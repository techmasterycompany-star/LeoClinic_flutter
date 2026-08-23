import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/selection_card.dart';

class SelectTypeOfVisit extends StatefulWidget {
  final  void Function() onPressed;
  const SelectTypeOfVisit({super.key, required this.onPressed});

  @override
  State<SelectTypeOfVisit> createState() =>
      _SelectTypeOfVisitState();
}

class _SelectTypeOfVisitState extends State<SelectTypeOfVisit> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.only(top: 20.h, left: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Type of Visit",
                      style: AppTextStyle.textstyle18.copyWith(
                        fontSize: 20.sp,
                        color: AppColors.surfaceDark,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, right: 30),
                      child: SelectionCard(
                        title: 'Online',
                        icon: Icons.videocam_outlined,
                        isSelected: selectedIndex == 0,
                        onTap: () => setState(() => selectedIndex = 0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        right: 30,
                        bottom: 30.h,
                      ),
                      child: SelectionCard(
                        title: 'In-Clinic',
                        icon: Icons.meeting_room_outlined,
                        isSelected: selectedIndex == 1,
                        onTap: () => setState(() => selectedIndex = 1),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 24.h),
                      child: Button(
                        label: "Continue",
                        onPressed: widget.onPressed,
                        backgroundcolor: AppColors.primaryColor,
                        foregroundcolor: AppColors.background,
                        showicon: false,
                      ),
                    ),
                  ],
                ),
              );
  }
}
