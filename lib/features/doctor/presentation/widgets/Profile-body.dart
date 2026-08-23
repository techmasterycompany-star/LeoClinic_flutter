import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/profile_bottom.dart';

class Profilebody extends StatelessWidget {
  const Profilebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Profilebottom(
          maintext: 'Edit Profile',
          iconimage: Assets.imagesEditProfile,
        ),
        SizedBox(height: 8.h),
        Profilebottom(
          maintext: "My requests",
          iconimage: Assets.imagesMyrequests,
        ),
        SizedBox(height: 8.h),
        Profilebottom(maintext: "Payment", iconimage: Assets.imagesPayment),
        SizedBox(height: 8.h),
        Profilebottom(
          maintext: "Invite friends",
          iconimage: Assets.imagesInvitefriends,
        ),
        SizedBox(height: 8.h),
        Profilebottom(maintext: "Log out", iconimage: Assets.imagesLogout),
      ],
    );
  }
}