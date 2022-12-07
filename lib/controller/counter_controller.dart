import 'package:get/get.dart';
import 'package:zekr/services/settings_services.dart';

class CounterController extends GetxController{

  static int count = SettingsServices.sharedPreferences.getInt("count") ?? 0;

  increment() {
    count++;
    update();
  }

  zero() {
    count=0;
    update();
  }

}