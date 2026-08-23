import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class AnalysisAppointmentCard extends StatelessWidget {
  final int index;
  const AnalysisAppointmentCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ScreenUtil().screenWidth < 600;
    return Container(
      margin: index == 0 || index == 2
          ? EdgeInsets.only(left: 20.w)
          : EdgeInsets.only(right: 20.w),
      height: isMobile ? 130.h : 150.h,
      width: isMobile ? 200.w : 200.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: isMobile ? 40.h : 45.h,
                  width: isMobile ? 40.w : 45.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffE5F1FF),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/notification-02.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/arrow-up-right-01.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '+12.5%',
                      style: AppTextStyle.textstyle10
                          .copyWith(color: const Color(0xff00B517)),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              'Appointments',
              style: AppTextStyle.textstyle12
                  .copyWith(color: const Color(0xff1A1A1A)),
            ),
            SizedBox(height: 2.h),
            Text(
              '1,500',
              style: AppTextStyle.textstyle14
                  .copyWith(color: AppColors.surfaceDark),
            )
          ],
        ),
      ),
    );
  }
}
