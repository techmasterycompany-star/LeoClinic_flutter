import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class PaymentSummary extends StatelessWidget {
  final double fee;
  final double tax;

  const PaymentSummary({
    super.key,
    required this.fee,
    required this.tax,
  });

  double get totalAmount => fee + tax;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.textMuted.withValues(alpha : 0.3),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          _Row(label: 'Fee', value: '\$${fee.toStringAsFixed(2)}'),
          SizedBox(height: 10.h),
          _Row(label: 'Tax', value: '\$${tax.toStringAsFixed(2)}'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(height: 1, color: AppColors.textMuted.withValues(alpha : 0.3)),
          ),
          _Row(
            label: 'Total Amount',
            value: '\$${totalAmount.toStringAsFixed(2)}',
            boldLabel: true,
            valueColor: AppColors.primaryColor,
            valueFontSize: 22.sp,
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final bool boldLabel;
  final Color? valueColor;
  final double? valueFontSize;

  const _Row({
    required this.label,
    required this.value,
    this.boldLabel = false,
    this.valueColor,
    this.valueFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: boldLabel ? AppColors.textPrimary : AppColors.textMuted,
            fontSize: 15.sp,
            fontWeight: boldLabel ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? AppColors.textPrimary,
            fontSize: valueFontSize ?? 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}