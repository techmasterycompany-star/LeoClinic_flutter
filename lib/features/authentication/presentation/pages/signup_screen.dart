import 'package:flutter/material.dart';
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
import 'verification.dart';

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
  final specialityIdController = TextEditingController();
  final priceController = TextEditingController();
  final bioController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final addressController = TextEditingController();

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
    specialityIdController.dispose();
    priceController.dispose();
    bioController.dispose();

    dateOfBirthController.dispose();
    addressController.dispose();

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
              builder: (context) => Verification(
                email: emailController.text.trim(),
                isResetPassword: false,
              ),
            ),
          );
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
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
                top: 55.h,
                left: 37.w,
                child: Image.asset("assets/images/Group2.png"),
              ),

              Positioned(
                top: 115.h,
                left: 0,
                child: Image.asset("assets/images/Rectangle.png"),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 175.h, 20.w, 40.h),
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
                                  height: 50.h,
                                  child: AppTextFormField(
                                    hintText: "First Name",
                                    controller: firstNameController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Enter your first name';
                                      }

                                      return null;
                                    },
                                  ),
                                ),

                                const Spacer(),

                                SizedBox(
                                  width: 164.w,
                                  height: 50.h,
                                  child: AppTextFormField(
                                    hintText: "Last Name",
                                    controller: lastNameController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Enter your last name';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16.h),

                            Row(
                              children: [
                                SizedBox(
                                  width: 164.w,
                                  height: 50.h,
                                  child: AppTextFormField(
                                    hintText: "Email",
                                    controller: emailController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Enter your email';
                                      }

                                      final emailRegex = RegExp(
                                        r'^[\w-\.\+]+@([\w-]+\.)+[\w-]{2,4}$',
                                      );

                                      if (!emailRegex.hasMatch(value.trim())) {
                                        return 'Enter a valid email';
                                      }

                                      return null;
                                    },
                                  ),
                                ),

                                const Spacer(),

                                SizedBox(
                                  width: 164.w,
                                  height: 50.h,
                                  child: AppTextFormField(
                                    hintText: "Phone Number",
                                    controller: phoneController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
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

                            SizedBox(height: 16.h),

                            PasswordAndConfirm(
                              passwordController: passwordController,
                              confirmPasswordController:
                                  confirmPasswordController,
                            ),
                            SizedBox(height: 16.h),

                            if (selectedRole == "doctor") ...[
                              AppTextFormField(
                                hintText: "Speciality ID",
                                controller: specialityIdController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter speciality ID";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 12.h),

                              AppTextFormField(
                                hintText: "Price",
                                controller: priceController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter price";
                                  }

                                  if (int.tryParse(value.trim()) == null) {
                                    return "Enter a valid price";
                                  }

                                  return null;
                                },
                              ),

                              SizedBox(height: 12.h),

                              AppTextFormField(
                                hintText: "Bio",
                                controller: bioController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter your bio";
                                  }
                                  return null;
                                },
                              ),
                            ],

                            if (selectedRole == "patient") ...[
                              GestureDetector(
                                onTap: () async {
                                  final pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2000),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );

                                  if (pickedDate != null) {
                                    dateOfBirthController.text = pickedDate
                                        .toUtc()
                                        .toIso8601String();
                                  }
                                },
                                child: AbsorbPointer(
                                  child: AppTextFormField(
                                    hintText: "Date of Birth",
                                    controller: dateOfBirthController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Enter your date of birth";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(height: 12.h),

                              AppTextFormField(
                                hintText: "Address",
                                controller: addressController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter your address";
                                  }
                                  return null;
                                },
                              ),
                            ],
                            SizedBox(height: 16.h),

                            Row(
                              children: [
                                Checkbox(
                                  value: isTermsAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      isTermsAccepted = value ?? false;
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
                              buttonText: state is AuthLoading
                                  ? "Loading..."
                                  : "Sign up",
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

                            SizedBox(height: 16.h),

                            LoginOptionsSection(
                              selectedRole: selectedRole,
                              onRoleChanged: (value) {
                                setState(() {
                                  selectedRole = value;

                                  if (selectedRole != "patient") {
                                    dateOfBirthController.clear();
                                    addressController.clear();
                                  }

                                  if (selectedRole != "doctor") {
                                    specialityIdController.clear();
                                    priceController.clear();
                                    bioController.clear();
                                  }
                                });
                              },
                            ),

                            SizedBox(height: 5.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account? "),
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

    DoctorProfileModel? doctorProfile;
    PatientProfileModel? patientProfile;

    if (role == 'doctor') {
      doctorProfile = DoctorProfileModel(
        specialityId: specialityIdController.text.trim(),
        price: int.parse(priceController.text.trim()),
        bio: bioController.text.trim(),
      );
    }

    if (role == 'patient') {
      patientProfile = PatientProfileModel(
        dateOfBirth: dateOfBirthController.text.trim(),
        address: addressController.text.trim(),
      );
    }

    final request = RegisterRequestModel(
      name:
          '${firstNameController.text.trim()} ${lastNameController.text.trim()}',
      email: emailController.text.trim(),
      password: passwordController.text,
      role: role,
      contactNumber: phoneController.text.trim(),
      doctorProfile: doctorProfile,
      patientProfile: patientProfile,
    );

    context.read<AuthCubit>().register(request);
  }
}
