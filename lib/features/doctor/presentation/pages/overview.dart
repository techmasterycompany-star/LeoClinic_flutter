import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_app_bar.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_new_request.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_next_appointment_card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/today_appointment.dart';

class DoctorOverview extends StatelessWidget {
  const DoctorOverview({super.key});

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
              // Next Appointment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headline('Next Appointments'),
                  TextButton(
                    // Implement onPressed
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: AppTextStyle.textstyle12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              AppListView(
                card: NextAppointmentCard(
                  patientName: 'Sarah',
                  patientAge: 25,
                  patientGender: 'Female',
                  appointmentTime: '10:00 AM',
                  appointmentDate: '2023-10-15',
                ),
                itemCount: 3,
              ),

              // Today's Appointment
              Row(
                mainAxisAlignment: .spaceBetween,

                children: [
                  headline('Today\'s Appointments'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: AppTextStyle.textstyle12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              AppListView(
                card: TodayAppointmentCard(
                  patientName: 'Sarah',
                  patientAge: '25',
                  patientGender: 'Female',
                  appointmentTime: '10:00 AM',
                  appointmentDate: '2023-10-15',
                  location: 'online',
                ),
                itemCount: 2,
              ),

              // New Requests
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headline('New Requests'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: AppTextStyle.textstyle12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              AppListView(
                card: NewRequestCard(
                  patientName: 'Sarah',
                  patientAge: '25',
                  patientGender: 'Female',
                  appointmentDate: '2023-10-15',
                  location: 'online',
                ),
                itemCount: 2,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
