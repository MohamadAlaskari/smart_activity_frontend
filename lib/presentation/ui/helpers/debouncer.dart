import 'dart:async';

class Debouncer {
  final int milliSeconds;
  Timer? _timer;

  Debouncer({required this.milliSeconds});

  void call(Function() action) {
    dispose();
    _timer = Timer(Duration(milliseconds: milliSeconds), action);
  }

  void dispose() => _timer?.cancel();
}