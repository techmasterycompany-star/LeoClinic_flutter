import 'package:flutter/material.dart';
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
      icon: Icon(Icons.home),
      selectedIcon: Icon(Icons.home, size: 30),
      label: 'Patient',
    ),

    NavigationDestination(
      icon: Icon(Icons.person),
      selectedIcon: Icon(Icons.person, size: 30),
      label: 'Profile',
    ),
  ];

  final List<Widget> _pages = [DoctorOverview(), Placeholder()];

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
