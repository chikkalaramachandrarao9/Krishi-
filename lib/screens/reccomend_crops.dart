import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi/constants.dart';
import 'package:krishi/info/soil_info_tel.dart';
import 'package:krishi/info/soil_info.dart';
import 'package:provider/provider.dart';

class Reccomend_crops_screen extends StatefulWidget{
  late int ind;
  Reccomend_crops_screen(i){
    this.ind = i;
  }

  @override
  State<Reccomend_crops_screen> createState() => _Reccomend_crops_screenState(this.ind);
}

class _Reccomend_crops_screenState extends State<Reccomend_crops_screen> {
  late int ind;
  int lang = 0;
  _Reccomend_crops_screenState(i){
    this.ind = i;
  }

  @override
  Widget build(BuildContext context) {
    lang = lang = Provider.of<int>(context);

    Widget getTextWidgets(List<String> strings)
    {
      return new ListView(children: strings.map((item) => ListTile(leading: Icon(Icons.agriculture_rounded,color: primarycolor2,),
        title:Text(item,
          style: TextStyle(
            fontSize: 20
          ),),
      )
      ).toList());
    }

    return Scaffold(
      backgroundColor: primarycolor1,
        appBar: AppBar(
        backgroundColor: primarycolor1,
        elevation: 0,
        title: Text(lang==0?soil_names[ind]:soil_names_tel[ind],style: TextStyle(fontWeight: FontWeight.w700),),
    leading: IconButton(onPressed: (){
    Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios_new_rounded,
    size: 35,color: Colors.black,)),
    ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 20, 20),
          child: getTextWidgets(lang==0?soil_rec_crops[ind]:soil_rec_crops_tel[ind])
      ),
    );
  }
}