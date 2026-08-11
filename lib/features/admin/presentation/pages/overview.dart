import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/features/admin/presentation/widgets/appbar.dart';

import '../widgets/alert.dart';
import '../widgets/doctorperformance.dart';
import '../widgets/listview.dart';
import '../widgets/health_overview.dart';
import '../widgets/today_appointments.dart';

class AdminHomePage extends StatelessWidget {
  Widget headline(String headline) {
    return Text(
      headline,
      style: AppTextStyle.textstyle14.copyWith(fontSize: 16),
    );
  }

  const AdminHomePage({super.key});

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
                children: [
                  HealthOverviewCard(
                    icon: Icons.people,
                    headline: 'Today\'s Patient',
                    result: '32',
                  ),

                  HealthOverviewCard(
                    icon: Icons.medical_services_outlined,
                    headline: 'Active doctors',
                    result: '12',
                  ),
                  HealthOverviewCard(
                    icon: Icons.euro_outlined,
                    headline: 'Clinic Revenue',
                    result: '4,000',
                  ),
                  HealthOverviewCard(
                    icon: Icons.edit_calendar_outlined,
                    headline: 'Pending Appointments',
                    result: '10',
                  ),
                ],
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
              MyListView(
                card: TodayAppointmentCard(
                  patientName: 'Emily Carter',
                  patientNumber: '01234567890',
                  drName: 'Ali',
                  speciality: 'Cardiology',
                  time: '9:00pm',
                  status: 'Completed',
                ),
                itemCount: 4,
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
              MyListView(
                card: DoctorPerformanceCard(
                  doctorName: 'Sara',
                  speciality: 'Cardiologist',
                  totalAppointments: 42,
                  appointmentsCompleted: 39,
                  rate: '4.8',
                ),
                itemCount: 3,
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
              MyListView(
                card: AlertsCard(
                  title: 'Low inventory',
                  subTitle: '3 medicines are below minimum stock.',
                ),
                itemCount: 3,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
