import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/network/dio_client.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/features/admin/data/models/admin_overview_model.dart';
import 'package:leoclinic_flutter/features/admin/presentation/widgets/appbar.dart';
import 'package:leoclinic_flutter/features/doctor/data/datasource/doctor_api_services.dart';
import 'package:leoclinic_flutter/features/doctor/data/models/doctor_model.dart';

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
  final DoctorApiServices _doctorApiServices = DoctorApiServices(DioClient());
  List<DoctorModel>? _doctors;

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    try {
      final doctors = await _doctorApiServices.searchDoctors();
      if (mounted) {
        setState(() {
          _doctors = doctors;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _doctors = null;
        });
      }
    }
  }

  List<DoctorPerformanceModel> get _doctorPerformance {
    final doctors = _doctors;
    if (doctors == null) return const [];
    return doctors.map((doctor) {
      return DoctorPerformanceModel(
        doctorName: doctor.name,
        speciality: doctor.speciality,
        totalAppointments: 0,
        appointmentsCompleted: 0,
        rate: 0,
        doctorImage: doctor.image,
      );
    }).toList();
  }

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
              // Statistics
              headline('Statistics'),
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

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Today\'s Appointments'),
                  TextButton(
                    onPressed: _toggleTodayAppointmentView,
                    child: Text('View All Appointments'),
                  ),
                ],
              ),
              widget.overview.todayAppointments.isEmpty
                  ? _buildEmptyState('No appointments today')
                  : AppListView(
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

              // Doctor Performance
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Doctor Performance'),
                  TextButton(
                    onPressed: _toggleDoctorPerformanceView,
                    child: Text('View All'),
                  ),
                ],
              ),
              _doctorPerformance.isEmpty
                  ? _buildEmptyState('No doctor performance data available')
                  : AppListView(
                      itemCount: doctorPerformanceView &&
                              _doctorPerformance.isNotEmpty
                          ? _doctorPerformance.length
                          : 1,
                      itemBuilder: (context, index) {
                        final doctor =
                            _doctorPerformance[index];

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

              // Alerts
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Alerts'),
                  TextButton(
                    onPressed: _toggleAlertView,
                    child: Text('View All'),
                  ),
                ],
              ),
              widget.overview.alerts.isEmpty
                  ? _buildEmptyState('No alerts')
                  : AppListView(
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
