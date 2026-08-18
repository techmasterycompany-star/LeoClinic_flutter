import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/app_colors.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/login_screen.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_button.dart';

class PasswordChangedSuccessfullyScreen extends StatefulWidget {
  const PasswordChangedSuccessfullyScreen({super.key});

  @override
  State<PasswordChangedSuccessfullyScreen> createState() =>
      _PasswordChangedSuccessfullyScreenState();
}

class _PasswordChangedSuccessfullyScreenState
    extends State<PasswordChangedSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 140.h),
            Image.asset("assets/images/Group5.png"),
            SizedBox(height: 16.h),
            Text(
              "Your password successfully change",
              style: TextStyle(
                color: MyColors.textSecondary,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
