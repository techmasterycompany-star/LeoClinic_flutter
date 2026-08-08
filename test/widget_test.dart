import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:leoclinic_flutter/main.dart';

void main() {
  testWidgets('shows the doctor bottom navigation', (tester) async {
    // await tester.pumpWidget(const MyApp());

    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
    expect(find.byIcon(Icons.medical_services_outlined), findsOneWidget);
    expect(find.byIcon(Icons.group_outlined), findsOneWidget);
    expect(find.byIcon(Icons.self_improvement_outlined), findsOneWidget);
    expect(find.byIcon(Icons.chat_bubble_outline_rounded), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
