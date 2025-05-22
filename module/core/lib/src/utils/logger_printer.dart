import 'package:logger/logger.dart';

/// Provides a custom output format for the Logger library.
/// It displays only the message and, if available, the error/stackTrace.
class CustomPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final message = event.message.toString();
    final error = event.error != null ? 'Error: ${event.error}' : '';
    final stackTrace = event.stackTrace != null ? 'StackTrace: ${event.stackTrace}' : '';

    return [
      '${event.level.toString().toUpperCase().split('.').last}: $message',
      if (error.isNotEmpty) error,
      if (stackTrace.isNotEmpty) stackTrace,
    ];
  }
}
