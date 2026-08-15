import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/app_colors.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/forgot_password.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/signup_screen.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_button.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/email_and_password.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/login_options_section.dart';

import '../widgets/app_text_form_field.dart';

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
            child: Image.asset("assets/images/Group.png", height: 210),
          ),
          Positioned(
            top: 125.h,
            left: 0,
            child: Image.asset("assets/images/Rectangle.png"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 215.h, 24.w, 40.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset("assets/images/logomark-shield.png"),
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
                              color: Color(0xFF00E5FF),
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
                    titleAlignment: ListTileTitleAlignment.center,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: MyColors.textPrimary,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: rememberDevice,
                            onChanged: (value) {
                              setState(() {
                                rememberDevice = value!;
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
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
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
                        backgroundColor: MyColors.backgroundCard,
                        buttonText: "Log in",
                        textStyle: TextStyle(
                          color: MyColors.textCard,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        onPressed: () {
                          ValidationToLogin(context);
                        },
                      ),
                      SizedBox(height: 16),

                      LoginOptionsSection(
                        selectedRole: selectedRole,
                        onRoleChanged: (value) {
                          setState(() {
                            selectedRole = value;
                          });
                        },
                      ),

                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: MyColors.backgroundCard,
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
  }

  void ValidationToLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
    }
  }
}
