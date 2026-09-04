import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withAlpha(20),
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: AppTextStyle.heading,
      iconTheme: const IconThemeData(color: Colors.black87),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
    ),
  );
}