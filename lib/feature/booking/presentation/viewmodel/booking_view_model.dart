import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/booking/domain/use_case/booking_use_case.dart';
import 'package:venue_look/feature/booking/presentation/state/booking_state.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';

final bookingViewModelProvider =
    StateNotifierProvider<BookingViewModel, BookingState>(
  (ref) => BookingViewModel(ref.watch(bookingUsecaseProvider)),
);

class BookingViewModel extends StateNotifier<BookingState> {
  final BookingUseCase bookingUseCase;

  BookingViewModel(this.bookingUseCase) : super(BookingState.initial()) {
    getAllBookings();
  }

//get all bookings
  getAllBookings() async {
    state = state.copyWith(isLoading: true);
    var data = await bookingUseCase.getAllBookings();
    state = state.copyWith(bookings: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, bookings: r, error: null),
    );
  }

//booking venue
  Future<void> bookingVenue(
    BuildContext context,
    BookingEntity booking,
    String venueId,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await bookingUseCase.bookingVenue(booking, venueId);
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showSnackBar(
            message: failure.error, context: context, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(message: "Booking Successfully ", context: context);
      },
    );
  }

  Future<void> deleteBooking(
      BuildContext context, BookingEntity booking) async {
    state.copyWith(isLoading: true);
    var data = await bookingUseCase.deleteBooking(booking.bookingId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.bookings.remove(booking);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'booking delete successfully',
          context: context,
        );
      },
    );
  }

  Future<void> updateBooking(String bookingId, BookingEntity booking) async {
    state = state.copyWith(isLoading: true);

    var data = await bookingUseCase.updateBooking(bookingId, booking);

    data.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
        (r) {
      // remove from the list
      state.bookings.removeWhere((booking) => booking.bookingId == bookingId);
      // append the updated booking in the list
      state.bookings.add(booking);
      // off the loading
      state = state.copyWith(isLoading: false, error: null);
    });
  }
}
