import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/core/utils/color.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/accept-bottam.dart';

class Newrequestscard extends StatelessWidget {
  const Newrequestscard({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(Assets.imagesDoctor),
          SizedBox(width: width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sarah Legend",
                  style: Custamtextstyle.test14.copyWith(
                    color: Color(0xff4A4F5A),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "23years , female",
                      style: Custamtextstyle.test10.copyWith(
                        color: Color(0xff6B707B),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Image.asset(
                      Assets.imagesCalendericon,
                      color: Color(0xff4A4F5A),
                    ),
                    Text(
                      "  27/8/2026 |  ",
                      style: Custamtextstyle.test12.copyWith(
                        color: Color(0xff4A4F5A),
                      ),
                    ),
                    Image.asset(
                      Assets.imagesClockIcon,
                      color: Color(0xff141B34),
                    ),
                    Text(
                      "  8:00 PM",
                      style: Custamtextstyle.test12.copyWith(
                        color: Color(0xff4A4F5A),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Acceptbottam(
                      text: 'Accept',
                      textcolor: Colors.white,
                      backgroundcolor: appcolor.color,
                      icon: Icons.check,
                      iconcolor: Colors.white,
                    ),
                    SizedBox(width: width * 0.03),
                    Acceptbottam(
                      text: "Decline",
                      textcolor: appcolor.color,
                      backgroundcolor: appcolor.backbootomcolor,
                      icon: Icons.close,
                      iconcolor: appcolor.color,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
