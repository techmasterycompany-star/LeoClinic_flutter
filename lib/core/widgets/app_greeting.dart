import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class AppGreeting extends StatelessWidget {
  final String greeting;
  final String userName;

  const AppGreeting({
    super.key,
    this.greeting = 'Good Morning',
    this.userName = 'Asser Mohammed',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // TODO: Implement the greeting with time of the day.
            greeting,
            style: AppTextStyle.secondarytext,
          ),
          Text(
            // TODO: Replace this placeholder with the logged-in user's name.
            userName,
            style: AppTextStyle.textstyle14,
          ),
        ],
      ),
    );
  }
}
