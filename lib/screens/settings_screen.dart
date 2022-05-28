import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi/constants.dart';
import 'package:krishi/info/info.dart';
import 'package:krishi/info/info_tel.dart';
import 'package:krishi/main.dart';
import 'package:krishi/services/language.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class SettingScreen extends StatefulWidget{
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int lang =0;


  @override
  Widget build(BuildContext context) {
    lang = Provider.of<int>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor1,
        elevation: 0,
        title: Text(lang==0?info[10]:info_tel[10],style: TextStyle(fontWeight: FontWeight.w700),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,
          size: 35,color: Colors.black,)),
      ),
      body:Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lang==0?info[11]:info_tel[11]),
              ListTile(
                title: Text(lang==0?info_tel[13]:info[12],style: TextStyle(
                  fontSize: 20,
                ),
                ),
                onTap: () async {
                  int currentValue =
                  MyAppSettings(await StreamingSharedPreferences.instance)
                      .lang
                      .getValue();
                  StreamingSharedPreferences settings =
                      await StreamingSharedPreferences.instance;
                  settings.setInt("lang", currentValue==0?1:0);
                  RestartWidget.restartApp(context);
                },
              ),


            ],
          )),

    );
  }
}