import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/theme/app_theme.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_add_prescription.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Doctor-final-navebar.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      themeMode: ThemeMode.light,
      home: DoctorAddPrescription(),
    );
  }
}