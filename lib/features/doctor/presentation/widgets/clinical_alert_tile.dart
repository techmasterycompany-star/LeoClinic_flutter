import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class ClinicalAlertTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final Color color;
  final Color bgColor;

  const ClinicalAlertTile({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.color,
    required this.bgColor,
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: AppTextStyle.textstyle14),
          ),
          Text(time, style: AppTextStyle.secondarytext),
        ],
      ),
    );
  }
}
