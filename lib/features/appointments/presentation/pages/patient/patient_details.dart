import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/widgets/top_headline_of_screens.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/form_for_patient/form_for_patient.dart';

class PatientDeatilsScreen extends StatefulWidget {
  const PatientDeatilsScreen({super.key});

  @override
  State<PatientDeatilsScreen> createState() => _PatientDeatilsScreenState();
}

class _PatientDeatilsScreenState extends State<PatientDeatilsScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: AppColors.secondaryColor,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: TopHeadline(title: 'Personal Details', numofPad: 40),
                  ),

                  Positioned(
                    top: 80.h,
                    right: 0,
                    left: 220.w,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/doctor_preview_image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.h),
                  topRight: Radius.circular(30.h),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SingleChildScrollView(
                  child: PatientDetailsForm(
                    formkey: formKey,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                       GoRouter.of(context).push("/UplaodFile");
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
