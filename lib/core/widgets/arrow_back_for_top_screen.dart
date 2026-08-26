import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class ArrowBackTopScreen extends StatelessWidget {
  const ArrowBackTopScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
    Icons.arrow_back_ios_new_rounded,
    size: 15,
        ),
        onPressed: () {
    Navigator.pop(context);
        },
      ),
    );
  }
}