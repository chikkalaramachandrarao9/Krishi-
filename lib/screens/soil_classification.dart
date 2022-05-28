import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krishi/constants.dart';
import 'package:krishi/info/info.dart';
import 'package:krishi/screens/predicted_soil.dart';
import 'package:provider/provider.dart';
import 'package:tflite/tflite.dart';
import 'package:krishi/info/info_tel.dart';

class SoilClassificationScreeen extends StatefulWidget{
  @override
  State<SoilClassificationScreeen> createState() => _SoilClassificationScreeenState();
}

class _SoilClassificationScreeenState extends State<SoilClassificationScreeen> {
  int lang = 0;
  bool _loading = false;
  File? _image;
  List<dynamic>? _output;
  final picker = ImagePicker();

  @override
  void initState(){
    super.initState();
    loadModel().then((value){
      setState(() {

      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async{
    List<dynamic>? output = await Tflite.runModelOnImage(path: image.path,
      numResults: 4,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output;
      _loading = false;
      print(_output);
    });
  }

  loadModel() async {
    await Tflite.loadModel(model: 'assets/soil_model.tflite',labels: 'assets/soil_labels.txt');

  }

  pickImage() async{
    var image = await picker.pickImage(source: ImageSource.camera);
    if(image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  pickImageGallery() async{
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }


  @override
  Widget build(BuildContext context) {
    lang = Provider.of<int>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor1,
        elevation: 0,
        title: Text(lang==0?info[1]:info_tel[1],style: TextStyle(fontWeight: FontWeight.w700),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,
          size: 35,color: Colors.black,)),
      ),
      body: Container(
        color: primarycolor1,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: primarycolor2,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: _loading == true
                      ? null //show nothing if no picture selected
                      : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 250, width: 250,
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(30),
                            child: _image != null?Image.file(
                              _image!,
                              fit: BoxFit.fill,
                            ):Container(),
                          ),
                        ),
                        SizedBox(height: 10,),
                        // Divider(
                        //   height: 25,thickness: 1,
                        // ),
                        // // _output != null
                        // //     ? Text(
                        // //   'The soil in the picture: ${_output![0]
                        // //   ['label']}!',
                        // //   style: TextStyle(
                        // //       color: Colors.white,
                        // //       fontSize: 18,
                        // //       fontWeight:
                        // //       FontWeight.w400),
                        // // )
                        // //     : Container(),
                        // Divider(
                        //   height: 25,
                        //   thickness: 1,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: pickImage, //no parenthesis
                      child: Container(
                        width:
                        MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.15,
                        alignment: Alignment.center,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24,
                            vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                            BorderRadius.circular(15)),
                        child: Text(
                         lang==0? info[3]:info_tel[3],
                          style: TextStyle(color: Colors.white,
                              fontSize: 12),
                        ),),),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: pickImageGallery, //no parenthesis
                      child: Container(
                        width:
                        MediaQuery.of(context).size.width *0.3,
                        height: MediaQuery.of(context).size.height*0.15,
                        alignment: Alignment.center,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24,
                            vertical: 17),
                        decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius:
                            BorderRadius.circular(15)),
                        child: Text(
                          lang==0?info[4]:info_tel[4],
                          style: TextStyle(color: Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  if(_output!=null) {
                    if (_output?.length== 0) {
                      print("yes");
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              PredictedSoilScreen("Red_Soil",_image)),);
                    }
                    else {
                      print("no");
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              PredictedSoilScreen(_output![0]['label'],_image)));
                    }
                  }
                  else{
                    print("Choose a picture");
                  }
                }, //no parenthesis
                child: Container(
                  width:
                  MediaQuery.of(context).size.width *0.5,
                  height: MediaQuery.of(context).size.height*0.1,
                  alignment: Alignment.center,
                  padding:
                  EdgeInsets.symmetric(horizontal: 24,
                      vertical: 17),
                  decoration: BoxDecoration(
                      color:Colors.black12,
                      borderRadius:
                      BorderRadius.circular(15)),
                  child: Text(
                    lang==0?info[5]:info_tel[5],
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}