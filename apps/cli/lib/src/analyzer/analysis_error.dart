import 'package:celest_cli/src/context.dart';
import 'package:source_span/source_span.dart';

typedef AnalysisErrorReporter =
    void Function(
      String message, {
      AnalysisErrorSeverity? severity,
      FileSpan? location,
    });

enum AnalysisErrorSeverity { error, warning, info, debug }

final class CelestAnalysisError {
  const CelestAnalysisError({
    AnalysisErrorSeverity? severity,
    required this.message,
    required this.location,
  }) : severity = severity ?? AnalysisErrorSeverity.error;

  final AnalysisErrorSeverity severity;
  final String message;
  final SourceSpan? location;

  @override
  String toString() {
    if (location case SourceSpan(sourceUrl: != null) && final location) {
      return location.debugHighlight(message);
    }
    return message;
  }
}

extension SourceSpanDump on SourceSpan {
  String debugHighlight(String message) {
    // Better `SourceLocation.message` implementation which makes URIs
    // clickable in VSCode terminal.
    final uri = p.prettyUri(sourceUrl);
    final line = start.line + 1;
    final column = start.column + 1;
    final buffer = StringBuffer()..write('$uri:$line:$column: $message');
    final highlight = this.highlight();
    if (highlight.isNotEmpty) {
      buffer
        ..writeln()
        ..write(highlight);
    }
    return buffer.toString();
  }
}
