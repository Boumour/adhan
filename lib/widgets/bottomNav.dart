import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekr/controller/home_controller.dart';
import 'package:zekr/view/azkar/azkarPage.dart';
import 'package:zekr/view/homepage.dart';
import 'package:zekr/view/qibla_compass.dart';
import 'package:zekr/view/quran/quran.dart';

class BottomNav extends StatelessWidget{

  List pages = [HomePage(),QuranPage(),AzkarPage(),QiblaCompass()];

  Widget build(BuildContext context){
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          // FloatingActionButton(
          //   onPressed: () {
              
          //   },
          //   child: const Text('Home'),
          // ),
          GetX<HomeController>(builder: ((controller) => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            backgroundColor: Colors.black,
            fixedColor: Colors.white,
            onTap: (index) {
              controller.selectedIndex.value = index;
              Get.off(pages[index]);
            },
            items: [
              const BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home,color: Colors.grey,size: 35,)
              ),
              BottomNavigationBarItem(
                label: 'Quran',
                icon: Image.asset('assets/icons/quran.png',scale: 2.3)
              ),
              BottomNavigationBarItem(
                label: 'Azkar',
                icon: Image.asset('assets/icons/tasbih.png',scale: 2.5,alignment: Alignment.topCenter,)
              ),
              const BottomNavigationBarItem(
                label: 'qaba',
                icon: Icon(Icons.call_merge,color: Colors.grey,size: 40,)
              ),
            ],
            ))

          ),
        ],
      ),
    );
  }
}