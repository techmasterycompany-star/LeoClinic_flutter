import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/actions_for_cards.dart';

class _DayTab {
  final String title;
  final String subtitle;
  final List<String> slots;
  

  const _DayTab({
    required this.title,
    required this.subtitle,
    required this.slots,
  });
}

class BookASlot extends StatefulWidget {
    final void Function() onPressedOfBlueAcion;
  final void Function() onPressedOfLightBlueAcion;
  const BookASlot({super.key, required this.onPressedOfBlueAcion, required this.onPressedOfLightBlueAcion});

  @override
  State<BookASlot> createState() => _BookASlotState();
}

class _BookASlotState extends State<BookASlot> {
  final List<_DayTab> _days = const [
    _DayTab(title: 'Today', subtitle: 'No slots', slots: []),
    _DayTab(
      title: 'Tomorrow',
      subtitle: '10 Feb Tuseday',
      slots: ['09:00 AM', '09:00 AM', '09:00 AM', '09:00 AM'],
    ),
    _DayTab(
      title: '11 Feb Tuseday',
      subtitle: '10 slots avaliable',
      slots: ['09:00 AM', '09:30 AM', '10:00 AM', '10:30 AM', '11:00 AM'],
    ),
  ];

  int _selectedDayIndex = 1;
  String? _selectedSlot;

  void _selectDay(int index) {
    setState(() {
      _selectedDayIndex = index;
      _selectedSlot = null;
    });
  }

  void _selectSlot(String slot) {
    setState(() => _selectedSlot = slot);
  }

  @override
  Widget build(BuildContext context) {
    final currentDay = _days[_selectedDayIndex];

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Book a slot",
            style: AppTextStyle.textstyle16.copyWith(
              color: AppColors.surfaceDark,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: List.generate(_days.length, (index) {
              final day = _days[index];
              final isSelected = index == _selectedDayIndex;

              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _selectDay(index),
                  child: Column(
                    children: [
                      Text(
                        day.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textstyle14.copyWith(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.surfaceDark,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        day.subtitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textstyle12.copyWith(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 2,
                        width: double.infinity,
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const Divider(height: 1),
          const SizedBox(height: 16),

          if (currentDay.slots.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'No slots available for this day',
                style: AppTextStyle.textstyle14.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            )
          else
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: currentDay.slots.map((slot) {
                final isSelected = slot == _selectedSlot;

                return GestureDetector(
                  onTap: () => _selectSlot(slot),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      slot,
                      style: AppTextStyle.textstyle14.copyWith(
                        color: isSelected
                            ? Colors.white
                            : AppColors.surfaceDark,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          const SizedBox(height: 20),
          ActionsForCards(
            showiconLightbutton: false,
            showiconDarkbutton: false,
            labelOfBlueAction: 'Canclled',
            labelOflightblueAction: 'Confirm',
            onPressedOfBlueAcion: widget.onPressedOfLightBlueAcion,
            onPressedOfLightBlueAcion: widget.onPressedOfBlueAcion,
            blueBackground: AppColors.secondaryColor,
            lightBlueBackground: AppColors.primaryColor,
            foregroundForblueBackground: AppColors.primaryColor,
            foregroundForLightblueBackground: AppColors.background,
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
