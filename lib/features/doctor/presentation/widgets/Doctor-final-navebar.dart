import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/pages/doctor-dashborad-home.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/pages/doctor-requset.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/DoctorBottomNavBar.dart';

class Doctorfinalnavebar extends StatefulWidget {
  const Doctorfinalnavebar({super.key});

  @override
  State<Doctorfinalnavebar> createState() => _DoctorfinalnavebarState();
}

class _DoctorfinalnavebarState extends State<Doctorfinalnavebar> {
  final List<Widget> pages = [Doctordashboradhome(), Doctorrequset()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: pages[currentIndex]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Doctorbottomnavbar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
