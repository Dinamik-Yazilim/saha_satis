/// A general error that occurs during database operations.
class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);

  @override
  String toString() => 'DatabaseException: $message';
}

/// An error indicating an invalid model type.
class InvalidModelException implements Exception {
  final String message;
  InvalidModelException(this.message);

  @override
  String toString() => 'InvalidModelException: $message';
}
