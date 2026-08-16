import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/responsive.dart';
import 'package:leoclinic_flutter/core/widgets/appointment_filter.dart';
import 'package:leoclinic_flutter/core/widgets/top_headline_of_screens.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/patient_appointment_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/files/file_section.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/patient_card_details/patient_details_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/prescriptions_section/prescription_section.dart';

class ProfilePatientForDoctor extends StatelessWidget {
  const ProfilePatientForDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: Responsive.value(context, mobile: 20, tablet: 24),
            ),
            child: Column(
              children: [
                TopHeadline(title: "Appointment"),
                SizedBox(height: 30),
                PatientDetailsCard(
                  name: 'Asmaa Osman',
                  imageUrl:
                      'https://images.unsplash.com/photo-1786473354593-763ab8d64254?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  age: 30,
                  phone: '(0106) 6181852',
                  city: 'Cairo',
                  appointmentsCount: 4,
                  upcomingCount: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: Responsive.value(context, mobile: 20, tablet: 30),
                  ),
                  child: AppointmentFilterSection(
                    section1: "Previous Visit",
                    section2: "Request",
                    section3: "Confirmed",
                  ),
                ),
                PatientAppointmentCard(showactions: false,showdatetime: false,),
                PrescriptionSection(),
                FileSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
