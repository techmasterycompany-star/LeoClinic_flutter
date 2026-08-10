import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/navbar.dart';
import 'package:leoclinic_flutter/core/theme/app_theme.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/pages/doctor_home_page.dart';
// import 'package:leoclinic_flutter/features/patient/presentation/pages/patient_info_page.dart';

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
      home: Scaffold(
        body: DoctorHomePage(),
        bottomNavigationBar: PatientNavBar(),
      ),
    );
  }
}
