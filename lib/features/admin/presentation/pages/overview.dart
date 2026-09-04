import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/network/dio_client.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/core/widgets/overview_shared.dart';
import 'package:leoclinic_flutter/features/admin/data/models/admin_overview_model.dart';
import 'package:leoclinic_flutter/features/admin/presentation/widgets/appbar.dart';
import 'package:leoclinic_flutter/features/doctor/data/datasource/doctor_api_services.dart';

import '../widgets/alert.dart';
import '../widgets/doctorperformance.dart';
import '../widgets/health_overview.dart';
import '../widgets/today_appointments.dart';

class AdminOverview extends StatefulWidget {
  final AdminOverviewModel overview;

  const AdminOverview({super.key, this.overview = adminOverviewMock});

  @override
  State<AdminOverview> createState() => _AdminOverviewState();
}

class _AdminOverviewState extends State<AdminOverview> {
  // DoctorApiServices is kept for future API integration.
  // ignore: unused_field
  final DoctorApiServices _doctorApiServices = DoctorApiServices(DioClient());

  void _toggleTodayAppointmentView() {
    setState(() {
      todayAppointmentView = !todayAppointmentView;
    });
  }

  void _toggleDoctorPerformanceView() {
    setState(() {
      doctorPerformanceView = !doctorPerformanceView;
    });
  }

  void _toggleAlertView() {
    setState(() {
      alertView = !alertView;
    });
  }

  bool todayAppointmentView = false;
  bool doctorPerformanceView = false;
  bool alertView = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AdminAppBar(),

        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SectionHeader(title: 'Statistics'),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: widget.overview.statistics.map((statistic) {
                  return HealthOverviewCard(
                    icon: statistic.icon,
                    headline: statistic.headline,
                    result: statistic.result,
                    percentage: statistic.percentage,
                  );
                }).toList(),
              ),

              SectionHeader(
                title: 'Today\'s Appointments',
                actionText: 'View All Appointments',
                onAction: _toggleTodayAppointmentView,
              ),
              widget.overview.todayAppointments.isEmpty
                  ? const EmptyState(message: 'No appointments today')
                  : AppListView(
                      spacing: 10,
                      itemCount: todayAppointmentView &&
                              widget.overview.todayAppointments.isNotEmpty
                          ? widget.overview.todayAppointments.length
                          : 1,
                      itemBuilder: (context, index) {
                        final appointment =
                            widget.overview.todayAppointments[index];

                        return TodayAppointmentCard(
                          patientName: appointment.patientName,
                          patientNumber: appointment.patientNumber,
                          drName: appointment.doctorName,
                          speciality: appointment.speciality,
                          time: appointment.time,
                          status: appointment.status,
                          patientImage: appointment.patientImage,
                        );
                      },
                    ),

              SectionHeader(
                title: 'Doctor Performance',
                actionText: 'View All',
                onAction: _toggleDoctorPerformanceView,
              ),
              widget.overview.doctorPerformance.isEmpty
                  ? const EmptyState(
                      message: 'No doctor performance data available')
                  : AppListView(
                      spacing: 10,
                      itemCount: doctorPerformanceView &&
                              widget.overview.doctorPerformance.isNotEmpty
                          ? widget.overview.doctorPerformance.length
                          : 1,
                      itemBuilder: (context, index) {
                        final doctor =
                            widget.overview.doctorPerformance[index];

                        return DoctorPerformanceCard(
                          doctorName: doctor.doctorName,
                          speciality: doctor.speciality,
                          totalAppointments: doctor.totalAppointments,
                          appointmentsCompleted:
                              doctor.appointmentsCompleted,
                          rate: doctor.rateText,
                          doctorImage: doctor.doctorImage,
                        );
                      },
                    ),

              SectionHeader(
                title: 'Alerts',
                actionText: 'View All',
                onAction: _toggleAlertView,
              ),
              widget.overview.alerts.isEmpty
                  ? const EmptyState(message: 'No alerts')
                  : AppListView(
                      spacing: 10,
                      itemCount: alertView && widget.overview.alerts.isNotEmpty
                          ? widget.overview.alerts.length
                          : 1,
                      itemBuilder: (context, index) {
                        final alert = widget.overview.alerts[index];

                        return AlertsCard(
                          title: alert.title,
                          subTitle: alert.subTitle,
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
