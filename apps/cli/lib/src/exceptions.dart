final class CancellationException implements Exception {
  const CancellationException([this.message = '']);

  final String message;

  @override
  String toString() => 'CancellationException: $message';
}
