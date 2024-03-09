// By convention, any custom exception types thrown by an API must be defined
// in this file or exported from this file.

class BadNameException implements Exception {
  const BadNameException(this.message);

  final String message;

  @override
  String toString() => 'BadNameException: $message';
}
