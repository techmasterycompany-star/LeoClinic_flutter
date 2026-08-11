import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class AppointmentFilterSection extends StatefulWidget {
  final String section1;
  final String section2;
  final String section3;
  const AppointmentFilterSection({
    super.key,
    required this.section1,
    required this.section2,
    required this.section3,
  });

  @override
  State<AppointmentFilterSection> createState() =>
      _AppointmentFilterSectionState();
}

class _AppointmentFilterSectionState extends State<AppointmentFilterSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> filters = [widget.section1, widget.section2, widget.section3,];
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 25),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          itemBuilder: (context, index) {
            final bool isSelected = selectedIndex == index;
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(51),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: isSelected ? AppColors.selected : AppColors.unselected,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.selected
                          : const Color.fromARGB(255, 238, 238, 238),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    filters[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade700,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}