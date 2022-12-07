// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:zekr/controller/quran_controller.dart';
// import 'package:quran/quran_text.dart' as quran;
// import 'package:zekr/view/quran/SurahPage.dart';

// class Testing extends StatelessWidget {

//   List<Surah> surah = [];

//   @override
//   Widget build(BuildContext context) {
//     int count = quran.quranText.length;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         body: PageView.builder(
//           itemCount: quran.quranText.length,
//           itemBuilder: (context, index) {
//             return SafeArea(
//               minimum: const EdgeInsets.all(10),
//               child: ListView(children: [
//                 // Padding(
//                 //   padding: const EdgeInsets.all(1),
//                 //   child: header(),
//                 // ),
//                 const SizedBox(height: 5),
//                 RichText(
//                   textAlign: count <= 20 ? TextAlign.center : TextAlign.justify,
//                   text: TextSpan(
//                     children: [
//                       for (var i = 1 ; i <= count ; i++) ...{
//                         TextSpan(
//                           text: '${quran.quranText[i]['content']}',
//                           style: TextStyle(
//                             fontFamily: 'kitab',
//                             fontSize: 25,
//                             // color: Theme.of(context).backgroundColor
//                           )
//                         ),
//                         WidgetSpan(
//                           alignment: PlaceholderAlignment.middle,
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 40,
//                             width: 35,
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(image: AssetImage('assets/quran/ayaNumber.png'))
//                             ),
//                             child: Text("$i",style: const TextStyle(color: Colors.black),textAlign: TextAlign.center,textScaleFactor: i.toString().length <= 2 ? 1 : .8,),
//                           )
//                         )
//                       }
//                     ]
//                   ),
//                 )
//               ]),
//             );
//               },
//         )
//       ),
//     )
//     );
//   }

//   // Widget header() {
//   //   return Container(
//   //     child: Column(
//   //       children: [
//   //         Container(
//   //           alignment: Alignment.center,
//   //           height: 100,
//   //           width: double.infinity,
//   //           decoration: const BoxDecoration(
//   //             image: DecorationImage(
//   //               fit: BoxFit.fill,
//   //               image: AssetImage("assets/quran/surahBanner.png")
//   //             )
//   //           ),
//   //           child: Text(
//   //             "سورة ${surah.arabicName}",
//   //             style: const TextStyle(
//   //               fontFamily: 'UthmanTN1_Ver10',
//   //               fontSize: 25,
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.black
//   //             ),
//   //           ),
//   //         ),
//   //         Container(
//   //           child: Text(
//   //             "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
//   //             textDirection: TextDirection.rtl,
//   //             style: TextStyle(
//   //               fontFamily: 'UthmanTN1_Ver10',
//   //               fontSize: 24
//   //             ),
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   }