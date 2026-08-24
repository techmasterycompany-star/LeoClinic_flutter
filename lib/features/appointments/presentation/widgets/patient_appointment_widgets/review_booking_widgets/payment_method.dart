import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class PaymentMethod extends StatelessWidget {
  final String cardNumber;
  final VoidCallback onChange;

  const PaymentMethod({
    super.key,
    required this.cardNumber,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.textMuted.withValues(alpha: 0.15),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.textMuted.withValues(alpha: 0.15)),
            ),
            child: Text(
              'VISA',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 13.sp,
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Text(
              cardNumber,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          GestureDetector(
            onTap: onChange,
            child: Text(
              'Change',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}