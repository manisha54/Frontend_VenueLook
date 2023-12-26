
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/user/data/modal/user_hive_model.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';

final userLocalDataSourceProvider = Provider(
  (ref) => UserLocalDataSource(
    ref.read(hiveServiceProvider),
    ref.read(userHiveModelProvider),
  ),
);

class UserLocalDataSource{
  final HiveService _hiveService;
  final UserHiveModel _userHiveModel;

 UserLocalDataSource(this._hiveService, this._userHiveModel);



//regsiter user
 Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    try {
      await _hiveService.addUser(_userHiveModel.toHiveModel(user));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }



  Future<Either<Failure, bool>> loginuser(
    String email,
    String password,
  ) async {
    try {
      UserHiveModel? users = await _hiveService.login(email, password);
      if (users == null) {
        return Left(Failure(error: 'Username or password is wrong'));
      } else {
        return const Right(true);
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

}