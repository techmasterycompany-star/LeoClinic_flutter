import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  static T value<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
  }) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 600) return tablet;
    return mobile;
  }
}