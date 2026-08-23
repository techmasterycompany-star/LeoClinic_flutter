import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_pill_button.dart';

class CaringSpecialistCard extends StatelessWidget {
  final String doctorName;
  final String? doctorImage;
  final String speciality;
  final double amount;
  final VoidCallback? onViewProfile;
  final VoidCallback? onBookAppointment;

  const CaringSpecialistCard({
    super.key,
    required this.doctorName,
    this.doctorImage,
    required this.speciality,
    required this.amount,
    this.onViewProfile,
    this.onBookAppointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 200.h,
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: const [AppBoxShadow.boxShadow],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        alignment: AlignmentGeometry.centerLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doctorName, style: AppTextStyle.textstyle14),
              Text(speciality, style: AppTextStyle.secondarytext),
              SizedBox(height: 30.h),
              Text('\$$amount / Visit', style: TextStyle(fontSize: 14.sp)),
            ],
          ),

          Positioned(
            right: 5.w,
            bottom: 0,
            child: doctorImage != null
                ? Image.network(doctorImage!)
                : Image.asset('assets/images/placeholder.png', width: 180.w),
          ),
          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                  child: AppPillButton(
                    text: 'View Profile',
                    onPressed: onViewProfile ?? () {},
                    backgroundColor: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: AppPillButton(
                    text: 'Book Appointment',
                    onPressed: onBookAppointment ?? () {},
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
