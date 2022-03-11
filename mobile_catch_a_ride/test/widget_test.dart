import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_catch_a_ride/main.dart';

void main() {
  testWidgets('Test testing widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Catch A Ride'), findsOneWidget);

    expect(find.text('Welcome'), findsNothing);
    expect(find.text('Catch-A-Ride'), findsNothing);
    expect(find.text('Profile'), findsNothing);
    expect(find.text('Help'), findsNothing);
  });

  testWidgets('Test NavMenu Population (Titles and Icons)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.dragFrom(tester.getTopLeft(find.byType(MaterialApp)), Offset(300, 0));
    await tester.pumpAndSettle();

    expect(find.text("Henry Wessels"), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsNWidgets(2));
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.byIcon(Icons.input), findsOneWidget);
    expect(find.text('Catch-A-Ride'), findsOneWidget);
    expect(find.byIcon(Icons.directions_car_rounded), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.byIcon(Icons.verified_user), findsOneWidget);
    expect(find.text('Help'), findsOneWidget);
    expect(find.byIcon(Icons.help_center_rounded), findsOneWidget);
  });
}
