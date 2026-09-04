import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Profile-body.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Profile-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam-appbar-allpage.dart';

class Doctorprofile extends StatelessWidget {
  const Doctorprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const Custamappbarallpage(maintext: "Profile"),
          SizedBox(height: 24.h),
          const Profilecard(),
          SizedBox(height: 8.h),
          const Profilebody(),
        ],
      ),
    );
  }
}
