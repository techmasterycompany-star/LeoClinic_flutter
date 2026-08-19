import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Profile-body.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Profile-card.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/custam-appbar-allpage.dart';

class Doctorprofile extends StatelessWidget {
  const Doctorprofile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Custamappbarallpage(maintext: "Profile"),
          SizedBox(height: height * 0.03),
          Profilecard(),
          SizedBox(height: height * 0.01),
          Profilebody(),
        ],
      ),
    );
  }
}
