import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';

class PatientDirectory extends StatelessWidget {
  final String name;
  final String number;
  final String info;
  final String status;
  final String image;
  final VoidCallback? onTap;
  const PatientDirectory({
    super.key,
    required this.name,
    required this.number,
    required this.info,
    required this.status,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        clipBehavior: Clip.hardEdge,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
        ),
        child: Image.network(image, fit: BoxFit.cover),
      ),
      title: Text(name, style: AppTextStyle.textstyle14),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: AppTextStyle.secondarytext),
          Text(info, style: AppTextStyle.secondarytext),
        ],
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: AppColors.successBg,
          borderRadius: BorderRadius.circular(200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          status,
          style: AppTextStyle.textstyle12.copyWith(color: AppColors.success),
        ),
      ),
    );
  }
}
