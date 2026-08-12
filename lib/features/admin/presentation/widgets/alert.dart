import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class AlertsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const AlertsCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.fieldBg,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: AppColors.failed),
      ),
      child: ListTile(
        leading: Icon(Icons.warning_amber_rounded, color: AppColors.failed),
        title: Text(
          title,
          style: AppTextStyle.textstyle14.copyWith(color: AppColors.failed),
        ),
        subtitle: Text(subTitle, style: AppTextStyle.secondarytext),
      ),
    );
  }
}
