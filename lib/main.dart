import 'package:flutter/material.dart';
import 'package:krishi/screens/home_screen.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:krishi/services/language.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await StreamingSharedPreferences.instance;
  final settings = MyAppSettings(preferences);
  print(settings);
  runApp(MyApp(settings:settings));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final MyAppSettings settings;
  MyApp({required this.settings});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(settings.lang);
    return StreamProvider<int>.value(
      value: settings.lang,
      initialData: 0,
      child: RestartWidget(
        child: MaterialApp(
            title: 'Krishi',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.lightGreen,
            ),
            home: Home(),
            debugShowCheckedModeBanner: false,

        ),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
