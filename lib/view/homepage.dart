import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:jiffy/jiffy.dart';
import 'package:location/location.dart';
import 'package:zekr/controller/changeTheme.dart';
import 'package:zekr/controller/home_controller.dart';
import 'package:zekr/view/allahummabaarikalamuhammad.dart';
import 'package:zekr/view/azkar/counter.dart';
import 'package:zekr/view/info.dart';
import 'package:zekr/view/qibla_compass.dart';
import 'package:zekr/view/quran/quran.dart';
import 'package:zekr/view/settings.dart';
import 'package:zekr/widgets/bottomNav.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:zekr/widgets/showExitPopUp.dart';

class HomePage extends StatelessWidget {

  HomeController homeController = Get.put(HomeController());
  Location location = Location();

  @override
  Widget build(context) {

    HijriCalendar hijri = HijriCalendar.now();
    HijriCalendar.setLocal('ar');
    int alarmID = 1;

    return WillPopScope(
      onWillPop: () => ShowExitPopUp(),
      child: Scaffold(

      appBar: AppBar(title: Text("1".tr),centerTitle: true,),

      drawer: Container(
        
        color: Theme.of(context).primaryColor,
        width: 233,
        
        child: Column(children: [
          
          Padding(
            padding: const EdgeInsets.only(top: 40,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  alignment: Alignment.topRight,
                  icon: const Icon(CupertinoIcons.moon_stars_fill,color: Colors.grey,),
                  onPressed: (){
                    Themes().changeTheme();
                  },
                ),
              ],
            ),
          ),
          
          Container(margin: const EdgeInsets.symmetric(horizontal: 30), child: Image.asset("assets/quran/qaba.png",fit: BoxFit.cover)),
          
          const SizedBox(height: 33),

          InkWell(
            child: Card(
            shape: RoundedRectangleBorder(side: const BorderSide(width: 1),borderRadius: BorderRadius.circular(33)),
            margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            child: Row(
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.home_outlined,size: 30),
                const SizedBox(width: 8,height: 55,),
                Text("1".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium),
              ],)
            ),
            onTap: (){
              Get.back();
            }
          ),

          InkWell(
            child: Card(
              shape: RoundedRectangleBorder(side: const BorderSide(width: 1),borderRadius: BorderRadius.circular(33)),
              margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.settings,size: 30),
                  const SizedBox(width: 30,height: 55,),
                  Text("2".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium),
                ],
              )
            ),
            onTap: (){
              Get.to(() => Settings());
            },
          ),

          InkWell(
            child: Card(
              shape: RoundedRectangleBorder(side: const BorderSide(width: 1),borderRadius: BorderRadius.circular(33)),
              margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.info,size: 30),
                  const SizedBox(width: 18,height: 55,),
                  Text("10".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium),
                ],
              )
            ),
            onTap: (){
              Get.to(() => const Info());
            },
          ),

        ]),
      ),
      
      body: ListView(
        children: [
          
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: 350,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 230, 139, 19),
                    Color.fromARGB(255, 6, 43, 92),
                ]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0,0)
                  )
                ]
              ),

              child: Column(
                children: [
                  
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black,width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 220, 57, 152),
                                ),
                                margin: const EdgeInsets.only(right: 10,top: 10),
                                height: 70,
                                width: 130,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(hijri.toFormat('dd MMMM yyyy هـ').toString(),style: const TextStyle(fontSize: 13,color: Colors.white)),
                                    Text(Jiffy().format('EEEE d MMMM y'),style: const TextStyle(fontSize: 13,color: Colors.white))
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 20),

                          Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/backgroundCircular.png'),fit: BoxFit.cover)
                                ),
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.only(top: 50,right: 5),
                                height: 180,
                                width: 125,
                                child: StreamBuilder(
                                  stream: remainsTime(),
                                  builder: (context, snapshot) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(homeController.nextPrayerArabic(),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        const Text('بعد',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 0,),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 13.0),
                                          child: Text(
                                            "${snapshot.data ?? ''}",
                                            style: const TextStyle(color: Colors.black, fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Expanded(child: SizedBox()),
                  
                  StreamBuilder(
                    stream: location.onLocationChanged,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting){
                        return const Center(child: CircularProgressIndicator());
                      }

                      snapshot.data;
                      homeController.coordinates = Coordinates(snapshot.data!.latitude, snapshot.data!.longitude);
                      homeController.prayerTimes = PrayerTimes(homeController.coordinates, homeController.date, homeController.params, precision: true);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 33),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 82, 10, 218),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(children: [
                                const Text("الشروق", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white)),
                                const Expanded(child: SizedBox()),
                                Text(timePresenter(homeController.prayerTimes.sunrise!.toLocal()), style: const TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white))
                              ],),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 82, 10, 218),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(children: [
                                const Text("الفجر", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                const Expanded(child: SizedBox()),
                                Text(timePresenter(homeController.prayerTimes.fajr!.toLocal()), style: const TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white))
                              ],),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 82, 10, 218),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(children: [
                                const Text("الظهر", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                const Expanded(child: SizedBox()),
                                Text(timePresenter(homeController.prayerTimes.dhuhr!.toLocal()), style: const TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white))
                              ],),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 82, 10, 218),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(children: [
                                const Text("العصر", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                const Expanded(child: SizedBox()),
                                Text(timePresenter(homeController.prayerTimes.asr!.toLocal()), style: const TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white))
                              ],),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 82, 10, 218),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(children: [
                                const Text("المغرب", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                const Expanded(child: SizedBox()),
                                Text(timePresenter(homeController.prayerTimes.maghrib!.toLocal()), style: const TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white))
                              ],),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 82, 10, 218),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(children: [
                                const Text("العشاء", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white)),
                                const Expanded(child: SizedBox()),
                                Text(timePresenter(homeController.prayerTimes.isha!.toLocal()), style: const TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white))
                              ],),
                            ),
                        ],),
                      );
                    }
                  ),
                  
                ],
              ),
          ),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              MaterialButton(
                onPressed: (){
                  Get.to(() => const Counter());
                },child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    width: 140,height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                        Color.fromARGB(255, 40, 108, 49),
                        Color.fromARGB(255, 230, 211, 158),
                      ])),
                    child: Text("11".tr),
                  )
                ]),
              ),
                        
              MaterialButton(
                onPressed: (){
                  Get.to(() => QuranPage());
                },child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    width: 140,height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                        Color(0xff29286C),
                        Color(0xffE69ED8),
                      ])),
                    child: Text("12".tr),
                  )
                ]),
              ),

            ],
          ),
          
          const SizedBox(height: 50,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: (){
                  Get.to(() => QiblaCompass());
                },child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    width: 140,height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                        Color.fromARGB(255, 40, 108, 49),
                        Color.fromARGB(255, 230, 211, 158),
                      ])),
                    child: Text("13".tr),
                  )
                ]),
              ),

              MaterialButton(
                onPressed: (){
                  Get.to(() => AllahummabaarikAlaMuhammad());
                },child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    width: 140,height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                        Color.fromARGB(255, 40, 108, 49),
                        Color.fromARGB(255, 230, 211, 158),
                      ])),
                    child: Text("17".tr),
                  )
                ]),
              ),

            
            
            ],
          ),

        ]
      ),
      


      bottomNavigationBar: BottomNav(),      
    ));
  }

  remainsTime() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (t) {
      final prayer = homeController.prayerTimes.nextPrayer();
      DateTime nextPrayerTime = homeController.prayerTimes.timeForPrayer(prayer)!.toLocal();
      DateTime now = DateTime.now();
      Duration remains = nextPrayerTime.difference(now);
      return secondToHour(remains.inSeconds);
    });
  }

  secondToHour(int seconds) {
    int minutes = seconds ~/ 60;
    int hours = minutes ~/ 60;
    seconds = seconds - minutes * 60;
    minutes = minutes - hours * 60;
    return "$hours:$minutes:$seconds";
  }

  String timePresenter(DateTime dateTime) {
    String timeInString = "";
    bool isGreaterThan12 = dateTime.hour > 12;
    String prefix = dateTime.hour > 11 ? "pm" : "am";

    int hour = isGreaterThan12 ? dateTime.hour - 12 : dateTime.hour;
    int minute = dateTime.minute;
    String hourInString = hour.toString().length == 1 ? "0$hour" : "$hour";
    String minuteInString = minute.toString().length == 1 ? "0$minute" : "$minute";
    return "$hourInString:$minuteInString $prefix";
  }

}