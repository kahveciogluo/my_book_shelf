import 'dart:async';
import 'package:flutter/material.dart';

class SearchAction {
  late Duration duration;
  late VoidCallback action;
  late Timer? _timer = Timer(Duration.zero, () {});

  SearchAction({required this.duration});

  void run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(duration, action);
  }
}
