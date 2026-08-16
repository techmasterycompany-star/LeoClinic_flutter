import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';

class DetailsOfPatientCard extends StatelessWidget {
  const DetailsOfPatientCard({
    super.key,
    required this.age,
    required this.phone,
    required this.city,
  });

  final int age;
  final String phone;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.person_outline, color: Colors.white70, size: 16),
        const SizedBox(width: 4),
        Text(
          'Age: $age',
          style: AppTextStyle.textstyle12.copyWith(color: Colors.white),
        ),

        const SizedBox(width: 8),
        Container(width: 1, height: 14, color: Colors.white38),
        const SizedBox(width: 8),

        const Icon(Icons.phone_outlined, color: Colors.white70, size: 16),
        const SizedBox(width: 4),
        Text(
          phone,
          style: AppTextStyle.textstyle12.copyWith(color: Colors.white),
        ),

        const SizedBox(width: 8),
        Container(width: 1, height: 14, color: Colors.white38),
        const SizedBox(width: 8),

        const Icon(Icons.location_on_outlined, color: Colors.white70, size: 16),
        const SizedBox(width: 4),
        Text(
          city,
          style: AppTextStyle.textstyle12.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
