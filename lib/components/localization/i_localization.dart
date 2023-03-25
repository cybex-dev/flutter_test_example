import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class ILocalization {
  Locale get defaultLocale;

  Locale get currentLocale;

  set currentLocale(Locale locale);

  void updateLocaleCode(String code);

  List<Locale> get supportedLocales;

  AppLocalizations getLocalization(BuildContext context);

  AppLocalizations getLocalizationFromCurrentLocale({Locale? overrideLocale});
}
