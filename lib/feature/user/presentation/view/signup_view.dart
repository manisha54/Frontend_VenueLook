import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';

import '../../../../config/router/app_route.dart';
import '../viewmodel/user_view_model.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

final mykey = GlobalKey<FormState>();

final _fnameController = TextEditingController();
final _lnameController = TextEditingController();
final _phoneController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class _SignUpViewState extends ConsumerState<SignUpView> {
  bool passwordvisibility = true;

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 135,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          Center(
            child: RichText(
              text: const TextSpan(
                text: ("Register to "),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
                children: [
                  TextSpan(
                    text: "Venue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF1493),
                    ),
                  ),
                  TextSpan(
                    text: "Look",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 55, 211, 201),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              height: 880,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                  topLeft: Radius.circular(70),
                ),
                color: Color(0xffff66c4),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: Form(
                    key: mykey,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _fnameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFF0BC7B7),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter the First Name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please the first name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _lnameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFF0BC7B7),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter the last Name ',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                )),
                          ),
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please the second name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Color(0xFF0BC7B7),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter the Phone number',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                )),
                          ),
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please the phone number';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Color(0xFF0BC7B7),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter the email address',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                )),
                          ),
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please the email address';
                            }
                            return null;
                          },
                        ),

                        //for password
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: passwordvisibility,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFF0BC7B7),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordvisibility = !passwordvisibility;
                                });
                              },
                              icon: Icon(passwordvisibility
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              color: const Color(0xFF0BC7B7),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter the password ',
                            //  helperText: 'Password must contain special character',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20.0),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the password ';
                            }
                            return null;
                          },
                        ),

                        //for password
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: passwordvisibility,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFF0BC7B7),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordvisibility = !passwordvisibility;
                                });
                              },
                              icon: Icon(passwordvisibility
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              color: const Color(0xFF0BC7B7),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter confirm password ',
                            //      helperText: 'Password must contain special character',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20.0),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter confirm password';
                            }
                            return null;
                          },
                        ),

                        //button
                        const SizedBox(height: 10),
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: 180, height: 60),
                          child: ElevatedButton(
                            onPressed: () {
                              if (mykey.currentState!.validate()) {
                                var user = UserEntity(
                                  fName: _fnameController.text,
                                  lName: _lnameController.text,
                                  phoneNumber: _phoneController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );

                                ref
                                    .read(userViewModelProvider.notifier)
                                    .registerUser(context,user);

                                // if (userState.error != null) {
                                //   showSnackBar(
                                //     message: userState.error.toString(),
                                //     context: context,
                                //     color: Colors.red,
                                //   );
                                // } else {
                                //   showSnackBar(
                                //     message: 'Registered successfully',
                                //     context: context,
                                //   );
                                // }
                                // Navigator.popAndPushNamed(
                                //     context, AppRoute.loginRoute);
                              }
                            },
                            child: const Text("Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, AppRoute.loginRoute);
                          },
                          child: Column(
                            children: [
                              Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: 'Already have an account ?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'Sign In ?',
                                  style: TextStyle(
                                    fontFamily: ' RobotoCondensed Regular',
                                    color: Color.fromARGB(255, 55, 211, 201),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
