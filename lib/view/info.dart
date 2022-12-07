import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekr/controller/changeTheme.dart';
import 'package:zekr/view/homepage.dart';
import 'package:zekr/view/settings.dart';

class Info extends StatelessWidget {
  const Info({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("10".tr)),

      // drawer: Container(
        
      //   color: Theme.of(context).primaryColor,
      //   width: 233,
        
      //   child: Column(children: [
          
      //     Padding(
      //       padding: const EdgeInsets.only(top: 40,bottom: 10),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           IconButton(
      //             alignment: Alignment.topRight,
      //             icon: const Icon(CupertinoIcons.moon_stars_fill,color: Colors.grey,),
      //             onPressed: (){
      //               Themes().changeTheme();
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
          
      //     Container(child: Image.asset("assets/img.png",fit: BoxFit.cover),margin: EdgeInsets.symmetric(horizontal: 30)),
          
      //     SizedBox(height: 33),

      //     InkWell(
      //       child: Card(
      //       shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(33)),
      //       margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      //       child: Row(
      //         children: [
      //           SizedBox(width: 10),
      //           Icon(Icons.home_outlined,size: 30),
      //           SizedBox(width: 8,height: 55,),
      //           Text("1".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium),
      //         ],)
      //       ),
      //       onTap: (){
      //         Get.off(() => Home());
      //       }
      //     ),

      //     InkWell(
      //       child: Card(
      //         shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(33)),
      //         margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      //         child: Row(
      //           children: [
      //             SizedBox(width: 10),
      //             Icon(Icons.settings,size: 30),
      //             SizedBox(width: 30,height: 55,),
      //             Text("2".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium),
      //           ],
      //         )
      //       ),
      //       onTap: (){
      //         Get.off(() => Settings());
      //       },
      //     ),

      //     InkWell(
      //       child: Card(
      //         shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(33)),
      //         margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      //         child: Row(
      //           children: [
      //             SizedBox(width: 10),
      //             Icon(Icons.info,size: 30),
      //             SizedBox(width: 18,height: 55,),
      //             Text("10".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium),
      //           ],
      //         )
      //       ),
      //       onTap: (){
      //         Get.back();
      //       },
      //     ),

      //   ]),
      // ),
      
      body: ListTile(
        title: Text("الإصدار الأول"),
      ),
    );
  }
}