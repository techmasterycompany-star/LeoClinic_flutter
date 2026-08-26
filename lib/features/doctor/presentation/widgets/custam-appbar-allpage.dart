import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class Custamappbarallpage extends StatelessWidget {
  final String maintext;
  final bool showBackButton;
  const Custamappbarallpage({super.key, required this.maintext, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(maintext, style: AppTextStyle.heading),
      centerTitle: true,
      leading: showBackButton
          ? GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.arrow_back_ios, size: 19),
                ),
              ),
            )
          : null,
    );
  }
}
