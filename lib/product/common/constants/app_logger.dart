import 'package:logger/logger.dart';

final class AppLogger {
  static final Logger _logger = Logger();

  // Loglama fonksiyonu
  static void log(String message, {LoggerLevel level = LoggerLevel.debug, bool enable = true}) {
    if (!enable) return;

    switch (level) {
      case LoggerLevel.trace:
        _logger.t(message);
        break;
      case LoggerLevel.info:
        _logger.i(message);
        break;
      case LoggerLevel.error:
        _logger.e(message);
        break;
      case LoggerLevel.debug:
        _logger.d(message);
        break;
    }
  }
}

enum LoggerLevel { trace, info, error, debug }
