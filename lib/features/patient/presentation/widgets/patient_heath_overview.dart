import 'package:flutter/material.dart';

class HealthOverviewCard extends StatelessWidget {
  final IconData icon;
  const HealthOverviewCard({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // The icon and the measurement
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(83, 244, 67, 54),
                ),
                child: Icon(icon),
              ),

              SizedBox(width: 10),

              // The measurement
              Text(
                'numbers',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          Container(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // The health info
                Text(
                  'Pluse',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                // The result of health info
                Text(
                  'Regular',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
