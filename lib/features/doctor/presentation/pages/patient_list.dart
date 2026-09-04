import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/pages/patient_info_detail.dart';
import '../widgets/appointment_new.dart';
import '../widgets/custam-searche.dart';
import '../widgets/custam-appbar-allpage.dart';
import '../widgets/health_overview.dart';
import '../widgets/patient_directory_card.dart';

class PatientInfo extends StatelessWidget {
  PatientInfo({super.key});

  final List<Map<String, dynamic>> metricsData = [
    {
      'icon': Icons.notifications_none_rounded,
      'headline': 'Total Patient',
      'result': '2,845',
      'percentage': '+12.5%',
    },
    {
      'icon': Icons.favorite_border_rounded,
      'headline': 'Active Treatments',
      'result': '842',
      'percentage': '-3.4%',
    },
    {
      'icon': Icons.person_add_alt_1_outlined,
      'headline': 'New This Month',
      'result': '123',
      'percentage': '+8.2%',
    },
    {
      'icon': Icons.star_outline_rounded,
      'headline': 'Satisfied Patients',
      'result': '98%',
      'percentage': '+2.1%',
    },
  ];

  final List<String> directory = ['All', 'New', 'In Treatment', 'Follow up'];

  final List<Map<String, dynamic>> patientsMockData = [
    {
      'name': 'Marcus Williams',
      'number': '+123456789001',
      'info': '34F | A+ | July, 27, 2026',
      'status': 'Follow up',
      'image':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
    },
    {
      'name': 'Sarah Jenkins',
      'number': '+123456789002',
      'info': '28F | O+ | August, 12, 2026',
      'status': 'New Patient',
      'image':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
    },
    {
      'name': 'David Chen',
      'number': '+123456789003',
      'info': '45M | B- | June, 05, 2026',
      'status': 'Admitted',
      'image':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150',
    },
    {
      'name': 'Elena Rostova',
      'number': '+123456789004',
      'info': '52F | AB+ | August, 20, 2026',
      'status': 'Recovered',
      'image':
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150',
    },
    {
      'name': 'Michael Brown',
      'number': '+123456789005',
      'info': '39M | A- | May, 19, 2026',
      'status': 'Follow up',
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    },
    {
      'name': 'Amira Al-Mansoor',
      'number': '+123456789006',
      'info': '24F | O- | August, 01, 2026',
      'status': 'Pending Lab',
      'image':
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
    },
    {
      'name': 'James Wilson',
      'number': '+123456789007',
      'info': '61M | B+ | July, 14, 2026',
      'status': 'Critical',
      'image':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=150',
    },
    {
      'name': 'Sophia Martinez',
      'number': '+123456789008',
      'info': '29F | A+ | August, 18, 2026',
      'status': 'New Patient',
      'image':
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150',
    },
    {
      'name': 'Robert Taylor',
      'number': '+123456789009',
      'info': '48M | AB- | April, 11, 2026',
      'status': 'Discharged',
      'image':
          'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=150',
    },
    {
      'name': 'Emma Thompson',
      'number': '+123456789010',
      'info': '31F | O+ | August, 22, 2026',
      'status': 'Follow up',
      'image':
          'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget headline(String headline) {
      return Text(headline, style: AppTextStyle.heading);
    }

    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 20,
              children: [
                Custamappbarallpage(maintext: 'Patient List', showBackButton: false),
                Custamsearche(),
                AppointmentNew(),
                headline('Statistics'),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: metricsData
                      .map(
                        (element) => HealthOverviewCard(
                          icon: element['icon'],
                          headline: element['headline'],
                          result: element['result'],
                          percentage: element['percentage'],
                        ),
                      )
                      .toList(),
                ),
                headline('Patient Directory'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 16,
                    children: directory
                        .map(
                          (element) => ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              element,
                              style: AppTextStyle.textstyle12,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                Column(
                  children: patientsMockData.map(
                    (element) => PatientDirectory(
                      name: element['name'],
                      number: element['number'],
                      info: element['info'],
                      status: element['status'],
                      image: element['image'],
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PatientInfoDetail(
                              patientName: element['name'] as String,
                              patientImage: element['image'] as String,
                              patientInfo: element['info'] as String,
                              patientStatus: element['status'] as String,
                            ),
                          ),
                        );
                      },
                    ),
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
