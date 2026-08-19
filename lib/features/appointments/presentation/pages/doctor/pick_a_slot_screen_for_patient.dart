import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/widgets/Top_headline_of_screens.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/pick_a_slot_widgets/book_a_slot.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/pick_a_slot_widgets/breif_patient_intake.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/patient_card_details/patient_details_card.dart';

class PickAslotScreen extends StatelessWidget {
  const PickAslotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopHeadline(title: 'Appointments'),
               SizedBox(height: 30),
                Center(
                  child: PatientDetailsCard(
                    name: 'Asmaa Osman',
                    imageUrl:
                        'https://images.unsplash.com/photo-1786473354593-763ab8d64254?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    age: 30,
                    phone: '(0106) 6181852',
                    city: 'Cairo',
                    appointmentsCount: 4,
                    upcomingCount: 1,
                  ),
                ),
                PatientIntakeBriefCard(reasonForVisit: 'Chest pain and shortness of breath',
                 symptomsReported: 'Chest pain', durationOfSymptoms: 'Two Weeks',
                  clinicalNotes: 'Type 2 Diabetes, Tooth extraction under general anesthesia',),
                  BookASlot(onPressedOfBlueAcion: () {  }, onPressedOfLightBlueAcion: () { GoRouter.of(context).push("/DoctorRequestAppointment"); },),
                  ]),
          ))));
  }
}