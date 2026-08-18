import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class NumberOfPrescriptionField extends StatelessWidget {
  const NumberOfPrescriptionField({
    super.key,
    required TextEditingController numberController,
  }) : _numberController = numberController;

  final TextEditingController _numberController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _numberController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "1",
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