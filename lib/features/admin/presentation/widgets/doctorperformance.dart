import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class DoctorPerformanceCard extends StatelessWidget {
  final String doctorName;
  final String? doctorImage;
  final String speciality;
  final int totalAppointments;
  final int appointmentsCompleted;
  final String rate;
  const DoctorPerformanceCard({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.totalAppointments,
    required this.appointmentsCompleted,
    required this.rate,
    this.doctorImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppBoxShadow.boxShadow],
      ),
      // TODO: Add the doctor image
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.person)),
        title: Text('Dr. $doctorName', style: AppTextStyle.textstyle14),
        subtitle: Column(
          crossAxisAlignment: .start,
          children: [
            Text(speciality, style: AppTextStyle.secondarytext),

            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Icon(Icons.date_range),
                Text(
                  '$totalAppointments Appointments',
                  style: AppTextStyle.textstyle10,
                ),
                Text(
                  '($appointmentsCompleted Completed)',
                  style: AppTextStyle.textstyle10.copyWith(
                    color: AppColors.success,
                  ),
                ),

                SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    thickness: 2,
                    color: AppColors.textPrimary,
                  ),
                ),

                Icon(Icons.star_border_purple500_outlined),
                Text(rate, style: AppTextStyle.textstyle10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
