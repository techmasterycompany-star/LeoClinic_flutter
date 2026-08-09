import 'package:flutter/material.dart';

/*
The page is not done yet, it is just a placeholder for the patient info page. The page will be implemented in the future.

*/

class PatientInfo extends StatefulWidget {
  const PatientInfo({super.key});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // TODO: Add patient info (name - id - blood - greetings)
        _buildPatientInfo(),

        /*

        This will be Sliverlist builder that will build the following:
        1. Health overview
        2. Clinical alerts
        3. Clinical Notes
        4. Care Milestones
        5. Medical history

        */
        // TODO: Add health overview
        SliverToBoxAdapter(child: Container(height: 300, color: Colors.blue)),

        // TODO: Add clinical alerts
        SliverToBoxAdapter(child: Container(height: 200, color: Colors.yellow)),

        // TODO: Add clinical Notes
        SliverToBoxAdapter(child: Container(height: 200, color: Colors.red)),

        // TODO: Add Care Milestones
        SliverToBoxAdapter(child: Container(height: 200, color: Colors.blue)),

        // TODO: Add Medical history
        SliverFillRemaining(child: Container(color: Colors.grey)),
      ],
    );
  }
}

SliverAppBar _buildPatientInfo() {
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.antiAlias,
    pinned: true,
    expandedHeight: 290,
    shadowColor: Colors.black,

    // I want the user greetings to appear when the user scrolls down, and the patient profile card to appear when the user scrolls up
    title: greetUser(),

    // This is background ui for the Navbar it will be a gradient with a shadow and a rounded bottom border
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF000F75), Color(0xFF1730D4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(0, 5)),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      // I will add the content in here
      // TODO
      child: FlexibleSpaceBar(
        background: Container(
          margin: EdgeInsets.all(10),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildPatientProfileCard(),
              SizedBox(height: 10),
              _buildAppointmentCard(),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget greetUser() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(8),
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

Widget _buildPatientProfileCard() {
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

Widget _buildAppointmentCard() {
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
