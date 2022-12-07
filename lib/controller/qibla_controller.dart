import 'package:get/get.dart';
import 'package:location/location.dart';

class QiblaController extends GetxController{
  Location location = Location();
  late Stream<LocationData> locationData;

  @override
  void onInit() {
    locationData = location.onLocationChanged;
  }
}