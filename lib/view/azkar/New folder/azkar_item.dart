// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:zekr/controller/azkar_controller.dart';
// import 'package:zekr/view/azkar/New%20folder/azkar_by_category.dart';

// class AzkarItem extends StatefulWidget {
//   const AzkarItem({Key? key, required this.azkar}) : super(key: key);
//   final String azkar;

//   static double fontSizeAzkar = 18;

//   @override
//   State<AzkarItem> createState() => _AzkarItemState();
// }

// class _AzkarItemState extends State<AzkarItem> {
//   AzkarByCategory azkarByCategory = AzkarByCategory();
//   late final AzkarController _azkarController = Get.put(AzkarController());
//   double lowerValue = 18;
//   double upperValue = 40;
//   String? selectedValue;

//   @override
//   void initState() {
//     azkarByCategory.getAzkarByCategory(widget.azkar);
//     super.initState();
//   }

//   addNotes() async {
//     try {
//       int? azkar = await _azkarController.addAzkar(
//         Azkar(
//             category: category,
//             count: count,
//             description: description,
//             reference: reference,
//             zekr: zekr)
//       );
//       DatabaseHelper.saveNote(note);
//       print('$azkar');
//     } catch (e) {
//       print('Error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<QuranCubit, QuranState>(
//         listener: (BuildContext context, state) {
//           if (state is QuranPageState) {
//             print('page');
//           } else if (state is SoundPageState) {
//             print('sound');
//           }
//         },
//         builder: (BuildContext context, state) {
//           QuranCubit cubit = QuranCubit.get(context);
//           return SafeArea(
//             top: false,
//             bottom: false,
//             child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: Scaffold(
//                 backgroundColor: Theme.of(context).backgroundColor,
//                 body: Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 64.0),
//                       child: Stack(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Align(
//                                 alignment: Alignment.topRight,
//                                 child: fontSizeDropDown(context)),
//                           ),
//                           GestureDetector(
//                             onTap: () => Navigator.of(context).pop(),
//                             child: Align(
//                               alignment: Alignment.topCenter,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).backgroundColor,
//                                     borderRadius: const BorderRadius.only(
//                                       topRight: Radius.circular(8),
//                                       topLeft: Radius.circular(8),
//                                     ),
//                                     border: Border.all(
//                                         width: 2,
//                                         color: Theme.of(context).dividerColor)),
//                                 child: Icon(
//                                   Icons.close_outlined,
//                                   color: Theme.of(context).bottomAppBarColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Align(
//                               alignment: Alignment.topLeft,
//                               child: SizedBox(
//                                 width: 150,
//                                 child: Container(
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 8),
//                                   decoration: BoxDecoration(
//                                       color: Theme.of(context)
//                                           .bottomAppBarColor
//                                           .withOpacity(.2),
//                                       border: Border.symmetric(
//                                           vertical: BorderSide(
//                                               color: Theme.of(context)
//                                                   .bottomAppBarColor,
//                                               width: 2))),
//                                   child: Text(
//                                     azkarByCategory.azkarList.first.category,
//                                     style: TextStyle(
//                                       color: ThemeProvider.themeOf(context).id ==
//                                               'dark'
//                                           ? Colors.white
//                                           : Theme.of(context).primaryColor,
//                                       fontSize: 12,
//                                       fontFamily: 'kufi',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const Divider(
//                             height: 58,
//                             thickness: 2,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 95.0),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: azkarByCategory.azkarList.map((azkar) {
//                             return Container(
//                               margin: const EdgeInsets.symmetric(
//                                   horizontal: 16, vertical: 5),
//                               decoration: BoxDecoration(
//                                   color: Theme.of(context)
//                                       .bottomAppBarColor
//                                       .withOpacity(.2),
//                                   borderRadius: const BorderRadius.all(
//                                     Radius.circular(8),
//                                   )),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.symmetric(
//                                           vertical: BorderSide(
//                                             color: Theme.of(context)
//                                                 .bottomAppBarColor,
//                                             width: 2,
//                                           ),
//                                         ),
//                                       ),
//                                       width: double.infinity,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8),
//                                         child: SelectableText(
//                                           azkar.zekr,
//                                           style: TextStyle(
//                                               color:
//                                                   ThemeProvider.themeOf(context)
//                                                               .id ==
//                                                           'dark'
//                                                       ? Colors.white
//                                                       : Colors.black,
//                                               height: 1.4,
//                                               fontFamily: 'naskh',
//                                               fontSize:
//                                                   AzkarItem.fontSizeAzkar),
//                                           showCursor: true,
//                                           cursorWidth: 3,
//                                           cursorColor:
//                                               Theme.of(context).dividerColor,
//                                           cursorRadius:
//                                               const Radius.circular(5),
//                                           scrollPhysics:
//                                               const ClampingScrollPhysics(),
//                                           toolbarOptions: const ToolbarOptions(
//                                               copy: true, selectAll: true),
//                                           textDirection: TextDirection.rtl,
//                                           textAlign: TextAlign.justify,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(bottom: 8.0),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Container(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 8),
//                                             margin: const EdgeInsets.symmetric(
//                                                 horizontal: 8),
//                                             decoration: BoxDecoration(
//                                                 color: Theme.of(context)
//                                                     .bottomAppBarColor
//                                                     .withOpacity(.2),
//                                                 border: Border.symmetric(
//                                                     vertical: BorderSide(
//                                                         color: Theme.of(context)
//                                                             .bottomAppBarColor,
//                                                         width: 2))),
//                                             child: Text(
//                                               azkar.reference,
//                                               style: TextStyle(
//                                                   color: ThemeProvider.themeOf(
//                                                                   context)
//                                                               .id ==
//                                                           'dark'
//                                                       ? Colors.white
//                                                       : Theme.of(context)
//                                                           .primaryColorDark,
//                                                   fontSize: 12,
//                                                   fontFamily: 'kufi',
//                                                   fontStyle: FontStyle.italic),
//                                             ))),
//                                   ),
//                                   Align(
//                                       alignment: Alignment.center,
//                                       child: Container(
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8),
//                                           margin: const EdgeInsets.symmetric(
//                                               horizontal: 8),
//                                           decoration: BoxDecoration(
//                                               color: Theme.of(context)
//                                                   .bottomAppBarColor
//                                                   .withOpacity(.2),
//                                               border: Border.symmetric(
//                                                   vertical: BorderSide(
//                                                       color: Theme.of(context)
//                                                           .bottomAppBarColor,
//                                                       width: 2))),
//                                           child: Text(
//                                             azkar.description,
//                                             style: TextStyle(
//                                                 color: ThemeProvider.themeOf(
//                                                                 context)
//                                                             .id ==
//                                                         'dark'
//                                                     ? Colors.white
//                                                     : Theme.of(context)
//                                                         .primaryColorDark,
//                                                 fontSize: 16,
//                                                 fontFamily: 'kufi',
//                                                 fontStyle: FontStyle.italic),
//                                           ))),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: Theme.of(context)
//                                               .bottomAppBarColor
//                                               .withOpacity(.2),
//                                           border: Border.symmetric(
//                                               vertical: BorderSide(
//                                                   color: Theme.of(context)
//                                                       .bottomAppBarColor,
//                                                   width: 2))),
//                                       width: double.infinity,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               IconButton(
//                                                 onPressed: () {
//                                                   Share.share(
//                                                       '${azkar.category}\n\n'
//                                                       '${azkar.zekr}\n\n'
//                                                       '| ${azkar.description}. | (التكرار: ${azkar.count})');
//                                                 },
//                                                 icon: Icon(
//                                                   Icons.share,
//                                                   color: Theme.of(context)
//                                                       .bottomAppBarColor,
//                                                   size: 20,
//                                                 ),
//                                               ),
//                                               IconButton(
//                                                 onPressed: () {
//                                                   FlutterClipboard.copy(
//                                                           '${azkar.category}\n\n'
//                                                           '${azkar.zekr}\n\n'
//                                                           '| ${azkar.description}. | (التكرار: ${azkar.count})')
//                                                       .then(
//                                                     (value) =>
//                                                     customSnackBar(
//                                                         context,
//                                                       AppLocalizations.of(context)!.copyAzkarText
//                                                     )
//                                                   );
//                                                 },
//                                                 icon: Icon(
//                                                   Icons.copy,
//                                                   color: Theme.of(context)
//                                                       .bottomAppBarColor,
//                                                   size: 20,
//                                                 ),
//                                               ),
//                                               // IconButton(
//                                               //   onPressed: () async {
//                                               //     await _azkarController.addAzkar(
//                                               //             Azkar(
//                                               //               id: azkar.id,
//                                               //                 category: azkar.category,
//                                               //                 count: azkar.count,
//                                               //                 description: azkar.description,
//                                               //                 reference: azkar.reference,
//                                               //                 zekr: azkar.zekr)
//                                               //         ).then(
//                                               //             (value) =>
//                                               //             customSnackBar(
//                                               //                 context,
//                                               //                 AppLocalizations.of(context)!.copyAzkarText
//                                               //             ));
//                                               //     // FlutterClipboard.copy(
//                                               //     //         '${azkar.category}\n\n'
//                                               //     //         '${azkar.zekr}\n\n'
//                                               //     //         '| ${azkar.description}. | (التكرار: ${azkar.count})')
//                                               //     //     .then(
//                                               //     //   (value) =>
//                                               //     //   customSnackBar(
//                                               //     //       context,
//                                               //     //     AppLocalizations.of(context)!.copyAzkarText
//                                               //     //   )
//                                               //     // );
//                                               //   },
//                                               //   icon: Icon(
//                                               //     Icons.bookmark_add,
//                                               //     color: Theme.of(context)
//                                               //         .bottomAppBarColor,
//                                               //     size: 20,
//                                               //   ),
//                                               // ),
//                                             ],
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 8, vertical: 4),
//                                             decoration: BoxDecoration(
//                                           borderRadius: const BorderRadius.only(
//                                             topRight: Radius.circular(8),
//                                             bottomRight: Radius.circular(8),
//                                           ),
//                                                 color: Theme.of(context)
//                                                     .bottomAppBarColor,
//                                             ),
//                                             child: Row(
//                                               children: [
//                                                 Text(
//                                                   azkar.count,
//                                                   style: TextStyle(
//                                                       color: ThemeProvider
//                                                                       .themeOf(
//                                                                           context)
//                                                                   .id ==
//                                                               'dark'
//                                                           ? Colors.white
//                                                           : Colors.black,
//                                                       fontSize: 14,
//                                                       fontFamily: 'kufi',
//                                                       fontStyle:
//                                                           FontStyle.italic),
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Icon(
//                                                   Icons.repeat,
//                                                   color: ThemeProvider
//                                                       .themeOf(
//                                                       context)
//                                                       .id ==
//                                                       'dark'
//                                                       ? Colors.white
//                                                       : Colors.black,
//                                                   size: 20,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//   }

//   Widget fontSizeDropDown(BuildContext context) {
//     QuranCubit cubit = QuranCubit.get(context);
//     return DropdownButton2(
//       isExpanded: true,
//       items: [
//         DropdownMenuItem<String>(
//           child: FlutterSlider(
//             values: [AzkarItem.fontSizeAzkar],
//             max: 40,
//             min: 18,
//             rtl: true,
//             trackBar: FlutterSliderTrackBar(
//               inactiveTrackBarHeight: 5,
//               activeTrackBarHeight: 5,
//               inactiveTrackBar: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Theme.of(context).bottomAppBarColor,
//               ),
//               activeTrackBar: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4),
//                   color: Theme.of(context).backgroundColor),
//             ),
//             handlerAnimation: const FlutterSliderHandlerAnimation(
//                 curve: Curves.elasticOut,
//                 reverseCurve: null,
//                 duration: Duration(milliseconds: 700),
//                 scale: 1.4),
//             onDragging: (handlerIndex, lowerValue, upperValue) {
//               lowerValue = lowerValue;
//               upperValue = upperValue;
//               AzkarItem.fontSizeAzkar = lowerValue;
//               cubit.saveAzkarFontSize(AzkarItem.fontSizeAzkar);
//               setState(() {});
//             },
//             handler: FlutterSliderHandler(
//               decoration: const BoxDecoration(),
//               child: Material(
//                 type: MaterialType.circle,
//                 color: Colors.transparent,
//                 elevation: 3,
//                 child: SvgPicture.asset('assets/svg/slider_ic.svg'),
//               ),
//             ),
//           ),
//         )
//       ],
//       value: selectedValue,
//       onChanged: (value) {
//         setState(() {
//           selectedValue = value as String;
//         });
//       },
//       customButton: Icon(
//         Icons.format_size,
//         color: Theme.of(context).bottomAppBarColor,
//       ),
//       iconSize: 24,
//       buttonHeight: 50,
//       buttonWidth: 50,
//       buttonElevation: 0,
//       itemHeight: 35,
//       dropdownDecoration: BoxDecoration(
//           color: Theme.of(context).bottomAppBarColor.withOpacity(.9),
//           borderRadius: const BorderRadius.all(Radius.circular(8))
//       ),
//       itemPadding: const EdgeInsets.only(left: 14, right: 14),
//       dropdownMaxHeight: MediaQuery.of(context).size.height,
//       dropdownWidth: 230,
//       dropdownPadding: null,
//       dropdownElevation: 0,
//       scrollbarRadius: const Radius.circular(8),
//       scrollbarThickness: 6,
//       scrollbarAlwaysShow: true,
//       offset: const Offset(-0, 0),
//     );
//   }
// }
