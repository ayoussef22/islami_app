import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/HadethTab.dart';
import 'package:islami_app/Home/Quran/QuranTab.dart';
import 'package:islami_app/Home/Radio/RadioTab.dart';
import 'package:islami_app/Home/Sebha/SebhaTab.dart';

class HomeScreen extends StatefulWidget {
static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget>tabs=[QuranTab(),HadethTab(),SebhaTab(),RadioTab()];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset('assets/images/background.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,),
          Scaffold(
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor:Theme.of(context).primaryColor),
              child: BottomNavigationBar(
                currentIndex:selectedIndex ,
                onTap: (index){
                  setState(() {
                    selectedIndex=index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: 'Quran'
                  ), BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: 'Hadeth'
                  ), BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: 'Radio'),
                ],
              ),
            ),
            appBar: AppBar(title: Text('Islami'),),
            body: tabs[selectedIndex]
          ),

        ],
      ),
    );
  }
}
