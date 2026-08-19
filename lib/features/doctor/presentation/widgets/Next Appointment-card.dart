import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';

class Nextappointmentcard extends StatelessWidget {
  final String? maintext;

  const Nextappointmentcard({super.key, this.maintext});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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

          SizedBox(height: height * 0.02),

          Row(
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
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff0018A6),
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
