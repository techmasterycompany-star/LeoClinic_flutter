import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class Button extends StatelessWidget {
  final bool showicon;
  final String label;
  final void Function() onPressed;
  final Color backgroundcolor;
  final Color foregroundcolor;
  final double? width;
  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundcolor,
    this.width,
    required this.foregroundcolor,
    required this.showicon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          foregroundColor: foregroundcolor,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showicon)
              const Icon(Icons.close, size: 18, color: AppColors.primaryColor),
            if (showicon)
             const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyle.textstyle14.copyWith(color: foregroundcolor),
            ),
          ],
        ),
      ),
    );
  }
}
