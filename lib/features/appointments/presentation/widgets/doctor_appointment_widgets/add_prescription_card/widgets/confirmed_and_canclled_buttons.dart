import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';

class ConfirmedAndCanclledButtons extends StatelessWidget {
  final  void Function() canclledOnPressed;
    final  void Function() confirmOnPressed;
  const ConfirmedAndCanclledButtons({
    super.key, required this.canclledOnPressed, required this.confirmOnPressed,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Button(
            showicon: false,
            label: "Cancelled",
            onPressed: canclledOnPressed,
            backgroundcolor: AppColors.secondaryColor,
            foregroundcolor: AppColors.primaryColor,
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Button(
            showicon: false,
            label: 'Confirm',
            onPressed: confirmOnPressed,
            backgroundcolor: AppColors.primaryColor,
            foregroundcolor: AppColors.background,
          ),
        ),
      ],
    );
  }
}
