import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage='en';
  ThemeMode appTheme=ThemeMode.light;

  void ChangeAppLanguage(String newLanguage){
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage=newLanguage;
    notifyListeners();
  }

  void ChangeAppTheme(ThemeMode newTheme){
    if(appTheme==newTheme){
      return;
    }
    appTheme=newTheme;
    notifyListeners();
  }
}