import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';
import 'package:leoclinic_flutter/features/appointments/domain/entities/doctor_details_for_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/details_doctor_section/doctor_overview_for_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/details_doctor_section/select_date_and_select_time.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/select_type_of_visit/select_type_of_visit.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/patient_appointment_widgets/selection_card.dart';

class SelectTypeOfVisitScreen extends StatefulWidget {
  const SelectTypeOfVisitScreen({super.key});

  @override
  State<SelectTypeOfVisitScreen> createState() =>
      _SelectTypeOfVisitScreenState();
}

class _SelectTypeOfVisitScreenState extends State<SelectTypeOfVisitScreen> {
  DoctorDetailsForAppointment detailsForAppointment =
      DoctorDetailsForAppointment(
        nameOfDoctor: "Dr.Mohamed Gamal",
        specilst: "Detarmanolgy",
        salary: 900,
        experience: "12 YRS",
        rating: 4.9,
        review: 10,
      );
  int selectedIndex = 1;

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
              child: SelectTypeOfVisit(
                onPressed: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
