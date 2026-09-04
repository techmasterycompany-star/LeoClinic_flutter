import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:leoclinic_flutter/core/utils/app_colors.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_button.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/otp_input.dart';

import '../../business_logic/cubit/auth_cubit.dart';
import '../../business_logic/cubit/auth_state.dart';
import '../../data/models/verify_reset_password_token_request_model.dart';
import 'login_screen.dart';

class Verification extends StatefulWidget {
  final String email;
  final bool isResetPassword;

  const Verification({
    super.key,
    required this.email,
    this.isResetPassword = false,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String verificationCode = '';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyEmailSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );

          context.go('/login');
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
              top: 125.h,
              left: 19.w,
              child: Image.asset(
                "assets/images/Group3.png",
              ),
            ),

            Positioned(
              top: 320.h,
              child: Image.asset(
                "assets/images/Rectangle.png",
              ),
            ),

            Positioned(
              top: 70.h,
              left: 30.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
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
                460.h,
                20.w,
                40.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verification",
                      style: TextStyle(
                        color: MyColors.textPrimary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    Text(
                      "Enter verification code",
                      style: TextStyle(
                        color: MyColors.textSecondary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      "Code sent to ${widget.email}",
                      style: TextStyle(
                        color: MyColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                    ),

                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          OtpInput(
                            length: 6,
                            onCompleted: (code) {
                              verificationCode = code;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the verification code';
                              }

                              if (value.length != 6) {
                                return 'Please enter the complete verification code';
                              }

                              return null;
                            },
                          ),

                          SizedBox(height: 16.h),

                          AppTextButton(
                            buttonText:
                            context.watch<AuthCubit>().state
                            is AuthLoading
                                ? "Verifying..."
                                : "Verify",

                            textStyle: TextStyle(
                              color: MyColors.textCard,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),

                            backgroundColor:
                            MyColors.backgroundCard,

                            onPressed: () {
                              if (context.read<AuthCubit>().state is AuthLoading) {
                                return;
                              }

                              if (!formKey.currentState!.validate()) {
                                return;
                              }

                              if (widget.isResetPassword) {
                                final request =
                                VerifyResetPasswordTokenRequestModel(
                                  token: verificationCode,
                                );

                                context
                                    .read<AuthCubit>()
                                    .verifyResetPasswordToken(
                                  request,
                                );
                              } else {
                                context.read<AuthCubit>().verifyEmail(verificationCode);
                              }
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
}