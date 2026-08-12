import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/features/admin/data/models/admin_overview_model.dart';
import 'package:leoclinic_flutter/features/admin/presentation/widgets/appbar.dart';

import '../widgets/alert.dart';
import '../widgets/doctorperformance.dart';
import '../widgets/health_overview.dart';
import '../widgets/today_appointments.dart';

class AdminOverview extends StatelessWidget {
  final AdminOverviewModel overview;

  Widget headline(String headline) {
    return Text(
      headline,
      style: AppTextStyle.textstyle14.copyWith(fontSize: 16),
    );
  }

  const AdminOverview({super.key, this.overview = adminOverviewMock});

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
                children: overview.statistics.map((statistic) {
                  return HealthOverviewCard(
                    icon: statistic.icon,
                    headline: statistic.headline,
                    result: statistic.result,
                    percentage: statistic.percentage,
                  );
                }).toList(),
              ),

              // Today's Appointments
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Today\'s Appointments'),
                  // TODO: Impelement Today's Appointment button
                  TextButton(
                    onPressed: () {},
                    child: Text('View All Appointments'),
                  ),
                ],
              ),
              AppListView(
                itemCount: overview.todayAppointments.length,
                itemBuilder: (context, index) {
                  final appointment = overview.todayAppointments[index];

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
                  // TODO: Implement doctor performance onPress
                  TextButton(onPressed: () {}, child: Text('View All')),
                ],
              ),
              AppListView(
                itemCount: overview.doctorPerformance.length,
                itemBuilder: (context, index) {
                  final doctor = overview.doctorPerformance[index];

                  return DoctorPerformanceCard(
                    doctorName: doctor.doctorName,
                    speciality: doctor.speciality,
                    totalAppointments: doctor.totalAppointments,
                    appointmentsCompleted: doctor.appointmentsCompleted,
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
                  // TODO: Implement alerts onPressed
                  TextButton(onPressed: () {}, child: Text('View All')),
                ],
              ),
              AppListView(
                itemCount: overview.alerts.length,
                itemBuilder: (context, index) {
                  final alert = overview.alerts[index];

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
