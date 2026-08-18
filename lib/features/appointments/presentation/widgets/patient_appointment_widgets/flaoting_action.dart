import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class FlaotingAction extends StatelessWidget {
  final void Function() onPressed;
  const FlaotingAction({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.background,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Icon(Icons.add));
  }
}