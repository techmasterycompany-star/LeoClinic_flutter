import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/widgets/app_greeting.dart';
import 'package:leoclinic_flutter/core/widgets/app_notification_button.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/pages/Notifications.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: const AppGreeting(),
      actions: [
        AppNotificationButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const Notifications()),
            );
          },
        ),
      ],
    );
  }
}
