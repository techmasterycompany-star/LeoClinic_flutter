import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/custom_text_style.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/new_requests_card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/next_appointment_card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/today_appointments_card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam_searche.dart';

class Doctordashboradbody extends StatelessWidget {
  const Doctordashboradbody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.02),
          Custamsearche(),
          SizedBox(height: height * 0.02),
          Text("Next Appointment", style: Custamtextstyle.test16),
          SizedBox(height: height * 0.01),
          Nextappointmentcard(),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Text(
                "Today’s Appointments",
                style: Custamtextstyle.test16.copyWith(
                  color: Color(0xff4A4F5A),
                ),
              ),
              Spacer(),
              Text(
                "See all",
                style: Custamtextstyle.test12.copyWith(
                  color: Color(0xff0018A6),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Todaysappointmentscard(),

          SizedBox(height: height * 0.02),
          Todaysappointmentscard(),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Text(
                "New Requests",
                style: Custamtextstyle.test16.copyWith(
                  color: Color(0xff4A4F5A),
                ),
              ),
              Spacer(),
              Text(
                "See all",
                style: Custamtextstyle.test12.copyWith(
                  color: Color(0xff0018A6),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Newrequestscard(),
          SizedBox(height: height * 0.02),
          Newrequestscard(),
        ],
      ),
    );
  }
}
