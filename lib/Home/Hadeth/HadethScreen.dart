import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/HadethLinesDetails.dart';
import 'package:islami_app/Home/Hadeth/HadethTab.dart';
import 'package:provider/provider.dart';

import '../../Providers/AppConfigProvider.dart';

class HadethScreen extends StatelessWidget {
  static const String routeName='hadeth screen';

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as Hadeth;
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
            appBar: AppBar(title: Text(args.hadethTiltle),),
            body:
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width*0.05,
                  vertical: MediaQuery.of(context).size.height*0.06
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(84, 255, 255, 255),
              ),
              child: ListView.builder(itemBuilder: (context,index){
                return HadethLinesDetails(hadethLine: args.hadethContent[index]);
              },
                itemCount: args.hadethContent.length,
              )
            ),

          )
        ],
      ),
    );
  }
  }

