import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/appbar.dart';

import '../widgets/patient_caring_specialist.dart';
import '../widgets/patient_next_appointment_card.dart';

class PatientOverview extends StatelessWidget {
  const PatientOverview({super.key});
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
              // Next Appointment
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Next Appointment'),
                  TextButton(onPressed: () {}, child: Text('View all')),
                ],
              ),
              AppListView(
                card: NextAppointmentCard(
                  doctorName: 'Sarah legend',
                  doctorAge: 24,
                  doctorGender: 'female',
                  appointmentTime: '8:00 PM',
                  appointmentDate: '27/8/2026',
                  location: 'visit',
                ),
                itemCount: 1,
              ),

              // Caring Specialists
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Caring specialist'),
                  Text(
                    // TODO: Implement available doctors length
                    '4 doctors available this week',
                    style: AppTextStyle.secondarytext,
                  ),
                ],
              ),
              // TODO: Put caring specialist length
              AppListView(card: CaringSpecialistCard(), itemCount: 4),

              // Next Appointment (not now until determined)
            ]),
          ),
        ),
      ],
    );
  }
}
