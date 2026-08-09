import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/patient_info_app_bar.dart';

/*
The page is not done yet, it is just a placeholder for the patient info page. The page will be implemented in the future.

*/

class PatientInfoPage extends StatefulWidget {
  const PatientInfoPage({super.key});

  @override
  State<PatientInfoPage> createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // TODO: Add patient info (name - id - blood - greetings)
        buildPatientInfoAppBar(),

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
