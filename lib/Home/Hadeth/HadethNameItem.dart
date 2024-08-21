import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/HadethScreen.dart';
import 'package:islami_app/Home/Hadeth/HadethTab.dart';
import 'package:provider/provider.dart';

import '../../Providers/AppConfigProvider.dart';

class HadethNameItem extends StatelessWidget {
Hadeth hadeth;
HadethNameItem({required this.hadeth});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethScreen.routeName,
        arguments:hadeth
        );
      },
      child: Center(child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(hadeth.hadethTiltle,style:
        provider.appTheme==ThemeMode.dark?
        Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white):
        Theme.of(context).textTheme.titleSmall),
      )),
    );
  }
}
