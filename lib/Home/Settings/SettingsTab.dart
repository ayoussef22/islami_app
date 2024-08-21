import 'package:flutter/material.dart';
import 'package:islami_app/Home/Settings/LanguageBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/Settings/ThemeBottomSheet.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical:MediaQuery.of(context).size.height*0.1,
          horizontal: MediaQuery.of(context).size.width*0.04),
      child: SingleChildScrollView(
        child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleLarge,),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12)
            ),
            child: InkWell(
              onTap: (){
                OnSelectLanguageClick();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage=='en'?
                  AppLocalizations.of(context)!.english :
                  AppLocalizations.of(context)!.arabic
                    ,style: Theme.of(context).textTheme.titleMedium,),
                  Icon(Icons.arrow_drop_down_outlined,
                      color: provider.appTheme==ThemeMode.dark?
                      MyTheme.yellowColor:
                      Colors.black)
                ],
              ),
            ),
          ),
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleLarge,),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: InkWell(
                onTap: (){
                  OnSelectThemeClick();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.appTheme==ThemeMode.dark?
                    AppLocalizations.of(context)!.dark :
                    AppLocalizations.of(context)!.light
                      ,style: Theme.of(context).textTheme.titleMedium),
                    Icon(Icons.arrow_drop_down_outlined,
                    color: provider.appTheme==ThemeMode.dark?
                      MyTheme.yellowColor:
                      Colors.black)
                  ],
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }

  void OnSelectLanguageClick(){
    showModalBottomSheet(context: context, builder:(context)=>LanguageBottomSheet());
  }

  void OnSelectThemeClick(){
    showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
  }
}
