import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';

class Nextappointmentcard extends StatelessWidget {
  final String? maintext;

  const Nextappointmentcard({super.key, this.maintext});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          colors: [Color(0xff0018A6), Color(0xff4A5FDB), Color(0xffB3BCF2)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (maintext != null)
            Text(
              maintext!,
              style: Custamtextstyle.test14.copyWith(color: Colors.white),
            ),

          SizedBox(height: 16.h),

          Row(
            children: [
              Image.asset(Assets.imagesDoctor),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sarah Legend",
                      style: Custamtextstyle.test14.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "23years , female",
                          style: Custamtextstyle.test10.copyWith(
                            color: const Color(0xffDFE1E6),
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: const Color(0xff0018A6),
                            borderRadius: BorderRadius.circular(16.r),
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
                          " 27/8/2026 | ",
                          style: Custamtextstyle.test12.copyWith(
                            color: Colors.white,
                          ),
                        ),

                        Image.asset(Assets.imagesClockIcon),

                        Text(
                          " 8:00 PM",
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
        ],
      ),
    );
  }
}
