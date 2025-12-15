import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:provider/provider.dart';

import '../../Providers/AppConfigProvider.dart';
import '../../l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double myAngle = 0;
  int counter = 0;

  List<String> tasbehNameList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    final screenWidth = MediaQuery.of(context).size.width;

    final double bodySize = screenWidth * 0.6;
    final double headSize = screenWidth * 0.22;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: bodySize + headSize,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: headSize,
                    left: (screenWidth - bodySize) / 2,
                    child: Transform.rotate(
                      angle: myAngle,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: onSebhaClick,
                        child: Image.asset(
                          provider.appTheme == ThemeMode.dark
                              ? 'assets/images/sebha_body_dark.png'
                              : 'assets/images/sebha_body.png',
                          width: bodySize,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: headSize * 0.22,
                    left: (screenWidth / 2) + bodySize * 0.12,
                    child: Image.asset(
                      provider.appTheme == ThemeMode.dark
                          ? 'assets/images/sebha_head_dark.png'
                          : 'assets/images/sebha_head.png',
                      width: headSize,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              AppLocalizations.of(context)!.number_of_praises,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 16),

            Container(
              width: screenWidth * 0.3,
              height: screenWidth * 0.18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.dark
                    ? Theme.of(context).primaryColor
                    : const Color.fromARGB(255, 250, 250, 210),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            const SizedBox(height: 16),

            Container(
              width: screenWidth * 0.55,
              height: screenWidth * 0.18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.yellowColor
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                tasbehNameList[index],
                style: provider.appTheme == ThemeMode.dark
                    ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                  color: Theme.of(context).primaryColor,
                )
                    : Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSebhaClick() {
    setState(() {
      myAngle += 0.25;

      counter++;
      if (counter == 30) {
        counter = 0;
        index++;
        if (index == tasbehNameList.length) {
          index = 0;
        }
      }
    });
  }
}
