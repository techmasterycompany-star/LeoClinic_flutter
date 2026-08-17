import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor-dashborad-body.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/doctor-home-appbar.dart';

class Doctordashboradhome extends StatelessWidget {
  const Doctordashboradhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Doctorhomeappbar(),
            Expanded(child: Doctordashboradbody()),
          ],
        ),
      ),
    );
  }
}
