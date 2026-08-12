import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/features/doctor/data/models/doctor_overview_model.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_app_bar.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_new_request.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_next_appointment_card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/today_appointment.dart';

class DoctorOverview extends StatelessWidget {
  final DoctorOverviewModel overview;

  const DoctorOverview({super.key, this.overview = doctorOverviewMock});

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
                itemCount: overview.nextAppointments.length,
                itemBuilder: (context, index) {
                  final appointment = overview.nextAppointments[index];

                  return NextAppointmentCard(
                    patientName: appointment.patientName,
                    patientAge: appointment.patientAge,
                    patientGender: appointment.patientGender,
                    appointmentTime: appointment.appointmentTime,
                    appointmentDate: appointment.appointmentDate,
                    patientImage: appointment.patientImage,
                  );
                },
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
                itemCount: overview.todayAppointments.length,
                itemBuilder: (context, index) {
                  final appointment = overview.todayAppointments[index];

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
                itemCount: overview.newRequests.length,
                itemBuilder: (context, index) {
                  final request = overview.newRequests[index];

                  return NewRequestCard(
                    patientName: request.patientName,
                    patientAge: request.patientAge,
                    patientGender: request.patientGender,
                    appointmentDate: request.appointmentDate,
                    location: request.location,
                    patientImage: request.patientImage,
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
