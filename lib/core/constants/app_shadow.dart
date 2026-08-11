import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class AppBoxShadow {
  static const boxShadow = BoxShadow(
    color: AppColors.border,
    blurRadius: 8,
    offset: Offset(0, 4),
  );
}
