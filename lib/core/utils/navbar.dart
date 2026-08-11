import 'package:flutter/material.dart';

/*

The page is not done yet, it is just a placeholder for the patient info page. The page will be implemented in the future.

*/

class PatientNavBar extends StatefulWidget {
  const PatientNavBar({super.key});

  @override
  State<PatientNavBar> createState() => _PatientNavBarState();
}

class _PatientNavBarState extends State<PatientNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0, right: 20, left: 20),
      color: Colors.transparent,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(34),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: NavigationBar(
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34),
            ),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home, size: 30),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                selectedIcon: Icon(Icons.search, size: 30),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                selectedIcon: Icon(Icons.person, size: 30),
                label: 'Profile',
              ),
            ],
            selectedIndex: currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            height: 64,
            animationDuration: const Duration(milliseconds: 300),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          ),
        ),
      ),
    );
  }
}
