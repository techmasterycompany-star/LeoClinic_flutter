
import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/features/appointments/data/models/appointment_model.dart';
import 'package:leoclinic_flutter/core/widgets/status_of_cards.dart';
import 'package:leoclinic_flutter/core/widgets/actions_for_cards.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/stauts_card/deatils_of_card.dart';

class NewVisitAppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
    final bool showdatetime;
      final bool showactions;

      final void Function() onPressedOfBlueAcion;
  final void Function() onPressedOfLightBlueAcion;

  const NewVisitAppointmentCard({
    super.key,
    required this.appointment, 
        required this.showdatetime, required this.onPressedOfBlueAcion, required this.onPressedOfLightBlueAcion, required this.showactions

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
              if(showdatetime)
              DeatilsOfCard.buildInfoItem(Icons.calendar_today_outlined, appointment.date),
              if(showdatetime)
              DeatilsOfCard.buildDivider(),
              DeatilsOfCard.buildInfoItem(Icons.access_time, appointment.time),
              DeatilsOfCard.buildDivider(),
              DeatilsOfCard.buildInfoItem(Icons.videocam_outlined, appointment.location),
            ],
          ),

            const SizedBox(height: 16),
            if(showactions)
            ActionsForCards(showiconLightbutton: true,
            showiconDarkbutton: false,
          labelOfBlueAction: 'Pick A Slot', labelOflightblueAction: 'Decline',
           onPressedOfBlueAcion: onPressedOfBlueAcion, onPressedOfLightBlueAcion: onPressedOfLightBlueAcion,
            blueBackground: AppColors.primaryColor, lightBlueBackground: AppColors.secondaryColor,
             foregroundForblueBackground: AppColors.background, foregroundForLightblueBackground: AppColors.primaryColor,),
        ],
      ),
    );
  }
}