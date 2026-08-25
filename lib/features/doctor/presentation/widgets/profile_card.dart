import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/core/utils/custom_text_style.dart';

class Profilecard extends StatelessWidget {
  const Profilecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 14, right: 20, bottom: 14, left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
        gradient: LinearGradient(
          colors: [Color(0XFF0018A6), Color(0XFF4A5FDB), Color(0XFFB3BCF2)],
        ),
      ),
      child: Row(
        children: [
          Image.asset(Assets.imagesDoctor),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr.omnia moahmouad",
                style: Custamtextstyle.test16.copyWith(color: Colors.white),
              ),
              Text(
                "Saralegend123@gmail.com ",
                style: Custamtextstyle.test12.copyWith(
                  color: Color(0XFFDFE1E6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
