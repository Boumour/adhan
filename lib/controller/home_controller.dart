import 'package:adhan_dart/adhan_dart.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class HomeController extends GetxController{
  
  RxInt selectedIndex = 0.obs;
  late DateTime date;
  late CalculationParameters params;
  late PrayerTimes prayerTimes;
  Coordinates coordinates = Coordinates(31.2115713, 30.0194393);

  String nextPrayerArabic() {
    
    late String x;

      if (prayerTimes.nextPrayer().toString() == 'sunrise'){
        x = 'الشروق';
      }
      else if (prayerTimes.nextPrayer().toString() == 'fajr'){
        x = 'الفجر';
      }
      else if (prayerTimes.nextPrayer().toString() == 'fajrafter'){
        x = 'الفجر';
      }
      else if (prayerTimes.nextPrayer().toString() == 'dhuhr'){
        x = 'الظهر';
      }
      else if (prayerTimes.nextPrayer().toString() == 'asr'){
        x = 'العصر';
      }
      else if (prayerTimes.nextPrayer().toString() == 'maghrib'){
        x = 'المغرب';
      }
      else if (prayerTimes.nextPrayer().toString() == 'isha'){
        x = 'العشاء';
      }
      else {
        x = 'else';
      }

    return x;
  }

  @override
  void onInit() {
    date = DateTime.now();
    params = CalculationMethod.Egyptian();
    params.madhab = Madhab.Shafi;
    prayerTimes = PrayerTimes(coordinates, date, params, precision: true);
  }
}