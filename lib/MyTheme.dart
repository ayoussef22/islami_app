import 'package:flutter/material.dart';

class MyTheme{

 static Color primaryLight=Color(0xffB7935F);
 static Color primaryDark=Color(0xff141A2E);
 static Color yellowColor=Color(0xffFACC1D);

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
   selectedIconTheme: IconThemeData(
    size: 35
   )
  ),
  textTheme: TextTheme(
   titleLarge: TextStyle()
  )

 );

 static ThemeData darkTheme=ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  primaryColor: primaryDark,
scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: AppBarTheme(
   backgroundColor: Colors.transparent,
   centerTitle: true,
   scrolledUnderElevation: 0,
   titleTextStyle: TextStyle(fontSize: 28,
       color: Colors.white,fontWeight: FontWeight.bold)
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
   selectedItemColor: yellowColor,
   selectedIconTheme: IconThemeData(
    size: 35
   )
  ),
  textTheme: TextTheme(
   titleLarge: TextStyle()
  )

 );
}