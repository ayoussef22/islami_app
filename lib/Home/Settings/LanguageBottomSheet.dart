import 'package:flutter/material.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

  class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return
       Container(
         width: double.infinity,
         color: provider.appTheme==ThemeMode.dark?
         Theme.of(context).primaryColor:
         Colors.white,
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: (){
                  provider.ChangeAppLanguage('en');
                },
                child:provider.appLanguage=='en'?
                    SelectedLanguageWidget(AppLocalizations.of(context)!.english) :
                    UnSelectedLanguageWidget(AppLocalizations.of(context)!.english)
              ),
              InkWell(
                onTap: (){
                  provider.ChangeAppLanguage('ar');
                },
                child: provider.appLanguage=='ar'?
                    SelectedLanguageWidget(AppLocalizations.of(context)!.arabic) :
                    UnSelectedLanguageWidget(AppLocalizations.of(context)!.arabic)
                ),
            ],

               ),
         ),
       );
  }

  Widget SelectedLanguageWidget(String language){
    var provider=Provider.of<AppConfigProvider>(context);
    return
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language,style: Theme.of(context).textTheme.titleMedium),
          Icon(Icons.check_circle,color: provider.appTheme==ThemeMode.dark?
          Color(0xffFACC1D):
          Theme.of(context).primaryColor)
        ],
      ),
    );
  }
  Widget UnSelectedLanguageWidget(String language){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(language,style:
    Theme.of(context).textTheme.titleMedium),
    ],
    )
    );
  }
}
