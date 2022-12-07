// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:zekr/controller/azkar_controller.dart';
// import 'package:zekr/view/azkar/azkarPage.dart';
// import 'package:zekr/view/azkar/azkar_elsapah.dart';


// class AzkarElMasaa extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     final azkarElMasaa = azkarList.sublist(1);
//     print(azkarElMasaa);

//     return Scaffold(
//       appBar: AppBar(title: Text('21'.tr),centerTitle: true,),
//       body: FutureBuilder(
//         future: controller.readJosn(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting){
//             return const Center(child: CircularProgressIndicator());
//           }
//           return ListView.separated(
//             separatorBuilder: (context, index) {
//               return const Divider(color: Colors.black45);
//             },
//             itemCount: azkarElMasaa.length,
//             itemBuilder: (context, index) {
//               String count = azkarElMasaa[index].count;
//               RxInt iConunt = int.parse(count).obs;
//               return Obx(() => InkWell(
//                 onTap: () {
//                   if (iConunt.value > 0)
//                   iConunt.value--;
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   alignment: Alignment.center,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         azkarElMasaa[index].category,
//                       ),
//                       const SizedBox(height: 15),
//                       Text(
//                         azkarElMasaa[index].zekr,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontFamily: 'UthmanTN1_Ver10'
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.symmetric(vertical: 15),
//                         child: Text(
//                           azkarElMasaa[index].description + '  [' + azkarElMasaa[index].reference +']',
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             // color: Colors.grey,
//                             fontFamily: 'UthmanTN1_Ver10'
//                           ),
//                         ),
//                       ),
//                       Text(
//                         'العدد: ' + iConunt.value.toString()
//                       )
//                     ],
//                   ),
//                 ),
//               ));
//             }
//           );
//         }
//       ),
//     );
//   }
// }