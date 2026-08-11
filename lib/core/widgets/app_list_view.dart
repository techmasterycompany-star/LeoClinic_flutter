import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final Widget card;
  final int itemCount;

  const AppListView({super.key, required this.card, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => card,
    );
  }
}
