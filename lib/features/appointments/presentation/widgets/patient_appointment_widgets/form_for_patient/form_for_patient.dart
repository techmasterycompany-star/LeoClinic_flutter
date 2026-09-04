import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';
import 'package:leoclinic_flutter/core/widgets/custom_text_form_field.dart';

class PatientDetailsForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final void Function()? onPressed;
  const PatientDetailsForm({super.key, required this.formkey, this.onPressed});

  @override
  State<PatientDetailsForm> createState() => _PatientDetailsFormState();
}

class _PatientDetailsFormState extends State<PatientDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFormField(
              label: 'Doctor  name',
              hintText: 'Mariam',
            ),
            SizedBox(height: 20.h),

            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    label: 'Department',
                    hintText: 'dintisry',
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomTextFormField(
                    label: 'Phone number',
                    hintText: '+20 XXX XXX XXX',
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    label: 'Visit type',
                    hintText: 'new visit / follow-up',
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomTextFormField(
                    label: 'Payment method',
                    hintText: 'online/in clinic',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            const CustomTextFormField(
              label: 'Reason For visit/Note',
              hintText:
                  'Patient is reporting mild pain in the left knee during regular walks.',
              maxLines: 4,
            ),
            SizedBox(height: 24.h),

            Button(
              label: "Continue",
              onPressed: widget.onPressed!,
              backgroundcolor: AppColors.primaryColor,
              foregroundcolor: AppColors.background,
              showicon: false,
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
