import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/components/components.dart';

void main() {
  group("Localization Tests", () {
    test("Default Localization() locale should be 'en' with country code 'US'", () {
      final localizations = Localization();
      expect(localizations.currentLocale.languageCode, 'en');
      expect(localizations.currentLocale.countryCode, 'US');
    });

    test("Localization.fromLocale(DE) locale should be 'de' with country code 'DE'", () {
      final localizations = Localization.fromLocale(const Locale('de', 'DE'));
      expect(localizations.currentLocale.languageCode, 'de');
      expect(localizations.currentLocale.countryCode, 'DE');
    });

    test("Localization.fromLocaleString(es_ES) locale should be 'es' with country code 'ES'", () {
      final localizations = Localization.fromLocaleString('es_ES');
      expect(localizations.currentLocale.languageCode, 'es');
      expect(localizations.currentLocale.countryCode, 'ES');
    });

    test("Localization.fromPlatform() locale should be '${Platform.localeName}' and country code empty", () {
      final localizations = Localization.fromPlatform();
      expect(localizations.currentLocale.languageCode, Platform.localeName.split('_').first);
      expect(localizations.currentLocale.countryCode, Platform.localeName.split('_').last);
    });

    test("Update with 'de_DE' and expect current locale should be 'de_DE'", () {
      final localizations = Localization();
      localizations.updateLocaleCode('de_DE');
      expect(localizations.currentLocale.languageCode, 'de');
      expect(localizations.currentLocale.countryCode, 'DE');
    });

    test("Set new locale with 'de_DE' and expect default locale should be 'de' with countryCode = 'DE'", () {
      final localizations = Localization();
      localizations.currentLocale = const Locale('de', 'DE');
      expect(localizations.currentLocale.languageCode, 'de');
      expect(localizations.currentLocale.countryCode, 'DE');
    });
  });
}
