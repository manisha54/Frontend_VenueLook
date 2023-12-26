import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/user/data/modal/user_api_model.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';
import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/users_shared_prefs.dart';
import '../dto/get_users_info_dto.dart';

final userRemoteDataSourceProvider = Provider(
  (ref) => UserRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
    userApiModel: ref.read(userApiModelProvider),
  ),
);

class UserRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  final UserApiModel userApiModel;

  UserRemoteDataSource(
      {required this.dio,
      required this.userSharedPrefs,
      required this.userApiModel});

  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "fName": user.fName,
          "lName": user.lName,
          "email": user.email,
          "phoneNumber": user.phoneNumber,
          "password": user.password,
        },
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

  //login user

  Future<Either<Failure, bool>> loginUser(
    String email,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        // retrieve token
        String token = response.data["token"];
        await userSharedPrefs.setUserToken(token);
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

  Future<Either<Failure, List<UserEntity>>> getUserInfo() async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.get(ApiEndpoints.getUserInfo,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        GetUsersInfoDTO usersInfoDTO = GetUsersInfoDTO.fromJson(response.data);

        return Right(userApiModel.listFromJson(usersInfoDTO.data));
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

  Future<Either<Failure, bool>> updateprofile(UserEntity user) async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.put(
        ApiEndpoints.updateProfile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          "fName": user.fName,
          "lName": user.lName,
          "email": user.email,
          "phoneNumber": user.phoneNumber
        },
      );
      if (response.statusCode == 200) {
        return const Right(true);
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
}
