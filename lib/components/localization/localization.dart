import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'i_localization.dart';

class Localization extends ILocalization with ChangeNotifier {
  late Locale _locale;

  Localization({String defaultLocaleCode = "en", String defaultCountryCode = "US"}) {
    currentLocale = Locale(defaultLocaleCode, defaultCountryCode);
  }

  Localization.fromPlatform() {
    currentLocale = defaultLocale;
  }

  Localization.fromLocaleString(String localeString) {
    updateLocaleCode(localeString);
  }

  Localization.fromLocale(Locale locale) {
    currentLocale = locale;
  }

  @override
  Locale get currentLocale => _locale;

  @override
  Locale get defaultLocale => getLocaleFromLocaleString(Platform.localeName);

  @override
  set currentLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  @override
  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  @override
  AppLocalizations getLocalization(BuildContext context) => AppLocalizations.of(context)!;

  @override
  AppLocalizations getLocalizationFromCurrentLocale({Locale? overrideLocale}) {
    return lookupAppLocalizations(overrideLocale ?? currentLocale);
  }

  @override
  void updateLocaleCode(String code) {
    _locale = getLocaleFromLocaleString(code);
    notifyListeners();
  }

  Locale getLocaleFromLocaleString(String code) {
    assert(code.isNotEmpty);
    final array = code.split("_");
    if (array.isEmpty) {
      return const Locale("en");
    }
    String locale = array.first;
    String? country = "";
    if (array.length > 1) {
      country = array.last;
    }
    return Locale(locale, country);
  }
}
