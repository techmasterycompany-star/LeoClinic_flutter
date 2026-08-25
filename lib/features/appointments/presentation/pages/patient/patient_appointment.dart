import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/widgets/Top_headline_of_screens.dart';
import 'package:leoclinic_flutter/core/widgets/appointment_filter.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/search_and_filtering.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/patient_appointment_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/flaoting_action.dart';

class PatientAppointment extends StatelessWidget {
  const PatientAppointment({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  TopHeadline(title: 'Appointments'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: SearchAndFiltering(),
                  ),
                  AppointmentFilterSection(
                    section1: "All",
                    section2: "Confirmd",
                    section3: "Pending",
                  ),
                  PatientAppointmentCard(showdatetime: true),
                  SizedBox(height: 80.h),
                ],
              ),
            ),
            Positioned(
              bottom:80,
              right: 25,
              child: FlaotingAction(onPressed: () {
                GoRouter.of(context).push("/BookAppointment");
              }),
            ),
          ],
        ),
      ),
    ),
  );
}
}
