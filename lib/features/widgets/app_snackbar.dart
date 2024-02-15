import 'package:flutter/material.dart';

class AppSnackBar {
  static SnackBar snackBar({
    required String message,
    Color? backgroundColor,
  }) {
    return SnackBar(
      content: Text(message,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold)),
      backgroundColor: backgroundColor ?? Colors.blueGrey,
    );
  }
}
