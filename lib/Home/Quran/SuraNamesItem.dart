import 'package:flutter/material.dart';
import 'package:islami_app/Home/Quran/SuraScreen.dart';

class SuraNamesItem extends StatelessWidget {
String suraName;
int suraPosition;
SuraNamesItem({required this.suraName, required this.suraPosition});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraScreen.routeName,
        arguments: SuraScreenArgs(suraNameArg: suraName, suraPositionArg: suraPosition));
      },
      child: Center(child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(suraName,style:
          TextStyle(fontSize: 20),),
      )),
    );
  }
}
