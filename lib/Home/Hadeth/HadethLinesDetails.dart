import 'package:flutter/material.dart';

class HadethLinesDetails extends StatelessWidget {
String hadethLine;
HadethLinesDetails({required this.hadethLine});
  @override
  Widget build(BuildContext context) {
    return Text(hadethLine, textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22),);
  }
}
