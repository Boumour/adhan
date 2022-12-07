import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';
import 'package:zekr/controller/allahummabaarikalamuhammad_controller.dart';
import 'package:zekr/controller/azkar_controller.dart';
import 'package:zekr/controller/changeTheme.dart';
import 'package:zekr/controller/counter_controller.dart';
import 'package:zekr/controller/settings_controller.dart';
import 'package:zekr/locale/locale.dart';
import 'package:zekr/locale/locale_controller.dart';
import 'package:zekr/services/settings_services.dart';
import 'package:zekr/view/azkar/azkarPage.dart';
import 'package:zekr/view/azkar/azkar_elmasaa.dart';
import 'package:zekr/view/azkar/azkar_elsapah.dart';
import 'package:zekr/view/homepage.dart';


void callbackDesPatcher(){
  Workmanager().executeTask((taskName, inputData) {
    print('ddtyitytiyriryiytityiyiytiytiytdd');
    AllahummabaarikAlaMuhammadController().play();
    return Future.value(true);
  },);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

Future initialServices() async {
  await Get.putAsync(() => SettingsServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLocaleController myLocaleController = Get.put(MyLocaleController());
    SettingsController settingsController = Get.put(SettingsController());
    SettingsServices settingsServices = Get.put(SettingsServices());
    Themes themes = Get.put(Themes());
    CounterController counterController = Get.put(CounterController());
    AzkarController azkarController = Get.put(AzkarController());

    return GetMaterialApp(
      locale: myLocaleController.initialLang,
      translations: MyLocale(),
      debugShowCheckedModeBanner: false,
      theme: Themes().customDarkTheme,
      // darkTheme: Themes().customDarkTheme,
      // themeMode: Themes().getThemeMode(),
      home: HomePage()
    );
  }
}

class StorageUpload extends StatefulWidget {
  @override
  StorageUploadState createState() => new StorageUploadState();
}

class StorageUploadState extends State<StorageUpload> {
  List results = [];

  var rows = [];
  String query = '';
  late TextEditingController tc;

  @override
  void initState() {
    super.initState();
    tc = TextEditingController();
    rows = [
      {
        'contact_name': 'Test User 1',
        'contact_phone': '066 560 4900',
      },
      {
        'contact_name': 'Test User 2',
        'contact_phone': '066 560 7865',
      },
      {
        'contact_name': 'Test User 3',
        'contact_phone': '906 500 4334',
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delivero Contacts",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: tc,
                    decoration: const InputDecoration(hintText: 'Search...'),
                    onChanged: (v) {
                      setState(() {
                        query = v;
                        setResults(query);
                      });
                    },
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: results.length,
                          itemBuilder: (con, ind) {
                            return ListTile(
                              title: Text(results[ind]['contact_name']),
                              subtitle: Text(results[ind]['contact_phone']),
                              onTap: () {
                                setState(() {
                                  tc.text = results[ind]['contact_name'];
                                  query = results[ind]['contact_name'];
                                  setResults(query);
                                });
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setResults(String query) {
    results = rows.where((elem) =>
            elem['contact_name'].toString().toLowerCase().contains(query.toLowerCase()) ||
            elem['contact_phone'].toString().toLowerCase().contains(query.toLowerCase())).toList();
  }
}
