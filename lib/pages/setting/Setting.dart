import 'package:bdn_test/bloc/user/user_bloc.dart';
import 'package:bdn_test/pages/auth/register.dart';
import 'package:bdn_test/service/models/user/UserListResponse.dart';
import 'package:bdn_test/service/repository/UserRepository.dart';
import 'package:bdn_test/tools/ColorsResource.dart';
import 'package:bdn_test/tools/Typoghrapy.dart';
import 'package:bdn_test/widget/BottomSheetFeedback.dart';
import 'package:bdn_test/widget/Button.dart';
import 'package:bdn_test/widget/UserCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hai,",
                style: popins.copyWith(fontSize: 40.sp),
              ),
              Text("Selamat Datang di aplikasi test",
                  style: popins.copyWith(fontSize: 16.sp)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Menu Setting",
                style: popins.copyWith(fontSize: 20.sp),
              ),
              Divider()
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            child: GestureDetector(
                child: Button(
              functionClick: () async {
                BottomSheetFeedback.show_success(
                    context, "Selamat", "Anda berhasil keluar ");
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear();
                Future.delayed(const Duration(milliseconds: 2000), () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Register()));
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
                "Logout",
                style: popins.copyWith(
                    color: whiteText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ))),
      ],
    ));
  }
}
