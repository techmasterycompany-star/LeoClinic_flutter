import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leoclinic_flutter/core/utils/navbar.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/patient/book_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/patient/patient_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/patient_appointment_card/patient_appointment_card.dart';
import 'overview.dart';

class PatientMainScreen extends StatefulWidget {
  const PatientMainScreen({super.key});

  @override
  State<PatientMainScreen> createState() => _PatientMainScreenState();
}

class _PatientMainScreenState extends State<PatientMainScreen> {
  int _index = 0;
  final List<NavigationDestination> destination = [
    /*
      ============================================
    1. Home
    2. appointment
    4. doctor appointment (page name = patient appointment)
    5. chat
    6. profile
      ============================================
     */
    const NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_outlined, size: 30),
      label: 'home',
    ),
    const NavigationDestination(
      icon: Icon(Icons.calendar_today_outlined),
      selectedIcon: Icon(Icons.calendar_today_outlined, size: 30),
      label: 'booking',
    ),
    const NavigationDestination(
      icon: Icon(Icons.payment_sharp),
      selectedIcon: Icon(Icons.payment_sharp, size: 30),
      label: 'payment',
    ),
    const NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person_outline, size: 30),
      label: 'profile',
    ),
  ];
  final List<Widget> _pages = const [PatientOverview(),
  PatientAppointment(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      extendBody: true,
      bottomNavigationBar: NavBar(
        destination: destination,
        selectedIndex: _index,
        onDestinationSelected: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
