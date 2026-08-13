import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/app_colors.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_button.dart';

class LoginOptionsSection extends StatelessWidget {
  final String? selectedRole;
  final ValueChanged<String?> onRoleChanged;

  const LoginOptionsSection({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "OR",
                style: TextStyle(
                  color: MyColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        RadioGroup<String>(
          groupValue: selectedRole,
          onChanged: onRoleChanged,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Doctor", style: TextStyle(fontSize: 16.sp)),
              const Radio<String>(value: "doctor"),
              const SizedBox(width: 20),
              Text("Patient", style: TextStyle(fontSize: 16.sp)),
              const Radio<String>(value: "patient"),
            ],
          ),
        ),
        AppTextButton(
          borderWidth: 1.1,
          buttonWidth: 250,
          buttonHeight: 18,
          borderColor: MyColors.textPrimary,
          buttonText: "Login with Google",
          textStyle: TextStyle(
            color: MyColors.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          icon: Image.asset(
            "assets/images/material-icon-theme_google.png",
            height: 20.h,
            width: 20.w,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
