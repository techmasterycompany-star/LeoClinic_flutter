import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final Widget card;
  final int itemCount;
  const MyListView({super.key, required this.card, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // TODO: Item count should be by next appointment length
      itemCount: 3,
      itemBuilder: (context, index) {
        return card;
      },
    );
  }
}
