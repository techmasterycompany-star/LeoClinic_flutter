import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Filter-bottom-reuse.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Filter-bottom.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/New%20Requests-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Next%20Appointment-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Today%20Appointments-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam-searche.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Notifications", style: Custamtextstyle.test28),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF0F1F5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.arrow_back_ios, size: 19),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
