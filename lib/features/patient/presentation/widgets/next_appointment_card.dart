import 'package:flutter/material.dart';

Widget buildAppointmentCard() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30), // Pill-shaped rounded corners
    ),
    child: ListTile(
      selected: true,
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: const Icon(Icons.calendar_today, size: 20),
      title: const Text(
        // TODO: Impelement the next appointment
        'Next appointment: Aug 12, 2026 · 10:30 Am',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
      ),
      onTap: () {},
    ),
  );
}
