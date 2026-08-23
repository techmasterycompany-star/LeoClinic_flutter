import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/features/appointments/domain/entities/appointment_model.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/stauts_card/deatils_of_card.dart';

class CanceledAppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;

  const CanceledAppointmentCard({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.fieldBg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Canceled Appointment",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.failed,
                ),
              ),
              Text(
                appointment.time,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.failed,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              CircleAvatar(radius: 20.r),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.doctorName!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    appointment.specialty!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              DeatilsOfCard.buildInfoItem(Icons.calendar_today_outlined, appointment.date),
              DeatilsOfCard.buildDivider(),
              DeatilsOfCard.buildInfoItem(Icons.access_time, appointment.time),
              DeatilsOfCard.buildDivider(),
              DeatilsOfCard.buildInfoItem(Icons.videocam_outlined, appointment.location),
            ],
          ),
        ],
      ),
    );
  }
}