import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/features/appointments/data/models/appointment_model.dart';
import 'package:leoclinic_flutter/core/widgets/status_of_cards.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widget/actions_for_cards.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widget/stauts_card/deatils_of_card.dart';

class FollowUpAppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  final bool showActions;
  const FollowUpAppointmentCard({
    super.key,
    required this.appointment, 
    required this.showActions,
  });

  @override
  Widget build(BuildContext context) {
    final statusStyle = StatusOfCards(appointment.status);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.patientName ?? "",
                      style: AppTextStyle.textstyle14
                          .copyWith(color: AppColors.surfaceDark),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      appointment.age ?? "",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: statusStyle.statuscoloroflabel,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  statusStyle.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: statusStyle.textColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
            DeatilsOfCard.buildInfoItem(Icons.calendar_today_outlined, appointment.date),
             DeatilsOfCard.buildDivider(),
              DeatilsOfCard.buildInfoItem(Icons.access_time, appointment.time),
              DeatilsOfCard.buildDivider(),
              DeatilsOfCard.buildInfoItem(Icons.videocam_outlined, appointment.location),
            ],
          ),

          if (showActions) ...[
            const SizedBox(height: 16),
           ActionsForCards(),
          ],
        ],
      ),
    );
  }
}