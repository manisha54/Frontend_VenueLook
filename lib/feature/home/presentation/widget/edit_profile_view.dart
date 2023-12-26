import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../../user/presentation/viewmodel/user_view_model.dart';

class EditprofileView extends ConsumerStatefulWidget {
  const EditprofileView({super.key});

  @override
  ConsumerState<EditprofileView> createState() => _EditprofileViewState();
}

class _EditprofileViewState extends ConsumerState<EditprofileView> {
  final _gap = const SizedBox(height: 10);

  final mykey = GlobalKey<FormState>();

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    var userState = ref.read(userViewModelProvider);
    List<UserEntity>? userList = userState.users;
    _fnameController.text = userList![0].fName;
    _lnameController.text = userList[0].lName;
    _phoneController.text = userList[0].phoneNumber;
    _emailController.text = userList[0].email;
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(userViewModelProvider);
    List<UserEntity>? userList = userState.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit profile"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: mykey,
            child: Column(
              children: [
                _gap,
                TextFormField(
                  controller: _fnameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //   fillColor: Color(0xffDCDCDC),
                    hintText: 'Enter First Name',
                    labelText: "First name",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
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
                          Radius.circular(20),
                        )),
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                ),
                _gap,
                TextFormField(
                  controller: _lnameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //   fillColor: Color(0xffDCDCDC),
                    hintText: 'Enter Last Name',
                    labelText: "Last Name",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
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
                          Radius.circular(20),
                        )),
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                ),
                _gap,
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //   fillColor: Color(0xffDCDCDC),
                    hintText: 'Ente your email ',
                    labelText: "Email",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
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
                          Radius.circular(20),
                        )),
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                ),
                _gap,
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //   fillColor: Color(0xffDCDCDC),
                    hintText: 'Ente your phone number',
                    labelText: "Phone Number",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
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
                          Radius.circular(20),
                        )),
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                ),
                const SizedBox(
                  height: 40,
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 350, height: 64),
                  child: ElevatedButton(
                    onPressed: () async {
                      UserEntity user = UserEntity(
                          fName: _fnameController.text.trim(),
                          lName: _lnameController.text.trim(),
                          email: _emailController.text.trim(),
                          phoneNumber: _phoneController.text.trim(),
                          password: _passwordController.text.trim());

                      // Navigator.popAndPushNamed(context, AppRoute.homeRoute);

                      await ref
                          .watch(userViewModelProvider.notifier)
                          .updateProfile(user);

                      showSnackBar(
                        context: context,
                        message: 'Profile Updated successfully.',
                        color: Colors.green,
                      );
                    },
                    child: const Text("Update Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
