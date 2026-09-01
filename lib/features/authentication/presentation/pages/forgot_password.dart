import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:leoclinic_flutter/features/authentication/business_logic/cubit/auth_cubit.dart';
import 'package:leoclinic_flutter/features/authentication/business_logic/cubit/auth_state.dart';
import 'package:leoclinic_flutter/features/authentication/data/models/forgot_password_request_model.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/verification.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_form_field.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/app_text_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.response.message),
            ),
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Verification(
                email: emailController.text.trim(),
                isResetPassword: true,
              ),
            ),
          );
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },

      child: Scaffold(
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
              top: 140.h,
              left: 0,
              child: Image.asset(
                "assets/images/Group1.png",
              ),
            ),

            Positioned(
              top: 320.h,
              left: 0,
              child: Image.asset(
                "assets/images/Rectangle.png",
              ),
            ),

            Positioned(
              top: 70.h,
              left: 30.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: MyColors.textCard,
                    ),

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
              padding: EdgeInsets.fromLTRB(
                20.w,
                440.h,
                20.w,
                30.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: MyColors.textPrimary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    Text(
                      "We will Send you a verification code to your registered email.",
                      style: TextStyle(
                        color: MyColors.textSecondary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Text(
                      "Email",
                      style: TextStyle(
                        color: MyColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 7.5.h),

                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            hintText: "Hint text",
                            controller: emailController,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty) {
                                return 'Enter your email';
                              }

                              final emailRegex = RegExp(
                                r'^[\w-\.\+]+@([\w-]+\.)+[\w-]{2,4}$',
                              );

                              if (!emailRegex.hasMatch(
                                value.trim(),
                              )) {
                                return 'Enter a valid email';
                              }

                              return null;
                            },
                          ),

                          SizedBox(height: 16.h),

                          AppTextButton(
                            backgroundColor:
                            MyColors.backgroundCard,

                            buttonText:
                            context.watch<AuthCubit>().state
                            is AuthLoading
                                ? "Loading..."
                                : "Submit",

                            textStyle: TextStyle(
                              color: MyColors.textCard,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),

                            onPressed: () {
                              if (context
                                  .read<AuthCubit>()
                                  .state
                              is AuthLoading) {
                                return;
                              }

                              validateForgotPassword();
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
      ),
    );
  }

  void validateForgotPassword() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final request = ForgotPasswordRequestModel(
      email: emailController.text.trim(),
    );

    context.read<AuthCubit>().forgotPassword(request);
  }
}