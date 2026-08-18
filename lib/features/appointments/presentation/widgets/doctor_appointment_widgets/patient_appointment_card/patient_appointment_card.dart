import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/features/appointments/data/datasource/mocking_data/patient_data_card.dart';
import 'package:leoclinic_flutter/features/appointments/data/models/appointment_model.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/stauts_card/follow_up_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/stauts_card/new_visit_card.dart';

class PatientAppointmentCard extends StatelessWidget {
  final bool showdatetime;
  const PatientAppointmentCard({super.key, required this.showdatetime});

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
         return  FollowUpAppointmentCard(appointment: patientItem,
         showdatetime: showdatetime,
         onPressedOfBlueAcion: (){
          GoRouter.of(context).push("/PickAslotScreen");
         },onPressedOfLightBlueAcion: (){},);
        }
        else if (patientItem.status == AppointmentStatus.newvisit){
      return NewVisitAppointmentCard(appointment: patientItem,
      showdatetime: showdatetime,onPressedOfBlueAcion: (){
        GoRouter.of(context).push("/PickAslotScreen");
      },
      onPressedOfLightBlueAcion: (){});
        }
        return null;
      },
    );
  }
}