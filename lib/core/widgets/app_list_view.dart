import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final Widget? card;
  final NullableIndexedWidgetBuilder? itemBuilder;
  final int itemCount;
  final double spacing;

  const AppListView({
    super.key,
    this.card,
    this.itemBuilder,
    required this.itemCount,
    this.spacing = 0,
  }) : assert(card != null || itemBuilder != null);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder ?? (context, index) => card!,
      separatorBuilder: (context, index) => SizedBox(height: spacing),
    );
  }
}
