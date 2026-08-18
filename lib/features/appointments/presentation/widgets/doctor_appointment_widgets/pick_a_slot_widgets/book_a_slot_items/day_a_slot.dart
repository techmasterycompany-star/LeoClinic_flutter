import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class DaySlot extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const DaySlot({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.textstyle14.copyWith(
              color: isSelected ? AppColors.primaryColor : AppColors.surfaceDark,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.textstyle12.copyWith(
              color: isSelected ? AppColors.primaryColor : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: 100,
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
          ),
        ],
      ),
    );
  }
}