import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/payment_widgets/payment_card_wrapper.dart';

class ServicesTreatmentsCard extends StatelessWidget {
  const ServicesTreatmentsCard({super.key});

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
                Icons.medical_services_outlined,
                size: 16.sp,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "Services & Treatments",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "DESCRIPTION",
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            SizedBox(
              width: 40.w,
              child: Text(
                "QTY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            SizedBox(
              width: 80.w,
              child: Text(
                "AMOUNT",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _buildServiceRow(
          name: "Specialist Consultation",
          rate: "\$150.00",
          qty: "1",
          amount: "\$150.00",
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Divider(color: Colors.grey.shade200, height: 1),
        ),
        _buildServiceRow(
          name: "ECG Test",
          rate: "\$85.00",
          qty: "1",
          amount: "\$85.00",
        ),
      ],
    );
  }

  Widget _buildServiceRow({
    required String name,
    required String rate,
    required String qty,
    required String amount,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Rate: $rate",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 40.w,
          child: Text(
            qty,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
          width: 80.w,
          child: Text(
            amount,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
