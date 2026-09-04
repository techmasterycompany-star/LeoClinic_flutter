import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class NavBar extends StatelessWidget {
  final List<NavigationDestination> destination;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  const NavBar({
    super.key,
    required this.destination,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0, right: 20, left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(34),
            color: AppColors.background.withValues(alpha: 0.72),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(34),
              child: NavigationBar(
                backgroundColor: Colors.transparent,
                indicatorColor: AppColors.secondaryColor,
                indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(34),
                ),
                destinations: destination,
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                height: 40.h,
                animationDuration: const Duration(milliseconds: 300),
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                labelTextStyle: WidgetStatePropertyAll(TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
