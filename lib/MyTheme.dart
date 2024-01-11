import 'package:flutter/material.dart';

class MyTheme{

 static Color primaryLight=Color(0xffB7935F);

 static ThemeData lightTheme=ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  primaryColor: primaryLight,
scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: AppBarTheme(
   backgroundColor: Colors.transparent,
   centerTitle: true,
   scrolledUnderElevation: 0,
   titleTextStyle: TextStyle(fontSize: 28,
       color: Colors.black87,fontWeight: FontWeight.bold)
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
   selectedItemColor: Colors.black87,
   showUnselectedLabels: true,
   selectedIconTheme: IconThemeData(
    size: 35
   )
  ),
  textTheme: TextTheme(
   titleLarge: TextStyle()
  )

 );
}