import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Filter-bottom-reuse.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/New%20Requests-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Next%20Appointment-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Today%20Appointments-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam-appbar-allpage.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam-searche.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(14.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Custamappbarallpage(maintext: "Notifications", showBackButton: false,),
              const Custamsearche(),
              SizedBox(height: 16.h),
              const Filterbottomreuse(),
              SizedBox(height: 16.h),
              const Nextappointmentcard(maintext: "Next Appointment"),
              SizedBox(height: 16.h),
              Todaysappointmentscard(
                maincolor: const Color(0xffFFEAEA),
                maintext: "Canceled Appointment ",
              ),
              SizedBox(height: 16.h),
              const Newrequestscard(
                maintext: "New Request",
                delete: Icons.delete_forever_outlined,
              ),
              SizedBox(height: 16.h),
              const Newrequestscard(
                maintext: "New Request",
                delete: Icons.delete_forever_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
