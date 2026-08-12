import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/responsive.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: Responsive.value<double>(context, mobile: 14, tablet: 16),
      ),
      decoration: InputDecoration(
        hintText: "Search..",
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: Responsive.value<double>(context, mobile: 14, tablet: 16),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade400,
          size: Responsive.value<double>(context, mobile: 22, tablet: 26),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          vertical: Responsive.value<double>(context, mobile: 14, tablet: 18),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Responsive.value<double>(context, mobile: 12, tablet: 14),
          ),
          borderSide: BorderSide(
            color: Color(0xffDFE1E6),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Responsive.value<double>(context, mobile: 12, tablet: 14),
          ),
          borderSide: BorderSide(
            color: Color(0xffDFE1E6),
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Responsive.value<double>(context, mobile: 12, tablet: 14),
          ),
          borderSide: BorderSide(
            color: Color(0xffDFE1E6),
            width: 1,
          ),
        ),
      ),
    );
  }
}