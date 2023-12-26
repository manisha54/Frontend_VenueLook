import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/use_case/user_usecase.dart';
import '../state/user_state.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, UserState>((ref) {
  return UserViewModel(
    ref.read(userUseCaseProvider),
  );
});

class UserViewModel extends StateNotifier<UserState> {
  final UserUseCase _userUseCase;

  UserViewModel(this._userUseCase) : super(UserState(isLoading: false)) {
    getUserInfo();
  }

  Future<void> registerUser(BuildContext context, UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _userUseCase.registerUser(user);
    data.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        error: failure.error,
      );
      showSnackBar(message: failure.error, context: context, color: Colors.red);
    }, (sucess) {
      state = state.copyWith(isLoading: false, error: null);
      showSnackBar(message: "Successfully registered", context: context);
      Navigator.popAndPushNamed(context, AppRoute.loginRoute);
    });
  }

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await _userUseCase.loginUser(email, password);
    data.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      showSnackBar(
          message: failure.error, context: context, color: Colors.green);
    }, (sucess) {
      state = state.copyWith(isLoading: false, error: null);
      Navigator.popAndPushNamed(context, AppRoute.homeRoute);
    });
  }






  getUserInfo() async {
    state = state.copyWith(isLoading: true);
    var data = await _userUseCase.getUserInfo();
    state = state.copyWith(users: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, users: r, error: null),
    );
  }


  updateProfile(UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _userUseCase.updateprofile(user);
    state = state.copyWith(users: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }
}
