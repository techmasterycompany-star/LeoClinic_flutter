import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class TodayAppointmentCard extends StatelessWidget {
  final String patientName;
  final String patientNumber;
  final String? patientImage;
  final String drName;
  final String speciality;
  final String time;
  final String status;

  const TodayAppointmentCard({
    super.key,
    required this.patientName,
    required this.patientNumber,
    required this.drName,
    required this.speciality,
    required this.time,
    required this.status,
    this.patientImage,
  });

  ({Color textColor, Color backgroundColor}) get statusColors {
    return switch (status) {
      'In Progress' => (
        textColor: AppColors.secondaryColor,
        backgroundColor: AppColors.primaryColor,
      ),
      'Upcoming' => (
        textColor: AppColors.warning,
        backgroundColor: AppColors.warningBg,
      ),
      'Completed' => (
        textColor: AppColors.success,
        backgroundColor: AppColors.successBg,
      ),
      _ => (textColor: AppColors.danger, backgroundColor: AppColors.dangerBg),
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = statusColors;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [AppBoxShadow.boxShadow],
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        mainAxisAlignment: .start,
        children: [
          CircleAvatar(child: Icon(Icons.person)),
          SizedBox(width: 10),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(patientName, style: AppTextStyle.textstyle12),

                    Text(patientNumber, style: AppTextStyle.secondarytext),

                    Text(
                      'Dr. $drName | $speciality | $time',
                      style: AppTextStyle.secondarytext,
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(800),
                    color: colors.backgroundColor,
                  ),

                  child: Text(
                    status,
                    style: AppTextStyle.textstyle10.copyWith(
                      color: colors.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
