import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/greeting.dart';

class DoctorAppBar extends StatelessWidget {
  const DoctorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: greetUser(),

      actions: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [AppBoxShadow.boxShadow]
          ),
          child: TextButton.icon(
            onPressed: () {},
            label: Icon(Icons.notifications),
          ),
        ),
      ],
    );
  }
}
