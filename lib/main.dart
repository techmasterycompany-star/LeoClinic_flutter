import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/network/dio_client.dart';
import 'package:leoclinic_flutter/core/routes/navigation_manger.dart';
import 'package:leoclinic_flutter/core/theme/app_theme.dart';
<<<<<<< HEAD
import 'package:leoclinic_flutter/features/appointments/presentation/pages/admin/admin_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_request.dart';
import 'package:leoclinic_flutter/features/authentication/business_logic/cubit/auth_cubit.dart';
import 'package:leoclinic_flutter/features/authentication/data/datasource/auth_api_services.dart';
import 'package:leoclinic_flutter/features/authentication/data/repositories/login_repo.dart';
=======
import 'core/network/dio_client.dart';
import 'features/authentication/business_logic/cubit/auth_cubit.dart';
import 'features/authentication/data/datasource/auth_api_services.dart';
import 'features/authentication/data/repositories/login_repo.dart';
>>>>>>> 8dc76576153d683dd8c2782ff7017022e9f32367

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return  ScreenUtilInit(
  designSize: const Size(375, 812),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (_, child) {
    return BlocProvider(
      create: (_) => AuthCubit(
        LoginRepo(
          AuthApiServices(
            DioClient(),
          ),
        ),
      ),
=======
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (_) => AuthCubit(LoginRepo(AuthApiServices(DioClient()))),
          child: child!,
        );
      },
>>>>>>> 8dc76576153d683dd8c2782ff7017022e9f32367
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().lightTheme,
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  },
);
  }
}
