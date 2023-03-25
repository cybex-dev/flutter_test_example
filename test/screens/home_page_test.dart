import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/main.dart';

main() {
  group("Home Page", () {
    testWidgets("Home Page Increment", (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text("0"), findsOneWidget);
      expect(find.text("1"), findsNothing);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.text("0"), findsNothing);
      expect(find.text("1"), findsOneWidget);
    });
  });
}
