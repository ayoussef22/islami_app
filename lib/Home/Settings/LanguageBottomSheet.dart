import 'package:flutter/material.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

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
  Widget UnSelectedLanguageWidget(String language){
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
