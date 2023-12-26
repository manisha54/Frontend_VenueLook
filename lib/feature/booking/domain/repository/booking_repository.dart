import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/booking/data/data_sources/booking_remote_data_source.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/booking_remote_repo_impl.dart';

final bookingRepositoryProvider = Provider<IBookingRepository>(
  (ref) {
    return BookingRemoteRepositoryImpl(
        bookingRemoteDataSource: ref.read(bookingRemoteDataSourceProvider));
  },
);

abstract class IBookingRepository {

  Future<Either<Failure, bool>> bookingVenue(BookingEntity booking, String venueId);
  Future<Either<Failure, List<BookingEntity>>> getAllBookings();
  Future<Either<Failure, bool>> deleteBooking(String bookingId);
  Future<Either<Failure, bool>> updateBooking(String bookingId, BookingEntity booking);



}
