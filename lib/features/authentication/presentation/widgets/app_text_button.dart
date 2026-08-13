import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? icon;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.borderColor,
    this.borderWidth,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(borderRadius ?? 25.0),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0,
            ),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? Colors.white,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 10.w,
            vertical: verticalPadding ?? 8.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(
            buttonWidth ?? double.maxFinite,
            buttonHeight ?? 50.h,
          ),
        ),
      ),
      onPressed: onPressed,
      child:  Row(mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: textStyle,
          ),
          SizedBox(width: 8.w),
          icon ?? const SizedBox(),

        ],
      )
    );
  }
}