import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:venue_look/config/router/app_route.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/booking/domain/use_case/booking_use_case.dart';
import 'package:venue_look/feature/booking/presentation/viewmodel/booking_view_model.dart';

import '../../../../../../test_data/booking_entity_test.dart';
import '../../../../../unit_test/booking_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<BookingUseCase>(),
])
void main() {
  late BookingUseCase mockBookingUsecase;
  late List<BookingEntity> bookingEntity;

  setUpAll(() async {
    mockBookingUsecase = MockBookingUseCase();
    bookingEntity = await getBookingListTest();
  });
  testWidgets('booking view ...', (tester) async {
    when(mockBookingUsecase.getAllBookings())
        .thenAnswer((_) async =>  Right(bookingEntity));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bookingViewModelProvider
              .overrideWith((ref) => BookingViewModel(mockBookingUsecase)),
        ],
        child: MaterialApp(
          routes: AppRoute.getApplicationRoute(),
          initialRoute: AppRoute.bookingRoute,
        ),
      ),
    );
    await tester.pumpAndSettle();
   // expect(find.byType(ListView), findsOneWidget);
  });
}
