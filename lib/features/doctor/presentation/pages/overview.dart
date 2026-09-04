import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
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
  void _toggleNiewRequestView() {
    setState(() {
      newRequestView = !newRequestView;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget headline(String headline) {
      return Text(headline, style: AppTextStyle.heading);
    }

    return CustomScrollView(
      slivers: [
        DoctorAppBar(),

        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headline('Next Appointments'),
                  TextButton(
                    onPressed: _toggleNextAppointmentView,
                    child: Text(
                      'See all',
                      style: AppTextStyle.textstyle12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              widget.overview.nextAppointments.isEmpty
                  ? _buildEmptyState('No upcoming appointments')
                  : AppListView(
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

              Row(
                mainAxisAlignment: .spaceBetween,

                children: [
                  headline('Today\'s Appointments'),
                  TextButton(
                    onPressed: _toggleTodayAppointmentView,
                    child: Text(
                      'See all',
                      style: AppTextStyle.textstyle12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              widget.overview.todayAppointments.isEmpty
                  ? _buildEmptyState('No appointments today')
                  : AppListView(
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headline('New Requests'),
                  TextButton(
                    onPressed: _toggleNiewRequestView,
                    child: Text(
                      'See all',
                      style: AppTextStyle.textstyle12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              widget.overview.newRequests.isEmpty
                  ? _buildEmptyState('No new requests')
                  : AppListView(
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
