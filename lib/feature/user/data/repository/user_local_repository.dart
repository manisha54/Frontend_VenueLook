import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/core/failure/failure.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';
import 'package:venue_look/feature/user/domain/repository/user_repository.dart';

import '../data_sources/user_local_data_source.dart';

final userLocalRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserLocalRepository(
    ref.read(userLocalDataSourceProvider),
  );
});

class UserLocalRepository implements IUserRepository {
  final UserLocalDataSource _userLocalDataSource;

  UserLocalRepository(this._userLocalDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return _userLocalDataSource.loginuser(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(UserEntity user) {
    return _userLocalDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getUserInfo() {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> updateProfile(UserEntity user) {
    throw UnimplementedError();
  }
}
