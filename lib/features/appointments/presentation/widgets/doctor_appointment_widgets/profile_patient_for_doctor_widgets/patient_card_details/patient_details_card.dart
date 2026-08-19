import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/utils/responsive.dart';
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
    return Container(
      width: Responsive.value(context, mobile: 370, tablet: 420),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
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
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 10),
          DetailsOfPatientCard(age: age, phone: phone, city: city),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatusOfPatientCard(label: "4 Appointment"),
              const SizedBox(width: 8),
              StatusOfPatientCard(label: "1 Upcoming",showDot: true,),
            ],
          ),
        ],
      ),
    );
  }
}
