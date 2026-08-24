import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/payment_widgets/payment_card_wrapper.dart';

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({super.key});

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  String selectedPaymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return PaymentCardWrapper(
      children: [
        Text(
          "Payment Method",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 14.h),
        _buildPaymentMethodOption(
          title: "Credit Card",
          icon: Icons.credit_card_rounded,
        ),
        SizedBox(height: 10.h),
        _buildPaymentMethodOption(
          title: "Insurance",
          icon: Icons.shield_outlined,
        ),
        SizedBox(height: 10.h),
        _buildPaymentMethodOption(
          title: "Cash",
          icon: Icons.payments_outlined,
        ),
      ],
    );
  }

  Widget _buildPaymentMethodOption({
    required String title,
    required IconData icon,
  }) {
    final bool isSelected = selectedPaymentMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF2FBF7) : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF00A86B) : Colors.grey.shade300,
            width: isSelected ? 1.5.w : 1.w,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF00A86B)
                      : Colors.grey.shade400,
                  width: 2.w,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF00A86B),
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? const Color(0xFF00A86B) : Colors.black87,
              ),
            ),
            const Spacer(),
            Icon(
              icon,
              size: 22.sp,
              color: isSelected ? const Color(0xFF00A86B) : Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
