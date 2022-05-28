
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:krishi/info/info.dart';
import 'package:krishi/info/soil_info_tel.dart';
import 'package:krishi/info/soil_info.dart';
import 'package:krishi/screens/reccomend_crops.dart';
import 'package:krishi/info/info_tel.dart';
import 'package:krishi/screens/soil_info_screen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class PredictedSoilScreen extends StatefulWidget{
  late String soilName;
  late File img;

  PredictedSoilScreen(s,img){
    this.soilName = s;
    this.img = img;
  }
  @override
  State<PredictedSoilScreen> createState() => _PredictedSoilScreenState(soilName,img);
}

class _PredictedSoilScreenState extends State<PredictedSoilScreen> {
  late String soilName;
  late File img;
  int lang = 0;
  final FlutterTts flutterTts = FlutterTts();




  var soils = {"Alluvial_Soil":0,
    "Black_Soil":1,
    "Clay_Soil":2,
    "Red_Soil":3};
  _PredictedSoilScreenState(s,img)
  {
    this.soilName = s;
    this.img = img;
  }
  
  int ind(String s)
  {
    if(s == "Alluvial_Soil")
    {
      return 0;
    }
    else if(s == "Black_Soil")
    {
      return 1;
    }
    else if(s == "Clay_Soil")
    {
      return 2;
    }
    else
    {
      return 3;
    }
  }

  Future<void> speak (String text)
  async {
    if(lang==0)
    await flutterTts.setLanguage("en-IN");
    else
      await flutterTts.setLanguage("te");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }
  
  @override
  Widget build(BuildContext context) {
    lang = lang = Provider.of<int>(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor:primarycolor1,

      floatingActionButton: FloatingActionButton.small(onPressed: () {
        if(lang ==0)
        speak(soil_names[ind(soilName)]);
        else
          speak(soil_names_tel[ind(soilName)]);

      },

        child:  Icon(Icons.record_voice_over_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        color: primarycolor2,
        // color: Colors.amber,
        child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 35,color: primarycolor1,)),
                        SizedBox(width: 20,),
                        Text(lang==0?info[9]:info_tel[9],
                        style: TextStyle(
                          color: primarycolor1,
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height*0.5,
                  // child: Image.asset("assets/"+soil_img[ind(soilName)],)
                  // child: Image.asset("assets/soil_red.png",)
                child: Image.file(
                  img,
                  fit: BoxFit.fill,
                )
              ),
              Container(

                height: MediaQuery.of(context).size.height*0.4-28,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                  color: primarycolor1,


                  ),
                child:Column(
                  children: [
                    Text(lang==0?soil_names[ind(soilName)]:soil_names_tel[ind(soilName)],
                     style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                          ),
                    SizedBox(height: 5.0,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.2-9,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lang==0?soil_info[ind(soilName)]:soil_info_tel[ind(soilName)],
                      style: TextStyle(fontSize: 15,color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    Reccomend_crops_screen(ind(soilName))),);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/2,
                            height: MediaQuery.of(context).size.height*0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                              color: primarycolor2,
                              // color: Colors.amber
                            ),
                            child: Center(child: Text(lang==0?info[6]:info_tel[6],style: TextStyle(color: primarycolor1,fontSize: 16),)),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    Soil_Info(this.ind(soilName))),);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/2,
                            height: MediaQuery.of(context).size.height*0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                              color: primarycolor1,
                            ),
                            child: Center(child: Text(lang==0?info[7]:info_tel[7],style: TextStyle(fontSize: 16),)),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),

            ],
        ),
      ),
    );
  }
}