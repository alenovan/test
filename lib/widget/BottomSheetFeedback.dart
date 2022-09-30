import 'package:bdn_test/tools/ColorsResource.dart';
import 'package:bdn_test/tools/Typoghrapy.dart';
import 'package:bdn_test/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomSheetFeedback {
  const BottomSheetFeedback();

  static Future showError(
      BuildContext context, String title, String description) async {
    double _screenWidth = MediaQuery.of(context).size.width;
    hideKeyboard(context);
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _screenWidth * (15 / 100),
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(7.5 / 2),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: popins.copyWith(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                    margin: EdgeInsets.only(top: 1.h),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: popinsLight.copyWith(fontSize: 13.sp),
                    ))
              ],
            ),
          );
        });
    return;
  }

  static Future show_success(
      BuildContext context, String title, String description) async {
    double _screenWidth = MediaQuery.of(context).size.width;
    hideKeyboard(context);
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _screenWidth * (15 / 100),
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(7.5 / 2),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Icon(Boxicons.bx_check_shield,color: primaryColor,size: 100.h,),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: popins.copyWith(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                    margin: EdgeInsets.only(top: 1.h),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: popinsLight.copyWith(fontSize: 13.sp),
                    ))
              ],
            ),
          );
        });
    return;
  }

  static Future showInfo(
      BuildContext context, String title, String description) async {
    double _screenWidth = MediaQuery.of(context).size.width;
    hideKeyboard(context);
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _screenWidth * (15 / 100),
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(7.5 / 2),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: popins.copyWith(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                    margin: EdgeInsets.only(top: 1.h),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: popinsLight.copyWith(fontSize: 13.sp),
                    ))
              ],
            ),
          );
        });
    return;
  }
}
