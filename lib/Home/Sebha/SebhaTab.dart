import 'package:flutter/material.dart';

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
    return Center(
      child: Column(
        children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.12),
              child: Image.asset('assets/images/sebha_head.png',
              height: MediaQuery.of(context).size.height*0.12,),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.11),
              child: Transform.rotate(
                angle: myAngle,
                child: InkWell(
                  onTap: OnSebhaClick,
                  child: Image.asset('assets/images/sebha_body.png',
                  height: MediaQuery.of(context).size.height*0.3),
                ),
              ),
            ),
          ],
        ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text
              ('عـدد الـسبـحـات',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.3,
            height: MediaQuery.of(context).size.height*0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 250, 210),
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text('$counter',style: TextStyle(fontSize: 30,),),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.1,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text(tasbehNameList[index],style: TextStyle(fontSize: 30,color: Colors.white),),
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
