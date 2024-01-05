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
                text: ("Welcome to "),
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
                      color: Color(0xffff66c4),
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
                // color: Color(0xffff66c4),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: Form(
                    key: mykey,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),

                        // const SizedBox(height: 10),
                        TextFormField(
                          controller: _fnameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            // labelText: 'Enter the First Name',
                            hintText:
                                'Enter the First Name', // Display hint text while typing
                            prefixIcon: Icon(
                              Icons.person,
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
                              return 'Please enter the first name';
                            }
                            return null;
                          },
                        ),
// const SizedBox(height: 10),
                        TextFormField(
                          controller: _lnameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            // labelText: 'Enter the last Name',
                            hintText:
                                'Enter the last Name', // Display hint text while typing
                            prefixIcon: Icon(
                              Icons.person,
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
                              return 'Please enter the last name';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Enter the phone Name',
                            prefixIcon: Icon(
                              Icons.phone,
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

                            hintText: 'Enter confirm password ',
                            //      helperText: 'Password must contain special character',

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
                              return 'Please enter confirm password';
                            }
                            return null;
                          },
                        ),

                        //button
                        const SizedBox(height: 20),
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
                                    .registerUser(context, user);
                              }
                            },
                            child: const Text("Register",
                                style: TextStyle(
                                    fontFamily: 'RobotoCondensed Regular',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 35)),
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
                                    color: Color(0xffff66c4),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const Padding(
                        //   padding: EdgeInsets.symmetric(vertical: 10.0),
                        //   child: Text(
                        //     "By signing up you’re agreeing to the Terms & Conditions and Privacy Statement ",
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        // ),
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
