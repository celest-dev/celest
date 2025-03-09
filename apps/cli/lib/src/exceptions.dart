final class CliException implements Exception {
  const CliException(this.message, {this.additionalContext});

  final String message;
  final Map<String, String>? additionalContext;

  @override
  String toString() {
    final buffer = StringBuffer(message);
    if (additionalContext != null) {
      buffer
        ..writeln()
        ..writeln('Additional context:');
      for (final entry in additionalContext!.entries) {
        buffer.writeln('${entry.key}: ${entry.value}');
      }
    }
    return buffer.toString();
  }
}

final class CancellationException implements Exception {
  const CancellationException([this.message = '']);

  final String message;

  @override
  String toString() => 'CancellationException: $message';
}
