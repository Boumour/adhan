import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> ShowExitPopUp() async {
  return await Get.defaultDialog(
    title: 'Exit',
    content: const Text('هل تود الخروج من التطبيق ؟',style: TextStyle(fontSize: 20)),
    textCancel: 'Cancel',
    confirm: InkWell(onTap: () => exit(0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: Colors.blue),
        borderRadius: BorderRadius.circular(18)
      ),
      child: const Text('Yes',style: TextStyle(fontSize: 18,color: Colors.blue),),
    ),)
  );
}