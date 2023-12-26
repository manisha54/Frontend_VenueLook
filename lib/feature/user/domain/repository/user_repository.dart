import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/user_remote_repo_impl.dart';

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  // return ref.read(userLocalRepositoryProvider);
  return ref.read(userRemoteRepositoryProvider);
});

abstract class IUserRepository {
  Future<Either<Failure, bool>> registerUser(UserEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  Future<Either<Failure, List<UserEntity>>> getUserInfo();
  Future<Either<Failure, bool>> updateProfile(UserEntity user);
}
