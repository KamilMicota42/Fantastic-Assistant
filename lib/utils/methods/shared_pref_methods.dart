import 'package:shared_preferences/shared_preferences.dart';

addStringToSP(String key, var value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('stringValue', "abc");
  prefs.setString(key, value);
}

readValueFromSP(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.get(key);
}

removeStringToSP(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}
