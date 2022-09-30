import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bdn_test/utils/SharedPreference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void hideKeyboard(context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

void popScreen(BuildContext context, [dynamic data]) {
  Navigator.pop(context, data);
}

enum RouteTransition { slide, dualSlide, fade, material, cupertino }

Future pushScreenAndWait(BuildContext context, Widget buildScreen) async {
  await Navigator.push(
      context, CupertinoPageRoute(builder: (context) => buildScreen));
  return;
}



Color hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return Color(val);
}


Color computeTextColor(Color color) {
  return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}

bool Potrait(ctx) {
  return MediaQuery.of(ctx).orientation == Orientation.portrait;
}

Future<Map<String, String>> tokenHeader() async {
  var token = await getStringValuesSF("token");
  var headers = {
    "Content-Type": "application/json",
    'Authorization': 'Bearer $token',
  };
  // debugPrint("header"+token);
  return headers;
}



