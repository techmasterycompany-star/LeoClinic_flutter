import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/widgets/Top_headline_of_screens.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/add_prescription_card/add_prescription_card.dart';

class DoctorAddPrescription extends StatelessWidget {
  const DoctorAddPrescription({super.key});

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
                AddPrescriptionCard(),
                  ]),
          ))));
  }
}