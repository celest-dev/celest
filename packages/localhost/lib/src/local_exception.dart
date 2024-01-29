final class LocalException implements Exception {
  const LocalException(this.message);

  final String message;

  @override
  String toString() => 'LocalException: $message';
}
