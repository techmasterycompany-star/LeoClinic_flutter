import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/arrow_back_for_top_screen.dart';

class TopHeadline extends StatelessWidget {
  final String title;
  final double numofPad;
  final bool showBackButton;
  const TopHeadline({
    super.key,
    required this.title, required this.numofPad, this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       SizedBox(width: 25.w),
      if (showBackButton) ArrowBackTopScreen(),
      Padding(
        padding: EdgeInsets.only(left: numofPad.w),
        child: Text(
          title,
          style: AppTextStyle.heading,
        ),
      )
    ],);
  }
}