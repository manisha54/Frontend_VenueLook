import 'package:venue_look/feature/user/domain/entity/user_entity.dart';

class UserState {
  final bool isLoading;
  final String? error;
  final String? imageName;
  final List<UserEntity>? users;

  UserState({required this.isLoading, this.error, this.imageName, this.users});

  factory UserState.initial() {
    return UserState(isLoading: false, error: null, imageName: null, users: []);
  }

  UserState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
    List<UserEntity>? users,
  }) {
    return UserState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        users: users ?? this.users,
        imageName: imageName ?? this.imageName);
  }

  @override
  String toString() =>
      'AuthState(isLoading: $isLoading, error: $error, users:$users)';
}
