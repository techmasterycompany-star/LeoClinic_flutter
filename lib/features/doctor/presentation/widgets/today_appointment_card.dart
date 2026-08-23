import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';

class Todaysappointmentscard extends StatelessWidget {
  String? maintext;
  final Color? maincolor;
  Todaysappointmentscard({super.key, this.maintext, this.maincolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: maincolor ?? Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (maintext != null)
            Text(
              maintext!,
              style: Custamtextstyle.test14.copyWith(color: const Color(0xffDA1E28)),
            ),
          if (maintext != null) SizedBox(height: 16),
          Row(
            children: [
              Image.asset(Assets.imagesDoctor),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sarah Legend",
                      style: Custamtextstyle.test14.copyWith(
                        color: const Color(0xff4A4F5A),
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "23years , female",
                          style: Custamtextstyle.test10.copyWith(
                            color: const Color(0xff6B707B),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesCalendericon,
                          color: const Color(0xff4A4F5A),
                        ),
                        Text(
                          "  27/8/2026 |  ",
                          style: Custamtextstyle.test12.copyWith(
                            color: const Color(0xff4A4F5A),
                          ),
                        ),
                        Image.asset(
                          Assets.imagesClockIcon,
                          color: const Color(0xff141B34),
                        ),
                        Text(
                          "  8:00 PM",
                          style: Custamtextstyle.test12.copyWith(
                            color: const Color(0xff4A4F5A),
                          ),
                        ),
                        SizedBox(width: 12),
                        const Text("|"),
                        SizedBox(width: 12),
                        Image.asset(Assets.imagesVideo),
                        Text(
                          " Online",
                          style: Custamtextstyle.test12.copyWith(
                            color: const Color(0xff4A4F5A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
