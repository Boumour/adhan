import 'package:flutter/material.dart';
import 'package:zekr/controller/quran_controller.dart';
import 'package:get/get.dart';
import 'package:quran/quran_text.dart';
import 'package:zekr/view/quran/SurahPage.dart';

List<Quran> userDetails = [];

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}
  TextEditingController controllertec = TextEditingController();
  QuranController quranController = Get.put(QuranController());
  
  class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 23),
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(child: 
                ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                      controller: controllertec,
                      autofocus: true,
                      style: const TextStyle(fontSize: 20,decoration: TextDecoration.none,decorationThickness: 0),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'بحث',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      onChanged: OnSearchTextChanged,
                    ),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: (() {
                      controllertec.clear();
                      OnSearchTextChanged('');
                    }),
                  ),
                )
              ),
            )
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              'عدد النتائج : ${quranController.searchResult.value.length}',
              style: TextStyle(color: Theme.of(context).backgroundColor,fontWeight: FontWeight.w300,fontSize: 15),
            )
          ),
          Expanded(
            child: quranController.searchResult.value.length != 0 && controllertec.text.isNotEmpty
            ? ListView.builder(
              itemCount: quranController.searchResult.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 7,horizontal: 20),
                  title: Text(
                    quranController.searchResult.value[index].content,
                    style: TextStyle(color: Theme.of(context).backgroundColor,fontSize: 15,fontFamily: 'uthmanic_hafs_v20',fontWeight: FontWeight.w300)),
                  trailing: Text(
                    quranController.searchResult.value[index].sura_name_ar,
                    style: TextStyle(color: Theme.of(context).backgroundColor,fontSize: 15,fontFamily: 'uthmanic_hafs_v20')),
                  // onTap: () => Get.to(() => SurahPage(surah: searchResult[index],)),
                );
              },
            )
            : Text('')
          )
        ],
      ),
    );
  }

  OnSearchTextChanged(String text) async {
    quranController.searchResult.value.clear();
    if (text.isEmpty){
      return;
    }
    userDetails.forEach(((userDetails) {
      if (userDetails.content_emlaey.contains(text))
      quranController.searchResult.value.add(userDetails);
    }));
    setState(() {
      
    });
  }
}