import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_add_prescription.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/header_of_sections.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/prescriptions_section/widgets/prescription_card.dart';

class PrescriptionSection extends StatefulWidget {
  const PrescriptionSection({super.key});

  @override
  State<PrescriptionSection> createState() => _PrescriptionSectionState();
}

class _PrescriptionSectionState extends State<PrescriptionSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderOfPrescriptionSection(title: "Prescriptions", subtitle:  "See all",),
        PrescriptionCard(title: "Prescriptions #1", date: "15 Jul 206", items: ["Amoxicilline 500g","Panadol extra","Mouth Wash"],onPressed: (){
          GoRouter.of(context).push("/DoctorAddPrescription");
        }
        ,)
      ],
    );
  }
}