import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekr/controller/azkar_controller.dart';
import 'package:zekr/view/azkar/azkarPage.dart';

AzkarController controller = Get.put(AzkarController());

class AzkarElSapah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('20'.tr),centerTitle: true,),
      body: FutureBuilder(
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
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 78, 240, 64),
                    borderRadius: BorderRadius.circular(50)
                  ),
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
                        margin: const EdgeInsets.symmetric(vertical: 17),
                        child: Text(
                          azkarList[index].description + '  [' + azkarList[index].reference +']',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            // color: Colors.grey,
                            fontFamily: 'UthmanTN1_Ver10'
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Text(
                          iConunt.value.toString(),
                          style: const TextStyle(color: Colors.white),
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
    );
  }
}