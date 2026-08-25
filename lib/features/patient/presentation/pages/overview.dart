import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
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

  Widget headline(String headline) {
    return Text(
      headline,
      style: AppTextStyle.textstyle14.copyWith(fontSize: 16),
    );
  }

  Widget _buildEmptyState(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          message,
          style: AppTextStyle.secondarytext,
        ),
      ),
    );
  }

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
          padding: const EdgeInsets.all(8),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Next Appointment'),
                  TextButton(
                    onPressed: _toggleNextAppointment,
                    child: Text('View all'),
                  ),
                ],
              ),
              widget.overview.nextAppointments.isEmpty
                  ? _buildEmptyState('No appointments available')
                  : AppListView(
                      itemCount: nextAppointmentView
                          ? widget.overview.nextAppointments.length
                          : 1,
                      itemBuilder: (context, index) {
                        final appointment =
                            widget.overview.nextAppointments[index];

                        return GestureDetector(
                          onTap: () => context.push('/BookAppointment'),
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

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Caring specialist'),
                  Text(
                    '${widget.overview.availableDoctorsThisWeek} doctors available this week',
                    style: AppTextStyle.secondarytext,
                  ),
                ],
              ),
              widget.overview.caringSpecialists.isEmpty
                  ? _buildEmptyState('No caring specialists available')
                  : AppListView(
                      itemCount: widget.overview.caringSpecialists.length,
                      itemBuilder: (context, index) {
                        final specialist =
                            widget.overview.caringSpecialists[index];

                        return CaringSpecialistCard(
                          doctorName: specialist.doctorName,
                          speciality: specialist.speciality,
                          amount: specialist.amount,
                          doctorImage: specialist.doctorImage,
                          onBookAppointment: () => context.push('/BookAppointment'),
                        );
                      },
                    ),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Request History'),
                  TextButton(
                    onPressed: _toggleRequestHistory,
                    child: Text('See all'),
                  ),
                ],
              ),
              widget.overview.requestsHistory.isEmpty
                  ? _buildEmptyState('No request history')
                  : AppListView(
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
