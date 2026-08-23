import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/top_headline_of_screens.dart';
import 'package:leoclinic_flutter/features/appointments/domain/entities/doctor_details_for_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/details_doctor_section/state_card.dart';

class DoctorOverviewForAppointment extends StatelessWidget {
  const DoctorOverviewForAppointment({
    super.key,
    required this.detailsForAppointment,
  });

  final DoctorDetailsForAppointment detailsForAppointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.secondaryColor,
      child: Stack(
        children: [
         
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: TopHeadline(title: 'Appointment'),
          ),

     Positioned(
            top: 60.h,
            right: 0,
            left: 150.w,
            bottom: 0,
            child: Image.asset(
              "assets/images/doctor_preview_image.png",
              height: 300.h,
              width: 200.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 80.h,
            left: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailsForAppointment.nameOfDoctor,
                  style: AppTextStyle.textstyle16.copyWith(
                    color: AppColors.surfaceDark,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  detailsForAppointment.specilst,
                  style: AppTextStyle.textstyle16.copyWith(
                    color: AppColors.surfaceDark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  "${detailsForAppointment.salary} EGB",
                  style: AppTextStyle.textstyle16.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Consaltion Fees",
                  style: AppTextStyle.textstyle16.copyWith(
                    color: AppColors.surfaceDark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 15,
            bottom: 5,
            child: Row(
              children: [
                StateCard(
                  value: detailsForAppointment.experience,
                  label: "Experience",
                ),
                SizedBox(width: 10.w),
                StateCard(
                  value: detailsForAppointment.rating.toString(),
                  label: "Rating",
                ),
                SizedBox(width: 10.w),
    
                StateCard(
                  value: detailsForAppointment.review.toString(),
                  label: "Review",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
