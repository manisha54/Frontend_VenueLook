import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

import '../../../user/domain/entity/user_entity.dart';

class BookingState {
  final bool isLoading;
  final List<VenueEntity> venues;
  final List<UserEntity>? users;
  final List<BookingEntity> bookings;
  final String? error;

  BookingState({
    this.users,
    required this.isLoading,
    required this.venues,
    required this.bookings,
    this.error,
  });

  factory BookingState.initial() {
    return BookingState(isLoading: false, users: [], venues: [], bookings: []);
  }

  BookingState copyWith({
    bool? isLoading,
    List<VenueEntity>? venues,
    List<UserEntity>? users,
    List<BookingEntity>? bookings,
    String? error,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      venues: venues ?? this.venues,
      bookings: bookings ?? this.bookings,
      users: users ?? users,
      error: error ?? this.error,
    );
  }
}
