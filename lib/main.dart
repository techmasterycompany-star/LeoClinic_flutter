import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/routes/navigation_manger.dart';
import 'package:leoclinic_flutter/core/theme/app_theme.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().lightTheme,
          themeMode: ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}
