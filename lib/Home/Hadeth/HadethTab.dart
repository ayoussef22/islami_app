import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Home/Hadeth/HadethNameItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../../MyTheme.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      LoadHadethFile();
    }
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/hadeth_bg.png'))),
        )),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 8),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.hadeth_name,
                        style: provider.appTheme == ThemeMode.dark
                            ? Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white)
                            : Theme.of(context).textTheme.titleMedium),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: provider.appTheme == ThemeMode.dark
                              ? MyTheme.yellowColor
                              : Theme.of(context).primaryColor,
                          width: 2)),
                ),
                ahadethList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return HadethNameItem(hadeth: ahadethList[index]);
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                color: provider.appTheme == ThemeMode.dark
                                    ? MyTheme.yellowColor
                                    : Theme.of(context).primaryColor,
                                height: 2,
                              );
                            },
                            itemCount: ahadethList.length),
                      )
              ],
            )),
      ],
    );
  }

  void LoadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(hadethTiltle: title, hadethContent: hadethLines);

      setState(() {
        ahadethList.add(hadeth);
      });
    }
  }
}

class Hadeth {
  //data class
  String hadethTiltle;
  List<String> hadethContent;

  Hadeth({required this.hadethTiltle, required this.hadethContent});
}
