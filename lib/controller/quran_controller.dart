import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:zekr/view/quran/quran.dart';
import 'package:zekr/view/quran/search.dart';

class Surah {
  int id;
  String revelationPlace;
  int revelationOrder;
  String name;
  String arabicName;
  int versesCount;
  Surah({
    required this.id,
    required this.revelationPlace,
    required this.revelationOrder,
    required this.name,
    required this.arabicName,
    required this.versesCount
  });
  factory Surah.fromMap(Map<String, dynamic> json) => Surah(
    id: json["id"],
    revelationPlace: json["revelation_place"],
    revelationOrder: json["revelation_order"],
    name: json["name_simple"],
    arabicName: json["name_arabic"],
    versesCount: json["verses_count"]
  );
}

class Quran {
  Quran({
    required this.surah_number,
    required this.verse_number,
    required this.content,
    required this.content_emlaey,
    required this.sura_name_ar
  });

  final int surah_number;
  final int verse_number;
  final String content;
  final String content_emlaey;
  final String sura_name_ar;

  factory Quran.fromJson(Map<String, dynamic> json) => Quran(
    surah_number: json["surah_number"],
    verse_number: json["verse_number"],
    content: json["content"],
    content_emlaey: json["content_emlaey"],
    sura_name_ar: json['sura_name_ar']
  );
}

class QuranController extends GetxController {

  RxInt selectedIndex = 0.obs;
  RxBool isReverse = false.obs;
  RxList results = [].obs;
  var rows = [].obs;
  RxString query = ''.obs;
  Rx<TextEditingController> tc = TextEditingController().obs;
  RxList searchResult = [].obs;
  
  
  Future<void> readJsonSurahList() async {
    final String response = await rootBundle.loadString('assets/json/quran/surah.json');
    final data = await json.decode(response);
    for (var item in data["chapters"]) {
      surahList.add(Surah.fromMap(item));
    }
  }

  Future<void> readJsonQuran() async {
    final String response = await rootBundle.loadString('assets/json/quran/hafsData_v2-0.json');
    final data = await json.decode(response);
    for (var item in data["text"]) {
      userDetails.add(Quran.fromJson(item));
      surahList2.add(Quran.fromJson(item));
    }
  }

  @override
  void onInit() {
    readJsonSurahList();
    readJsonQuran();
  }

}