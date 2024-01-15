import 'package:flutter/material.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class HadethLinesDetails extends StatelessWidget {
String hadethLine;
HadethLinesDetails({required this.hadethLine});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Text(hadethLine, textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style:  provider.appTheme==ThemeMode.dark?
      Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Colors.white):
      Theme.of(context).textTheme.titleSmall);
  }
}
