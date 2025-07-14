import 'dart:async';

import 'package:flutter/cupertino.dart';

class DebouncerServices {
  final Duration duration;

  DebouncerServices(this.duration);

  VoidCallback? action;
  Timer? _timer;
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(duration, action);
  }

  void cancel() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }
}
