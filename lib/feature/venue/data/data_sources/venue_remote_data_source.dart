import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/data/modal/venue_api_model.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/users_shared_prefs.dart';
import '../dto/get_all_venue_dto.dart';
import '../dto/get_all_venues_by_id.dart';

final venueRemoteDataSourceProvider = Provider(
  (ref) => VenueRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    venueApiModel: ref.read(venueApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class VenueRemoteDataSource {
  final Dio dio;
  final VenueApiModel venueApiModel;
  final UserSharedPrefs userSharedPrefs;

  VenueRemoteDataSource({
    required this.dio,
    required this.venueApiModel,
    required this.userSharedPrefs,
  });

  //get all venues
  Future<Either<Failure, List<VenueEntity>>> venues() async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.get(ApiEndpoints.getAllVenue,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      //check for status code
      if (response.statusCode == 200) {
        GetAllVenueDTO getAllVenueDTO = GetAllVenueDTO.fromJson(response.data);
        //convert model to entity
        return Right(venueApiModel.toEntityList(getAllVenueDTO.data));
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

  //get  venues by id

  Future<Either<Failure, List<VenueEntity>>> getAllVenuesById(
      String venueId) async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.get(ApiEndpoints.getVenueById + venueId,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        GetAllVenuesByIdDTO getAllVenueDTO =
            GetAllVenuesByIdDTO.fromJson(response.data);

        return Right(venueApiModel.listFromJson(getAllVenueDTO.data));
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

  //Add details venue
  Future<Either<Failure, bool>> addVenue(VenueEntity venue) async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.post(ApiEndpoints.createVenue,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            "venueName": venue.venueName,
            "established": venue.established,
            "location": venue.location,
            "advancePayment": venue.advancePayment,
            "spacePreference": venue.spacePreference,
            "venueType": venue.venueType,
            "contactNumber": venue.contactNumber,
            "venueHallCapacity": venue.venueHallCapacity,
            "perPlate": venue.perPlate,
            "picture": venue.picture
          });

      if (response.statusCode == 201) {
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

  // Upload image using multipart
  Future<Either<Failure, String>> uploadProfilePicture(
      File image) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'photo': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );

      Response response = await dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );
      return Right(response.data['data']);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

//delete venue by owner
  Future<Either<Failure, bool>> deleteVenue(String veneuId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteVenue + veneuId,
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

  // update venue by its id
  Future<Either<Failure, bool>> updateVenue(
      String venueId, VenueEntity venue) async {
    try {
      // get user token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);

      Response res = await dio.put(
        ApiEndpoints.updateVenue + venueId,
        data: {
          "venueName": venue.venueName,
          "established": venue.established,
          "location": venue.location,
          "advancePayment": venue.advancePayment,
          "spacePreference": venue.spacePreference,
          "venueType": venue.venueType,
          "contactNumber": venue.contactNumber,
          "venueHallCapacity": venue.venueHallCapacity,
          "perPlate": venue.perPlate,
          "picture": venue.picture
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
