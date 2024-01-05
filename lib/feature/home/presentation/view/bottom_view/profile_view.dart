import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:venue_look/feature/user/presentation/viewmodel/user_view_model.dart';

import '../../../../../config/router/app_route.dart';
import '../../../../../core/common/provider/is_dark_theme.dart';
import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../../../user/domain/entity/user_entity.dart';
import '../../../data/modal/shake_sensor.dart';
import '../../viewmodel/home_viewmodel.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  late bool isDark;
  late ShakeSensor shakeSensor;
  @override
  void initState() {
    isDark = ref.read(isDarkThemeProvider);
    shakeSensor = ShakeSensor(onShake: _onShake);
    super.initState();
  }

  void _onShake() {
    setState(() {
      isDark = !isDark;
    });
    ref.read(isDarkThemeProvider.notifier).updateTheme(isDark);
  }

  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _logout() {
    showDialog(
        context: context,
        builder: (context) => Dialog(
                child: Wrap(
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.warning,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Are you sure want to logout?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        setState(() {
                          // Navigator.pushNamed(context, '/');
                          ref
                              .read(homeViewModelProvider.notifier)
                              .logout(context);
                        });
                        // Navigator.pop(context);
                      },
                      child: const Text('Ok'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                  ],
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.read(userViewModelProvider);
    List<UserEntity>? userList = userState.users;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
       backgroundColor: const Color(0xFF41409E),
        actions: [
          Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                  ref.read(isDarkThemeProvider.notifier).updateTheme(value);
                });
              }),
          IconButton(
            onPressed: () {
              ref.read(userViewModelProvider.notifier).getUserInfo();
              showSnackBar(message: 'Refressing...', context: context);
            },
            icon: const Icon(
              Icons.refresh,
              color: Color.fromARGB(255, 240, 242, 242),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              // height: 500,
              child: Stack(
                //   fit: StackFit.expand,
                children: <Widget>[
                  ClipPath(
                    clipper: CustomeShape(),
                    child: Container(
                      height: 210,
                      color: const Color(0xFF41409E),
                    ),
                  ),
                  Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.grey[300],
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        _browseImage(ref, ImageSource.camera);
                                        Navigator.pop(context);
                                        // Upload image it is not null
                                      },
                                      icon: const Icon(Icons.camera),
                                      label: const Text('Camera'),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        _browseImage(ref, ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.image),
                                      label: const Text('Gallery'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: SizedBox(
                              height: 170,
                              width: 200,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: _img != null
                                    ? FileImage(_img!)
                                    : const AssetImage(
                                            'assets/images/profile2.png')
                                        as ImageProvider,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          userList![0].fName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            // color: Colors.amber
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          userList[0].email,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8492A2)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoute.editProfileRoute);
                          },
                          child: const Text(
                            "Edit profile",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 20),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(Icons.settings),
              ),
              title: const Text(
                "Settings",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1)),
                child: const Icon(Icons.chevron_right),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.settingRoute);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(Icons.question_answer_outlined),
              ),
              title: const Text(
                "About us",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1)),
                child: const Icon(Icons.chevron_right),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.aboutUsRoute);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(Icons.book_online),
              ),
              title: const Text(
                "My Bookings",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1)),
                child: const Icon(Icons.chevron_right),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.bookingDetailView);
              },
            ),

            const SizedBox(height: 10),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(Icons.language),
              ),
              title: const Text(
                "Language",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1)),
                child: const Icon(Icons.chevron_right),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.languageViewRoute);
              },
            ),


            // const SizedBox(height: 10),
            // ListTile(
            //   leading: Container(
            //     width: 40,
            //     height: 40,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100),
            //       color: Colors.grey.withOpacity(0.1),
            //     ),
            //     child: const Icon(Icons.book_online),
            //   ),
            //   title: const Text(
            //     "Add Venue",
            //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //   ),
            //   trailing: Container(
            //     width: 30,
            //     height: 30,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(100),
            //         color: Colors.grey.withOpacity(0.1)),
            //     child: const Icon(Icons.chevron_right),
            //   ),
            //   onTap: () {
            //     Navigator.pushNamed(context, AppRoute.addVenueRoute);
            //   },
            // ),








            const SizedBox(height: 10),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(Icons.logout),
              ),
              onTap: () {
                _logout();
              },
              title: const Text(
                "Logout",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1)),
                child: const Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
