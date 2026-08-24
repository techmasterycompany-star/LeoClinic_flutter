import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/widgets/Top_headline_of_screens.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/payment_widgets/invoice_details_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/payment_widgets/payment_method_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/payment_widgets/payment_summary_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/payment_widgets/services_treatments_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _patientNameController =
      TextEditingController(text: 'Eleanor Pena  (ID: PT-2025-001)');
  final TextEditingController _doctorController =
      TextEditingController(text: 'Dr. Anil Patel');
  final TextEditingController _deptController =
      TextEditingController(text: 'Cardiology');
  final TextEditingController _issueDateController =
      TextEditingController(text: 'Oct 24, 2025');
  final TextEditingController _dueDateController =
      TextEditingController(text: 'Nov 07, 2025');

  @override
  void dispose() {
    _patientNameController.dispose();
    _doctorController.dispose();
    _deptController.dispose();
    _issueDateController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const TopHeadline(title: 'Payment', numofPad: 85),
            SizedBox(height: 16.h),
            Expanded(
              child: ColoredBox(
                color: AppColors.secondaryColor,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Column(
                    children: [
                      InvoiceDetailsCard(
                        patientNameController: _patientNameController,
                        doctorController: _doctorController,
                        deptController: _deptController,
                        issueDateController: _issueDateController,
                        dueDateController: _dueDateController,
                      ),
                      SizedBox(height: 16.h),
                      const ServicesTreatmentsCard(),
                      SizedBox(height: 16.h),
                      const PaymentSummaryCard(),
                      SizedBox(height: 16.h),
                      const PaymentMethodCard(),
                      SizedBox(height: 24.h),
                      Button(
                        label: "Confirm & Pay \$246.75",
                        onPressed: () {},
                        backgroundcolor: AppColors.primaryColor,
                        foregroundcolor: AppColors.background,
                        showicon: false,
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}