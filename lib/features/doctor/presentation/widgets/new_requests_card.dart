import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/core/utils/color.dart';
import 'package:leoclinic_flutter/core/utils/custom_text_style.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/accept_bottom.dart';

class Newrequestscard extends StatelessWidget {
  final String? maintext;
  final IconData? delete;
  const Newrequestscard({super.key, this.maintext, this.delete});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (maintext != null) Text(maintext!, style: Custamtextstyle.test14),
          SizedBox(height: height * 0.01),
          Row(
            children: [
              Image.asset(Assets.imagesDoctor),
              SizedBox(width: width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Dr. Sarah Legend",
                        style: Custamtextstyle.test14.copyWith(
                          color: Color(0xff4A4F5A),
                        ),
                      ),
                      if (delete != null) ...[
                        SizedBox(width: width * 0.3),
                        Icon(delete),
                      ],
                    ],
                  ),
                  Text(
                    "22 years",
                    style: Custamtextstyle.test10.copyWith(
                      color: Color(0xff6B707B),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesCalendericon, color: Color(0xff4A4F5A)),
              Text(
                "  27/8/2026 |  ",
                style: Custamtextstyle.test12.copyWith(
                  color: Color(0xff4A4F5A),
                ),
              ),
              Image.asset(Assets.imagesVideo, color: Color(0xff141B34)),
              Text(
                "  In the clinic",
                style: Custamtextstyle.test12.copyWith(
                  color: Color(0xff4A4F5A),
                ),
              ),
              SizedBox(width: width * 0.2),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0x3300875A),
                ),
                child: Text(
                  "New Visit",
                  style: Custamtextstyle.test10.copyWith(
                    color: Color(0xff00875A),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              Acceptbottam(
                text: 'Pick a Slot',
                textcolor: Colors.white,
                backgroundcolor: AppColor.color,
                icon: Icons.check,
                iconcolor: Colors.white,
              ),
              SizedBox(width: width * 0.05),
              Acceptbottam(
                text: "Decline",
                textcolor: AppColor.color,
                backgroundcolor: AppColor.backbootomcolor,
                icon: Icons.close,
                iconcolor: AppColor.color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
