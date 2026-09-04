import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/utils/pref-helper.dart';

class AppGreeting extends StatefulWidget {
  const AppGreeting({super.key});

  @override
  State<AppGreeting> createState() => _AppGreetingState();
}

class _AppGreetingState extends State<AppGreeting> {
  String _userName = '';
  String _greeting = 'Good Morning';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final name = await Prefhelper.getUserName();
    final hour = DateTime.now().hour;

    String greeting;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    if (mounted) {
      setState(() {
        _userName = name ?? '';
        _greeting = greeting;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _greeting,
            style: AppTextStyle.secondarytext,
          ),
          Text(
            _userName,
            style: AppTextStyle.textstyle14,
          ),
        ],
      ),
    );
  }
}
