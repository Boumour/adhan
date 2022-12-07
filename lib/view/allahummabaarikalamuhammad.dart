import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import 'package:zekr/controller/allahummabaarikalamuhammad_controller.dart';

class AllahummabaarikAlaMuhammad extends StatelessWidget {
  AllahummabaarikAlaMuhammadController controller = Get.put(AllahummabaarikAlaMuhammadController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('14'.tr)),
      body: Container(
        alignment: Alignment.center,
        child: GetBuilder<AllahummabaarikAlaMuhammadController>(builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Obx(() => SquarePercentIndicator(
              width: 140,
              height: 140,
              startAngle: StartAngle.bottomRight,
              reverse: true,
              borderRadius: 12,
              shadowWidth: 1.5,
              progressWidth: 5,
              shadowColor: Colors.grey,
              progressColor: Colors.blue,
              progress: controller.currentPossition.value.inSeconds.toDouble(),
              child: Center(
                child: Text(
                  "${controller.currentPossition.value.inSeconds}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),),

            ElevatedButton.icon(label: Text(controller.isPlaying == true ? '15'.tr : '16'.tr),icon: controller.isPlaying == true ? const Icon(Icons.play_circle) : const Icon(Icons.stop),onPressed: () async {
              if (controller.isPlaying){
                print('play: ${controller.isPlaying}');
                controller.isPlaying = false;
                await controller.play();
                controller.reLoad();
              } else {
                print('stop: ${controller.isPlaying}');
                controller.isPlaying = true;
                controller.stop();
              }
              
            }),
        ],))),
    );
  }
}