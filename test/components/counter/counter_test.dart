import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/components/components.dart';

void main() {
  group("Counter Tests", () {
    test("Value should be 0", () {
      const initial = 0;
      final counter = Counter(value: initial);
      expect(counter.value, initial);
    });

    test("Counter increment, should be 1", () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test("Counter decrement, should be -1", () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
