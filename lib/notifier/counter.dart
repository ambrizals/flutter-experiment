import 'package:flutter/widgets.dart';

class CounterNotifier with ChangeNotifier {
  late int number;
  int count = 0;

  CounterNotifier(int number) {
    this.number = number;
  }

  void increase() {
    count = count + this.number;
    notifyListeners();
  }

  void decrease() {
    count = count - this.number;
    notifyListeners();
  }
}
