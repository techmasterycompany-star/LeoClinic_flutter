import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/features/appointments/domain/entities/doctor_details_for_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/details_doctor_section/doctor_overview_for_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/details_doctor_section/select_date_and_select_time.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DoctorDetailsForAppointment detailsForAppointment =
      DoctorDetailsForAppointment(
        nameOfDoctor: "Dr.Mohamed Gamal",
        specilst: "Detarmanolgy",
        salary: 900,
        experience: "12 YRS",
        rating: 4.9,
        review: 10,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: DoctorOverviewForAppointment(
              detailsForAppointment: detailsForAppointment,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child:SelectDateAndSelectTime(onPressed: (){
                GoRouter.of(context).push("/SelectTypeOfVisitScreen");
              },),
            ),
          ),
        ],
      ),
    );
  }
}
