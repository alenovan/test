
import 'dart:async';

import 'package:bdn_test/pages/Menu.dart';
import 'package:bdn_test/pages/auth/register.dart';
import 'package:bdn_test/tools/Images.dart';
import 'package:bdn_test/utils/NavigationUtils.dart';
import 'package:bdn_test/utils/SharedPreference.dart';
import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async{
      var token = await getStringValuesSF("token");
      if (token == null || token == "") {
        NavigationUtils.navigateTo(context, Register(), false);
      }else{
        NavigationUtils.navigateTo(context, Menu(), false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        child: Image.asset(Images.login),
      ),
    );
  }
}
