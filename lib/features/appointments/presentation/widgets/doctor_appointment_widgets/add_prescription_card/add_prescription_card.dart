import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
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
      height: 650.h,
      width: 390.w,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 24.h,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 50.h,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
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
          horizontal: 10.w,
          vertical: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOfPrescriptionCard(),
            SizedBox(height: 20.h),
            Text(
              "Number Prescripation",
              style: AppTextStyle.textstyle14.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.surfaceDark,
              ),
            ),
            SizedBox(height: 10.h),
            NumberOfPrescriptionField(numberController: _numberController),
            SizedBox(height: 20.h),
            Text(
              "Date",
              style: AppTextStyle.textstyle14.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.surfaceDark,
              ),
            ),
            SizedBox(height: 10.h),
            DateOfPrescriptionCard(),
            SizedBox(height: 20.h),
            Text(
              "New Prescripation",
              style: AppTextStyle.textstyle14.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.surfaceDark,
              ),
            ),
            SizedBox(height: 10.h),
            NewPrescriptionText(numberController: _numberController),
            SizedBox(height: 20.h),
            ConfirmedAndCanclledButtons(confirmOnPressed: (){},canclledOnPressed: (){
              GoRouter.of(context).push("/ProfilePatientForDoctor");
            },),
          ],
        ),
      ),
    );
  }
}