import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekr/services/settings_services.dart';

class Themes {

  late bool isDark;

  ThemeData customDarkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    backgroundColor: Colors.white,
    buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.red,width: 700),
    appBarTheme: const AppBarTheme(color: Colors.black,titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),iconTheme: IconThemeData(color: Colors.white,size: 25)),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white,fontSize: 50),
      bodyMedium: TextStyle(color: Colors.white,fontSize: 17),
      labelMedium: TextStyle(color: Colors.grey,fontSize: 13),
      displayMedium: TextStyle(color: Colors.white,fontSize: 20),
    )
  );
  ThemeData customLightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    backgroundColor: Colors.black,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.red,width: 700),
    appBarTheme: const AppBarTheme(color: Colors.black,titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),iconTheme: IconThemeData(color: Colors.white,size: 25)),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.black),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.black,fontSize: 50),
      bodyMedium: TextStyle(color: Colors.black,fontSize: 17),
      labelMedium: TextStyle(color: Colors.grey,fontSize: 13),
      displayMedium: TextStyle(color: Colors.black,fontSize: 20),
    )
  );

  void changeTheme(){
    if (Get.isDarkMode){
      isDark = false;
      Get.changeTheme(customLightTheme);
      SettingsServices.sharedPreferences.setBool("theme",isDark);
    } else {
      isDark = true;
      Get.changeTheme(customDarkTheme);
      SettingsServices.sharedPreferences.setBool("theme",isDark);
      }
  }
}