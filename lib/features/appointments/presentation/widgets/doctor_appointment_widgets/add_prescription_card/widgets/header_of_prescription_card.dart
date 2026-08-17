import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFFEAF0FE),
            borderRadius: BorderRadius.circular(14),
          ),
          child: SvgPicture.asset(
            "assets/icons/validation-approval-for-prescription.svg",
            height: 24,
            width: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Prescription',
                style: AppTextStyle.textstyle16.copyWith(
                  color: AppColors.surfaceDark,
                ),
              ),
              const SizedBox(height: 5),
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