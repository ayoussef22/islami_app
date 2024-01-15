import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:provider/provider.dart';

import '../../Providers/AppConfigProvider.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double myAngle=0;
  int counter=0;
  List<String> tasbehNameList=
  ['سبحان الله',
    'الحمد لله',
    'الله أكبر',];
  int index=0;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.12),
              child: provider.appTheme==ThemeMode.dark?
              Image.asset('assets/images/sebha_head_dark.png',
              height: MediaQuery.of(context).size.height*0.12,):
              Image.asset('assets/images/sebha_head.png',
                height: MediaQuery.of(context).size.height*0.12,)
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.11),
              child: Transform.rotate(
                angle: myAngle,
                child: InkWell(
                  onTap: OnSebhaClick,
                  child: provider.appTheme==ThemeMode.dark?
                  Image.asset('assets/images/sebha_body_dark.png',
                  height: MediaQuery.of(context).size.height*0.3):
                  Image.asset('assets/images/sebha_body.png',
                      height: MediaQuery.of(context).size.height*0.3),
                ),
              ),
            ),
          ],
        ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text
              (AppLocalizations.of(context)!.number_of_praises,
              style: Theme.of(context).textTheme.titleLarge,),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.3,
            height: MediaQuery.of(context).size.height*0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: provider.appTheme==ThemeMode.dark?
              Theme.of(context).primaryColor:
              Color.fromARGB(255, 250, 250, 210),
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text('$counter',style: Theme.of(context).textTheme.titleLarge,),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.1,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color:provider.appTheme==ThemeMode.dark?
                  MyTheme.yellowColor:
              Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text(tasbehNameList[index],
              style: provider.appTheme==ThemeMode.dark?
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor
                  ):
              Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white
              ),),
          )
      ],),
    );
  }
  void OnSebhaClick(){
    myAngle+=3;

    if(counter==30){
      counter=0;
      index++;
      if (index>2)
        index=0;
    }
    counter++;
    setState(() {});
  }
}
