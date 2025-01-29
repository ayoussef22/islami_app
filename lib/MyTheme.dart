import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = const Color(0xffB7935F);
  static Color primaryDark = const Color(0xff141A2E);
  static Color yellowColor = const Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primaryColor: primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 28,
              color: Colors.black87,
              fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black87,
          selectedIconTheme: IconThemeData(size: 35)),
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )));

  static ThemeData darkTheme = ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primaryColor: primaryDark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          scrolledUnderElevation: 0,
          titleTextStyle: const TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: yellowColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: yellowColor,
          selectedIconTheme: const IconThemeData(size: 35)),
      textTheme: TextTheme(
          titleLarge: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: yellowColor),
          titleSmall: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )));
}
