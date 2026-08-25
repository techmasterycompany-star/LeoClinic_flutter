import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class StateCard extends StatelessWidget {
 final String  value;
 final String label;
  const StateCard({super.key, required this.value, required this.label,});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(right: 40.w, left: 20.w, top: 10.h, bottom: 10.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString() ,
          style: AppTextStyle.textstyle16.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.surfaceDark,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: AppTextStyle.textstyle16.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
  }
}