import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/widgets/Top_headline_of_screens.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';
import 'package:leoclinic_flutter/features/appointments/domain/entities/receipt_appointment_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/payment_widgets/payment_method_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/review_booking_widgets/doctor_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/review_booking_widgets/info_details_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/review_booking_widgets/payment_method.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/review_booking_widgets/payment_summary_card.dart';

class ReviewBookingAppointment extends StatefulWidget {
  final AppointmentReceiptCard appointmentReceiptCard;
  const ReviewBookingAppointment({
    super.key,
    required this.appointmentReceiptCard,
  });

  @override
  State<ReviewBookingAppointment> createState() =>
      _ReviewBookingAppointmentState();
}

class _ReviewBookingAppointmentState extends State<ReviewBookingAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const TopHeadline(title: 'Review Booking', numofPad: 50),
            SizedBox(height: 16.h),
            Expanded(
              child: ColoredBox(
                color: AppColors.secondaryColor,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DoctorCard(appointmentReceiptCard: widget.appointmentReceiptCard),
                        InfoDetailsCard(label1Info:widget.appointmentReceiptCard.date,
                         label2Info: widget.appointmentReceiptCard.time,
                          label3Info: widget.appointmentReceiptCard.package,
                           lable1: 'Date', lable2: 'Time',
                            lable3: 'Package',
                          ),
                          InfoDetailsCard(label1Info:widget.appointmentReceiptCard.patientName,
                         label2Info: widget.appointmentReceiptCard.age,
                          label3Info: widget.appointmentReceiptCard.gender,
                           lable1: 'Patient Name', lable2: 'Age',
                            lable3: 'Gender',
                          ),
                          PaymentSummary(fee: widget.appointmentReceiptCard.fee, tax: widget.appointmentReceiptCard.tax,),
                     PaymentMethod(cardNumber: '123456789', onChange: () {  },),
                     Padding(
                       padding:  EdgeInsets.only(top: 30.h),
                       child: Button(
                          label: "Confirm & Pay \$246.75",
                          onPressed: () {
                          },
                          backgroundcolor: AppColors.primaryColor,
                          foregroundcolor: AppColors.background,
                          showicon: false,
                        ),
                     ),
                      SizedBox(height: 70.h),
                      ],
                    ),
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
