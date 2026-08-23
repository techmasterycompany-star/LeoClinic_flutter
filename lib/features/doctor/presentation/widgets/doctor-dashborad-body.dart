import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/New%20Requests-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Next%20Appointment-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Today%20Appointments-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam-searche.dart';

class Doctordashboradbody extends StatelessWidget {
  const Doctordashboradbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          const Custamsearche(),
          SizedBox(height: 16.h),
          Text("Next Appointment", style: Custamtextstyle.test16),
          SizedBox(height: 8.h),
          const Nextappointmentcard(),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                "Today’s Appointments",
                style: Custamtextstyle.test16.copyWith(
                  color: const Color(0xff4A4F5A),
                ),
              ),
              const Spacer(),
              Text(
                "See all",
                style: Custamtextstyle.test12.copyWith(
                  color: const Color(0xff0018A6),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Todaysappointmentscard(),

          SizedBox(height: 16.h),
          Todaysappointmentscard(),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                "New Requests",
                style: Custamtextstyle.test16.copyWith(
                  color: const Color(0xff4A4F5A),
                ),
              ),
              const Spacer(),
              Text(
                "See all",
                style: Custamtextstyle.test12.copyWith(
                  color: const Color(0xff0018A6),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Newrequestscard(),
          SizedBox(height: 16.h),
          Newrequestscard(),
        ],
      ),
    );
  }
}
