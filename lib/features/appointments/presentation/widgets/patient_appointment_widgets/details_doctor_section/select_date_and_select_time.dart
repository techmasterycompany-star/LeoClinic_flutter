import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/pick_a_slot_widgets/book_a_slot_items/time_a_slot.dart';

class SelectDateAndSelectTime extends StatefulWidget {
  final  void Function() onPressed;
  const SelectDateAndSelectTime({super.key, required this.onPressed});

  @override
  State<SelectDateAndSelectTime> createState() =>
      _SelectDateAndSelectTimeState();
}

class _SelectDateAndSelectTimeState extends State<SelectDateAndSelectTime> {
  DateTime dateTime = DateTime.now();
  bool isSelected = false;
  int? selectedTimeIndex;
  List<String> timeslot = ['09:00 AM', '09:00 AM', '09:00 AM', '09:00 AM'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Date",
            style: AppTextStyle.textstyle18.copyWith(
              fontSize: 20.sp,
              color: AppColors.surfaceDark,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: EasyTheme(
              data: EasyTheme.of(context)
                  .copyWith(
                    dayShape: const WidgetStatePropertyAll(StadiumBorder()),

                    currentDayShape: const WidgetStatePropertyAll(
                      StadiumBorder(),
                    ),
                  )
                  .copyWithState(
                    selectedDayTheme: const DayThemeData(
                      backgroundColor: Color(0xFF1A237E),
                    ),
                    unselectedDayTheme: const DayThemeData(
                      backgroundColor: Colors.white,
                    ),
                    selectedCurrentDayTheme: const DayThemeData(
                      backgroundColor: Color(0xFF1A237E),
                    ),
                    unselectedCurrentDayTheme: const DayThemeData(
                      backgroundColor: Colors.white,
                    ),
                  ),
              child: EasyDateTimeLinePicker(
                focusedDate: dateTime,
                firstDate: DateTime(2024, 3, 18),
                lastDate: DateTime(2030, 3, 18),
                headerOptions: const HeaderOptions(headerType: HeaderType.none),
                onDateChange: (date) {
                  setState(() {
                    dateTime = date;
                    selectedTimeIndex = null;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
            child: Text(
              "Select Time",
              style: AppTextStyle.textstyle18.copyWith(
                fontSize: 20.sp,
                color: AppColors.surfaceDark,
              ),
            ),
          ),
          SizedBox(
            height: 48.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timeslot.length,
              itemBuilder: (context, index) {
                final slot = timeslot[index];
                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: TimeSlot(
                    time: slot,
                    isSelected: isSelected = selectedTimeIndex == index,
                    onTap: () {
                      setState(() {
                        selectedTimeIndex = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              width: 300.w,
              child: Button(
                label: "Continue",
                onPressed: widget.onPressed,
                backgroundcolor: AppColors.primaryColor,
                foregroundcolor: AppColors.background,
                showicon: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
