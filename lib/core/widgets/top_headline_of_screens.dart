import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/arrow_back_for_top_screen.dart';

class TopHeadline extends StatelessWidget {
  final String title;
  const TopHeadline({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      const SizedBox(width: 25),
      ArrowBackTopScreen(),
      Padding(
        padding: const EdgeInsets.only(left: 72),
        child: Text(
          title,
          style: AppTextStyle.heading,
        ),
      )
    ],);
  }
}