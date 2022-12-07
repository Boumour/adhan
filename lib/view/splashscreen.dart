import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:zekr/controller/animation_route.dart';
import 'package:zekr/view/homepage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    startApp(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Lottie.asset('assets/splashscreen.json', width: 300),
          Text(
            'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 25,fontFamily: 'uthmanic_hafs_v20'),
          ),
          const SizedBox(height: 180,),
          const SizedBox(
            height: 50,
            width: 50,
            child: LoadingIndicator(
              indicatorType: Indicator.ballPulse,
              strokeWidth: 20,
              colors: [
                Colors.white,
                Colors.white,
                Colors.white
              ],
            ),
          )
        ],
      ),
    );
  }

  startApp(BuildContext context){
    Timer(
      const Duration(seconds: 3),
      (){
        Navigator.of(context).pushReplacement(SlideRight(Page: HomePage()));
      }
    );
  }

}



















      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Color(0xff29286C),
      //       Color(0xffE69ED8),
      //     ],
      //   ),
      // ),