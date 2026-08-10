import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
Widget greetUser() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // TODO: Implement the greeting with time of the day
          'Good Morning',
          style: AppTextStyle.secondarytext,
        ),

        Text(
          // TODO: Implement the patient name
          'Asser Mohammed',
          style: AppTextStyle.textstyle14,
        ),
      ],
    ),
  );
}
