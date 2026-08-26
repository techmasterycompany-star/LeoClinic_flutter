import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/navbar.dart';
import 'package:leoclinic_flutter/core/widgets/profile_page.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_request.dart';
import 'overview.dart';
import 'patient_list.dart';
import 'Notifications.dart';

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
      icon: Icon(Icons.calendar_today_outlined),
      selectedIcon: Icon(Icons.calendar_today, size: 30),
      label: 'Appointments',
    ),
    NavigationDestination(
      icon: Icon(Icons.notifications_outlined),
      selectedIcon: Icon(Icons.notifications, size: 30),
      label: 'Notifications',
    ),
    NavigationDestination(
      icon: Icon(Icons.people_outline),
      selectedIcon: Icon(Icons.people, size: 30),
      label: 'Patients',
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      selectedIcon: Icon(Icons.person, size: 30),
      label: 'Profile',
    ),
  ];

  final List<Widget> _pages = [
    DoctorOverview(),
    DoctorRequestAppointment(),
    Notifications(),
    PatientInfo(),
    ProfilePage(
      name: 'Dr. Mohamed Gamal',
      email: 'mohamed.gamal@leoclinic.com',
    ),
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
