import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/custom_text_style.dart';

class Profilebottom extends StatelessWidget {
  final String maintext;
  final String iconimage;
  const Profilebottom({
    super.key,
    required this.maintext,
    required this.iconimage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, right: 20, bottom: 16, left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(iconimage),
          SizedBox(width: 8),
          Text(maintext, style: Custamtextstyle.test16),
          Spacer(),
          Icon(Icons.arrow_back_ios),
        ],
      ),
    );
  }
}
