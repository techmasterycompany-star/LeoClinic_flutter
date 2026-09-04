import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class HealthOverviewCard extends StatelessWidget {
  final IconData icon;
  final String headline;
  final String result;
  final String? percentage;
  const HealthOverviewCard({
    super.key,
    required this.icon,
    required this.headline,
    required this.result,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppBoxShadow.boxShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.fieldBg,
                ),
                child: Icon(icon),
              ),
              Text(
                percentage ?? 'None',
                style: AppTextStyle.textstyle10,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(headline, style: AppTextStyle.textstyle10),
              Text(result, style: AppTextStyle.textstyle12),
            ],
          ),
        ],
      ),
    );
  }
}
