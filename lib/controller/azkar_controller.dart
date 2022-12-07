import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zekr/view/azkar/New%20folder/azkar_by_category.dart';
import 'package:zekr/view/azkar/azkarPage.dart';
import 'package:zekr/view/azkar/azkar_elsapah.dart';

class AzkarList {
  final category;
  final count;
  final description;
  final reference;
  final zekr;

  AzkarList({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.zekr,
  });
  
  factory AzkarList.fromjson(Map<String , dynamic> json) => AzkarList(
    category: json['category'],
    count: json['count'],
    description: json['description'],
    reference: json['reference'],
    zekr: json['zekr'],
  );
}

class AzkarController extends GetxController{

  AzkarByCategory azkarByCategory = AzkarByCategory();
  final String azkar = '';

  Future<void> readJosn() async {
    final String response = await rootBundle.loadString('assets/json/azkarlist.json');
    final data = await json.decode(response);
    for (var item in data['azkarlist']){
      azkarList.add(AzkarList.fromjson(item));
    }
  }

  @override
  void onInit() {
    readJosn();
  }
}