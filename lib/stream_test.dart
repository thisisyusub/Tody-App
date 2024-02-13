import 'dart:async';

import 'package:rxdart/subjects.dart';

void main() {
  final controller = ReplaySubject<int>();

  controller.addError('Error!');
  controller.add(5);

  controller.stream.listen(
    (event) {
      print('first: $event');
    },
    onError: (error) {
      print('first: $error');
    },
  );

  controller.add(10);
  controller.add(11);
  controller.add(12);

  controller.stream.listen(
    (event) {
      print('second: $event');
    },
    onError: (error) {
      print('second: $error');
    },
  );

  controller.add(20);
}
