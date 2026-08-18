import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/actions_for_cards.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/pick_a_slot_widgets/book_a_slot_items/day_a_slot.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/pick_a_slot_widgets/book_a_slot_items/time_a_slot.dart';

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
  const BookASlot({
    super.key,
    required this.onPressedOfBlueAcion,
    required this.onPressedOfLightBlueAcion,
  });

  @override
  State<BookASlot> createState() => _BookASlotState();
}

class _BookASlotState extends State<BookASlot> {
  final List<_DayTab> _days = const [
    _DayTab(title: 'Today', subtitle: 'No slots', slots: []),
    _DayTab(
      title: 'Tomorrow',
      subtitle: '3 slots avaliable',
      slots: ['09:00 AM', '09:00 AM', '09:00 AM', '09:00 AM'],
    ),
    _DayTab(
      title: '11 Feb Tuseday',
      subtitle: '10 slots avaliable',
      slots: ['09:00 AM', '09:30 AM', '10:00 AM', '10:30 AM', '11:00 AM'],
    ),
    _DayTab(
      title: '12 Feb Wednesday',
      subtitle: '5 slots avaliable',
      slots: ['09:00 AM', '09:30 AM', '10:00 AM', '10:30 AM', '11:00 AM'],
    ),
    _DayTab(title: '13 Feb Thursday', subtitle: 'No slots', slots: []),
    _DayTab(
      title: '14 Feb Friday',
      subtitle: '8 slots avaliable',
      slots: [
        '08:00 AM',
        '08:30 AM',
        '09:00 AM',
        '09:30 AM',
        '10:00 AM',
        '10:30 AM',
        '11:00 AM',
        '11:30 AM',
      ],
    ),
    _DayTab(
      title: '15 Feb Saturday',
      subtitle: '3 slots avaliable',
      slots: ['09:00 AM', '09:30 AM', '10:00 AM'],
    ),
  ];

  int _selectedDayIndex = 1;
  String? _selectedSlot;

  List<String> get currentSlots => _days[_selectedDayIndex].slots;

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

          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _days.length,
              itemBuilder: (context, index) {
                final day = _days[index];
                final isSelected = index == _selectedDayIndex;

                return Padding(
                  padding: EdgeInsets.only(
                    right: index == _days.length - 1 ? 0 : 24,
                  ),
                  child: DaySlot(
                    title: day.title,
                    subtitle: day.subtitle,
                    isSelected: isSelected,
                    onTap: () => _selectDay(index),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          const SizedBox(height: 16),

          if (currentSlots.isEmpty)
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
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: currentSlots.length,
                itemBuilder: (context, index) {
                  final slot = currentSlots[index];
                  final isSelected = slot == _selectedSlot;

                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == currentSlots.length - 1 ? 0 : 12,
                    ),
                    child: TimeSlot(
                      time: slot,
                      isSelected: isSelected,
                      onTap: () => _selectSlot(slot),
                    ),
                  );
                },
              ),
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
