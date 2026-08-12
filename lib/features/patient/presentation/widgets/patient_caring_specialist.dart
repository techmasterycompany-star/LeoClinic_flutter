import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_pill_button.dart';

class CaringSpecialistCard extends StatelessWidget {
  final String doctorName;
  final String? doctorImage;
  final String speciality;
  final double amount;
  final VoidCallback? onViewProfile;
  final VoidCallback? onBookAppointment;

  const CaringSpecialistCard({
    super.key,
    required this.doctorName,
    this.doctorImage,
    required this.speciality,
    required this.amount,
    this.onViewProfile,
    this.onBookAppointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 200,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [AppBoxShadow.boxShadow],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: AlignmentGeometry.centerLeft,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(doctorName, style: AppTextStyle.textstyle14),
              Text(speciality, style: AppTextStyle.secondarytext),
              SizedBox(height: 30),
              Text('\$$amount / Visit'),
            ],
          ),

          Positioned(
            right: 5,
            bottom: 0,
            child: doctorImage != null
                ? Image.network(doctorImage!)
                : Image.asset('assets/images/placeholder.png', width: 180,),
          ),
          // TODO: Implement view profile
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                  child: AppPillButton(
                    text: 'View Profile',
                    onPressed: onViewProfile ?? () {},
                    backgroundColor: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: AppPillButton(
                    text: 'Book Appointment',
                    onPressed: onBookAppointment ?? () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
