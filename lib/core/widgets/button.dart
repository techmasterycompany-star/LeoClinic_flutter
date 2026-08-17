import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final  void Function() onPressed;
  final Color backgroundcolor;
  final Color foregroundcolor;
  final double ? width;
  const Button({super.key, required this.label, required this.onPressed, required this.backgroundcolor,this.width,  required this.foregroundcolor, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          foregroundColor: foregroundcolor,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}