import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../viewmodel/user_view_model.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

final mykey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
class _SignInViewState extends ConsumerState<SignInView> {
  bool passwordvisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              //   color: Colors.yellow,
              height: 200,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          Center(
            child: RichText(
              text: const TextSpan(
                text: ("Login in to "),
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
          const SizedBox(height: 40),
          Flexible(
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
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF0BC7B7),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter the email',
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
                              return 'Please the email';
                            }
                            return null;
                          },
                        ),
                        //for password
                        const SizedBox(height: 20),
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
                            hintText: 'Enter the password',
                            //   helperText: 'Password must contain special character',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 40.0),
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
                              return 'Please enter the password';
                            }
                            return null;
                          },
                        ),

                        //button
                        const SizedBox(height: 50),
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: 250, height: 85),
                          child: ElevatedButton(
                            onPressed: () async{
                             if (mykey.currentState!.validate()) {
                           await ref
                              .read(userViewModelProvider.notifier)
                              .loginUser(
                                context,
                                _emailController.text,
                                _passwordController.text,
                              );
                             }
                            },
                            child: const Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 37,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, AppRoute.registerRoute);
                          },
                          child: Column(
                            children: [
                              Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: 'Donot have an accout?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'Sign up ?',
                                  style: TextStyle(
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
