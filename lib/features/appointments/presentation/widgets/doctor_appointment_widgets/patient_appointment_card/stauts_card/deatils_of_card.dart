import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeatilsOfCard {
 static Widget buildInfoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.r, color: Colors.grey.shade500),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

 static Widget buildDivider() {
    return Container(
      height: 20.h,
      width: 2.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      color: Colors.grey.shade300,
    );
  }
}