// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:module_14/main.dart';

void main() {
  testWidgets('App loads with a title', (WidgetTester tester) async {
    // Mock Firebase initialization would be needed for a real test
    // This is just a simple test to verify app structure

    // Build our app and trigger a frame
    await tester.pumpWidget(const App());

    // Verify that our app has the correct title in MaterialApp
    expect(find.text('FlutterChat'), findsOneWidget);
  });
}
