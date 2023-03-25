import 'package:flutter/material.dart';
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            _CounterText(),
          ],
        ),
      ),
      floatingActionButton: const _FAB(),
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
        return Text(
          value.value.toString(),
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
