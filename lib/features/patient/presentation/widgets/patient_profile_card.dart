import 'package:flutter/material.dart';

Widget buildPatientProfileCard() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),

    child: ListTile(
      leading: const CircleAvatar(radius: 21, child: Icon(Icons.person)),
      title: Text(
        // TODO: Implement the patient name
        'Asser Mohammed Youssef',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                // TODO: Implement the real ID
                'ID: PT-002',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              SizedBox(width: 4),
              Text(
                // TODO: implement Blood type
                'Blood: B+',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              SizedBox(width: 4),
              Text(
                // TODO: implement Age
                'Age: 20',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            // TODO: Implement the status
            'Type 2 Diabetes — Under care',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
        ],
      ),
      // The trailing didn't work with me, if you can make it
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        size: 24,
        color: Colors.black,
      ),

      onTap: () {},
    ),
  );
}
