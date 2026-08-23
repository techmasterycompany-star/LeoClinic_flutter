import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/features/appointments/domain/entities/appointment_model.dart';
import 'package:leoclinic_flutter/core/widgets/status_of_cards.dart';
import 'package:leoclinic_flutter/core/widgets/actions_for_cards.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/stauts_card/deatils_of_card.dart';

class FollowUpAppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  final bool showdatetime;
  final void Function() onPressedOfBlueAcion;
  final void Function() onPressedOfLightBlueAcion;
    final bool showactions;

  const FollowUpAppointmentCard({
    super.key,
    required this.appointment,
    required this.showdatetime, required this.onPressedOfBlueAcion, required this.onPressedOfLightBlueAcion, required this.showactions,
  });

  @override
  Widget build(BuildContext context) {
    final statusStyle = StatusOfCards(appointment.status);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
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
              CircleAvatar(radius: 24.r),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.patientName ?? "",
                      style: AppTextStyle.textstyle14.copyWith(
                        color: AppColors.surfaceDark,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      appointment.age ?? "",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: statusStyle.statuscoloroflabel,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  statusStyle.label,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: statusStyle.textColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              if (showdatetime)
                DeatilsOfCard.buildInfoItem(
                  Icons.calendar_today_outlined,
                  appointment.date,
                ),
              if (showdatetime) DeatilsOfCard.buildDivider(),
              DeatilsOfCard.buildInfoItem(Icons.access_time, appointment.time),
              DeatilsOfCard.buildDivider(),
              DeatilsOfCard.buildInfoItem(
                Icons.videocam_outlined,
                appointment.location,
              ),
            ],
          ),

          SizedBox(height: 16.h),
          if(showactions)
          ActionsForCards(showiconLightbutton: true,
          showiconDarkbutton: false,
          labelOfBlueAction: 'Pick A Slot', labelOflightblueAction: 'Decline',
           onPressedOfBlueAcion: onPressedOfBlueAcion, onPressedOfLightBlueAcion: onPressedOfLightBlueAcion,
            blueBackground: AppColors.primaryColor, lightBlueBackground: AppColors.secondaryColor,
             foregroundForblueBackground: AppColors.background, foregroundForLightblueBackground: AppColors.primaryColor,)],

      ),
    );
  }
}
