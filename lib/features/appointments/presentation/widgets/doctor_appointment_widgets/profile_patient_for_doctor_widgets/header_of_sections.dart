import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class HeaderOfPrescriptionSection extends StatelessWidget {
  final String title;
  final String subtitle;
  const HeaderOfPrescriptionSection({super.key , required this.title , required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 241,
        children: [
          Text(
            title,
            style: AppTextStyle.textstyle16.copyWith(color: AppColors.surfaceDark)
          ),
          Text(
            subtitle,
            style: AppTextStyle.textstyle12.copyWith(color: AppColors.primaryColor)
          ),
        ],
      ),
    );
  }
}
