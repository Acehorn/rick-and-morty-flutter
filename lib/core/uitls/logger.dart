import 'dart:developer';

class AppLogger {
  static void logInfo(String message) {
    log('[INFO] $message');
  }

  static void logError(String message) {
    log('[ERROR] $message');
  }
}
