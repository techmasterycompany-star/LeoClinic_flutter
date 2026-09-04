import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/core/utils/color.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/accept-bottam.dart';

class Newrequestscard extends StatelessWidget {
  final String? maintext;
  final IconData? delete;
  const Newrequestscard({super.key, this.maintext, this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (maintext != null) Text(maintext!, style: Custamtextstyle.test14),
          SizedBox(height: 8.h),
          Row(
            children: [
              Image.asset(Assets.imagesDoctor),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Dr. Sarah Legend",
                        style: Custamtextstyle.test14.copyWith(
                          color: const Color(0xff4A4F5A),
                        ),
                      ),
                      if (delete != null) ...[
                        SizedBox(width: 120.w),
                        Icon(delete),
                      ],
                    ],
                  ),
                  Text(
                    "22 years",
                    style: Custamtextstyle.test10.copyWith(
                      color: const Color(0xff6B707B),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesCalendericon, color: const Color(0xff4A4F5A)),
              Text(
                "  27/8/2026 |  ",
                style: Custamtextstyle.test12.copyWith(
                  color: const Color(0xff4A4F5A),
                ),
              ),
              Image.asset(Assets.imagesVideo, color: const Color(0xff141B34)),
              Text(
                "  In the clinic",
                style: Custamtextstyle.test12.copyWith(
                  color: const Color(0xff4A4F5A),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color(0x3300875A),
                ),
                child: Text(
                  "New Visit",
                  style: Custamtextstyle.test10.copyWith(
                    color: const Color(0xff00875A),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Acceptbottam(
                text: 'Pick a Slot',
                textcolor: Colors.white,
                backgroundcolor: appcolor.color,
                icon: Icons.check,
                iconcolor: Colors.white,
              ),
              SizedBox(width: 20.w),
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
    );
  }
}
