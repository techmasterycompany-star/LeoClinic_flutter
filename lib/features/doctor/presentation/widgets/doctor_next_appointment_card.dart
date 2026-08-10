import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_shadow.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/textButton.dart';

class NextAppointmentCard extends StatelessWidget {
  final String patientName;
  final String patientAge;
  final String patientGender;
  final String appointmentTime;
  final String appointmentDate;
  final String? patientImage;
  const NextAppointmentCard({
    super.key,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.appointmentTime,
    required this.appointmentDate,
    this.patientImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
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
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          patientName,
          style: AppTextStyle.textstyle14.copyWith(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$patientAge Years, $patientGender',
              style: AppTextStyle.textstyle10.copyWith(color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              '$appointmentDate | $appointmentTime',
              style: AppTextStyle.textstyle12.copyWith(color: Colors.white),
            ),
          ],
        ),

        // TODO: Implement the OnPressed
        trailing: MyTextButton(text: 'Join Now', onPressed: () {
          
        },),
      ),
    );
  }
}
