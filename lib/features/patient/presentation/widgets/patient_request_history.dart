import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class RequestHistoryCard extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final String? doctorImage;
  final String appointmentDate;
  final String appointmentTime;
  final String location;
  final String appointmentStatus;

  const RequestHistoryCard({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.location,
    required this.appointmentStatus,
    this.doctorImage,
  });
  bool isApproved(String status) => status.toLowerCase() == 'approved';

  @override
  Widget build(BuildContext context) {
    Color appointmentBgCol = isApproved(appointmentStatus)
        ? AppColors.successBg
        : AppColors.fieldBg;
    Color appointmentTextCol = isApproved(appointmentStatus)
        ? AppColors.success
        : AppColors.failed;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: appointmentBgCol,
        boxShadow: [AppBoxShadow.boxShadow],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Appointment status and time
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                '$appointmentStatus Appointment',
                style: AppTextStyle.textstyle14.copyWith(
                  color: appointmentTextCol,
                ),
              ),
              Text(
                appointmentTime,
                style: AppTextStyle.textstyle14.copyWith(
                  color: appointmentTextCol,
                ),
              ),
            ],
          ),

          // Other data
          ListTile(
            leading: CircleAvatar(
              child: doctorImage != null
                  ? Image.network(doctorImage!)
                  : Image.asset('assets/images/placeholder.png'),
            ),

            title: Text(doctorName, style: AppTextStyle.textstyle14),
            subtitle: Column(
              crossAxisAlignment: .start,
              children: [
                Text(speciality, style: AppTextStyle.secondarytext),

                Text('$appointmentDate | $appointmentTime | $location'),
              ],
            ),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
