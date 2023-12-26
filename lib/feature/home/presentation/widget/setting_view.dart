import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';

class SettingView extends ConsumerStatefulWidget {
  const SettingView({super.key});

  @override
  ConsumerState<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends ConsumerState<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setting",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFFF1493),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: const Icon(Icons.lock),
          ),
          title: const Text(
            "Change Password",
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
            Navigator.popAndPushNamed(context, AppRoute.changePasswordRoute);
          },
        ),
      ),
    );
  }
}
