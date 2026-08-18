import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:leoclinic_flutter/core/utils/app_colors.dart';
import 'package:leoclinic_flutter/core/utils/pref-helper.dart';

import 'package:leoclinic_flutter/features/authentication/business_logic/cubit/auth_cubit.dart';
import 'package:leoclinic_flutter/features/authentication/business_logic/cubit/auth_state.dart';

import 'package:leoclinic_flutter/features/authentication/presentation/pages/forgot_password.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/signup_screen.dart';

import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_button.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/email_and_password.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/login_options_section.dart';

import '../../data/models/login_request_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberDevice = false;

  String? selectedRole = "doctor";

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {

        if (state is LoginSuccess) {
          final role = state.response.user.role.toLowerCase();
          final token = state.response.accessToken;

          await Prefhelper.savetoken(token);
          await Prefhelper.saveRole(role);
          await Prefhelper.saveUserName(state.response.user.name);

          String route;
          switch (role) {
            case 'admin':
              route = '/admin';
              break;
            case 'doctor':
              route = '/doctor';
              break;
            case 'patient':
              route = '/patient';
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Unknown user role: $role',
                  ),
                ),
              );
              return;
          }

          if (context.mounted) {
            context.go(route);
          }
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },

      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,

          body: Stack(
            children: [

              Container(
                width: double.infinity,
                height: 700.h,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      MyColors.background,
                      MyColors.backgroundCard,
                      MyColors.backgroundColor,
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 30.h,
                left: 75.w,
                child: Image.asset(
                  "assets/images/Group.png",
                  height: 210,
                ),
              ),

              Positioned(
                top: 125.h,
                left: 0,
                child: Image.asset(
                  "assets/images/Rectangle.png",
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(
                  24.w,
                  215.h,
                  24.w,
                  40.h,
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ListTile(
                        contentPadding: EdgeInsets.zero,

                        leading: Image.asset(
                          "assets/images/logomark-shield.png",
                        ),

                        title: RichText(
                          text: TextSpan(
                            children: [

                              TextSpan(
                                text: "Leo ",
                                style: TextStyle(
                                  color: MyColors.textPrimary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),

                              TextSpan(
                                text: "Clinic",
                                style: TextStyle(
                                  color: const Color(0xFF00E5FF),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),

                        subtitle: Text(
                          "H E A L T H C A R E \nS Y S T E M",
                          style: TextStyle(
                            color: MyColors.textSecondary,
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        titleAlignment:
                        ListTileTitleAlignment.center,
                      ),

                      Text(
                        "Login",
                        style: TextStyle(
                          color: MyColors.textPrimary,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Text(
                        "Welcome back. Please fill in your unique admin login details below.",
                        style: TextStyle(
                          color: MyColors.textPrimary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 18.h),

                      Column(
                        children: [

                          EmailAndPassword(
                            formKey: formKey,
                            emailController: emailController,
                            passwordController: passwordController,
                          ),

                          SizedBox(height: 12.h),

                          Row(
                            children: [

                              Checkbox(
                                value: rememberDevice,

                                onChanged: (value) {
                                  setState(() {
                                    rememberDevice = value ?? false;
                                  });
                                },
                              ),

                              Text(
                                "Remember device",
                                style: TextStyle(
                                  color: MyColors.textPrimary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const Spacer(),

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                      const ForgotPassword(),
                                    ),
                                  );
                                },

                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: MyColors.backgroundCard,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          AppTextButton(
                            backgroundColor:
                            MyColors.backgroundCard,

                            buttonText: state is AuthLoading
                                ? "Loading..."
                                : "Log in",

                            textStyle: TextStyle(
                              color: MyColors.textCard,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),

                            onPressed: () {

                              if (state is AuthLoading) {
                                return;
                              }

                              ValidationToLogin(context);
                            },
                          ),

                          SizedBox(height: 16.h),

                          LoginOptionsSection(
                            selectedRole: selectedRole,

                            onRoleChanged: (value) {
                              setState(() {
                                selectedRole = value;
                              });
                            },
                          ),

                          SizedBox(height: 16.h),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            children: [

                              const Text(
                                "Don't have an account? ",
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                      const SignupScreen(),
                                    ),
                                  );
                                },

                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color:
                                    MyColors.backgroundCard,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  void ValidationToLogin(BuildContext context) {

    if (!formKey.currentState!.validate()) {
      return;
    }

    final request = LoginRequestModel(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    context.read<AuthCubit>().login(request);
  }
}