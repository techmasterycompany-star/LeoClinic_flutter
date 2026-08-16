import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leoclinic_flutter/core/utils/assets.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/profile-bottom.dart';

class Profilebody extends StatelessWidget {
  const Profilebody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Profilebottom(
          maintext: 'Edit Profile',
          iconimage: Assets.imagesEditProfile,
        ),
        SizedBox(height: height * 0.01),
        Profilebottom(
          maintext: "My requests",
          iconimage: Assets.imagesMyrequests,
        ),
        SizedBox(height: height * 0.01),
        Profilebottom(maintext: "Payment", iconimage: Assets.imagesPayment),
        SizedBox(height: height * 0.01),
        Profilebottom(
          maintext: "Invite friends",
          iconimage: Assets.imagesInvitefriends,
        ),
        SizedBox(height: height * 0.01),
        Profilebottom(maintext: "Log out", iconimage: Assets.imagesLogout),
      ],
    );
  }
}
