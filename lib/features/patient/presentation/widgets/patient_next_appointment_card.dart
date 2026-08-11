import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/app_pill_button.dart';

class NextAppointmentCard extends StatelessWidget {
  final String doctorName;
  final int doctorAge;
  final String doctorGender;
  final String appointmentTime;
  final String appointmentDate;
  final String? doctorImage;
  final String location;
  const NextAppointmentCard({
    super.key,
    required this.doctorName,
    required this.doctorAge,
    required this.doctorGender,
    required this.appointmentTime,
    required this.appointmentDate,
    this.doctorImage,
    required this.location,
  });

  bool isOnline() {
    return location.toLowerCase() == 'online';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: const [AppBoxShadow.boxShadow],
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.secondaryColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          radius: 30,
          // TODO: replace with patient image
          child: Icon(Icons.person, color: AppColors.background),
        ),
        title: Text(
          'Dr. $doctorName',
          style: AppTextStyle.textstyle14.copyWith(color: AppColors.background),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$doctorAge Years, $doctorGender',
              style: AppTextStyle.textstyle10.copyWith(
                color: AppColors.background,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '$appointmentDate | $appointmentTime',
              style: AppTextStyle.textstyle12.copyWith(
                color: AppColors.background,
              ),
            ),
          ],
        ),

        // TODO: Implement the OnPressed
        trailing: isOnline()
            ? AppPillButton(text: 'Join Now', onPressed: () {})
            : Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(900)
                ),
                child: Text('In the clinic', style: AppTextStyle.textstyle12),
              ),
      ),
    );
  }
}
