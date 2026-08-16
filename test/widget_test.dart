import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/pages/doctor_main.dart';

void main() {
  testWidgets('shows the doctor bottom navigation', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DoctorMainScreen()));

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
