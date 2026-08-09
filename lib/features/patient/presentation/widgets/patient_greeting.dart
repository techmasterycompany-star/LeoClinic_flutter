import 'package:flutter/material.dart';

Widget greetUser() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // TODO: Implement the greeting with time of the day
          'Good Morning',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),

        Text(
          // TODO: Implement the patient name
          'Asser Mohammed',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ],
    ),
  );
}
