import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/core/widgets/overview_shared.dart';
import 'package:leoclinic_flutter/features/doctor/data/models/doctor_overview_model.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_app_bar.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_new_request.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_next_appointment_card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/today_appointment.dart';

class DoctorOverview extends StatefulWidget {
  final DoctorOverviewModel overview;

  const DoctorOverview({super.key, this.overview = doctorOverviewMock});

  @override
  State<DoctorOverview> createState() => _DoctorOverviewState();
}

class _DoctorOverviewState extends State<DoctorOverview> {
  bool nextAppointmentView = false;
  bool todayAppointmentView = false;
  bool newRequestView = false;

  void _toggleNextAppointmentView() {
    setState(() {
      nextAppointmentView = !nextAppointmentView;
    });
  }

  void _toggleTodayAppointmentView() {
    setState(() {
      todayAppointmentView = !todayAppointmentView;
    });
  }

  void _toggleNewRequestView() {
    setState(() {
      newRequestView = !newRequestView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        DoctorAppBar(),

        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SectionHeader(
                title: 'Next Appointments',
                actionText: 'See all',
                onAction: _toggleNextAppointmentView,
              ),

              widget.overview.nextAppointments.isEmpty
                  ? const EmptyState(message: 'No upcoming appointments')
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
                            context.push('/ProfilePatientForDoctor');
                          },
                          child: NextAppointmentCard(
                            patientName: appointment.patientName,
                            patientAge: appointment.patientAge,
                            patientGender: appointment.patientGender,
                            appointmentTime: appointment.appointmentTime,
                            appointmentDate: appointment.appointmentDate,
                            patientImage: appointment.patientImage,
                          ),
                        );
                      },
                    ),

              SectionHeader(
                title: 'Today\'s Appointments',
                actionText: 'See all',
                onAction: _toggleTodayAppointmentView,
              ),

              widget.overview.todayAppointments.isEmpty
                  ? const EmptyState(message: 'No appointments today')
                  : AppListView(
                      spacing: 10,
                      itemCount: todayAppointmentView
                          ? widget.overview.todayAppointments.length
                          : 2,
                      itemBuilder: (context, index) {
                        final appointment =
                            widget.overview.todayAppointments[index];

                        return TodayAppointmentCard(
                          patientName: appointment.patientName,
                          patientAge: appointment.patientAge,
                          patientGender: appointment.patientGender,
                          appointmentTime: appointment.appointmentTime,
                          appointmentDate: appointment.appointmentDate,
                          location: appointment.location,
                          patientImage: appointment.patientImage,
                        );
                      },
                    ),

              SectionHeader(
                title: 'New Requests',
                actionText: 'See all',
                onAction: _toggleNewRequestView,
              ),

              widget.overview.newRequests.isEmpty
                  ? const EmptyState(message: 'No new requests')
                  : AppListView(
                      spacing: 10,
                      itemCount: newRequestView
                          ? widget.overview.newRequests.length
                          : 1,
                      itemBuilder: (context, index) {
                        final request = widget.overview.newRequests[index];

                        return GestureDetector(
                          onTap: () {
                            context.push('/PickAslotScreen');
                          },
                          child: NewRequestCard(
                            patientName: request.patientName,
                            patientAge: request.patientAge,
                            patientGender: request.patientGender,
                            appointmentDate: request.appointmentDate,
                            location: request.location,
                            patientImage: request.patientImage,
                          ),
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
