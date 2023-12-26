import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:venue_look/config/router/app_route.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';
import 'package:venue_look/feature/user/domain/use_case/user_usecase.dart';
import 'package:venue_look/feature/user/presentation/viewmodel/user_view_model.dart';

import '../test/feature/user/presentation/view/signup_view_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserUseCase mockUserUsecase;
  late UserEntity userEntity;

  setUpAll(
    () async {
      mockUserUsecase = MockUserUseCase();
      userEntity = UserEntity(
        id: null,
        fName: 'Manisha',
        lName: 'Tharu',
        email: 'manisha@gmail.com',
        phoneNumber: '9800562062',
        password: 'manisha123',
      );
    },
  );

  testWidgets('register view ...', (tester) async {
    when(mockUserUsecase.registerUser(userEntity))
        .thenAnswer((_) async => const Right(true));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userViewModelProvider.overrideWith(
            (ref) => UserViewModel(mockUserUsecase),
          ),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.registerRoute,
          routes: AppRoute.getApplicationRoute(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Enter manisha first textform field
    await tester.enterText(find.byType(TextFormField).at(0), 'Manisha');
    // Enter Tharu in second textform field
    await tester.enterText(find.byType(TextFormField).at(1), 'Tharu');
    // Enter gmail
    await tester.enterText(
        find.byType(TextFormField).at(3), 'manisha@gmail.com');
    // Enter phone number
    await tester.enterText(find.byType(TextFormField).at(2), '9800562062');
    // Enter password
    await tester.enterText(find.byType(TextFormField).at(4), 'manisha123');

    await tester.pumpAndSettle();

    //=========================== Find the register button===========================
    final registerButtonFinder =
        find.widgetWithText(ElevatedButton, 'Register');
  await tester.ensureVisible(registerButtonFinder);


    await tester.tap(registerButtonFinder);

    await tester.pumpAndSettle();

    // Check weather the snackbar is displayed or not
    expect(find.widgetWithText(SnackBar, 'Successfully registered'),
        findsOneWidget);
  });
}
