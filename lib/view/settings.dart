import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekr/controller/changeTheme.dart';
import 'package:zekr/controller/settings_controller.dart';
import 'package:zekr/locale/locale_controller.dart';
import 'package:zekr/services/settings_services.dart';

class Settings extends StatelessWidget {
  Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLocaleController myLocaleController = Get.find();
    Themes themes = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("2".tr)),
      body: Column(
        children: [

          Card(child: ListTile(
            title: Text("3".tr,style: Theme.of(context).textTheme.bodyMedium),
            subtitle: Text("4".tr,style: Theme.of(context).textTheme.labelMedium),
            trailing: Icon(Icons.format_color_fill),
            onTap: (){
              themes.changeTheme();
            },
          ),),
      
          Card(child: ListTile(
            title: Text("5".tr,style: Theme.of(context).textTheme.bodyMedium),
            subtitle: Text("6".tr,style: Theme.of(context).textTheme.labelMedium),
            trailing: Icon(Icons.language),
            onTap: (){
              AwesomeDialog(
                context: context,
                title: "5".tr,
                body: GetBuilder<SettingsController>(builder: (controller){
                  return Column(
                    children: [
                      
                      CheckboxListTile(
                        title: Text("7".tr,style: Theme.of(context).textTheme.bodyMedium),
                        secondary: Icon(Icons.language),
                        value: SettingsServices.sharedPreferences.getBool("value1") ?? false,
                        onChanged: (val){
                            myLocaleController.changeLang("ar");
                            SettingsServices.sharedPreferences.setBool("value1",true);
                            SettingsServices.sharedPreferences.setBool("value2",false);
                        },
                      ),
                    
                      CheckboxListTile(
                        title: Text("8".tr,style: Theme.of(context).textTheme.bodyMedium),
                        secondary: Icon(Icons.language),
                        value: SettingsServices.sharedPreferences.getBool("value2") ?? false,
                        onChanged: (val){
                          myLocaleController.changeLang("en");
                          SettingsServices.sharedPreferences.setBool("value2",true);
                          SettingsServices.sharedPreferences.setBool("value1",false);
                        },
                      ),

                    ],
                  );
                },) 
              ).show();
            },
          ),),

        ],
      ),
    );
  }
}