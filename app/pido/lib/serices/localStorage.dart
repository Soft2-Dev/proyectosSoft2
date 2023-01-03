import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static  SharedPreferences prefs;

  static Future configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}