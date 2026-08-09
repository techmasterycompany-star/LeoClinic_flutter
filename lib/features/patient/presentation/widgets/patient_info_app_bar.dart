import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/next_appointment_card.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/patient_greeting.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/patient_profile_card.dart';

SliverAppBar buildPatientInfoAppBar() {
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.antiAlias,
    pinned: true,
    expandedHeight: 278,
    shadowColor: Colors.black,

    // I want the user greetings to appear when the user scrolls down, and the patient profile card to appear when the user scrolls up
    title: greetUser(),

    // This is background ui for the Navbar it will be a gradient with a shadow and a rounded bottom border
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF000F75), Color(0xFF1730D4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(0, 5)),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      // TODO:  I will add the content in here
      child: FlexibleSpaceBar(
        background: Container(
          margin: EdgeInsets.all(10),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildPatientProfileCard(),
              SizedBox(height: 10),
              buildAppointmentCard(),
            ],
          ),
        ),
      ),
    ),
  );
}
