import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/appointments/data/datasource/mocking_data/appointment_data_card.dart';
import 'package:leoclinic_flutter/features/appointments/data/models/appointment_model.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/appointment_booking_card/status_card/canceled_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/appointment_booking_card/status_card/confirmed_card.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments = mockAppointments;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final item = appointments[index];
        if (item.status == AppointmentStatus.canceled) {
          return CanceledAppointmentCard(appointment: item);
        }
      return ConfirmedAppointmentCard(appointment: item);

      },
    );
  }
}