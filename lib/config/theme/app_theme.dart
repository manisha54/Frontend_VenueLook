import 'package:flutter/material.dart';

import '../constants/theme_constant.dart';

class AppTheme {
  AppTheme._();
  static getApplicationTheme(bool isDark) {
    return ThemeData(
      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: ThemeConstant.darkPrimaryColor,
            )
          : const ColorScheme.light(
              primary: Color.fromARGB(255, 235, 229, 232),
            ),
      brightness: isDark ? Brightness.dark : Brightness.light,
      // colorScheme: const ColorScheme.light(primary: Colors.black),
      fontFamily: 'RobotoCondensed Regular',
      useMaterial3: true,
      dividerColor: const Color(0xffC0C0C0),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFF41409E)
      ),
      //change appbar
      appBarTheme: const AppBarTheme(
        elevation: 0,
        // backgroundColor: Color(0xffff66c4),
        backgroundColor: Color(0xFF41409E),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      ),

      //bottom navigation
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFF9CA3AF),
        //backgroundColor: Color(0xFF0BC7B7),
      ),

      //elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF41409E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90.0),
            )),
      ),
    );
  }
}
