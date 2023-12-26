
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';
import 'package:venue_look/feature/user/domain/repository/user_repository.dart';

import '../../../../core/failure/failure.dart';

final userUseCaseProvider = Provider((ref) {
  return UserUseCase(
    ref.read(userRepositoryProvider),
  );
});

class UserUseCase {
  final IUserRepository _userRepository;

  UserUseCase(this._userRepository);

  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    return await _userRepository.registerUser(user);
  }

  Future<Either<Failure, bool>> loginUser(
      String email, String password) async {
    return await _userRepository.loginUser(email, password);
  }
Future<Either<Failure, List<UserEntity>>> getUserInfo() {
    return _userRepository.getUserInfo();
  }
 Future<Either<Failure, bool>> updateprofile( UserEntity user) async {
    return _userRepository.updateProfile( user);
  }
}
