import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/network/dio_client.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/core/widgets/overview_shared.dart';
import 'package:leoclinic_flutter/features/doctor/data/datasource/doctor_api_services.dart';
import 'package:leoclinic_flutter/features/patient/data/models/patient_overview_model.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/appbar.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/patient_request_history.dart';

import '../widgets/patient_caring_specialist.dart';
import '../widgets/patient_next_appointment_card.dart';

class PatientOverview extends StatefulWidget {
  final PatientOverviewModel overview;

  const PatientOverview({super.key, this.overview = patientOverviewMock});

  @override
  State<PatientOverview> createState() => _PatientOverviewState();
}

class _PatientOverviewState extends State<PatientOverview> {
  bool nextAppointmentView = false;
  bool requestHistoryView = false;

  // DoctorApiServices is kept for future API integration.
  // ignore: unused_field
  final DoctorApiServices _doctorApiServices = DoctorApiServices(DioClient());

  void _toggleNextAppointment() {
    setState(() {
      nextAppointmentView = !nextAppointmentView;
    });
  }

  void _toggleRequestHistory() {
    setState(() {
      requestHistoryView = !requestHistoryView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PatientAppBar(),

        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SectionHeader(
                title: 'Next Appointment',
                actionText: 'View all',
                onAction: _toggleNextAppointment,
              ),
              widget.overview.nextAppointments.isEmpty
                  ? const EmptyState(message: 'No appointments available')
                  : AppListView(
                      spacing: 10,
                      itemCount: nextAppointmentView
                          ? widget.overview.nextAppointments.length
                          : 1,
                      itemBuilder: (context, index) {
                        final appointment =
                            widget.overview.nextAppointments[index];

                        return GestureDetector(
                          onTap: () {
                            context.push('/BookAppointment');
                          },
                          child: NextAppointmentCard(
                            doctorName: appointment.doctorName,
                            doctorAge: appointment.doctorAge,
                            doctorGender: appointment.doctorGender,
                            appointmentTime: appointment.appointmentTime,
                            appointmentDate: appointment.appointmentDate,
                            location: appointment.location,
                            doctorImage: appointment.doctorImage,
                          ),
                        );
                      },
                    ),

              SectionHeader(
                title: 'Caring specialist',
              ),
              widget.overview.caringSpecialists.isEmpty
                  ? const EmptyState(
                      message: 'No caring specialists available')
                  : AppListView(
                      spacing: 10,
                      itemCount: widget.overview.caringSpecialists.length,
                      itemBuilder: (context, index) {
                        final specialist =
                            widget.overview.caringSpecialists[index];

                        return GestureDetector(
                          onTap: () {
                            context.push('/BookAppointment');
                          },
                          child: CaringSpecialistCard(
                            doctorName: specialist.doctorName,
                            speciality: specialist.speciality,
                            amount: specialist.amount,
                            doctorImage: specialist.doctorImage,
                          ),
                        );
                      },
                    ),

              SectionHeader(
                title: 'Request History',
                actionText: 'See all',
                onAction: _toggleRequestHistory,
              ),
              widget.overview.requestsHistory.isEmpty
                  ? const EmptyState(message: 'No request history')
                  : AppListView(
                      spacing: 10,
                      itemCount: requestHistoryView
                          ? widget.overview.requestsHistory.length
                          : 1,
                      itemBuilder: (context, index) {
                        final request =
                            widget.overview.requestsHistory[index];

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
