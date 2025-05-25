import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/HadethTab.dart';
import 'package:islami_app/Home/Quran/QuranTab.dart';
import 'package:islami_app/Home/Sebha/SebhaTab.dart';
import 'package:islami_app/Home/Settings/SettingsTab.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(), SettingsTab()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return SafeArea(
      child: Stack(
        children: [
          provider.appTheme == ThemeMode.dark
              ? Image.asset('assets/images/background_dark.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill)
              : Image.asset(
                  'assets/images/background.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
          Scaffold(
              bottomNavigationBar: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: Theme.of(context).primaryColor),
                child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: const ImageIcon(
                            AssetImage('assets/images/icon_quran.png')),
                        label: AppLocalizations.of(context)!.quran),
                    BottomNavigationBarItem(
                        icon: const ImageIcon(
                            AssetImage('assets/images/icon_hadeth.png')),
                        label: AppLocalizations.of(context)!.hadeth),
                    BottomNavigationBarItem(
                        icon: const ImageIcon(
                            AssetImage('assets/images/icon_sebha.png')),
                        label: AppLocalizations.of(context)!.sebha),
                    const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings_outlined,
                        ),
                        label: 'Settings'),
                  ],
                ),
              ),
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.app_title),
              ),
              body: tabs[selectedIndex]),
        ],
      ),
    );
  }
}
