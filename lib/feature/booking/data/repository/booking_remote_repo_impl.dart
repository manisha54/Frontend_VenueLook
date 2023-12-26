import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/core/failure/failure.dart';
import 'package:venue_look/feature/booking/data/data_sources/booking_remote_data_source.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';

final bookingRemoteRepoProvider = Provider<IBookingRepository>(
  (ref) => BookingRemoteRepositoryImpl(
    bookingRemoteDataSource: ref.read(bookingRemoteDataSourceProvider),
  ),
);

class BookingRemoteRepositoryImpl implements IBookingRepository {
  final BookingRemoteDataSource bookingRemoteDataSource;

  BookingRemoteRepositoryImpl({required this.bookingRemoteDataSource});

  @override
  Future<Either<Failure, bool>> bookingVenue(
      BookingEntity booking, String venueId) {
    return bookingRemoteDataSource.bookingVenue(booking, venueId);
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getAllBookings() {
    return bookingRemoteDataSource.getAllBookings();
  }

  @override
  Future<Either<Failure, bool>> deleteBooking(String bookingId) {
    return bookingRemoteDataSource.deleteBooking(bookingId);
  }
  
  @override
  Future<Either<Failure, bool>> updateBooking(String bookingId, BookingEntity booking) {
 return bookingRemoteDataSource.updateBooking(bookingId, booking);
  }
}
