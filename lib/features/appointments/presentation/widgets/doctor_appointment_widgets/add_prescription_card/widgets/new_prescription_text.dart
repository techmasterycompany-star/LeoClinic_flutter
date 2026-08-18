import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class NewPrescriptionText extends StatelessWidget {
  const NewPrescriptionText({
    super.key,
    required TextEditingController numberController,
  }) : _numberController = numberController;

  final TextEditingController _numberController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _numberController,
      keyboardType: TextInputType.number,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: "Enter diagnosis",
        hintStyle: TextStyle(color: AppColors.secondaryColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}