import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/AppConfigProvider.dart';

class AyaItem extends StatelessWidget {
String aya;
int ayaNum;
AyaItem({required this.aya, required this.ayaNum});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('$aya' +' '+'(${ayaNum})' ,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      style: provider.appTheme==ThemeMode.dark?
      Theme.of(context).textTheme.titleMedium?.copyWith(
        color: Colors.white):
      Theme.of(context).textTheme.titleMedium),
    );
  }
}
