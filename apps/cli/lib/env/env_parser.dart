// Copied from:
// https://github.com/petercinibulk/envied/blob/79c204367be5bdfc4ad5939006b086dbaf557ed0/packages/envied_generator/lib/src/parser.dart

import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:source_span/source_span.dart';

typedef EnvValue = ({
  String key,
  String value,
  int start,
  int end,
});

/// Creates key-value pairs from strings formatted as environment
/// variable definitions.
final class EnvParser {
  EnvParser({
    required this.source,
    required this.sourceUri,
  });

  static const String _singleQuot = "'";
  static final RegExp _leadingExport = RegExp(r'''^ *export ?''');
  static final RegExp _comment = RegExp(r'''#[^'"]*$''');
  static final RegExp _commentWithQuotes = RegExp(r'''#.*$''');
  static final RegExp _surroundQuotes = RegExp(r'''^(["'])(.*?[^\\])\1''');
  static final RegExp _bashVar =
      RegExp(r'''(\\)?(\$)(?:{)?([a-zA-Z_][\w]*)+(?:})?''');

  final String source;
  final Uri sourceUri;

  var _offset = 0;

  late final SourceFile _sourceFile = SourceFile.fromString(
    source,
    url: sourceUri,
  );

  final Map<String, String> env = {};
  final Map<String, FileSpan> spans = {};

  // TODO(dnys1): Record errors parsing instead of returning null.
  final List<CelestAnalysisError> errors = [];

  /// Creates a [Map](dart:core).
  /// Duplicate keys are silently discarded.
  Map<String, String> parse() {
    for (var i = 0; i < _sourceFile.lines; i++) {
      _offset = _sourceFile.getOffset(i);
      final line = _sourceFile.getText(
        _offset,
        i + 1 < _sourceFile.lines ? _sourceFile.getOffset(i + 1) : null,
      );
      final kv = parseOne(line);
      if (kv case (:final key, :final value, :final start, :final end)) {
        final span = _sourceFile.span(
          _offset + start,
          _offset + end,
        );
        env.update(
          key,
          (_) {
            errors.add(
              CelestAnalysisError(
                message: 'Duplicate key: $key',
                location: span,
              ),
            );
            return value;
          },
          ifAbsent: () => value,
        );
        spans.putIfAbsent(key, () => span);
      }
    }
    return env;
  }

  /// Parses a single line into a key-value pair.
  static EnvValue? parseOne(final String line) {
    final stripped = strip(line);
    if (!_isValid(stripped)) return null;

    final idx = stripped.indexOf('=');
    final lhs = stripped.substring(0, idx);
    final k = swallow(lhs);
    if (k.isEmpty) return null;

    final rhs = stripped.substring(idx + 1, stripped.length).trim();
    final quotChar = surroundingQuote(rhs);
    var v = unquote(rhs);
    if (quotChar == _singleQuot) {
      v = v.replaceAll(r"\'", "'");
    }
    if (quotChar == '"') {
      v = v.replaceAll(r'\"', '"').replaceAll(r'\n', '\n');
    }

    final start = line.indexOf(k);
    final end = start + line.length;

    return (
      key: k,
      value: v,
      start: start,
      end: end,
    );
  }

  /// Substitutes $bash_vars in [val] with values from [env].
  static String interpolate(String val, Map<String, String?> env) =>
      val.replaceAllMapped(_bashVar, (Match m) {
        if ((m.group(1) ?? '') == r'\') {
          return m.input.substring(m.start, m.end);
        } else {
          final k = m.group(3)!;
          return _has(env, k) ? env[k]! : '';
        }
      });

  /// If [val] is wrapped in single or double quotes, returns the quote character.
  /// Otherwise, returns the empty string.
  static String surroundingQuote(String val) => _surroundQuotes.hasMatch(val)
      ? _surroundQuotes.firstMatch(val)!.group(1)!
      : '';

  /// Removes quotes (single or double) surrounding a value.
  static String unquote(String val) => _surroundQuotes.hasMatch(val)
      ? _surroundQuotes.firstMatch(val)!.group(2)!
      : strip(val, includeQuotes: true).trim();

  /// Strips comments (trailing or whole-line).
  static String strip(
    String line, {
    bool includeQuotes = false,
  }) =>
      line.replaceAll(includeQuotes ? _commentWithQuotes : _comment, '').trim();

  /// Omits 'export' keyword.
  static String swallow(String line) =>
      line.replaceAll(_leadingExport, '').trim();

  static bool _isValid(String s) => s.isNotEmpty && s.contains('=');

  /// [ null ] is a valid value in a Dart map, but the env var representation is empty string, not the string 'null'
  static bool _has(Map<String, String?> map, String key) =>
      map.containsKey(key) && map[key] != null;
}
