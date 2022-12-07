import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'package:zekr/controller/changeTheme.dart';
import 'package:zekr/main.dart';

class SettingsServices extends GetxService{

  static late SharedPreferences sharedPreferences;

  Future<SettingsServices> init () async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getBool("theme") == true ? Get.changeTheme(Themes().customDarkTheme) : Get.changeTheme(Themes().customLightTheme);
    await Jiffy.locale("ar");
    // HomeWidget.registerBackgroundCallback();
    // await Workmanager().initialize(callbackDesPatcher,isInDebugMode: true);
    return this;
  }

}