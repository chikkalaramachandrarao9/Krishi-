import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

// class MyAppSettings {
//   MyAppSettings(StreamingSharedPreferences preferences)
//       : darkMode = preferences.getBool('darkMode', defaultValue: false);
//
//   final Preference<bool> darkMode;
// }

class MyAppSettings {
  MyAppSettings(StreamingSharedPreferences preferences) : lang = preferences.getInt("lang", defaultValue:0);
  final Preference<int> lang;
}