import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class DateOfPrescriptionCard extends StatefulWidget {
  
  const DateOfPrescriptionCard({super.key});

  @override
  State<DateOfPrescriptionCard> createState() => _DateOfPrescriptionCardState();
}

class _DateOfPrescriptionCardState extends State<DateOfPrescriptionCard> {
  DateTime _selectedDate = DateTime(2026, 5, 28);

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
              onTap: _pickDate,
              borderRadius: BorderRadius.circular(12.r),
              child: InputDecorator(
                decoration: InputDecoration(
                  hintText: "May 28, 2026",
                  hintStyle: TextStyle(color: AppColors.secondaryColor, fontSize: 15.sp),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 18.sp,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        _formatDate(_selectedDate),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 24.sp,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
            );
  }
}