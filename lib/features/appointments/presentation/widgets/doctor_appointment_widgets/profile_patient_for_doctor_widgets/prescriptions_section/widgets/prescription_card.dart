import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';

class PrescriptionCard extends StatelessWidget {
  final String title;
  final String date;
  final List<String> items;
  final ValueChanged<List<String>>? onItemsAdded;
  final void Function() onPressed;

  const PrescriptionCard({
    super.key,
    required this.title,
    required this.date,
    required this.items,
    this.onItemsAdded, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const Color lightBlueBg = Color(0xFFEAF0FE);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightBlueBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child:SizedBox(
                  child: SvgPicture.asset("assets/icons/validation-approval-for-prescription.svg",height: 16,width: 16,))
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined,
                          size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 6),
                      Text(
                        date,
                        style: TextStyle(fontSize: 14, color:AppColors.textSecondary ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),
          Divider(color: AppColors.border, thickness: 1),
          const SizedBox(height: 16),

          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: items
                .map(
                  (item) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(left: 6),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        item,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Button(label: "Add Prescriptions", onPressed:  onPressed,)
          ),
        ],
      ),
    );
  }
}