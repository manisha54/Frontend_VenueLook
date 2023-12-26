import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:venue_look/config/router/app_route.dart';
import 'package:venue_look/feature/venue/domain/use_case/venue_use_case.dart';
import 'package:venue_look/feature/venue/presentation/viewmodel/venue_view_model.dart';

import '../../../../unit_test/venue_unit_test.mocks.dart';

void main() {
  late VenueUseCase mockVenueUsecase;
 // late List<VenueEntity> venueEntity;

  setUpAll(() async {
    mockVenueUsecase = MockVenueUseCase();
    // venueEntity = await getVenueListTest();
  });
  testWidgets('venue detail ...', (tester) async {
    when(mockVenueUsecase.venues()).thenAnswer((_) async => const Right([]));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          venueViewModelProvider
              .overrideWith((ref) => VenueViewModel(mockVenueUsecase)),
        ],
        child: MaterialApp(
          routes: AppRoute.getApplicationRoute(),
          initialRoute: AppRoute.homeRoute,
        ),
      ),
    );
    await tester.pumpAndSettle();
   // expect(find.byType(ListView), findsOneWidget);
  });
}
