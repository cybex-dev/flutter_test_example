import 'package:flutter/widgets.dart';

class Counter with ChangeNotifier {
  late int value;

  Counter({this.value = 0}) {
    notifyListeners();
  }

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}
