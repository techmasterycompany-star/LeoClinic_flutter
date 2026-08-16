import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/widgets/Top_headline_of_screens.dart';
import 'package:leoclinic_flutter/core/widgets/appointment_filter.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/search_and_filtering.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/patient_appointment_card.dart';

class DoctorRequest extends StatelessWidget {
  const DoctorRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopHeadline(title: 'Appointments'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SearchAndFiltering(),
                ),
                AppointmentFilterSection(section1: "Request",section2: "Confirmd",section3: "Cancelled",),
                PatientAppointmentCard(showactions: true,showdatetime: false,)

                  ]),
          ))));
  }
}