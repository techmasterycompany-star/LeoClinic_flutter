import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/userrole.dart';

import 'features/patient/presentation/pages/patient_main.dart';
import 'features/admin/presentation/pages/admin_main.dart';
import 'features/doctor/presentation/pages/doctor_main.dart';


class RoleBasedHomeScreen extends StatelessWidget {
  final UserRole userRole;

  const RoleBasedHomeScreen({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    switch (userRole) {
      case UserRole.admin:
        return const AdminMainScreen();
      case UserRole.doctor:
        return const DoctorMainScreen();
      case UserRole.patient:
        return const PatientMainScreen();
    }
  }
}
