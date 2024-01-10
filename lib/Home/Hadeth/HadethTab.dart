import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Home/Hadeth/HadethNameItem.dart';

class HadethTab extends StatefulWidget {

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList=[];
  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty){
      LoadHadethFile();
    }
    return Column(
      children: [
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/hadeth_bg.png')
                  )
              ),
            )
        ),
        Expanded(flex: 3,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12,bottom: 8),
                  padding: EdgeInsets.all(8),
                  child: Center(child: Text('Hadth Names',style: TextStyle(fontSize: 23),),),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor,width: 2)
                  ),
                ),
                ahadethList.isEmpty ?
                    Center(child: CircularProgressIndicator(),):
                 Expanded(
                   child: ListView.separated(
                      itemBuilder: (context,index){
                        return HadethNameItem(hadeth: ahadethList[index]);
                      },
                      separatorBuilder: (context,index){
                        return Container(color: Theme.of(context).primaryColor,
                          height: 2,);
                      },
                      itemCount: ahadethList.length),
                 )

              ],
            )
        ),
      ],
    );
  }


  void LoadHadethFile()async{
    String hadethContent=await rootBundle.loadString('assets/files/ahadeth.txt');
    List <String> hadethList=hadethContent.split('#\n');
    for(int i=0;i<=hadethList.length;i++){
      List<String> hadethLines=hadethList[i].split('\n');
      String title=hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth=Hadeth(hadethTiltle: title, hadethContent: hadethLines);

      setState(() {
        ahadethList.add(hadeth);
      });


    }
  }
}

class Hadeth{ //data class
  String hadethTiltle;
  List<String> hadethContent;
  Hadeth({required this.hadethTiltle, required this.hadethContent});
}
