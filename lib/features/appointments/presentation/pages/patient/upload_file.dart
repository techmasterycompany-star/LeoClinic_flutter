import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/widgets/top_headline_of_screens.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/upload_file_screen/upload_file.dart';

class UplaodFile extends StatefulWidget {
  const UplaodFile({super.key});

  @override
  State<UplaodFile> createState() => _UplaodFileState();
}

class _UplaodFileState extends State<UplaodFile> {
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
                    left: 120.w,
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
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.h),
                  topRight: Radius.circular(30.h),
                ),
              ),
              width: double.infinity,
              child: UploadFile(onPressedOfBlueAcion: (){
                GoRouter.of(context).push("/PatientAppointment");
              },onPressedOfLightBlueAcion: (){},)
            ),
          ),
        ],
      ),
    );
  }
}
