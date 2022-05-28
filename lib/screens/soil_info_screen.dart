import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi/constants.dart';
import 'package:krishi/info/soil_info_tel.dart';
import 'package:krishi/info/soil_info.dart';
import 'package:provider/provider.dart';

class Soil_Info extends StatefulWidget{
  late int ind;

  Soil_Info(i){
    this.ind = i;
  }

  @override
  State<Soil_Info> createState() => _Soil_InfoState(this.ind);
}

class _Soil_InfoState extends State<Soil_Info> {
  int lang =0;
  late int ind;
  _Soil_InfoState(s)
  {
    this.ind = s;
  }

  @override
  Widget build(BuildContext context) {
    lang = Provider.of<int>(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: primarycolor2,
        appBar: AppBar(
        backgroundColor: primarycolor2,
        elevation: 0,
        title: Text(lang==0?soil_names[ind]:soil_names_tel[ind],style: TextStyle(fontWeight: FontWeight.w700),),
    leading: IconButton(onPressed: (){
    Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios_new_rounded,
    size: 35,color: Colors.black,)),
    ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 250, width: 250,
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(30),
              child:Image.asset("assets/"+soil_img[ind],fit: BoxFit.fill,)
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Text(lang==0?soil_more_info[this.ind]:soil_more_info_tel[this.ind],style: TextStyle(fontSize: 20,color: Colors.black54,),),
          ),
        ],
      ),
    );
  }
}