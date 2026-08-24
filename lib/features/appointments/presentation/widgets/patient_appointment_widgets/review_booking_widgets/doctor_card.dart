import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/features/appointments/domain/entities/receipt_appointment_card.dart';

class DoctorCard extends StatelessWidget {
  final AppointmentReceiptCard appointmentReceiptCard;

  const DoctorCard({super.key, required this.appointmentReceiptCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              child: Image.asset("assets/images/doctor_preview_image.png"),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appointmentReceiptCard.doctorname,
                  style: AppTextStyle.textstyle16,
                ),
                SizedBox(height: 2.h),
                Text(
                  appointmentReceiptCard.dept,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
