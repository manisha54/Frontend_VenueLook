import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/booking/data/dto/get_all_booking_dto.dart';
import 'package:venue_look/feature/booking/data/modal/booking_model.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/user/data/modal/user_api_model.dart';
import 'package:venue_look/feature/venue/data/modal/venue_api_model.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/users_shared_prefs.dart';

final bookingRemoteDataSourceProvider = Provider(
  (ref) => BookingRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userApiModel: ref.read(userApiModelProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
      venueApiModel: ref.read(venueApiModelProvider),
      bookingModel: ref.read(bookingModelProvider)),
);

class BookingRemoteDataSource {
  final Dio dio;
  final UserApiModel userApiModel;
  final VenueApiModel venueApiModel;
  final UserSharedPrefs userSharedPrefs;
  final BookingModel bookingModel;

  BookingRemoteDataSource(
      {required this.dio,
      required this.userApiModel,
      required this.venueApiModel,
      required this.userSharedPrefs,
      required this.bookingModel});

//get all booking venues
  Future<Either<Failure, List<BookingEntity>>> getAllBookings() async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.get(ApiEndpoints.getAllBookings,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      //check for status code
      if (response.statusCode == 200) {
        GetAllBookingDTO getAllBookingDTO =
            GetAllBookingDTO.fromJson(response.data);
        //convert model to entity
        return Right(bookingModel.toEntityList(getAllBookingDTO.data));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  //booking venue
  Future<Either<Failure, bool>> bookingVenue(
      BookingEntity booking, String venueId) async {
    try {
      // String id = '648aa21a2983b5855b7d9cf9';
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      // booking/23232323
      var response = await dio.post(ApiEndpoints.createBooking + venueId,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            "time": booking.time,
            "date": booking.date,
            "fullName": booking.fullName,
            "contactNumber": booking.contactNumber
          });

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

//delete booking by user
  Future<Either<Failure, bool>> deleteBooking(String bookingId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteBooking + bookingId,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  // update booking by its id
  Future<Either<Failure, bool>> updateBooking(
      String bookingId, BookingEntity booking) async {
    try {
      // get user token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);

      Response res = await dio.put(
        ApiEndpoints.updateBooking + bookingId,
        data: {
          "time": booking.time,
          "date": booking.date,
          "fullName": booking.fullName,
          "contactNumber": booking.contactNumber
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (res.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: res.statusMessage.toString(),
            statusCode: res.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
            error: e.error.toString(),
            statusCode: e.response?.statusCode.toString() ?? '0'),
      );
    }
  }
}
