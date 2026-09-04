import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class HeaderOfPrescriptionCard extends StatelessWidget {
  const HeaderOfPrescriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF0FE),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: SvgPicture.asset(
            "assets/icons/validation-approval-for-prescription.svg",
            height: 24.h,
            width: 24.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Prescription',
                style: AppTextStyle.textstyle16.copyWith(
                  color: AppColors.surfaceDark,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Enter prescription details for the patient',
                style: AppTextStyle.textstyle14.copyWith(
                  color: AppColors.surfaceDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}