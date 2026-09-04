import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/navbar.dart';
import 'package:leoclinic_flutter/core/widgets/profile_page.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/patient/patient_appointment.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/pages/Notifications.dart';
import 'overview.dart';

class PatientMainScreen extends StatefulWidget {
  const PatientMainScreen({super.key});

  @override
  State<PatientMainScreen> createState() => _PatientMainScreenState();
}

class _PatientMainScreenState extends State<PatientMainScreen> {
  int _index = 0;
  final List<NavigationDestination> destination = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home, size: 30),
      label: 'Home',
    ),
        NavigationDestination(
      icon: Icon(Icons.notifications_outlined),
      selectedIcon: Icon(Icons.notifications, size: 30),
      label: 'Notifications',
    ),
        NavigationDestination(
      icon: Icon(Icons.calendar_today_outlined),
      selectedIcon: Icon(Icons.calendar_today, size: 30),
      label: 'Appointments',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person, size: 30),
      label: 'Profile',
    ),
  ];
  final List<Widget> _pages = [
    PatientOverview(),
    Notifications(),
    PatientAppointment(),
    ProfilePage(),
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
