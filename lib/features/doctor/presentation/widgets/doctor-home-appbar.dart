import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/custam-Textstyle.dart';

class Doctorhomeappbar extends StatelessWidget {
  const Doctorhomeappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning", style: Custamtextstyle.test12),
              Text("Dr. Sarah Legend", style: Custamtextstyle.test18),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Container(
              width: 33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),

              child: Icon(
                Icons.notifications_none_outlined,
                color: Color(0xff0018A6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
