import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? imagePath;

  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, right: 20, bottom: 14, left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [AppBoxShadow.boxShadow],
        gradient: const LinearGradient(
          colors: [AppColors.primaryColor, Color(0xFF4A5FDB), Color(0xFFB3BCF2)],
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.background,
            backgroundImage: imagePath != null ? NetworkImage(imagePath!) : null,
            child: imagePath == null
                ? const Icon(Icons.person, size: 32, color: AppColors.primaryColor)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.textstyle16.copyWith(color: AppColors.background),
                ),
                Text(
                  email,
                  style: AppTextStyle.textstyle12.copyWith(color: const Color(0xFFDFE1E6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
