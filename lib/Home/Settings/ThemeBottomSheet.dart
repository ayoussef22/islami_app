import 'package:flutter/material.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return
       Container(
         width: double.infinity,
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: (){
                  provider.ChangeAppTheme(ThemeMode.dark);
                },
                child:provider.appTheme==ThemeMode.dark?
                SelectedThemeWidget(AppLocalizations.of(context)!.dark) :
                UnSelectedThemeWidget(AppLocalizations.of(context)!.dark)
              ),
              InkWell(
                onTap: (){
                  provider.ChangeAppTheme(ThemeMode.light);
                },
                child: provider.appTheme==ThemeMode.light?
                SelectedThemeWidget(AppLocalizations.of(context)!.light) :
                UnSelectedThemeWidget(AppLocalizations.of(context)!.light)
              ),
            ],

               ),
         ),
       );
  }

  Widget SelectedThemeWidget(String language){
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(language,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Icon(Icons.check_circle,color: Theme.of(context).primaryColor,)
          ],
        ),
      );
  }
  Widget UnSelectedThemeWidget(String language){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(language,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          ],
        )
    );
  }
}
