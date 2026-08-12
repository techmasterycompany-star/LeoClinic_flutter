import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/features/patient/data/models/patient_overview_model.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/appbar.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/patient_request_history.dart';

import '../widgets/patient_caring_specialist.dart';
import '../widgets/patient_next_appointment_card.dart';

class PatientOverview extends StatelessWidget {
  final PatientOverviewModel overview;

  const PatientOverview({super.key, this.overview = patientOverviewMock});
  Widget headline(String headline) {
    return Text(
      headline,
      style: AppTextStyle.textstyle14.copyWith(fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PatientAppBar(),

        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Next Appointment'),
                  TextButton(onPressed: () {}, child: Text('View all')),
                ],
              ),
              AppListView(
                itemCount: overview.nextAppointments.length,
                itemBuilder: (context, index) {
                  final appointment = overview.nextAppointments[index];

                  return NextAppointmentCard(
                    doctorName: appointment.doctorName,
                    doctorAge: appointment.doctorAge,
                    doctorGender: appointment.doctorGender,
                    appointmentTime: appointment.appointmentTime,
                    appointmentDate: appointment.appointmentDate,
                    location: appointment.location,
                    doctorImage: appointment.doctorImage,
                  );
                },
              ),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Caring specialist'),
                  Text(
                    '${overview.availableDoctorsThisWeek} doctors available this week',
                    style: AppTextStyle.secondarytext,
                  ),
                ],
              ),
              AppListView(
                itemCount: overview.caringSpecialists.length,
                itemBuilder: (context, index) {
                  final specialist = overview.caringSpecialists[index];

                  return CaringSpecialistCard(
                    doctorName: specialist.doctorName,
                    speciality: specialist.speciality,
                    amount: specialist.amount,
                    doctorImage: specialist.doctorImage,
                  );
                },
              ),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Request History'),
                  // TODO: Implement next appointment see all
                  TextButton(onPressed: () {}, child: Text('See all')),
                ],
              ),
              AppListView(
                itemCount: overview.requestsHistory.length,
                itemBuilder: (context, index) {
                  final request = overview.requestsHistory[index];

                  return RequestHistoryCard(
                    doctorName: request.doctorName,
                    speciality: request.speciality,
                    appointmentDate: request.appointmentDate,
                    appointmentTime: request.appointmentTime,
                    location: request.location,
                    appointmentStatus: request.appointmentStatus,
                    doctorImage: request.doctorImage,
                  );
                },
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
