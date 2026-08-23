import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/patient_card_details/widgets/detalis_of_patient_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/patient_card_details/widgets/status_of_patient_card.dart';

class PatientDetailsCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int age;
  final String phone;
  final String city;
  final int appointmentsCount;
  final int upcomingCount;

  const PatientDetailsCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.age,
    required this.phone,
    required this.city,
    required this.appointmentsCount,
    required this.upcomingCount,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ScreenUtil().screenWidth < 600;
    return Container(
      width: isMobile ? 370.w : 420.w,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentGeometry.bottomRight,
          colors: [
            AppColors.primaryColor,
            const Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 90.w,
            height: 90.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3.w),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 18.sp,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          DetailsOfPatientCard(age: age, phone: phone, city: city),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatusOfPatientCard(label: "4 Appointment"),
              SizedBox(width: 8.w),
              StatusOfPatientCard(
                label: "1 Upcoming",
                showDot: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
