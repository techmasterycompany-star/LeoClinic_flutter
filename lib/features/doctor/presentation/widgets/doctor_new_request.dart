import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_pill_button.dart';

class NewRequestCard extends StatelessWidget {
  final String patientName;
  final int patientAge;
  final String patientGender;
  final String appointmentDate;
  final String? patientImage;
  final String location;
  const NewRequestCard({
    super.key,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.appointmentDate,
    this.patientImage,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: const [AppBoxShadow.boxShadow],
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Patient image, name and age
          Row(
            children: [
              CircleAvatar(child: Icon(Icons.person)),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(patientName, style: AppTextStyle.textstyle12),

                  Text(
                    '$patientAge Years, $patientGender',
                    style: AppTextStyle.secondarytext,
                  ),
                ],
              ),
            ],
          ),

          // Patient date and location
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('$appointmentDate | $location'),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.successBg,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'New visit',
                  style: AppTextStyle.textstyle10.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),

          // Buttons
          // TODO: Implement pick a slot button
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              AppPillButton(text: 'Pick a Slot', onPressed: () {}),
              AppPillButton(
                text: 'Decline',
                onPressed: () {},
                backgroundColor: AppColors.secondaryColor,
                textStyle: AppTextStyle.textstyle10.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
