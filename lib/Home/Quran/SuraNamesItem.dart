import 'package:flutter/material.dart';
import 'package:islami_app/Home/Quran/SuraScreen.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class SuraNamesItem extends StatelessWidget {
  String suraName;
  int suraPosition;

  SuraNamesItem({required this.suraName, required this.suraPosition});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraScreen.routeName,
            arguments: SuraScreenArgs(
                suraNameArg: suraName, suraPositionArg: suraPosition));
      },
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(suraName,
            style: provider.appTheme == ThemeMode.dark
                ? Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.white)
                : Theme.of(context).textTheme.titleSmall),
      )),
    );
  }
}
