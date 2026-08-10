import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/theme/app_theme.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/admin_appointment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      themeMode: ThemeMode.light,
      home: AdminAppointment(),
    );
  }
}
