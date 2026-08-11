import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/appointments/data/datasource/mocking_data/patient_data_card.dart';
import 'package:leoclinic_flutter/features/appointments/data/models/appointment_model.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widget/stauts_card/follow_up_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widget/stauts_card/new_visit_card.dart';

class PatientAppointmentCard extends StatelessWidget {
  const PatientAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final patientAppointment = patinetappointmentcard ;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: patientAppointment.length,
      itemBuilder: (context, index) {
        final patientItem = patientAppointment[index];
        if (patientItem.status == AppointmentStatus.followup){
         return  FollowUpAppointmentCard(appointment: patientItem);
        }
        else if (patientItem.status == AppointmentStatus.newvisit){
      return NewVisitAppointmentCard(appointment: patientItem,);
        }
        return null;
      },
    );
  }
}