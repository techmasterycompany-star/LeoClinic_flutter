import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';

class AppointmentNew extends StatelessWidget {
  const AppointmentNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.primaryColor, AppColors.secondaryColor],
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Date
          Text(
            'Friday, August 8',
            style: AppTextStyle.textstyle10.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          // Appointment news and button
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'You have 6 Appointments today',
                style: AppTextStyle.textstyle14.copyWith(
                  color: AppColors.surfaceLight,
                ),
              ),

              // TODO: Implement patient list button
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_list_bulleted_rounded,
                  color: AppColors.surfaceLight,
                ),
              ),
            ],
          ),

          // Next Appointment
          Text('Next: James Rod', style: AppTextStyle.textstyle10.copyWith(
              color: AppColors.textMuted,
            ),)
        ],
      ),
    );
  }
}
