import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/widgets/custom_text_form_field.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/payment_widgets/payment_card_wrapper.dart';

class InvoiceDetailsCard extends StatelessWidget {
  final TextEditingController patientNameController;
  final TextEditingController doctorController;
  final TextEditingController deptController;
  final TextEditingController issueDateController;
  final TextEditingController dueDateController;

  const InvoiceDetailsCard({
    super.key,
    required this.patientNameController,
    required this.doctorController,
    required this.deptController,
    required this.issueDateController,
    required this.dueDateController,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentCardWrapper(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.r),
              decoration: const BoxDecoration(
                color: Color(0xFFE8F1FF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_rounded,
                size: 16.sp,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "Invoice Details",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CustomTextFormField(
          label: 'Patient Name',
          hintText: patientNameController.text,
          controller: patientNameController,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                label: 'Doctor',
                hintText: doctorController.text,
                controller: doctorController,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomTextFormField(
                label: 'Dept',
                hintText: deptController.text,
                controller: deptController,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                label: 'Issue Date',
                hintText: issueDateController.text,
                controller: issueDateController,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomTextFormField(
                label: 'Due Date',
                hintText: dueDateController.text,
                controller: dueDateController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
