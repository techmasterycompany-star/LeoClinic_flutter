import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

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
      print(file.name);
      print(file.path);
    } else {
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
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
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1.5,
                ),
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
        ],
      ),
    );
  }
}