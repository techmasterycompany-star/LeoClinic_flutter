import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/password_changed_successfully_screen.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_button.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_form_field.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/password_and_confirm.dart';

import '../../../../core/utils/app_colors.dart';
import 'login_screen.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 600.h,
            width: double.infinity,
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
            top: 110.h,
            left: 19.w,
            child: Image.asset("assets/images/Group4.png"),
          ),
          Positioned(
            top: 250.h,
            child: Image.asset("assets/images/Rectangle.png"),
          ),
          Positioned(
            top: 70.h,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back_ios, color: MyColors.textCard),
                  Text(
                    "Back to login",
                    style: TextStyle(
                      color: MyColors.textCard,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(20.w, 355.h, 20.w, 40.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create New Password",
                    style: TextStyle(
                      color: MyColors.textPrimary,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "Please set a new password for your account.",
                    style: TextStyle(
                      color: MyColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        PasswordAndConfirm(
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                        ),
                        SizedBox(height: 16),
                        AppTextButton(
                          backgroundColor: MyColors.backgroundCard,
                          buttonText: "Submit",
                          textStyle: TextStyle(
                            color: MyColors.textCard,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                          onPressed: () {
                            ValidationToneNewPassword(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ValidationToneNewPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PasswordChangedSuccessfullyScreen(),
        ),
      );
    }
  }
}
