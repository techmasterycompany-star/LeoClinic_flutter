import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/custom_text_style.dart';

class Acceptbottam extends StatelessWidget {
  final String text;
  final Color textcolor;
  final Color backgroundcolor;
  final IconData icon;
  final Color iconcolor;
  const Acceptbottam({
    super.key,
    required this.text,
    required this.textcolor,
    required this.backgroundcolor,
    required this.icon,
    required this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconcolor),
          Text(text, style: Custamtextstyle.test14.copyWith(color: textcolor)),
        ],
      ),
    );
  }
}
