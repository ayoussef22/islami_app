import 'package:flutter/material.dart';
import 'package:islami_app/Home/Quran/SuraNamesItem.dart';

class QuranTab extends StatelessWidget {
  List<String>names=['الفاتحة','البقرة','آل عمران','النساء','المآئدة','الأنعام','الأعراف',
    'الأنفال','التوبة','يونس','هود','يوسف','الرعد','إبراهيم','الحجر','النحل','الإسراء','الكهف','مريم','طـه','الأنبياء',
    'الحج','المؤمنون','النور','الفرقان','الشعراء','النمل','القصص','العنكبوت','الروم','لقمان','السجدة','الأحزاب','سبأ','فاطر',
    'يس','الصافات','ص','الزمر','غافر','فصلت','الشورى','الزخرف','الدخان','الجاثية','الأحقاف','محمد','الفتح','الحجرات',
    'ق','الذاريات','الطور','النجم','القمر','الرحمن','الواقعة','الحديد','المجادلة','الحشر','الممتحنة','الصف',
    'الجمعة','المنافقون','التغابن','الطلاق','التحريم','الملك','القلم','الحاقة','المعارج','نوح','الجن','المزمل',
    'المدثر','القيامة','الإنسان','المرسلات','النبأ','النازعات','عبس','التكوير','الإنفطار','المطففين','الإنشقاق','البرج',
    'الطارق','الأعلى','الغاشية','الفجر','البلد','الشمس','الليل','الضحى','الشرح','التين','العلق','القدر',
    'البيِّنة','الزلزلة','العاديات','القارعة','التكاثر','العصر','الهمزة','الفيل','قريش','الماعون','الكوثر','الكافرون',
    'النصر','المسد','الإخلاص','الفلق','الناس',];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/quran_bg.png')
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
                  child: Center(child: Text('Sura Names',style: TextStyle(fontSize: 23),),),
                          decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor,width: 2)
                          ),
                        ),
                Expanded(child: ListView.separated(
                    itemBuilder: (context,index){
                      return SuraNamesItem(suraName: names[index],suraPosition: index,);
                    },
                    separatorBuilder: (context,index){
                      return Container(color: Theme.of(context).primaryColor,
                      height: 2,);
                    },
                    itemCount: names.length))
              ],
            )
        ),
      ],
    );
  }
}
