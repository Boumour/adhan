import 'package:flutter/material.dart';
import 'package:zekr/controller/quran_controller.dart';
import 'package:quran/quran.dart' as quran;

class SurahPage extends StatelessWidget {

  final Surah surah;
  SurahPage({required this.surah});
  
  @override
  Widget build(BuildContext context) {
    int count  = surah.versesCount;
    int index = surah.id;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 235, 230, 230),
        body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: header(),
            ),
            const SizedBox(height: 5),
            RichText(
              textAlign: count <= 20 ? TextAlign.center : TextAlign.justify,
              text: TextSpan(
                children: [
                  for (var i = 1 ; i <= count ; i++) ...{
                    TextSpan(
                      text: ' ' + quran.getVerse(index, i, verseEndSymbol: false) + ' ',
                      style: TextStyle(
                        fontFamily: 'uthmanic_hafs_v20',
                        fontSize: 20,
                        color: Theme.of(context).backgroundColor
                      )
                    ),
                  }
                ]
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/quran/surahBanner.png")
              )
            ),
            child: Text(
              "سورة ${surah.arabicName}",
              style: const TextStyle(
                fontFamily: 'uthmanic_hafs_v20',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          Container(
            child: const Text(
              quran.basmala,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'uthmanic_hafs_v20',
                fontSize: 20
              ),
            ),
          )
        ],
      ),
    );
  }

}