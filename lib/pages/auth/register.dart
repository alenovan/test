import 'package:bdn_test/bloc/auth/auth_bloc.dart';
import 'package:bdn_test/pages/Menu.dart';
import 'package:bdn_test/pages/auth/login.dart';
import 'package:bdn_test/pages/dashboard/dashboard.dart';
import 'package:bdn_test/service/models/auth/RegisterPayload.dart';
import 'package:bdn_test/service/repository/AuthRepository.dart';
import 'package:bdn_test/tools/ColorsResource.dart';
import 'package:bdn_test/tools/Images.dart';
import 'package:bdn_test/tools/Typoghrapy.dart';
import 'package:bdn_test/utils/extentions.dart';
import 'package:bdn_test/widget/BottomSheetFeedback.dart';
import 'package:bdn_test/widget/Button.dart';
import 'package:bdn_test/widget/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late FocusNode _passFocus;
  late FocusNode _usernameFocus;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  AuthBloc _AuthBloc = AuthBloc(repository: AuthRepoRepositoryImpl());
  @override
  void initState() {
    _passFocus = FocusNode();
    _usernameFocus = FocusNode();
    _usernameFocus.addListener(_onOnFocusPassEvent);
    _passFocus.addListener(_onOnFocusPassEvent);
    usernameController.text = "eve.holt@reqres.in";
    passController.text = "pistol";
    super.initState();
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  _onOnFocusPassEvent() {
    setState(() {});
  }


  Widget consumer() {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _AuthBloc,
      listener: (c, s) {
        if (s is AuthLoadingState) {
          LoadingDialog.show(context, "Silahkan tunggu");
        } else if (s is AuthLoadedState) {
          popScreen(context);
          BottomSheetFeedback.show_success(
              context, "Selamat", "Anda berhasil masuk ");
          Future.delayed(const Duration(milliseconds: 2000), () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Menu()));
          });
        } else if (s is AuthErrorState) {
          popScreen(c);
          BottomSheetFeedback.showError(context, "Mohon Maaf", s.message);
        }
      },
      builder: (c, s) {
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: whiteText,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 120.w),
              child: Image.asset(Images.register),
            ),
            consumer(),
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              alignment: Alignment.center,
              child: Text(
                "Register To ApsTest!",
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
                controller: usernameController,
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
                controller: passController,
                focusNode: _passFocus,
                obscureText: true,
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
                    _AuthBloc
                      ..add(RegisterAct(
                          data: RegisterPayload(
                              email: usernameController.text,
                              password: passController.text)));
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
                    "Register",
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
                  // Future.delayed(const Duration(milliseconds: 2000), () {
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //       builder: (BuildContext context) => Login()));
                  // });
                },
                child: Column(
                  children: [
                    Text(
                      "demo : ",
                      style: popins,
                    ),
                    Text(
                      "Email : eve.holt@reqres.in",
                      style: popins,
                    ),
                    Text(
                      "demo : pistol",
                      style: popins,
                    ),
                    Divider(),
                    Text(
                      "Sesuai dengan data yang ada di https://reqres.in/",
                      style: popins,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
