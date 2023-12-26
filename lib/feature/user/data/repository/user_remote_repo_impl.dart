import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/repository/user_repository.dart';
import '../data_sources/user_remote_data_source.dart';

final userRemoteRepositoryProvider =
    Provider.autoDispose<IUserRepository>((ref) {
  return UserRemoteRepositoryImpl(
    ref.read(userRemoteDataSourceProvider),
  );
});

class UserRemoteRepositoryImpl implements IUserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRemoteRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<Either<Failure, bool>> registerUser(UserEntity user) {
    return _userRemoteDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    return await _userRemoteDataSource.loginUser(email, password);
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getUserInfo() {
    return _userRemoteDataSource.getUserInfo();
  }

  @override
  Future<Either<Failure, bool>> updateProfile(UserEntity user) {
    return _userRemoteDataSource.updateprofile(user);
  }
}
