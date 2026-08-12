import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/theme/app_theme.dart';

import 'home.dart';

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
      home: RoleBasedHomeScreen(userRole: .admin),
    );
  }
}
