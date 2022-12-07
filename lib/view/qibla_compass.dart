import 'dart:math';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:zekr/controller/qibla_controller.dart';
import 'package:zekr/widgets/bottomNav.dart';
import 'package:zekr/widgets/showExitPopUp.dart';

class QiblaCompass extends StatelessWidget {

  QiblaController qiblaController = Get.put(QiblaController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => ShowExitPopUp(),
      child: LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      final width = constraints.maxWidth;

      return StreamBuilder<LocationData>(
          stream: qiblaController.locationData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              snapshot.data;
              Coordinates coordinates = Coordinates(
                  snapshot.data!.latitude, snapshot.data!.longitude);
              double degree = Qibla.qibla(coordinates);

              double qibla = degree * (pi / 180);

              // print(qibla);
              return Scaffold(
                backgroundColor: Theme.of(context).primaryColor,
                body: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Column(
                    children: [

                      Text(
                        "إجعل السهم الأزرق لأعلى",
                        style: TextStyle(color: Theme.of(context).backgroundColor, fontSize: 25),
                      ),

                      Image.asset('assets/quran/qaba.png',fit: BoxFit.contain,height: 130,width: double.infinity,),

                      StreamBuilder<CompassEvent>(
                          stream: FlutterCompass.events,
                          builder: (context, snapshot2) {
                            if (snapshot2.hasData) {
                              double compass = -snapshot2.data!.heading! * (pi / 180);
                              // print(compass);
                              return Transform.rotate(
                                angle: compass,
                                child: SizedBox(
                                  height: width,
                                  width: width,
                                  child: Stack(
                                    children: [
                                      Transform.rotate(
                                        angle: qibla,
                                        child: Image.asset('assets/quran/qibla.png'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          })
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNav(),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return Dialog();
            }
            else {
              return Text('return');
            }
          });
    }));
  }
}
