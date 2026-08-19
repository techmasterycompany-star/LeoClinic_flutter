import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/widgets/Top_headline_of_screens.dart';
import 'package:leoclinic_flutter/core/widgets/appointment_filter.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/search_and_filtering.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/patient_appointment_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/flaoting_action.dart';

class PatientAppointment extends StatelessWidget {
  const PatientAppointment({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  TopHeadline(title: 'Appointments'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: SearchAndFiltering(hinttext: "Doctor name.."),
                  ),
                  AppointmentFilterSection(
                    section1: "All",
                    section2: "Confirmd",
                    section3: "Pending",
                    section4: "Cancelled",
                  ),
                  PatientAppointmentCard(showdatetime: true, showactions: false),
                  SizedBox(height: 80),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 25,
              child: FlaotingAction(onPressed: () {}),
            ),
          ],
        ),
      ),
    ),
  );
}
}