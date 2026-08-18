import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class PatientIntakeBriefCard extends StatelessWidget {
  final String reasonForVisit;
  final String symptomsReported;
  final String durationOfSymptoms;
  final String clinicalNotes;
 
  const PatientIntakeBriefCard({
    super.key,
    required this.reasonForVisit,
    required this.symptomsReported,
    required this.durationOfSymptoms,
    required this.clinicalNotes,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(22),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border,width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Patient Intake Brief',
            style: AppTextStyle.textstyle18.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          _InfoSection(
            label: 'REASON FOR VISIT',
            value: reasonForVisit,
          ),
          const Divider(height: 28),
          _InfoSection(
            label: 'SYMPTOMS REPORTED',
            value: symptomsReported,
          ),
          const Divider(height: 28,),
          _InfoSection(
            label: 'DURATION OF SYMPTOMS',
            value: durationOfSymptoms,
          ),
          const Divider(height: 28),
          _InfoSection(
            label: 'CLINICAL & ANESTHETIC NOTES',
            value: clinicalNotes,
          ),
        ],
      ),
    );
  }
}
 
class _InfoSection extends StatelessWidget {
  final String label;
  final String value;
  const _InfoSection({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.textstyle10.copyWith(color: AppColors.surfaceDark,fontWeight: FontWeight.w400)
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style:AppTextStyle.textstyle16.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w500)
        ),
      ],
    );
  }
}