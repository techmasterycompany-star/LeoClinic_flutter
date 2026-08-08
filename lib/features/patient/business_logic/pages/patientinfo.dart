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
    expandedHeight: 430,
    elevation: 8,
    shadowColor: Colors.black,

    // I want the user greetings to appear when the user scrolls down, and the patient profile card to appear when the user scrolls up
    title: Container(
      margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Text(
            'Asser Mohammed',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),

    // This is background ui for the Navbar it will be a gradient with a shadow and a rounded bottom border
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF000F75), Color(0xFF1730D4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),

      // I will add the content in here
      // TODO
      child: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 100), _buildPatientProfileCard()],
        ),
      ),
    ),
  );
}

Widget _buildPatientProfileCard() {
  return Container(
    color: Colors.white,
    margin: const EdgeInsets.all(30),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: .start,
        children: [
          Icon(Icons.image),

          SizedBox(width: 16),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Asser Mohammed Youssef',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),
              Text(
                'ID: 123456789',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              Text(
                'Blood Type: O+',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
