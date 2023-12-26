import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/booking/domain/repository/booking_repository.dart';
import '../../../../core/failure/failure.dart';

final bookingUsecaseProvider = Provider<BookingUseCase>(
  (ref) => BookingUseCase(
    bookingRepository: ref.watch(bookingRepositoryProvider),
  ),
);
class BookingUseCase{
  final IBookingRepository bookingRepository;

  BookingUseCase({required this.bookingRepository});

  Future<Either<Failure, bool>> bookingVenue(BookingEntity booking, String veneuId) async {
    return await bookingRepository.bookingVenue(booking, veneuId);
  }

   Future<Either<Failure, List<BookingEntity>>> getAllBookings() {
    return bookingRepository.getAllBookings();
  }

 Future<Either<Failure, bool>> deleteBooking(String bookingId) async {
    return bookingRepository.deleteBooking(bookingId);
  }

  Future<Either<Failure, bool>> updateBooking(String bookingId, BookingEntity booking) async {
    return bookingRepository.updateBooking(bookingId, booking);
  }
}