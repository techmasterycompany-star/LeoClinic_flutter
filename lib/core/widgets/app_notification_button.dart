import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';

class AppNotificationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppNotificationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [AppBoxShadow.boxShadow],
      ),
      child: IconButton(
        // TODO: Implement notification navigation.
        onPressed: onPressed,
        icon: const Icon(Icons.notifications),
      ),
    );
  }
}
