import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final Widget? card;
  final NullableIndexedWidgetBuilder? itemBuilder;
  final int itemCount;

  const AppListView({
    super.key,
    this.card,
    this.itemBuilder,
    required this.itemCount,
  }) : assert(card != null || itemBuilder != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder ?? (context, index) => card!,
    );
  }
}
