import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:venue_look/core/failure/failure.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';
import 'package:venue_look/feature/user/domain/use_case/user_usecase.dart';
import 'package:venue_look/feature/user/presentation/viewmodel/user_view_model.dart';

import 'user_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late UserUseCase mockUserUsecase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(() {
    mockUserUsecase = MockUserUseCase();
    context = MockBuildContext();
    container = ProviderContainer(overrides: [
      userViewModelProvider.overrideWith(
        (ref) => UserViewModel(mockUserUsecase),
      )
    ]);
  });

  test('check for the initial state', () async {
    final userState = container.read(userViewModelProvider);
    expect(userState.isLoading, false);
  });

  test('login test with valid email and password', () async {
    when(mockUserUsecase.loginUser('manisha@gmail.com', 'manisha123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(userViewModelProvider.notifier)
        .loginUser(context, 'manisha@gmail.com', 'manisha123');

    final userState = container.read(userViewModelProvider);

    expect(userState.error, isNull);
  });

  test('check for invalid email and password', () async {
    when(mockUserUsecase.loginUser('manisha@gmail.com', 'wrong123'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid'))));

    await container
        .read(userViewModelProvider.notifier)
        .loginUser(context, 'manisha@gmail.com', 'wrong123');

    final userState = container.read(userViewModelProvider);

    expect(userState.error, 'Invalid');
  });

  test('register test with valid user', () async {
    final user = UserEntity(
      fName: 'Manju',
      lName: 'Tharu',
      email: 'manju@gmail.com',
      phoneNumber: '98005622062',
      password: 'manju123',
    );
    when(mockUserUsecase.registerUser(user))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container.read(userViewModelProvider.notifier)
    .registerUser(context,user);
    final userState = container.read(userViewModelProvider);
    expect(userState.error, 'Invalid');
  });


  test('register test with invalid user', () async {
    final user = UserEntity(
      fName: 'xxxxxx', 
      lName: 'Tharu',
      email: 'manju@gmail.com',
      phoneNumber: '980573949',
      password: 'manju123',
    );

    when(mockUserUsecase.registerUser(user))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid user'))));

    await container.read(userViewModelProvider.notifier).
    registerUser(context, user);

    final userState = container.read(userViewModelProvider);

    expect(userState.error, 'Invalid user');
  });

  tearDownAll((){
    container.dispose();

  });
}
