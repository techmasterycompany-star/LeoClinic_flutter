import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final List<NavigationDestination> destination;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  NavBar({
    super.key,
    required this.destination,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

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
            destinations: destination,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            height: 64,
            animationDuration: const Duration(milliseconds: 300),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          ),
        ),
      ),
    );
  }
}
