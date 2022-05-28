import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi/constants.dart';
import 'package:krishi/info/disease_info.dart';
import 'package:krishi/info/disease_info_tel.dart';

import 'package:provider/provider.dart';

class DiseaseInfoScreen extends StatefulWidget{
  late int ind;

  DiseaseInfoScreen(i){
    this.ind = i;
  }

  @override
  State<DiseaseInfoScreen> createState() => _DiseaseInfoScreenState(this.ind);
}

class _DiseaseInfoScreenState extends State<DiseaseInfoScreen> {
  int lang =0;
  late int ind;
  _DiseaseInfoScreenState(s)
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
        title: Text(lang==0?disease_names[ind]:disease_names_tel[ind],style: TextStyle(fontWeight: FontWeight.w700),),
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
                child:Image.asset("assets/"+disease_img[this.ind],fit: BoxFit.fill,)
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Text(lang==0?disease_info[this.ind]:disease_info_tel[this.ind],style: TextStyle(fontSize: 20,color: Colors.black54,),),
          ),
        ],
      ),
    );
  }
}