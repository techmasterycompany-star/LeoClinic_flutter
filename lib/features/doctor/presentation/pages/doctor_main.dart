import 'package:flutter/material.dart';
import 'overview.dart';
import 'doctor-Profile.dart';
import '../../../../core/widgets/notification.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_appointment.dart';

import 'package:leoclinic_flutter/core/utils/navbar.dart';

import 'patient_list.dart';

class DoctorMainScreen extends StatefulWidget {
  const DoctorMainScreen({super.key});

  @override
  State<DoctorMainScreen> createState() => _DoctorMainScreenState();
}

class _DoctorMainScreenState extends State<DoctorMainScreen> {
  int _index = 0;
  final List<NavigationDestination> destination = const [
    NavigationDestination(
      icon: Icon(Icons.home),
      selectedIcon: Icon(Icons.home, size: 30),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.calendar_month_outlined),
      selectedIcon: Icon(Icons.calendar_month, size: 30),
      label: 'Appointments',
    ),
    NavigationDestination(
      icon: Icon(Icons.notifications_outlined),
      selectedIcon: Icon(Icons.notifications, size: 30),
      label: 'Notifications',
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      selectedIcon: Icon(Icons.person_outline, size: 30),
      label: 'Profile',
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      selectedIcon: Icon(Icons.person, size: 30),
      label: 'Profile',
    ),
  ];

  final List<Widget> _pages = [
    DoctorOverview(),
    DoctorAppointment(),
    Notifications(),
    PatientInfo(),
    Doctorprofile(),
  ];

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
