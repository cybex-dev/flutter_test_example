import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_example/components/components.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (BuildContext context) => Counter(),
      child: _Page(pageTitle: title),
    );
  }
}

class _Page extends StatelessWidget {
  final String pageTitle;

  const _Page({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: const [
          _ChangeLocale(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            _CounterText(),
          ],
        ),
      ),
      floatingActionButton: const _FAB(),
    );
  }
}

class _ChangeLocale extends StatelessWidget {
  const _ChangeLocale({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Localization>(
      builder: (context, value, child) {
        final popupItems = value.supportedLocales.map((locale) {
          return PopupMenuItem<Locale>(
            value: locale,
            child: Text(locale.languageCode),
          );
        }).toList();

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Change locale"),
            const SizedBox(width: 10),
            PopupMenuButton<Locale>(
              child: Text(value.currentLocale.languageCode),
              onSelected: (locale) {
                context.read<Localization>().currentLocale = locale;
              },
              itemBuilder: (_) => popupItems,
            ),
          ],
        );
      },
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.headlineMedium;
    return Consumer<Counter>(
      builder: (context, value, child) {
        final text = AppLocalizations.of(context)!.pressedText(value.value);
        return Text(
          text,
          style: style,
        );
      },
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.read<Counter>();
    return FloatingActionButton(
      onPressed: () => counter.increment(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
