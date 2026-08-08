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
    pinned: true,
    expandedHeight: 430,
    flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // TODO: add the greetings message
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),

                  Text(
                    'Asser Mohammed Youssef',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            // TODO: Add Patient profile card
            Container(
              color: Colors.red,
              margin: const EdgeInsets.all(30),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: .start,
                  children: [
                    // TODO: Profile picture
                    Icon(Icons.image),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              margin: const EdgeInsets.all(30),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: .start,
                  children: [
                    // TODO: Profile picture
                    Icon(Icons.image),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}