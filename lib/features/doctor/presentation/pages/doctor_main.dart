import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_request.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/pick_a_slot_screen_for_patient.dart';
import 'overview.dart';

import 'package:leoclinic_flutter/core/utils/navbar.dart';

class DoctorMainScreen extends StatefulWidget {
  const DoctorMainScreen({super.key});

  @override
  State<DoctorMainScreen> createState() => _DoctorMainScreenState();
}

class _DoctorMainScreenState extends State<DoctorMainScreen> {
  int _index = 0;
  final List<NavigationDestination> destination = const [
    /*
    ============================================
    1. Home
    2. appointment
    3. schedule
    4. patient list
    5. chat
    6. profile
    ============================================
     */
        NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_outlined, size: 30),
      label: 'home',
    ),
     NavigationDestination(
      icon: Icon(Icons.calendar_today_outlined),
      selectedIcon: Icon(Icons.calendar_today_outlined, size: 30),
      label: 'booking',
    ),
     NavigationDestination(
      icon: Icon(Icons.payment_sharp),
      selectedIcon: Icon(Icons.payment_sharp, size: 30),
      label: 'payment',
    ),
     NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person_outline, size: 30),
      label: 'profile',
    ),
  ];

  final List<Widget> _pages = [DoctorOverview(), DoctorRequestAppointment()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_index],
      bottomNavigationBar: NavBar(
        destination: destination,
        selectedIndex: _index,
        onDestinationSelected: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
