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

    testWidgets("Home Page Change Language: English to Spanish", (tester) async {
      await tester.pumpWidget(const MyApp());

      AppLocalizations localizationsEnglish = getLocalizations(tester, locale: const Locale("en"));
      AppLocalizations localizationsSpanish = getLocalizations(tester, locale: const Locale("es"));
      expect(find.text(localizationsSpanish.pressedText(0)), findsNothing);
      expect(find.text(localizationsEnglish.pressedText(0)), findsOneWidget);

      final popupMenuButton = find.byType(PopupMenuButton<Locale>);
      expect(popupMenuButton, findsOneWidget);
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();

      for (var locale in AppLocalizations.supportedLocales) {
        expect(find.widgetWithText(PopupMenuItem<Locale>, locale.languageCode), findsOneWidget);
      }

      await tester.tap(find.text("es"));
      await tester.pumpAndSettle();

      expect(find.text(localizationsSpanish.pressedText(0)), findsOneWidget);
      expect(find.text(localizationsEnglish.pressedText(0)), findsNothing);
    });
  });
}

AppLocalizations getLocalizations(WidgetTester t, {Locale? locale}) {
  final BuildContext context = t.element(find.byType(HomePage));
  return context.read<Localization>().getLocalizationFromCurrentLocale(overrideLocale: locale);
}
