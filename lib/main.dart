import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/HadethScreen.dart';
import 'package:islami_app/Home/HomeScreen.dart';
import 'package:islami_app/Home/Quran/SuraScreen.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (context)=>AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var provider=Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      theme: MyTheme.lightTheme,
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkTheme,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        SuraScreen.routeName:(context)=>SuraScreen(),
        HadethScreen.routeName:(context)=>HadethScreen(),
      },
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}