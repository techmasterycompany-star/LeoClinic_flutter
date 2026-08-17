import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/utils/responsive.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/add_prescription_card/widgets/confirmed_and_canclled_buttons.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/add_prescription_card/widgets/date_of_prescription_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/add_prescription_card/widgets/header_of_prescription_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/add_prescription_card/widgets/new_prescription_text.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/add_prescription_card/widgets/number_of_prescription_field.dart';

class AddPrescriptionCard extends StatefulWidget {
  const AddPrescriptionCard({super.key});

  @override
  State<AddPrescriptionCard> createState() => _AddPrescriptionCardState();
}

class _AddPrescriptionCardState extends State<AddPrescriptionCard> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();
  @override
  void dispose() {
    _numberController.dispose();
    _diagnosisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: 390,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.value(context, mobile: 16, tablet: 24),
        vertical: Responsive.value(context, mobile: 24, tablet: 40),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Responsive.value(context, mobile: 20, tablet: 30),
        vertical: Responsive.value(context, mobile: 50, tablet: 70),
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x2B7070F3),
            blurRadius: 20.60,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.value(context, mobile: 10, tablet: 20),
          vertical: Responsive.value(context, mobile: 30, tablet: 30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOfPrescriptionCard(),
            const SizedBox(height: 20),
            Text(
              "Number Prescripation",
              style: AppTextStyle.textstyle14.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.surfaceDark,
              ),
            ),
            const SizedBox(height: 10),
            NumberOfPrescriptionField(numberController: _numberController),
            const SizedBox(height: 20),
            Text(
              "Date",
              style: AppTextStyle.textstyle14.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.surfaceDark,
              ),
            ),
            const SizedBox(height: 10),
            DateOfPrescriptionCard(),
            const SizedBox(height: 20),
            Text(
              "New Prescripation",
              style: AppTextStyle.textstyle14.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.surfaceDark,
              ),
            ),
            const SizedBox(height: 10),
            NewPrescriptionText(numberController: _numberController),
            const SizedBox(height: 20),
            ConfirmedAndCanclledButtons(confirmOnPressed: (){},canclledOnPressed: (){},),
          ],
        ),
      ),
    );
  }
}