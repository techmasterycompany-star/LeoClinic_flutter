import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/routes/navigation_manger.dart';
import 'package:leoclinic_flutter/core/theme/app_theme.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/admin/admin_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_request.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}