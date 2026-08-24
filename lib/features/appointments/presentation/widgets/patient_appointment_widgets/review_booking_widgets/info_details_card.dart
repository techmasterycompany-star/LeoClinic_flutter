import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class InfoDetailsCard extends StatelessWidget {
  final String label1Info;
  final String label2Info;
  final String label3Info;
  final String lable1;
    final String lable2;
  final String lable3;


  const InfoDetailsCard({
    super.key,
    required this.label1Info,
    required this.label2Info,
    required this.label3Info, required this.lable1, required this.lable2, required this.lable3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.border,
              blurRadius: 12,
              offset:  Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            _InfoRow(label: lable1 , value: label1Info),
            const _DottedDivider(),
            _InfoRow(label: lable2, value: label2Info),
            const _DottedDivider(),
            _InfoRow(label:lable3 , value: label3Info),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyle.textstyle14.copyWith(color: AppColors.surfaceDark)
          ),
          Text(
            value,
            style: AppTextStyle.textstyle14
          ),
        ],
      ),
    );
  }
}

class _DottedDivider extends StatelessWidget {
  const _DottedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashWidth = 4.0;
        final dashCount = (constraints.maxWidth / (dashWidth * 2)).floor();
        return Row(
          children: List.generate(dashCount, (_) {
            return Expanded(
              child: Container(
                height: 1.h,
                margin:  EdgeInsets.symmetric(horizontal: 2.w),
                color: Colors.grey[300],
              ),
            );
          }),
        );
      },
    );
  }
}