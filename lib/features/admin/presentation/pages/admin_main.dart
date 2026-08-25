import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/navbar.dart';
import 'package:leoclinic_flutter/core/widgets/profile_page.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/admin/admin_appointment.dart';

import 'overview.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
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
      icon: Icon(Icons.person),
      selectedIcon: Icon(Icons.person, size: 30),
      label: 'Profile',
    ),
  ];
  final List<Widget> _pages = [
    AdminOverview(),
    AdminAppointment(),
    const ProfilePage(
      name: 'Admin',
      email: 'admin@leoclinic.com',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      extendBody: true,
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
