import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';
import 'package:venue_look/feature/venue/domain/use_case/venue_use_case.dart';
import 'package:venue_look/feature/venue/presentation/viewmodel/venue_view_model.dart';

import '../../test_data/venue_entity_test.dart';
import 'venue_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<VenueUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late VenueUseCase mockVenueUsecase;
  late List<VenueEntity> venueEntity;

  setUpAll(() async {
    mockVenueUsecase = MockVenueUseCase();
    venueEntity = await getVenueListTest();
    when(mockVenueUsecase.venues())
        .thenAnswer((_) => Future.value(const Right([])));
    container = ProviderContainer(
      overrides: [
        venueViewModelProvider.overrideWith(
          (ref) => VenueViewModel(mockVenueUsecase),
        )
      ],
    );
  });

  test('check venue initial state', () {
    final venueState = container.read(venueViewModelProvider);
    expect(venueState.isLoading, true);
    expect(venueState.venues, isEmpty);
  });

  test('check for the list of venues when calling getALlvenues', () async {
    when(mockVenueUsecase.venues())
        .thenAnswer((_) => Future.value(Right(venueEntity)));

    await container.read(venueViewModelProvider.notifier).venues();

    final venueState = container.read(venueViewModelProvider);

    expect(venueState.isLoading, false);
    expect(venueState.venues.length,2);
  });

  test('add venue entity and return true if successfully added', () async {
    when(mockVenueUsecase.addVenue(venueEntity[0]))
        .thenAnswer((_) => Future.value(const Right(true)));

    container
        .read(venueViewModelProvider.notifier);
        // .addVenue(venueEntity[0],context);

    final venueState = container.read(venueViewModelProvider);

    expect(venueState.error, isNull);
  });

  tearDownAll(() {
    container.dispose();
  });
}
