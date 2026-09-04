import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/features/admin/presentation/widgets/health_overview.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/care_milestone_tile.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/clinical_alert_tile.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/clinical_note_card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam-appbar-allpage.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor_next_appointment_card.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class PatientInfoDetail extends StatelessWidget {
  final String patientName;
  final String patientImage;
  final String patientInfo;
  final String patientStatus;

  const PatientInfoDetail({
    super.key,
    required this.patientName,
    required this.patientImage,
    required this.patientInfo,
    required this.patientStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Custamappbarallpage(maintext: 'Patient Info'),

              NextAppointmentCard(
                patientName: patientName,
                patientAge: 34,
                patientGender: 'Female',
                appointmentTime: '10:00 AM',
                appointmentDate: '2026-08-27',
                patientImage: patientImage,
              ),

              Text('Health Overview', style: AppTextStyle.heading),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  HealthOverviewCard(
                    icon: Icons.favorite_border_rounded,
                    headline: 'Heart Rate',
                    result: '72 bpm',
                    percentage: '98%',
                  ),
                  HealthOverviewCard(
                    icon: Icons.bloodtype_outlined,
                    headline: 'Blood Pressure',
                    result: '120/80',
                    percentage: '100%',
                  ),
                  HealthOverviewCard(
                    icon: Icons.thermostat_outlined,
                    headline: 'Temperature',
                    result: '36.6\u00b0C',
                    percentage: '99%',
                  ),
                  HealthOverviewCard(
                    icon: Icons.monitor_weight_outlined,
                    headline: 'Weight',
                    result: '68 kg',
                    percentage: '95%',
                  ),
                ],
              ),

              Text('Clinical Alerts', style: AppTextStyle.heading),
              ClinicalAlertTile(
                icon: Icons.warning_amber_rounded,
                title: 'Allergy: Penicillin',
                time: '2 days ago',
                color: AppColors.warning,
                bgColor: AppColors.warningBg,
              ),
              ClinicalAlertTile(
                icon: Icons.error_outline_rounded,
                title: 'Chronic: Hypertension',
                time: '1 week ago',
                color: AppColors.failed,
                bgColor: AppColors.fieldBg,
              ),
              ClinicalAlertTile(
                icon: Icons.info_outline_rounded,
                title: 'Post-op follow up required',
                time: '3 days ago',
                color: AppColors.primaryColor,
                bgColor: AppColors.secondaryColor,
              ),

              Text('Clinical Notes', style: AppTextStyle.heading),
              ClinicalNoteCard(
                speciality: 'Cardiology',
                date: 'Aug 20, 2026',
                description:
                    'Patient presented with mild chest discomfort. ECG normal. Recommended stress test and follow-up in 2 weeks.',
                doctorName: 'Dr. Mohamed Gamal',
              ),
              ClinicalNoteCard(
                speciality: 'General Practice',
                date: 'Aug 15, 2026',
                description:
                    'Annual checkup completed. Blood work ordered. All vitals within normal range. Patient advised on diet and exercise.',
                doctorName: 'Dr. Sara Ali',
              ),

              Text('Care Milestones', style: AppTextStyle.heading),
              CareMilestoneTile(
                icon: Icons.check_circle_outline,
                title: 'Initial Consultation',
                subtitle: 'Diagnosis confirmed',
                date: 'Jul 10, 2026',
              ),
              CareMilestoneTile(
                icon: Icons.medical_services_outlined,
                title: 'Treatment Started',
                subtitle: 'Medication prescribed',
                date: 'Jul 15, 2026',
              ),
              CareMilestoneTile(
                icon: Icons.follow_the_signs_outlined,
                title: 'First Follow-up',
                subtitle: 'Progress positive',
                date: 'Aug 01, 2026',
              ),
              CareMilestoneTile(
                icon: Icons.task_alt_rounded,
                title: 'Lab Results Received',
                subtitle: 'All markers normal',
                date: 'Aug 15, 2026',
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
