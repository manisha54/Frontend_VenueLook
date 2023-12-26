import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';

class UpdatePasswordView extends ConsumerStatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  ConsumerState<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends ConsumerState<UpdatePasswordView> {
  final gap = const SizedBox(height: 30);
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update password",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFFF1493),
      ),
      body: Container(
        color: const Color(0xfff0f8ff),
        height: 1000,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFF0BC7B7),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your current password',
                      labelText: "Enter your current password",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                            
                          )),
                    ),
                    style: const TextStyle(fontSize: 19, color: Colors.black),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please the current  password';
                      }
                      return null;
                    },
                  ),
                  gap,
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFF0BC7B7),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your new password',
                      labelText: "Enter your new password",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          )),
                    ),
                    style: const TextStyle(fontSize: 19, color: Colors.black),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please the new  password';
                      }
                      return null;
                    },
                  ),
                  gap,
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFF0BC7B7),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your confirm password again',
                      labelText: "Enter your confirm password again",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          )),
                    ),
                    style: const TextStyle(fontSize: 19, color: Colors.black),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your confirm password again';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints.tightFor(width: 200, height: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0BC7B7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          )),
                      onPressed: () {
                      // Navigator.pushNamed(context, '/');
            
                        // if (key.currentState!.validate()) {}
                         showSnackBar(
                        context: context,
                        message: 'Password Updated successfully.',
                        color: Colors.green,
                      );
                      },
                      child: const Text("Update",
                          style:
                              TextStyle(fontSize: 37, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}