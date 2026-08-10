import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Function onPressed;

  const MyTextButton({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed(),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: backgroundColor ?? AppColors.primaryColor,
        ),
        child: Text(
          text,
          style:
              textStyle ??
              AppTextStyle.textstyle12.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
