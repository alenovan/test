import 'package:shared_preferences/shared_preferences.dart';

addStringSf(param,value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(param, value);
}

getStringValuesSF(param) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? stringValue = prefs.getString(param);
  return await stringValue;
}

addModelsSF(param,List<String> value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList(param, value);
}

getModelsSF(param) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? stringValue = prefs.getStringList(param);
  return await stringValue;
}

