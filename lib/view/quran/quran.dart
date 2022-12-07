import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zekr/controller/quran_controller.dart';
import 'package:zekr/view/quran/SurahPage.dart';
import 'package:zekr/view/quran/search.dart';
import 'package:zekr/widgets/bottomNav.dart';
import 'package:zekr/widgets/showExitPopUp.dart';

List<Surah> surahList = [];
List<Quran> surahList2 = [];

class QuranPage extends StatelessWidget {

  ScrollController _controller = ScrollController();
  QuranController quranController = Get.put(QuranController());

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () => ShowExitPopUp(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.search),onPressed: () => Get.to(() => Search()),),
          centerTitle: true,
          actions: [ Obx(() =>
            Transform.rotate(
            angle: quranController.isReverse.value ? pi : 2 * pi,
            child: IconButton(
              icon: const Icon(Icons.sort),
              onPressed: (){
                quranController.isReverse.value = !quranController.isReverse.value;
              },
            ),
            ),
          )],
        ),
        body: Obx(() => surahList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : chaptersList(quranController.isReverse.value ? surahList.reversed.toList() : surahList)),
        bottomNavigationBar: BottomNav()
      ));
  }

  Widget chaptersList(List<Surah> chapters) {
    return ListView.separated(
      controller: _controller,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).backgroundColor,
          child: Text(chapters[index].id.toString(),style: TextStyle(color: Theme.of(context).primaryColor),),
        ),
        title: Text(
          chapters[index].arabicName,
          style: const TextStyle(fontFamily: 'uthmanic_hafs_v20',fontSize: 23,fontWeight: FontWeight.w200)
        ),
        subtitle: Text('آياتها: ${chapters[index].versesCount.toString()}',style: const TextStyle(fontFamily: 'uthmanic_hafs_v20',fontWeight: FontWeight.w200,fontSize: 15)),
        trailing: Text(chapters[index].name,style: const TextStyle(fontFamily: 'uthmanic_hafs_v20')),
        onTap: () => Get.to(() => SurahPage(surah: chapters[index]))
      ),
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemCount: chapters.length,
    );
  }
}