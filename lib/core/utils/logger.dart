import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static void log(String message, {String tag = 'APP'}) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('[$tag] $message');
    }
  }

  static void error(String message, {String tag = 'ERROR'}) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('[$tag] ❌ $message');
    }
  }
}
