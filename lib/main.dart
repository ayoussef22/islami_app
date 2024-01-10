import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/HadethScreen.dart';
import 'package:islami_app/Home/HomeScreen.dart';
import 'package:islami_app/Home/Quran/SuraScreen.dart';
import 'package:islami_app/MyTheme.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: MyTheme.lightTheme,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        SuraScreen.routeName:(context)=>SuraScreen(),
        HadethScreen.routeName:(context)=>HadethScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}