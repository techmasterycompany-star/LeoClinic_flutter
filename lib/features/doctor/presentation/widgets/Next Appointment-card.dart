import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';

class Nextappointmentcard extends StatelessWidget {
  const Nextappointmentcard({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Color(0xff0018A6), Color(0xff4A5FDB), Color(0xffB3BCF2)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
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
                  style: Custamtextstyle.test14.copyWith(color: Colors.white),
                ),

                Row(
                  children: [
                    Text(
                      "23years , female",
                      style: Custamtextstyle.test10.copyWith(
                        color: Color(0xffDFE1E6),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff0018A6),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "Join Now",
                        style: Custamtextstyle.test14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Image.asset(Assets.imagesCalendericon),
                    Text(
                      "  27/8/2026 |  ",
                      style: Custamtextstyle.test12.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(Assets.imagesClockIcon),
                    Text(
                      "  8:00 PM",
                      style: Custamtextstyle.test12.copyWith(
                        color: Colors.white,
                      ),
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
