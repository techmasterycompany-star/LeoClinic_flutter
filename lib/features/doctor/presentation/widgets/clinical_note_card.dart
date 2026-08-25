import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class ClinicalNoteCard extends StatelessWidget {
  final String speciality;
  final String date;
  final String description;
  final String doctorName;

  const ClinicalNoteCard({
    super.key,
    required this.speciality,
    required this.date,
    required this.description,
    required this.doctorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [AppBoxShadow.boxShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(speciality, style: AppTextStyle.textstyle14),
              Text(date, style: AppTextStyle.secondarytext),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: AppTextStyle.textstyle12),
          const SizedBox(height: 10),
          Text(doctorName, style: AppTextStyle.secondarytext),
        ],
      ),
    );
  }
}
