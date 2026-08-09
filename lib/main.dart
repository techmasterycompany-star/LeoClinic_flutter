import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/navbar.dart';
import 'package:leoclinic_flutter/features/patient/business_logic/pages/patientinfo.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'IBMPlexSans', 
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: PatientInfo(), bottomNavigationBar: PatientNavBar()),
    );
  }
}