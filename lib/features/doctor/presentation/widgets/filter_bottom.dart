import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/color.dart';
import 'package:leoclinic_flutter/core/utils/custom_text_style.dart';

class Filterbottom extends StatelessWidget {
  final VoidCallback ontap;
  final bool isselecleted;
  final String text;
  const Filterbottom({
    super.key,
    required this.text,
    required this.isselecleted,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffF0F1F5), width: 1),
          color: isselecleted ? AppColor.color : Colors.white,
        ),
        child: Text(
          text,
          style: Custamtextstyle.test12.copyWith(
            color: isselecleted ? Colors.white : Color(0xff4A4F5A),
          ),
        ),
      ),
    );
  }
}
