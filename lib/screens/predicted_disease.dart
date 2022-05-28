
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:krishi/info/disease_info.dart';
import 'package:krishi/info/disease_info_tel.dart';
import 'package:krishi/info/info.dart';
import 'package:krishi/info/info_tel.dart';
import 'package:krishi/screens/disease_info_screen.dart';
import 'package:krishi/screens/reccomend_pesticides.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class PredictedDiseaseScreen extends StatefulWidget{
  late String diseaseName;
  late File img;
  PredictedDiseaseScreen(s,img){
    this.diseaseName = s;
    this.img = img;
  }
  @override
  State<PredictedDiseaseScreen> createState() => _PredictedDiseaseScreenState(diseaseName,img);
}

class _PredictedDiseaseScreenState extends State<PredictedDiseaseScreen> {
  final FlutterTts flutterTts = FlutterTts();

  // Map<String,int> diseases = {
  //   "Apple__Apple_scab":0,
  //   "Apple_Black_rot": return 1,
  //   "Apple_Cedar_apple_rust": return 2,
  //   "Apple_healthy":3,
  //   "Blueberry_healthy":4,
  //   "Cherry(including_sour)__Powdery_mildew":5,
  //   "Cherry(including_sour)__healthy":6,
  //   "Corn(maize)__Cercospora_leaf_spot Gray_leaf_spot":7,
  //   "Corn(maize)__Common_rust":8,
  //   "Corn_(maize)__Northern_Leaf_Blight":9,
  //   "Corn(maize)__healthy": return 10,
  //   "Grape_Black_rot": return 11,
  //   "Grape_Esca(Black_Measles)": return 12,
  //   "Grape__Leaf_blight(Isariopsis_Leaf_Spot)": return 13,
  //   "Grape__healthy": return 14,
  //   "Orange_Haunglongbing(Citrus_greening)": return 15,
  //   "Peach__Bacterial_spot": return 16,
  //   "Peach_healthy": return 17,
  //   "Pepper_bell_Bacterial_spot": return 18,
  //   "Pepper_bell_healthy": return 19,
  //   "Potato_Early_blight": return 20,
  //   "Potato_Late_blight": return 21,
  //   "Potato_healthy": return 22,
  //   "Raspberry_healthy": return 23,
  //   "Soybean_healthy": return 24,
  //   "Squash_Powdery_mildew": return 25,
  //   "Strawberry_Leaf_scorch": return 26,
  //   "Strawberry_healthy": return 27,
  //   "Tomato_Bacterial_spot": return 28,
  //   "Tomato_Early_blight": return 29,
  //   "Tomato_Late_blight":30,
  //   "Tomato_Leaf_Mold":31,
  //   "Tomato_Septoria_leaf_spot":32,
  //   "Tomato_Spider_mites Two-spotted_spider_mite":33,
  //   "Tomato_Target_Spot":34,
  //   "Tomato_Tomato_Yellow_Leaf_Curl_Virus":35,
  //   "Tomato_Tomato_mosaic_virus":36,
  //   "Tomato_healthy":37,
  // };
  Future<void> speak (String text)
  async {
    if(lang==0)
      await flutterTts.setLanguage("en-IN");
    else
      await flutterTts.setLanguage("te");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }
  int index(String s)
  {
  print(disease_img[3]);
    switch(s)
    {
    case "Apple__Apple_scab":
      return 0;
    case "Apple_Black_rot":
      return 1;
      case "Apple_Cedar_apple_rust":
      return 2;
      case  "Apple_healthy":
        return 3;
  case "Blueberry_healthy": return 4;
  case "Cherry(including_sour)__Powdery_mildew": return 5;
 case  "Cherry(including_sour)__healthy": return 6;
  case "Corn(maize)__Cercospora_leaf_spot Gray_leaf_spot": return 7;
  case "Corn(maize)__Common_rust": return 8;
  case "Corn_(maize)__Northern_Leaf_Blight":return 9;
  case "Corn(maize)__healthy": return 10;
  case "Grape_Black_rot": return 11;
  case "Grape_Esca(Black_Measles)": return 12;
  case "Grape__Leaf_blight(Isariopsis_Leaf_Spot)": return 13;
  case "Grape__healthy": return 14;
  case "Orange_Haunglongbing(Citrus_greening)": return 15;
  case "Peach__Bacterial_spot": return 16;
  case "Peach_healthy": return 17;
  case "Pepper_bell_Bacterial_spot": return 18;
  case "Pepper_bell_healthy": return 19;
  case "Potato_Early_blight": return 20;
  case "Potato_Late_blight": return 21;
  case "Potato_healthy": return 22;
  case "Raspberry_healthy": return 23;
  case "Soybean_healthy": return 24;
  case "Squash_Powdery_mildew": return 25;
  case "Strawberry_Leaf_scorch":return 26;
  case "Strawberry_healthy":return 27;
  case "Tomato_Bacterial_spot":return 28;
  case "Tomato_Early_blight":return 29;
  case "Tomato_Late_blight":return 30;
  case "Tomato_Leaf_Mold":return 31;
    case "Tomato_Septoria_leaf_spot": return 32;
    case "Tomato_Spider_mites Two-spotted_spider_mite": return 33;
  case "Tomato_Target_Spot":return 34;
  case "Tomato_Tomato_Yellow_Leaf_Curl_Virus":return 35;
  case "Tomato_Tomato_mosaic_virus":return 36;
  case "Tomato_healthy":return 37;
        default: return 37;
    }
  }


  int lang =0;
  late String diseaseName;
  late File img;
  _PredictedDiseaseScreenState(s,img)
  {
    this.diseaseName = s;
    this.img = img;
  }
  @override
  Widget build(BuildContext context) {
    lang = Provider.of<int>(context);
    return Scaffold(
      backgroundColor:primarycolor1,
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        if(lang ==0)
          speak(disease_names[index(diseaseName)]);
        else
          speak(disease_names_tel[index(diseaseName)]);

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
                      Text(lang==0?"Disease Classification":info_tel[2],
                        style: TextStyle(
                          color: primarycolor1,
                          fontSize: 16,
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
                height: MediaQuery.of(context).size.height*0.6,
                // child: Image.asset("assets/plant.jpg",)
                child: Image.file(
                  img,
                  fit: BoxFit.fill,
                ),
            ),
            Container(

              height: MediaQuery.of(context).size.height*0.3-28,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                color: primarycolor1,


              ),
              child:Column(
                children: [
                  SizedBox(height: 30,),
                  Text(lang==0?disease_names[index(diseaseName)]:disease_names_tel[index(diseaseName)],
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.1-25,
                    // padding: const EdgeInsets.all(8.0),
                    // child: Text("Red soils include multiple soil types (e.g ultisols, alfisols, oxisols) that are classified as red soil when they develop a distinct reddish color, which can vary from reddish brown to reddish yellow due to their high iron content.[1] In general, red soils possess some characteristics of a good growing soil .",
                    //   style: TextStyle(fontSize: 15,color: Colors.grey),
                    // ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      InkWell(

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  ReccomendPesticidesScreen(index(diseaseName))),);

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: MediaQuery.of(context).size.height*0.1-4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                            color: primarycolor2,
                            // color: Colors.amber
                          ),
                          child: Center(child: Text(lang==0?info[8]:info_tel[8],textAlign: TextAlign.center,style: TextStyle(color: primarycolor1,fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  DiseaseInfoScreen(index(diseaseName))),);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: MediaQuery.of(context).size.height*0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                            color: primarycolor1,
                          ),
                          child: Center(child: Text(lang==0?info[7]:info_tel[7],style: TextStyle(fontSize: 20),)),
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