import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';

class Todaysappointmentscard extends StatelessWidget {
  final String? maintext;
  final Color? maincolor;
  const Todaysappointmentscard({super.key, this.maintext, this.maincolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.border.withValues(alpha: 0.5),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: maincolor ?? AppColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (maintext != null)
            Text(
              maintext!,
              style: AppTextStyle.textstyle14.copyWith(color: AppColors.failed),
            ),
          if (maintext != null) SizedBox(height: 16),
          Row(
            children: [
              Image.asset(Assets.imagesDoctor),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sarah Legend",
                      style: AppTextStyle.textstyle14.copyWith(
                        color: AppColors.surfaceDark,
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "23years , female",
                          style: AppTextStyle.textstyle10.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesCalendericon,
                          color: AppColors.surfaceDark,
                        ),
                        Text(
                          "  27/8/2026 |  ",
                          style: AppTextStyle.textstyle12.copyWith(
                            color: AppColors.surfaceDark,
                          ),
                        ),
                        Image.asset(
                          Assets.imagesClockIcon,
                          color: AppColors.textPrimary,
                        ),
                        Text(
                          "  8:00 PM",
                          style: AppTextStyle.textstyle12.copyWith(
                            color: AppColors.surfaceDark,
                          ),
                        ),
                        SizedBox(width: 12),
                        const Text("|"),
                        SizedBox(width: 12),
                        Image.asset(Assets.imagesVideo),
                        Text(
                          " Online",
                          style: AppTextStyle.textstyle12.copyWith(
                            color: AppColors.surfaceDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
