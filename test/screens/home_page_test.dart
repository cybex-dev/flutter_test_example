import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/components/components.dart';
import 'package:flutter_test_example/main.dart';
import 'package:flutter_test_example/screens/screens.dart';
import 'package:provider/provider.dart';

main() {
  group("Home Page", () {
    testWidgets("Home Page Increment", (tester) async {
      await tester.pumpWidget(const MyApp());

      final BuildContext context = tester.element(find.byType(HomePage));
      final AppLocalizations localizationsEnglish = context.read<Localization>().getLocalization(context);
      expect(find.text(localizationsEnglish.pressedText(0)), findsOneWidget);
      expect(find.text(localizationsEnglish.pressedText(1)), findsNothing);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.text(localizationsEnglish!.pressedText(0)), findsNothing);
      expect(find.text(localizationsEnglish!.pressedText(1)), findsOneWidget);
    });
  });
}
