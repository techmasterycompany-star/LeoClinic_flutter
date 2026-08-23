import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Filter-bottom-reuse.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/New%20Requests-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Next%20Appointment-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/today_appointment_card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custom_appbar_allpage.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam-searche.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Custamappbarallpage(maintext: "Notifications"),
              Custamsearche(),
              SizedBox(height: height * 0.02),
              Filterbottomreuse(),
              SizedBox(height: height * 0.02),
              Nextappointmentcard(maintext: "Next Appointment"),
              SizedBox(height: height * 0.02),
              Todaysappointmentscard(
                maincolor: Color(0xffFFEAEA),
                maintext: "Canceled Appointment ",
              ),
              SizedBox(height: height * 0.02),
              Newrequestscard(
                maintext: "New Request",
                delete: Icons.delete_forever_outlined,
              ),
              SizedBox(height: height * 0.02),
              Newrequestscard(
                maintext: "New Request",
                delete: Icons.delete_forever_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
