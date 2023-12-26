// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:venue_look/feature/review/data/model/review_api_model.dart';
// import 'package:venue_look/feature/review/domain/entity/review_entity.dart';
// import 'package:venue_look/feature/user/data/modal/user_api_model.dart';
// import '../../../../config/constants/api_endpoint.dart';
// import '../../../../core/failure/failure.dart';
// import '../../../../core/network/remote/http_service.dart';
// import '../../../../core/shared_prefs/users_shared_prefs.dart';
// import '../../../booking/domain/entity/booking_entity.dart';

// final batchRemoteDataSourceProvider = Provider(
//   (ref) => ReviewRemoteDataSource(
//     dio: ref.read(httpServiceProvider),
//     reviewApiModel: ref.read(reviewApiModelProvider),
//     userSharedPrefs: ref.read(userSharedPrefsProvider),
//     userApiModel: ref.read(userApiModelProvider),
//   ),
// );

// class ReviewRemoteDataSource {
//   final Dio dio;
//   final ReviewApiModel reviewApiModel;
//   final UserApiModel userApiModel;
//   final UserSharedPrefs userSharedPrefs;

//   ReviewRemoteDataSource({
//     required this.dio,
//     required this.reviewApiModel,
//     required this.userApiModel,
//     required this.userSharedPrefs,
//   });


  
// //get all review 
//   Future<Either<Failure, List<ReviewEntity>>> getAllReviews() async {
//     try {
//       // get token
//       String? token;
//       await userSharedPrefs
//           .getUserToken()
//           .then((value) => value.fold((l) => null, (r) => token = r!));

//       var response = await dio.get(ApiEndpoints.getAllReviews,
//           options: Options(
//             headers: {
//               'Authorization': 'Bearer $token',
//             },
//           ));
//       //check for status code
//       if (response.statusCode == 200) {
//        getAllReviewDTO getAllReviewsDTO = getAllReviewsDTO.fromJson(response.data);
//         //convert model to entity
//         return Right(reviewApiModel.toEntityList(getAllReviewsDTO.data));
//       } else {
//         return Left(
//           Failure(
//             error: response.statusMessage.toString(),
//             statusCode: response.statusCode.toString(),
//           ),
//         );
//       }
//     } on DioException catch (e) {
//       return Left(
//         Failure(
//           error: e.error.toString(),
//         ),
//       );
//     }
//   }
// }
