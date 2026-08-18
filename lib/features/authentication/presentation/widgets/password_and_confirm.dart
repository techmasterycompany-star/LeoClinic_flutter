import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_form_field.dart';

class PasswordAndConfirm extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const PasswordAndConfirm({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  @override
  State<PasswordAndConfirm> createState() => _PasswordAndConfirmState();
}

class _PasswordAndConfirmState extends State<PasswordAndConfirm> {
  bool isObscureText = true;
  bool isConfirmPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: "New Password",
          controller: widget.passwordController,
          isObscureText: isObscureText,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            child: Icon(
              isObscureText ? Icons.visibility_off : Icons.visibility,
              size: 24,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }

            final passwordRegex = RegExp(
              r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$',
            );

            if (!passwordRegex.hasMatch(value)) {
              return 'Min 8 chars, upper, lower, digit and special char';
            }

            return null;
          },
        ),
        SizedBox(height: 18.h),
        AppTextFormField(
          hintText: "Confirm New Password",
          controller: widget.confirmPasswordController,
          isObscureText: isConfirmPasswordObscure,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isConfirmPasswordObscure = !isConfirmPasswordObscure;
              });
            },
            child: Icon(
              isConfirmPasswordObscure
                  ? Icons.visibility_off
                  : Icons.visibility,
              size: 24,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Confirm your password';
            }

            if (value != widget.passwordController.text) {
              return 'Passwords do not match';
            }

            return null;
          },
        ),
      ],
    );
  }
}
