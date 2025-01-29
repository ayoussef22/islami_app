import 'package:flutter/material.dart';
import 'package:islami_app/Home/Quran/SuraNamesItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  List<String> names = [
    'الفاتحة',
    'البقرة',
    'آل عمران',
    'النساء',
    'المآئدة',
    'الأنعام',
    'الأعراف',
    'الأنفال',
    'التوبة',
    'يونس',
    'هود',
    'يوسف',
    'الرعد',
    'إبراهيم',
    'الحجر',
    'النحل',
    'الإسراء',
    'الكهف',
    'مريم',
    'طـه',
    'الأنبياء',
    'الحج',
    'المؤمنون',
    'النور',
    'الفرقان',
    'الشعراء',
    'النمل',
    'القصص',
    'العنكبوت',
    'الروم',
    'لقمان',
    'السجدة',
    'الأحزاب',
    'سبأ',
    'فاطر',
    'يس',
    'الصافات',
    'ص',
    'الزمر',
    'غافر',
    'فصلت',
    'الشورى',
    'الزخرف',
    'الدخان',
    'الجاثية',
    'الأحقاف',
    'محمد',
    'الفتح',
    'الحجرات',
    'ق',
    'الذاريات',
    'الطور',
    'النجم',
    'القمر',
    'الرحمن',
    'الواقعة',
    'الحديد',
    'المجادلة',
    'الحشر',
    'الممتحنة',
    'الصف',
    'الجمعة',
    'المنافقون',
    'التغابن',
    'الطلاق',
    'التحريم',
    'الملك',
    'القلم',
    'الحاقة',
    'المعارج',
    'نوح',
    'الجن',
    'المزمل',
    'المدثر',
    'القيامة',
    'الإنسان',
    'المرسلات',
    'النبأ',
    'النازعات',
    'عبس',
    'التكوير',
    'الإنفطار',
    'المطففين',
    'الإنشقاق',
    'البرج',
    'الطارق',
    'الأعلى',
    'الغاشية',
    'الفجر',
    'البلد',
    'الشمس',
    'الليل',
    'الضحى',
    'الشرح',
    'التين',
    'العلق',
    'القدر',
    'البيِّنة',
    'الزلزلة',
    'العاديات',
    'القارعة',
    'التكاثر',
    'العصر',
    'الهمزة',
    'الفيل',
    'قريش',
    'الماعون',
    'الكوثر',
    'الكافرون',
    'النصر',
    'المسد',
    'الإخلاص',
    'الفلق',
    'الناس',
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/quran_bg.png'))),
        )),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 8),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.sura_name,
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
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SuraNamesItem(
                            suraName: names[index],
                            suraPosition: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            color: provider.appTheme == ThemeMode.dark
                                ? MyTheme.yellowColor
                                : Theme.of(context).primaryColor,
                            height: 2,
                          );
                        },
                        itemCount: names.length))
              ],
            )),
      ],
    );
  }
}
