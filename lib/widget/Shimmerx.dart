import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Shimmerx extends StatelessWidget {
  const Shimmerx({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Container(
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 20,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
