import 'package:bdn_test/tools/Typoghrapy.dart';
import 'package:bdn_test/widget/Shimmerx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  final String first_name;
  final String last_name;
  final String email;
  final int id;
  final String image;
  final bool loading;

  const UserCard({Key? key,
    required this.first_name,
    required this.last_name,
    required this.id,
    required this.image,
    required this.email,
    required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (con) =>
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 5.0)
                      ]),
                  child: Wrap(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              image,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              first_name + " " + last_name,
                              style: popins,
                            ),
                            Text(
                              email,
                              style: popinsLight,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 10.h),
        padding: EdgeInsets.only(right: 10.h),
        child: Row(
          children: [
            loading
                ? Container(
              width: 100.h,
              height: 100.h,
              child: Shimmerx(),
            )
                : Image.network(
              image,
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      loading
                          ? Container(
                        width: 100.h,
                        height: 20.h,
                        child: Shimmerx(),
                      )
                          : Text(
                        first_name + " " + last_name,
                        style: popins,
                      ),
                      loading
                          ? Container(
                          height: 2.h,
                      )
                          : Container(),
                      loading
                          ? Container(
                        width: 120.h,
                        height: 20.h,
                        child: Shimmerx(),
                      )
                          : Text(
                        email,
                        style: popinsLight,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
