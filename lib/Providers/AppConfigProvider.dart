import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.system;

  late final SharedPreferences prefs;

  void init() async {
    prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString("language") ?? 'en';
    String theme = prefs.getString("theme") ?? 'light';
    if (theme == 'light') {
      appTheme = ThemeMode.light;
    } else {
      appTheme = ThemeMode.dark;
    }
    notifyListeners();
  }

  void ChangeAppLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    await prefs.setString("language", newLanguage);
    notifyListeners();
  }

  void ChangeAppTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    await prefs.setString(
        'theme', newTheme == ThemeMode.light ? "light" : "dark");
    notifyListeners();
  }
}
