import 'package:flutter/material.dart';
import 'package:zekr/controller/azkar_controller.dart';
import 'package:zekr/widgets/bottomNav.dart';
import 'package:get/get.dart';
import 'package:zekr/widgets/showExitPopUp.dart';

List<AzkarList> azkarList = [];

class AzkarPage extends StatelessWidget {

  // List pages = [AzkarElSapah(),AzkarElMasaa(),Counter()];
  AzkarController controller = Get.put(AzkarController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => ShowExitPopUp(),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('19'.tr),centerTitle: true,
            bottom: const TabBar(
              // onTap: (index) {
              //   Get.to(pages[index]);
              // },
              indicatorWeight: 1,
              indicatorColor: Colors.blue,
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text('أذكار الصباح'),
                ),
                Tab(
                  child: Text('أذكار المساء'),
                ),
                Tab(
                  child: Text('أذكار الصلاة'),
                ),
                Tab(
                  child: Text('أذكار النوم'),
                ),
                Tab(
                  child: Text('أذكار مختارة'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder(
        future: controller.readJosn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(color: Colors.black45);
            },
            itemCount: 24,
            itemBuilder: (context, index) {
              String count = azkarList[index].count;
              RxInt iConunt = int.parse(count).obs;
              return Obx(() => InkWell(
                onTap: () {
                  if (iConunt.value > 0)
                  iConunt.value--;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.black,width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(0,0)
                      )
                    ]
                  ),
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        azkarList[index].category,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        azkarList[index].zekr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'UthmanTN1_Ver10'
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          azkarList[index].description + '  [' + azkarList[index].reference +']',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            // color: Colors.grey,
                            fontFamily: 'UthmanTN1_Ver10'
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          color: Colors.black,
                          child: Text(
                            iConunt.value.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
            }
          );
        }
      ),
              Container(child: SelectableText('قثتفقتفقتفقتقفdd'),),
              Container(child: const Text('dd'),),
              Container(child: const Text('dd'),),
              Container(child: const Text('dd'),),
            ],
          ),
          bottomNavigationBar: BottomNav()
    ),
      ));
  }
}

            // image: DecorationImage(image: SettingsServices.sharedPreferences.getBool("theme") == true ? const AssetImage('assets/images/img2.jpg') : const AssetImage('assets/images/img.jpg'))
