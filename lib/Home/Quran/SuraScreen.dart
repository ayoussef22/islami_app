import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Home/Quran/AyaItem.dart';
import 'package:provider/provider.dart';

import '../../MyTheme.dart';
import '../../Providers/AppConfigProvider.dart';

class SuraScreen extends StatefulWidget {
static const String routeName='sura screen';

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as SuraScreenArgs;
    if (verses.isEmpty){
      LoadFileContet(args.suraPositionArg);
    }
    return SafeArea(
      child: Stack(
        children: [
          provider.appTheme==ThemeMode.dark ?
          Image.asset('assets/images/background_dark.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill):
          Image.asset('assets/images/background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,),
          Scaffold(
            appBar: AppBar(title: Text('${args.suraNameArg}'),),
            body: verses==0?
            const Center(child: CircularProgressIndicator(),):
                 Container(
                   margin: EdgeInsets.symmetric(
                     horizontal: MediaQuery.of(context).size.width*0.05,
                     vertical: MediaQuery.of(context).size.height*0.06
                   ),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(30),
                     color: const Color.fromARGB(84, 255, 255, 255),
                   ),
                   child: ListView.separated(itemBuilder: (context,index){
                      return AyaItem(aya: verses[index],ayaNum: index+1,);
                    },
                    itemCount: verses.length,
                    separatorBuilder: (context,index){
                      return Container(color: provider.appTheme==ThemeMode.dark?
                      MyTheme.yellowColor:
                      Theme.of(context).primaryColor,
                      height: 2, margin: const EdgeInsets.symmetric(horizontal: 20),);
                    },),
                 ),

          )
        ],
      ),
    );
  }

  List<String> verses=[];

  void LoadFileContet(int index)async{
    String content =await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines=content.split('\n');
    setState(() {
      verses=lines;
    });

  }
}

class SuraScreenArgs{ // data class
  String suraNameArg;
  int suraPositionArg;
  SuraScreenArgs({required this.suraNameArg, required this.suraPositionArg});
}
