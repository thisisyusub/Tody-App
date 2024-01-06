import 'package:flutter/foundation.dart';

class CounterNotifier extends ChangeNotifier {
  int counter = 0;
  String message = 'Hello';

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }

  void changeMessage() {
    message = 'Goodbye';
    notifyListeners();
  }
}
