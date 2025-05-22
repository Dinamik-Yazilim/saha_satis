import 'package:logger/logger.dart';
import 'package:core/src/utils/logger_printer.dart';
import 'package:core/src/utils/logger_output.dart' as console_output;

/// Logging class to be used throughout the application.
/// Customizes and simplifies the use of the Logger library.
class AppLogger {
  static final Logger _logger = Logger(
    filter: ProductionFilter(), // Hides debug and verbose logs in production
    printer: CustomPrinter(), // Uses a custom output format
    output: console_output.ConsoleOutput(), // Outputs to the console
  );

  /// Writes informational log messages.
  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Writes error log messages.
  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Writes warning log messages.
  static void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Writes debug log messages.
  static void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Writes verbose log messages.
  static void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Writes fatal log messages.
  static void fatal(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}
