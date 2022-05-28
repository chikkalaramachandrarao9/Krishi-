import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi/constants.dart';
import 'package:krishi/info/disease_info.dart';
import 'package:krishi/info/disease_info_tel.dart';
import 'package:provider/provider.dart';

class ReccomendPesticidesScreen extends StatefulWidget{
  late int ind;
  ReccomendPesticidesScreen(i){
    this.ind = i;
  }

  @override
  State<ReccomendPesticidesScreen> createState() => _ReccomendPesticidesScreenState(this.ind);
}

class _ReccomendPesticidesScreenState extends State<ReccomendPesticidesScreen> {
  late int ind;
  int lang = 0;
  _ReccomendPesticidesScreenState(i){
    this.ind = i;
  }

  @override
  Widget build(BuildContext context) {
    lang = lang = Provider.of<int>(context);

    Widget getTextWidgets(List<String> strings)
    {
      return new ListView(children: strings.map((item) => ListTile(leading: Icon(Icons.pest_control_rounded,color: primarycolor2,),
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
        title: Text(lang==0?disease_names[ind]:disease_names_tel[ind],style: TextStyle(fontWeight: FontWeight.w700),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,
          size: 35,color: Colors.black,)),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 20, 20),
          child: getTextWidgets(lang==0?rec_pest[ind]:rec_pest_tel[ind])
      ),
    );
  }
}