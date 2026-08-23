import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/actions_for_cards.dart';

class UploadFile extends StatefulWidget {
  final void Function() onPressedOfLightBlueAcion;
  final void Function() onPressedOfBlueAcion;

  const UploadFile({
    super.key,
    required this.onPressedOfLightBlueAcion,
    required this.onPressedOfBlueAcion,
  });

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  void chooseFile() async {
    List<PlatformFile> files = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (files.isNotEmpty) {
      PlatformFile file = files.first;
      // كمل هنا لو عايز تعمل حاجة بالملف
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('لم يتم اختيار أي ملف'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/validation-approval-for-prescription.svg",
                    fit: BoxFit.scaleDown,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Files / Documents",
                        style: AppTextStyle.textstyle16.copyWith(
                          color: AppColors.surfaceDark,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Enter prescription details for the Doctor",
                        style: AppTextStyle.textstyle16.copyWith(
                          color: AppColors.surfaceDark,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),
            GestureDetector(
              onTap: chooseFile, // ← ربطتها هنا كمان
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 40.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.grey.shade400, width: 1.5),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.upload_rounded,
                        color: AppColors.primaryColor,
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Darg & drop files here or click to browse",
                      style: AppTextStyle.textstyle16.copyWith(
                        color: AppColors.surfaceDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Supports: PDF, JPG, PNG",
                      style: AppTextStyle.textstyle16.copyWith(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            ActionsForCards(
              showiconLightbutton: false,
              showiconDarkbutton: false,
              labelOfBlueAction: 'Canclled',
              labelOflightblueAction: 'Upload',
              onPressedOfBlueAcion: widget.onPressedOfLightBlueAcion,
              onPressedOfLightBlueAcion: widget.onPressedOfBlueAcion,
              blueBackground: AppColors.secondaryColor,
              lightBlueBackground: AppColors.primaryColor,
              foregroundForblueBackground: AppColors.primaryColor,
              foregroundForLightblueBackground: AppColors.background,
            ),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
