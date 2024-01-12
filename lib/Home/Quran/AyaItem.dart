import 'package:flutter/material.dart';

class AyaItem extends StatelessWidget {
String aya;
int ayaNum;
AyaItem({required this.aya, required this.ayaNum});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('$aya' +' '+'(${ayaNum})' ,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),),
    );
  }
}
