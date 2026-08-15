import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/network/dio_client.dart';
import 'features/authentication/business_logic/cubit/auth_cubit.dart';
import 'features/authentication/data/datasource/auth_api_services.dart';
import 'features/authentication/data/repositories/login_repo.dart';
import 'features/authentication/presentation/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
          child: child!,
        );
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}