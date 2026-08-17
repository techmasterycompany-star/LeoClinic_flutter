import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class ActionsForCards extends StatelessWidget {
  const ActionsForCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A1AB8),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child:  Text(
              'Pick A Slot',
              style: AppTextStyle.textstyle14.copyWith(color: Colors.white,fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE5F1FF),
              foregroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Icon(Icons.close, size: 18, color: AppColors.primaryColor),
    const SizedBox(width: 6),
    Text(
      'Decline',
      style: AppTextStyle.textstyle14.copyWith(color: AppColors.primaryColor),
    ),
  ],
), 
            )
          ),
       ] );
  }
}