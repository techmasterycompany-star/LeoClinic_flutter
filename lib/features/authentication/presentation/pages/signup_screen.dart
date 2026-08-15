import 'package:flutter/material.dart';
import 'verification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/app_colors.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/login_options_section.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/password_and_confirm.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../../business_logic/cubit/auth_state.dart';
import '../../data/models/register_request_model.dart';
import '../widgets/app_text_button.dart';
import '../widgets/app_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isTermsAccepted = false;
  String? selectedRole = "patient";

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Verification(),
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

      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 812.h,
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
                top: 66.h,
                left: 37.w,
                child: Image.asset("assets/images/Group2.png"),
              ),
              Positioned(
                top: 125.h,
                left: 0,
                child: Image.asset("assets/images/Rectangle.png"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 185.h, 20.w, 40.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Signup",
                        style: TextStyle(
                          color: MyColors.textPrimary,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        "Create your account.",
                        style: TextStyle(
                          color: MyColors.textPrimary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 22.h),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 164.w,
                                  height: 45.h,
                                  child: AppTextFormField(
                                    hintText: "First Name",
                                    controller: firstNameController,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'Enter your first name';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 164.w,
                                  height: 45.h,
                                  child: AppTextFormField(
                                    hintText: "Last Name",
                                    controller: lastNameController,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'Enter your last name';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 27.h),
                            Row(
                              children: [
                                SizedBox(
                                  width: 164.w,
                                  height: 45.h,
                                  child: AppTextFormField(
                                    hintText: "Email",
                                    controller: emailController,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'Enter your email';
                                      }

                                      final emailRegex = RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                      );

                                      if (!emailRegex.hasMatch(value.trim())) {
                                        return 'Enter a valid email';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 164.w,
                                  height: 45.h,
                                  child: AppTextFormField(
                                    hintText: "Phone Number",
                                    controller: phoneController,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'Enter your phone number';
                                      }
                                      final phoneRegex = RegExp(
                                        r'^01[0125][0-9]{8}$',
                                      );

                                      if (!phoneRegex.hasMatch(value.trim())) {
                                        return 'Enter a valid phone number';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 22.h),
                            PasswordAndConfirm(
                              passwordController: passwordController,
                              confirmPasswordController: confirmPasswordController,
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: isTermsAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      isTermsAccepted = value!;
                                    });
                                  },
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "I agree to all the ",
                                        style: TextStyle(
                                          color: MyColors.textPrimary,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Terms ",
                                        style: TextStyle(
                                          color: MyColors.textPrimary,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "and ",
                                        style: TextStyle(
                                          color: MyColors.textPrimary,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Privacy Policies",
                                        style: TextStyle(
                                          color: MyColors.textPrimary,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            AppTextButton(
                              backgroundColor: MyColors.backgroundCard,
                              buttonText: state is AuthLoading ? "Loading..." : "Sign up",
                              textStyle: TextStyle(
                                color: MyColors.textCard,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              onPressed: () {
                                if (state is AuthLoading) return;
                                validateSignup();
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
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account? "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Login",
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
  void validateSignup() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!isTermsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the Terms and Privacy Policies'),
        ),
      );
      return;
    }

    final role = selectedRole!.toLowerCase();

    final request = RegisterRequestModel(
      name:
      '${firstNameController.text.trim()} ${lastNameController.text.trim()}',
      email: emailController.text.trim(),
      password: passwordController.text,
      role: role,
      contactNumber: phoneController.text.trim(),
    );

    print('ROLE: $role');
    print('REQUEST: ${request.toJson()}');

    context.read<AuthCubit>().register(request);
  }
}
