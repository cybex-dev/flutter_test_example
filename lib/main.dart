import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_example/components/components.dart';
import 'package:flutter_test_example/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Localization>(
      create: (_) => Localization(),
      child: const _MyApp(),
    );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Localization>(
      builder: (context, localization, child) {
        print("_MyApp (build) Locale: ${localization.currentLocale}");
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => localization.getLocalization(context).appTitle,
          title: 'Flutter Demo',
          locale: localization.currentLocale,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
