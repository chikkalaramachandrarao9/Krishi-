import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi/constants.dart';
import 'package:krishi/info/info.dart';
import 'package:krishi/info/info_tel.dart';
import 'package:provider/provider.dart';

import '../screens/predicted_soil.dart';

class HomeTile extends StatefulWidget{

  late int tileTitle;
  late String tileImg;
  late Widget tileScreen;

  // HomeTile(this.tileTitle,this.tileImg,this.tileScreen);

  HomeTile(t,i,s)
  {
    this.tileTitle = t;
    this.tileImg = i;
    this.tileScreen = s;

  }
  @override
  State<HomeTile> createState() => _HomeTileState(tileTitle,tileImg,tileScreen);
}

class _HomeTileState extends State<HomeTile> {

  late int title;
  late String img;
  late Widget screen;
  int lang =0;

  // _HomeTileState(this.title,this.img,this.screen);

  _HomeTileState(t,i,s)
  {
    this.title = t;
    this.img = i;
    this.screen = s;
    // print(t);
    // print(i);
    // print(s);
  }

  @override
  Widget build(BuildContext context) {
    lang = Provider.of<int>(context);

    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: primarycolor2,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow:[BoxShadow(
          color: primarycolor2.withOpacity(0.4),
          // color: Colors.black.withOpacity(0.5),
          spreadRadius: 3.0,

          blurRadius: 5.0,
          offset: const Offset(3,3),
        ),]
      ),

      width: MediaQuery.of(context).size.width*0.38,
      padding: EdgeInsets.all(15.0),
      height: 220,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen),);
        },
        child: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width*0.38,
              child: Image.asset(this.img,fit: BoxFit.fill,),
              // child: Image.asset(img,fit: BoxFit.fill,),
            ),
            Container(
              child: Text(lang==0?info[title]:info_tel[title],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0,color: primarycolor1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}