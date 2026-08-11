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
  TodayAppointmentCard({
    super.key,
    required this.patientName,
    required this.patientNumber,
    required this.drName,
    required this.speciality,
    required this.time,
    required this.status,
    this.patientImage,
  });

  late Color statusColor;
  late Color statusBgColor;
  void determineStatus(String stat) {
    if (stat == 'In Progress') {
      statusColor = AppColors.secondaryColor;
      statusBgColor = AppColors.primaryColor;
    } else if (stat == 'Upcoming') {
      statusColor = AppColors.warning;
      statusBgColor = AppColors.warningBg;
    } else if (stat == 'Completed') {
      statusColor = AppColors.success;
      statusBgColor = AppColors.successBg;
    } else {
      statusColor = AppColors.danger;
      statusBgColor = AppColors.dangerBg;
    }
  }

  @override
  Widget build(BuildContext context) {
    determineStatus(status);

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
          SizedBox(width: 10,),

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
                    color: statusBgColor,
                  ),
            
                  child: Text(
                    status,
                    style: AppTextStyle.textstyle10.copyWith(color: statusColor),
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
