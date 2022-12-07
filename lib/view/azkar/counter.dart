import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekr/controller/counter_controller.dart';
import 'package:zekr/services/settings_services.dart';

class Counter extends StatelessWidget {
  const Counter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text("11".tr),centerTitle:true),
      
      body: Container(

        color: Theme.of(context).primaryColor,
        alignment: Alignment.center,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // const SizedBox(height: 20,),

            Expanded(
              flex: 1,
              child: GetBuilder<CounterController>(builder: (controller) => 
              Text("${CounterController.count}",style: Theme.of(context).textTheme.titleMedium,)
              ),
            ),

            // const SizedBox(height: 50,),

            Expanded(
              flex: 1,
              child: InkWell(onTap: (){
                counterController.zero();
                SettingsServices.sharedPreferences.setInt("count",CounterController.count);
              } ,child: const Icon(Icons.replay_circle_filled, size: 75,),),
            ),

            // const SizedBox(height: 40,),

            Expanded(
              flex: 3,
              child: InkWell(onTap: (){
                counterController.increment();
                SettingsServices.sharedPreferences.setInt("count",CounterController.count);
              }, child: const Icon(Icons.data_saver_on, size: 300,),),
            ),

      ],),),


    );
  }
}