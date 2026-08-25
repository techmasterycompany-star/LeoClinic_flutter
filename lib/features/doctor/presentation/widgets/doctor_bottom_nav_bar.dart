import 'package:flutter/material.dart';

class Doctorbottomnavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const Doctorbottomnavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Color(0xffFFFFFF),
          border: Border.all(width: 1, color: Color(0xff4A4F5A)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            IconButton(
              onPressed: () {
                onTap(0);
              },
              icon: Icon(Icons.home_outlined),
            ),
            IconButton(
              onPressed: () {
                onTap(1);
              },
              icon: Icon(Icons.calendar_view_month_outlined),
            ),
            IconButton(
              onPressed: () {
                onTap(2);
              },
              icon: Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () {
                onTap(3);
              },
              icon: Icon(Icons.people),
            ),
            IconButton(
              onPressed: () {
                onTap(4);
              },
              icon: Icon(Icons.chat_bubble),
            ),
            IconButton(
              onPressed: () {
                onTap(5);
              },
              icon: Icon(Icons.people_outline),
            ),
          ],
        ),
      ),
    );
  }
}
