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
bool rememberMe = false; // Declare this boolean variable in your widget class

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
                      color: Color(0xFF41409E),
                    ),
                  ),
                  TextSpan(
                    text: "Look",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF1493),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20), // Space between text elements
          const Text(
            "Use credentials to access your account !!",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          //const SizedBox(height: 10),
          Flexible(
            child: Container(
              height: 880,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                  topLeft: Radius.circular(70),
                ),
                // color: Color.fromARGB(255, 212, 209, 247),
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
                            hintText: 'Enter the email Name',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF7F7F7F),
                            ),
                            filled: true,
                            fillColor: Color(0xffF3F4F6),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD9D9EC), // Outline color
                                width: 2.0, // Outline width
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffF3F4F6), // Focus outline color
                                width: 2.0, // Focus outline width
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red, // Error outline color
                                width: 2.0, // Error outline width
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            errorStyle: TextStyle(
                                color: Colors.red), // Error text color
                            // Other InputDecoration properties...
                          ),
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.black87,
                          ),
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
                            hintText: 'Enter the Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFF7F7F7F),
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
                              color: const Color(0xFF7F7F7F),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF3F4F6),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 20,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD9D9EC), // Outline color
                                width: 2.0, // Outline width
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffF3F4F6), // Focus outline color
                                width: 2.0, // Focus outline width
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red, // Error outline color
                                width: 2.0, // Error outline width
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            errorStyle: const TextStyle(
                                color: Colors.red), // Error text color
                            // Other InputDecoration properties...
                          ),
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.black87,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the password';
                            }
                            return null;
                          },
                        ),

                        // Remember Me toggle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                ),
                                const Text('Remember Me'),
                              ],
                            ),
                            const Spacer(), // Pushes the "Forgot Password?" text to the right
                            TextButton(
                              onPressed: () {
                                // Handle forgot password logic
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color(0xFF41409E),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // You can add additional widgets or adjust the layout here
                          ],
                        ),

                        //button
                        const SizedBox(height: 50),
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: 400, height: 55),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // backgroundColor: Colors.green, // Change button color as needed
                            ),
                            onPressed: () async {
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
