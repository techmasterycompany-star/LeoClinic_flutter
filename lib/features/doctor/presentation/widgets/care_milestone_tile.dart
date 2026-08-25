import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class CareMilestoneTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String date;

  const CareMilestoneTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [AppBoxShadow.boxShadow],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.secondaryColor,
          child: Icon(icon, color: AppColors.primaryColor, size: 20),
        ),
        title: Text(title, style: AppTextStyle.textstyle14),
        subtitle: Text(subtitle, style: AppTextStyle.secondarytext),
        trailing: Text(date, style: AppTextStyle.secondarytext),
      ),
    );
  }
}
