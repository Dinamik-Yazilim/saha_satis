import 'dart:developer' as developer;
import 'package:logger/logger.dart';

/// Provides console output for the Logger library.
/// Offers better IDE integration by using the `dart:developer` library.
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      developer.log(line, name: 'OkeanosCoreLogger');
    }
  }
}
