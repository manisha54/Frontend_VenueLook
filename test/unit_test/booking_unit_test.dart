import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/booking/domain/use_case/booking_use_case.dart';
import 'package:venue_look/feature/booking/presentation/viewmodel/booking_view_model.dart';

import '../../test_data/booking_entity_test.dart';
import 'booking_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<BookingUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late BookingUseCase mockBookingUsecase;
  late List<BookingEntity> bookingEntity;

  setUpAll(() async {
    mockBookingUsecase = MockBookingUseCase();
    bookingEntity = await getBookingListTest();
    when(mockBookingUsecase.getAllBookings())
        .thenAnswer((_) => Future.value(const Right([])));
    container = ProviderContainer(
      overrides: [
        bookingViewModelProvider.overrideWith(
          (ref) => BookingViewModel(mockBookingUsecase),
        )
      ],
    );
  });

  test('check booking initial state', () {
    final bookingstate = container.read(bookingViewModelProvider);
    expect(bookingstate.isLoading, true);
    expect(bookingstate.bookings, isEmpty);
    expect(bookingstate.venues, isEmpty);
    expect(bookingstate.users, null);
  });


  test('check for the list of bookings when calling getAllBookings', () async{
    when(mockBookingUsecase.getAllBookings())
    .thenAnswer((_) => Future.value(Right(bookingEntity)));

    await container.read(bookingViewModelProvider.notifier).getAllBookings();

    final bookingstate = container.read(bookingViewModelProvider);

    expect(bookingstate.isLoading, false);
    expect(bookingstate.bookings.length,2);
  });
}
