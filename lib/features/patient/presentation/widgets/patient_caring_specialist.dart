import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_pill_button.dart';

class CaringSpecialistCard extends StatelessWidget {
  static const String _placeholderImagePath = 'assets/images/placeholder.png';

  final String doctorName;
  final String? doctorImage;
  final String speciality;
  final double amount;
  final VoidCallback? onViewProfile;
  final VoidCallback? onBookAppointment;

  const CaringSpecialistCard({
    super.key,
    this.doctorName = 'Dr.Mohamed Gamal',
    this.doctorImage,
    this.speciality = 'Dermatologist',
    this.amount = 80,
    this.onViewProfile,
    this.onBookAppointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [AppBoxShadow.boxShadow],
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 20, 4, 0),
                    child: _DoctorInfo(
                      doctorName: doctorName,
                      speciality: speciality,
                      amount: amount,
                    ),
                  ),
                ),
                _CardActions(
                  onViewProfile: onViewProfile ?? () {},
                  onBookAppointment: onBookAppointment ?? () {},
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: Image.asset(
              // TODO: Replace this placeholder with the doctor's real profile photo.
              doctorImage ?? _placeholderImagePath,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}

class _DoctorInfo extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final double amount;

  const _DoctorInfo({
    required this.doctorName,
    required this.speciality,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final visitAmount = amount.truncateToDouble() == amount
        ? amount.toStringAsFixed(0)
        : amount.toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctorName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.textstyle14.copyWith(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(speciality, style: AppTextStyle.secondarytext),
        const SizedBox(height: 24),
        Text(
          '\$$visitAmount / Visit',
          style: AppTextStyle.textstyle14.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _CardActions extends StatelessWidget {
  final VoidCallback onViewProfile;
  final VoidCallback onBookAppointment;

  const _CardActions({
    required this.onViewProfile,
    required this.onBookAppointment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 0, 16),
      child: Row(
        children: [
          Expanded(
            child: AppPillButton(
              text: 'View Profile',
              onPressed: onViewProfile,
              backgroundColor: AppColors.secondaryColor.withValues(alpha: .35),
              textStyle: AppTextStyle.textstyle12.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: AppPillButton(
              text: 'Book Appointment',
              onPressed: onBookAppointment,
            ),
          ),
        ],
      ),
    );
  }
}
