import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/widgets/top_headline_of_screens.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/appointment_booking_card/appointment_card.dart';
import 'package:leoclinic_flutter/core/widgets/appointment_filter.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/details_dashboard/deatils_dashboard.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/search_and_filtering.dart';

class AdminAppointment extends StatelessWidget {
  const AdminAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopHeadline(title: 'Appointments'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: SearchAndFiltering(hinttext: "Search..",),
                ),
                DetilasDashboard(),
                AppointmentFilterSection(section1: "Today",section2: "NewVisit",section3: "Follow-Up",),
                AppointmentCard()
                  ]),
          ))));
  }
}
