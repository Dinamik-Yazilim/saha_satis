import 'package:logger/logger.dart';
import 'package:core/src/utils/logger_printer.dart';
import 'package:core/src/utils/logger_output.dart' as console_output;

/// Logging class to be used throughout the application.
/// Customizes and simplifies the use of the Logger library.
class AppLogger {
  static bool enableInfo = true;
  static bool enableError = true;
  static bool enableWarning = true;
  static bool enableDebug = true;
  static bool enableVerbose = true;
  static bool enableFatal = true;

  static final Logger _logger = Logger(
    filter: ProductionFilter(),
    printer: CustomPrinter(),
    output: console_output.ConsoleOutput(),
  );

  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (enableInfo) _logger.i(message, error: error, stackTrace: stackTrace);
  }

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (enableError) _logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (enableWarning) _logger.w(message, error: error, stackTrace: stackTrace);
  }

  static void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (enableDebug) _logger.d(message, error: error, stackTrace: stackTrace);
  }

  static void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (enableVerbose) _logger.t(message, error: error, stackTrace: stackTrace);
  }

  static void fatal(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (enableFatal) _logger.f(message, error: error, stackTrace: stackTrace);
  }

  static void disableAll() {
    enableInfo = false;
    enableError = false;
    enableWarning = false;
    enableDebug = false;
    enableVerbose = false;
    enableFatal = false;
  }

  static void enableAll() {
    enableInfo = true;
    enableError = true;
    enableWarning = true;
    enableDebug = true;
    enableVerbose = true;
    enableFatal = true;
  }
}
