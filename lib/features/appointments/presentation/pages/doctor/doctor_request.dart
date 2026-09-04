import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/widgets/Top_headline_of_screens.dart';
import 'package:leoclinic_flutter/core/widgets/appointment_filter.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/search_and_filtering.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/patient_appointment_card.dart';

class DoctorRequestAppointment extends StatelessWidget {
  const DoctorRequestAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopHeadline(title: 'Appointments',numofPad: 73),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: SearchAndFiltering(hinttext: "Search..",),
                ),
                AppointmentFilterSection(section1: "Request",section2: "Confirmd",section3: "Cancelled",),
                PatientAppointmentCard(showdatetime: false,showactions: true,)
                  ]),
          ))));
  }
}