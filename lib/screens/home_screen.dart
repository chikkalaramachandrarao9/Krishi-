import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi/constants.dart';
import 'package:krishi/screens/disease_classification.dart';
import 'package:krishi/screens/settings_screen.dart';
import 'package:krishi/screens/soil_classification.dart';
import 'package:krishi/widgets/home_tile.dart';
import 'package:provider/provider.dart';
import 'package:krishi/info/info.dart';
import 'package:krishi/info/info_tel.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _shownNav = true;
  final globalKey = GlobalKey<ScaffoldState>();
  int lang=0;


  List<Widget> bottom_pages =[
    Home(),
    SoilClassificationScreeen(),
    SoilClassificationScreeen(),
    DiseaseClassificationScreeen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    lang = Provider.of<int>(context);
    print(lang);
    // return HomePage();
    return Scaffold(
      backgroundColor:primarycolor1,
      key: globalKey,
      bottomNavigationBar:_shownNav? DiamondBottomNavigation(
        height: 60,
        itemIcons: const [
          Icons.home,
          Icons.agriculture_rounded,
          Icons.yard_rounded,
          Icons.settings,
        ],
        centerIcon: Icons.camera_alt,
        selectedLightColor: primarycolor2.withOpacity(0.5),
        selectedColor: primarycolor2,
        unselectedColor: Colors.black,
        selectedIndex: 0,
        onItemPressed: (index){
          if(index!=0)
          Navigator.push(context, MaterialPageRoute(builder: (context) => bottom_pages[index]),);

        },
      ):Container(height: 1,),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(height: 150,
            color: primarycolor2,
              child: Image(
                  image:AssetImage("assets/welcome.png"),
                ),

            ),
            SizedBox(height: 50,),
            ListTile(onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SoilClassificationScreeen()),);
            },
              leading: Image(
              image:AssetImage("assets/soil_icon.png"),
            ),
            title: Text(lang==0?info[1]:info_tel[1],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            ListTile(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DiseaseClassificationScreeen()),);
              },
              leading: Image(
                image:AssetImage("assets/plant_icon.png"),
              ),
              title: Text(lang==0?info[2]:info_tel[2],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20.0,),
          Container(
            padding: const EdgeInsets.only(right: 15.0,bottom: 10.0,left:15.0 ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  globalKey.currentState!.openDrawer();
                },
                  icon: const Icon(Icons.menu_rounded,size: 25.0),),
                IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()),);

                  },

                  icon: const Icon(Icons.translate,size: 25.0,),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0,top: 15.0),
            child: Text(lang==0?info[0]:info_tel[0],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.only(left: 30.0,top: 15.0,right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeTile(1,"assets/soil_predict.jpg",SoilClassificationScreeen()),
              HomeTile(2,"assets/plant.jpg",DiseaseClassificationScreeen()),
            ],
          ),
        ),
          const SizedBox(height: 10.0,),
          // Container(
          //   padding: const EdgeInsets.only(left: 30.0,top: 15.0,right: 15.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       HomeTile("Soil Classification","assets/plant.jpg",SoilClassificationScreeen()),
          //       HomeTile("Plant Disease Classification","assets/plant.jpg",DiseaseClassificationScreeen()),
          //     ],
          //   ),
          // ),

        ],
      ),
    );
  }

}




