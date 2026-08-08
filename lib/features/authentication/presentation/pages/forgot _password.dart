import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children: [
          Container(
            height: 700.h,
            color: MyColors.background,
          ),
          Positioned(
              top: 140,
              child: Image.asset("assets/images/Group1.png")),
          Positioned(
            top: 340,
              child: Image.asset("assets/images/Rectangle.png"))
        ],
      ),
    );
  }
}
