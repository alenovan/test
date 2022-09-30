import 'package:bdn_test/pages/auth/register.dart';
import 'package:bdn_test/pages/dashboard/dashboard.dart';
import 'package:bdn_test/tools/ColorsResource.dart';
import 'package:bdn_test/tools/Images.dart';
import 'package:bdn_test/tools/Typoghrapy.dart';
import 'package:bdn_test/widget/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late FocusNode _passFocus;
  late FocusNode _usernameFocus;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  void initState() {
    _passFocus = FocusNode();
    _usernameFocus = FocusNode();
    _usernameFocus.addListener(_onOnFocusPassEvent);
    _passFocus.addListener(_onOnFocusPassEvent);
    super.initState();
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  _onOnFocusPassEvent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteText,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(Images.login),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              alignment: Alignment.center,
              child: Text(
                "Selamat datang di ApsTest!",
                style: popins.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 24.sp),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Keep your data safe!",
                style: popins.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: greyTextVisi),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
              child: TextFormField(
                focusNode: _usernameFocus,
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: greyVeryYoung,
                  filled: true,
                  labelStyle: popins.copyWith(
                      fontSize: _usernameFocus.hasFocus ? 15.sp : 13.sp,
                      color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintStyle: popins.copyWith(color: greyText, fontSize: 8.sp),
                  contentPadding: EdgeInsets.only(left: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                style: popins.copyWith(fontSize: 13.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
              child: TextFormField(
                focusNode: _passFocus,
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: greyVeryYoung,
                  filled: true,
                  labelStyle: popins.copyWith(
                      fontSize: _passFocus.hasFocus ? 15.sp : 13.sp,
                      color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintStyle: popins.copyWith(color: greyText, fontSize: 8.sp),
                  contentPadding: EdgeInsets.only(left: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                style: popins.copyWith(fontSize: 13.sp),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
                child: GestureDetector(
                    child: Button(
                  functionClick: () {
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => Dashboard()));
                    });
                  },
                  topLeftRound: 10.w,
                  topRightRound: 10.w,
                  bottomRightRound: 10.w,
                  bottomLeftRound: 10.w,
                  borderColor: primaryColor,
                  textColor: Colors.white,
                  buttonColor: primaryColor,
                  height: 40.h,
                  child: Text(
                    "Login",
                    style: popins.copyWith(
                        color: whiteText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ))),
            Container(
              margin: EdgeInsets.only(top: 15.h),
              child: GestureDetector(
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 2000), () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => Register()));
                  });
                },
                child: Text(
                  "Belum daftar ? klik di sini untuk daftar",
                  style: popins,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
