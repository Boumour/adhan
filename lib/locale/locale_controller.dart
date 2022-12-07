import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zekr/services/settings_services.dart';

class MyLocaleController extends GetxController{
  
  Locale initialLang = SettingsServices.sharedPreferences.getString("lang") == null ? Get.deviceLocale! 
  : Locale(SettingsServices.sharedPreferences.getString("lang")!);

  void changeLang (String codelang){
    Locale locale = Locale(codelang);
    SettingsServices.sharedPreferences.setString("lang",codelang);
    Get.updateLocale(locale);
  }

}