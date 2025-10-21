import 'package:celest_cli/src/analyzer/analysis_error.dart';
import 'package:source_span/source_span.dart';

/// Structured representation of a parsed key-value entry within an env file.
typedef EnvValue = ({String key, String value, int start, int end});

/// Policy used when duplicate environment keys are encountered.
enum EnvDuplicateKeyBehavior {
  /// Replace the existing value while recording an error for the duplicate.
  replace,

  /// Keep the first value encountered and emit an error for later duplicates.
  keepFirst,

  /// Treat duplicates as fatal by recording an error without altering values.
  error,
}

/// Runtime options that modify how [EnvParser] interprets input lines.
class EnvParserOptions {
  /// Creates parsing options with sensible defaults for Celest CLI.
  const EnvParserOptions({
    this.allowExportPrefix = true,
    this.interpolate = false,
    this.interpolationEnvironment = const {},
    this.duplicateKeyBehavior = EnvDuplicateKeyBehavior.replace,
    this.trimUnquotedValues = true,
    this.keyPattern,
  });

  /// Whether to swallow an optional leading `export` keyword.
  final bool allowExportPrefix;

  /// Whether `$FOO` references inside values should be interpolated.
  final bool interpolate;

  /// Scope used when resolving interpolated values that precede the current key.
  final Map<String, String?> interpolationEnvironment;

  /// Strategy for handling duplicate keys encountered during parsing.
  final EnvDuplicateKeyBehavior duplicateKeyBehavior;

  /// Whether to trim trailing whitespace for unquoted values.
  final bool trimUnquotedValues;

  /// Optional pattern permitting callers to constrain valid key formats.
  final RegExp? keyPattern;
}

/// Parses dotenv-style environment files while preserving spans for diagnostics.
final class EnvParser {
  /// Creates a parser for [source], optionally overriding default [options].
  EnvParser({
    required this.source,
    required this.sourceUri,
    EnvParserOptions? options,
  }) : options = options ?? const EnvParserOptions();

  /// Raw env file contents.
  final String source;

  /// URI associated with [source]; used when generating error spans.
  final Uri sourceUri;

  /// Parser configuration applied while traversing the source.
  final EnvParserOptions options;

  /// Lazily computed view of [source] offering positional utilities.
  late final SourceFile _sourceFile = SourceFile.fromString(
    source,
    url: sourceUri,
  );

  /// Map of successfully parsed key-value pairs.
  final Map<String, String> env = {};

  /// Spans pointing to the location of each parsed key.
  final Map<String, FileSpan> spans = {};

  /// Collected parsing diagnostics encountered across all lines.
  final List<CelestAnalysisError> errors = [];

  /// Parses [source] line-by-line, returning the accumulated environment map.
  ///
  /// The [env], [spans], and [errors] collections are reset on each call so
  /// the parser instance can be reused safely.
  Map<String, String> parse() {
    env.clear();
    spans.clear();
    errors.clear();

    final interpolationScope = Map<String, String?>.from(
      options.interpolationEnvironment,
    );

    for (var lineIndex = 0; lineIndex < _sourceFile.lines; lineIndex++) {
      final startOffset = _sourceFile.getOffset(lineIndex);
      final endOffset = lineIndex + 1 < _sourceFile.lines
          ? _sourceFile.getOffset(lineIndex + 1)
          : source.length;
      final rawLine = _sourceFile.getText(startOffset, endOffset);
      _processLine(rawLine, startOffset, interpolationScope);
    }

    return env;
  }

  /// Parses an individual [rawLine], applying post-processing such as
  /// interpolation once the line is successfully understood.
  void _processLine(
    String rawLine,
    int baseOffset,
    Map<String, String?> interpolationScope,
  ) {
    final line = _normalizeLine(rawLine);
    if (line.isEmpty) {
      return;
    }

    final outcome = _LineParser(
      line: line,
      baseOffset: baseOffset,
      sourceFile: _sourceFile,
      options: options,
    ).parse();

    switch (outcome.type) {
      case _LineOutcomeType.skip:
        return;
      case _LineOutcomeType.failure:
        errors.add(outcome.error!);
        return;
      case _LineOutcomeType.success:
        break;
    }

    final success = outcome.success!;
    var value = success.value;
    if (options.interpolate && success.allowInterpolation) {
      value = interpolate(
        value,
        interpolationScope,
        literalDollarOffsets: success.literalDollarOffsets,
      );
    }

    final duplicate = env.containsKey(success.key);
    if (!duplicate) {
      env[success.key] = value;
      spans[success.key] = success.span;
      interpolationScope[success.key] = value;
      return;
    }

    final error = CelestAnalysisError(
      message: 'Duplicate key: ${success.key}',
      location: success.span,
    );
    switch (options.duplicateKeyBehavior) {
      case EnvDuplicateKeyBehavior.replace:
        env[success.key] = value;
        spans[success.key] = success.span;
        interpolationScope[success.key] = value;
        errors.add(error);
      case EnvDuplicateKeyBehavior.keepFirst:
        errors.add(error);
      case EnvDuplicateKeyBehavior.error:
        errors.add(error);
    }
  }

  /// Evaluates shell-style interpolation markers in [value] against [env].
  ///
  /// [literalDollarOffsets] contains offsets that originated from escaped `$`
  /// characters and therefore must remain literal.
  static String interpolate(
    String value,
    Map<String, String?> env, {
    List<int>? literalDollarOffsets,
  }) {
    if (value.isEmpty) {
      return value;
    }
    final skip = literalDollarOffsets == null || literalDollarOffsets.isEmpty
        ? null
        : literalDollarOffsets.toSet();
    final buffer = StringBuffer();
    var index = 0;
    while (index < value.length) {
      final char = value.codeUnitAt(index);
      if (char != _dollar) {
        buffer.writeCharCode(char);
        index++;
        continue;
      }

      if (skip?.contains(index) ?? false) {
        buffer.writeCharCode(char);
        index++;
        continue;
      }

      if (index + 1 >= value.length) {
        buffer.writeCharCode(char);
        index++;
        continue;
      }

      final peek = value.codeUnitAt(index + 1);
      if (peek == _dollar) {
        buffer
          ..writeCharCode(char)
          ..writeCharCode(peek);
        index += 2;
        continue;
      }

      var cursor = index + 1;
      var braced = false;
      if (value.codeUnitAt(cursor) == _leftBrace) {
        braced = true;
        cursor++;
      }

      final nameStart = cursor;
      while (cursor < value.length && _isIdentifier(value.codeUnitAt(cursor))) {
        cursor++;
      }
      final nameEnd = cursor;

      if (braced) {
        if (cursor >= value.length || value.codeUnitAt(cursor) != _rightBrace) {
          buffer.writeCharCode(char);
          index++;
          continue;
        }
        cursor++;
      }

      if (nameEnd == nameStart) {
        buffer.writeCharCode(char);
        index++;
        continue;
      }

      final key = value.substring(nameStart, nameEnd);
      buffer.write(env[key] ?? '');
      index = cursor;
    }
    return buffer.toString();
  }

  /// Convenience utility that parses a standalone [line] and returns its
  /// structured representation when valid.
  static EnvValue? parseOne(String line) {
    final parser = EnvParser(source: line, sourceUri: Uri.parse('env://single'))
      ..parse();
    if (parser.env.isEmpty) {
      return null;
    }
    final entry = parser.env.entries.first;
    final span = parser.spans[entry.key]!;
    return (
      key: entry.key,
      value: entry.value,
      start: span.start.offset,
      end: span.end.offset,
    );
  }
}

/// Stateful helper that tokenizes and validates a single env file line.
class _LineParser {
  _LineParser({
    required this.line,
    required this.baseOffset,
    required this.sourceFile,
    required this.options,
  });

  /// Raw content for the line currently being parsed.
  final String line;

  /// Byte offset of [line] relative to the original source.
  final int baseOffset;

  /// Source representation used to materialize spans when reporting errors.
  final SourceFile sourceFile;

  /// Parsing configuration forwarded from [EnvParser].
  final EnvParserOptions options;

  /// Walks the line and returns the resulting parse outcome.
  _LineParseOutcome parse() {
    final length = line.length;
    var index = 0;

    while (index < length && _isSkippable(line.codeUnitAt(index))) {
      index++;
    }

    if (index >= length || line.codeUnitAt(index) == _hash) {
      return _LineParseOutcome.skip();
    }

    if (options.allowExportPrefix && _matchesExport(line, index)) {
      index += 6;
      while (index < length && _isSkippable(line.codeUnitAt(index))) {
        index++;
      }
    }

    final keyStart = index;
    var keyEnd = -1;

    while (index < length) {
      final code = line.codeUnitAt(index);
      if (code == _equals) {
        break;
      }
      if (!_isSkippable(code)) {
        keyEnd = index + 1;
      }
      index++;
    }

    if (index >= length || line.codeUnitAt(index) != _equals) {
      return _LineParseOutcome.failure(
        _error('Invalid env entry: missing "=" delimiter', keyStart, length),
      );
    }

    if (keyEnd == -1) {
      return _LineParseOutcome.failure(
        _error('Invalid env key: key cannot be empty', keyStart, index),
      );
    }

    final key = line.substring(keyStart, keyEnd);
    if (options.keyPattern != null && !options.keyPattern!.hasMatch(key)) {
      return _LineParseOutcome.failure(
        _error('Invalid env key "$key"', keyStart, keyEnd),
      );
    }

    final equalsIndex = index;
    index++;

    while (index < length && _isSkippable(line.codeUnitAt(index))) {
      index++;
    }

    final valueStart = index;
    final valueResult = _parseValue(
      line: line,
      index: index,
      baseOffset: baseOffset,
      equalsIndex: equalsIndex,
      valueStart: valueStart,
      sourceFile: sourceFile,
      trimUnquoted: options.trimUnquotedValues,
    );

    if (valueResult.isError) {
      return _LineParseOutcome.failure(valueResult.error);
    }

    final spanStart = baseOffset + keyStart;
    var highlightEnd = valueResult.highlightEnd;
    final minimumHighlight = equalsIndex + 1;
    if (highlightEnd < minimumHighlight) {
      highlightEnd = minimumHighlight;
    }
    if (highlightEnd < keyEnd) {
      highlightEnd = keyEnd;
    }

    final span = sourceFile.span(spanStart, baseOffset + highlightEnd);

    return _LineParseOutcome.success(
      key: key,
      value: valueResult.value,
      span: span,
      allowInterpolation: valueResult.allowInterpolation,
      literalDollarOffsets: valueResult.literalDollarOffsets,
    );
  }

  /// Convenience for emitting a [CelestAnalysisError] spanning the provided
  /// offsets.
  CelestAnalysisError _error(String message, int start, int end) {
    final span = sourceFile.span(
      baseOffset + start,
      baseOffset + (end > start ? end : start),
    );
    return CelestAnalysisError(message: message, location: span);
  }
}

/// Result type emitted after attempting to parse a single line.
enum _LineOutcomeType { skip, success, failure }

/// Discriminated union describing the result of parsing a line.
class _LineParseOutcome {
  /// Outcome indicating the current line should be ignored.
  _LineParseOutcome.skip()
    : type = _LineOutcomeType.skip,
      success = null,
      error = null;

  /// Outcome for a successfully parsed line.
  _LineParseOutcome.success({
    required String key,
    required String value,
    required FileSpan span,
    required bool allowInterpolation,
    required List<int> literalDollarOffsets,
  }) : type = _LineOutcomeType.success,
       success = _LineParseSuccess(
         key: key,
         value: value,
         span: span,
         allowInterpolation: allowInterpolation,
         literalDollarOffsets: literalDollarOffsets,
       ),
       error = null;

  /// Outcome representing a parse failure alongside the emitted error.
  _LineParseOutcome.failure(this.error)
    : type = _LineOutcomeType.failure,
      success = null;

  /// Variant flag describing the outcome type.
  final _LineOutcomeType type;

  /// Success payload populated when [type] is [_LineOutcomeType.success].
  final _LineParseSuccess? success;

  /// Error payload populated when [type] is [_LineOutcomeType.failure].
  final CelestAnalysisError? error;
}

/// Captures successful parsing metadata for a single line.
class _LineParseSuccess {
  /// Creates a success payload carrying the parsed value and associated span.
  _LineParseSuccess({
    required this.key,
    required this.value,
    required this.span,
    required this.allowInterpolation,
    required this.literalDollarOffsets,
  });

  /// Parsed environment key.
  final String key;

  /// Parsed environment value (pre-interpolation).
  final String value;

  /// Span covering the key-value pair for diagnostics.
  final FileSpan span;

  /// Whether interpolation should be attempted for [value].
  final bool allowInterpolation;

  /// Positions containing escaped dollar signs that must remain literal.
  final List<int> literalDollarOffsets;
}

/// Carries either the parsed value state or a fatal error for a line segment.
class _ValueParseResult {
  /// Successful parse capturing value metadata.
  const _ValueParseResult.success({
    required this.value,
    required this.valueEnd,
    required this.allowInterpolation,
    required this.literalDollarOffsets,
    required this.highlightEnd,
  }) : error = null;

  /// Failed parse storing the triggering [error].
  const _ValueParseResult.error(this.error)
    : value = '',
      valueEnd = 0,
      allowInterpolation = false,
      literalDollarOffsets = const [],
      highlightEnd = 0;

  /// Parsed value text (untrimmed when inside quotes).
  final String value;

  /// Offset relative to the original line where the value finishes.
  final int valueEnd;

  /// Indicates whether interpolation should be attempted on [value].
  final bool allowInterpolation;

  /// Escaped dollar offset positions that must remain literal.
  final List<int> literalDollarOffsets;

  /// Offset used to highlight the full span including closing quotes.
  final int highlightEnd;

  /// Populated when parsing fails for the value segment.
  final CelestAnalysisError? error;

  /// Whether this result represents a failure state.
  bool get isError => error != null;
}

/// Represents a decoded portion of a value along with its metadata.
class _ValueChunk {
  /// Records a single value chunk, optionally marking literal dollar segments.
  const _ValueChunk(
    this.content,
    this.index,
    this.segment, {
    this.literalDollar = false,
  });

  /// The decoded piece of text contributed by this chunk.
  final String content;

  /// Offset of the chunk's last consumed character relative to the original
  /// line.
  final int index;

  /// The quoting context the chunk originated from.
  final _ValueSegment segment;

  /// Whether this chunk was produced from an escaped dollar sign.
  final bool literalDollar;
}

/// Categories describing the quoting context for a value token.
enum _ValueSegment { unquoted, single, double }

/// Parses the value portion of a key-value assignment, handling quoting,
/// escaping, comment stripping, and interpolation metadata extraction.
_ValueParseResult _parseValue({
  required String line,
  required int index,
  required int baseOffset,
  required int equalsIndex,
  required int valueStart,
  required SourceFile sourceFile,
  required bool trimUnquoted,
}) {
  final length = line.length;
  final chunks = <_ValueChunk>[];
  final literalDollarOffsets = <int>[];
  var cursor = index;
  var inSingle = false;
  var inDouble = false;
  var hasSingle = false;
  var hasDouble = false;
  var hasUnquotedContent = false;
  int? closingQuoteIndex;

  while (cursor < length) {
    final char = line[cursor];

    if (inSingle) {
      if (char == "'") {
        inSingle = false;
        closingQuoteIndex = cursor;
        cursor++;
        continue;
      }
      if (char == r'\' && cursor + 1 < length && line[cursor + 1] == "'") {
        chunks.add(_ValueChunk("'", cursor + 1, _ValueSegment.single));
        hasSingle = true;
        cursor += 2;
        continue;
      }
      chunks.add(_ValueChunk(char, cursor, _ValueSegment.single));
      hasSingle = true;
      cursor++;
      continue;
    }

    if (inDouble) {
      if (char == '"') {
        inDouble = false;
        closingQuoteIndex = cursor;
        cursor++;
        continue;
      }
      if (char == r'\') {
        if (cursor + 1 >= length) {
          return _ValueParseResult.error(
            _valueError(
              sourceFile,
              'Unfinished escape in double-quoted value',
              baseOffset + cursor,
              baseOffset + length,
            ),
          );
        }
        final next = line[cursor + 1];
        final decoded = _decodeDoubleQuotedEscape(next);
        final isLiteralDollar = next == r'$';
        chunks.add(
          _ValueChunk(
            decoded ?? next,
            cursor + 1,
            _ValueSegment.double,
            literalDollar: isLiteralDollar,
          ),
        );
        hasDouble = true;
        cursor += 2;
        continue;
      }
      chunks.add(_ValueChunk(char, cursor, _ValueSegment.double));
      hasDouble = true;
      cursor++;
      continue;
    }

    if (char == '#') {
      break;
    }
    if (char == "'") {
      inSingle = true;
      cursor++;
      continue;
    }
    if (char == '"') {
      inDouble = true;
      cursor++;
      continue;
    }
    if (char == r'\') {
      if (cursor + 1 >= length) {
        chunks.add(_ValueChunk(r'\', cursor, _ValueSegment.unquoted));
        cursor++;
        continue;
      }
      final next = line[cursor + 1];
      final isLiteralDollar = next == r'$';
      chunks.add(
        _ValueChunk(
          next,
          cursor + 1,
          _ValueSegment.unquoted,
          literalDollar: isLiteralDollar,
        ),
      );
      if (!_isWhitespace(next.codeUnitAt(0)) || isLiteralDollar) {
        hasUnquotedContent = true;
      }
      cursor += 2;
      continue;
    }
    if (_isWhitespace(line.codeUnitAt(cursor))) {
      chunks.add(_ValueChunk(char, cursor, _ValueSegment.unquoted));
      cursor++;
      continue;
    }
    chunks.add(_ValueChunk(char, cursor, _ValueSegment.unquoted));
    hasUnquotedContent = true;
    cursor++;
  }

  if (inSingle) {
    return _ValueParseResult.error(
      _valueError(
        sourceFile,
        'Unterminated single-quoted value',
        baseOffset + valueStart,
        baseOffset + line.length,
      ),
    );
  }
  if (inDouble) {
    return _ValueParseResult.error(
      _valueError(
        sourceFile,
        'Unterminated double-quoted value',
        baseOffset + valueStart,
        baseOffset + line.length,
      ),
    );
  }

  var effectiveLength = chunks.length;
  if (trimUnquoted && effectiveLength > 0) {
    while (effectiveLength > 0) {
      final chunk = chunks[effectiveLength - 1];
      if (chunk.segment != _ValueSegment.unquoted) {
        break;
      }
      if (!_isWhitespaceString(chunk.content)) {
        break;
      }
      effectiveLength--;
    }
  }

  final buffer = StringBuffer();
  var accumulatedLength = 0;
  for (var i = 0; i < effectiveLength; i++) {
    final chunk = chunks[i];
    buffer.write(chunk.content);
    if (chunk.literalDollar) {
      literalDollarOffsets.add(accumulatedLength);
    }
    accumulatedLength += chunk.content.length;
  }

  final value = buffer.toString();
  final valueEnd = effectiveLength > 0
      ? chunks[effectiveLength - 1].index + 1
      : cursor;

  var highlightEnd = valueEnd;
  if (closingQuoteIndex != null) {
    final candidate = closingQuoteIndex + 1;
    if (candidate > highlightEnd) {
      highlightEnd = candidate;
    }
  }
  if (highlightEnd < cursor) {
    highlightEnd = cursor;
  }

  final allowInterpolation = !(hasSingle && !hasDouble && !hasUnquotedContent);

  return _ValueParseResult.success(
    value: value,
    valueEnd: valueEnd,
    allowInterpolation: allowInterpolation,
    literalDollarOffsets: literalDollarOffsets,
    highlightEnd: highlightEnd,
  );
}

/// Constructs a [CelestAnalysisError] tied to the provided [SourceFile].
CelestAnalysisError _valueError(
  SourceFile sourceFile,
  String message,
  int start,
  int end,
) {
  final normalizedEnd = end > start ? end : start;
  final span = sourceFile.span(start, normalizedEnd);
  return CelestAnalysisError(message: message, location: span);
}

/// Returns `true` when the line from [index] begins with an `export` token.
bool _matchesExport(String line, int index) {
  if (index + 6 > line.length) {
    return false;
  }
  if (line.substring(index, index + 6) != 'export') {
    return false;
  }
  if (index + 6 == line.length) {
    return true;
  }
  return _isSkippable(line.codeUnitAt(index + 6));
}

/// Normalizes a line by trimming trailing newline characters.
String _normalizeLine(String line) {
  var result = line;
  if (result.isEmpty) {
    return result;
  }
  if (result.endsWith('\n')) {
    result = result.substring(0, result.length - 1);
  }
  if (result.endsWith('\r')) {
    result = result.substring(0, result.length - 1);
  }
  return result;
}

/// Whether a character code represents horizontal whitespace or BOM.
bool _isSkippable(int codeUnit) =>
    codeUnit == 0x20 || // space
    codeUnit == 0x09 || // tab
    codeUnit == 0x0B || // vertical tab
    codeUnit == 0x0C || // form feed
    codeUnit == 0x0D || // carriage return
    codeUnit == 0xFEFF; // byte order mark

/// Whether a character code is considered whitespace for unquoted values.
bool _isWhitespace(int codeUnit) =>
    codeUnit == 0x20 ||
    codeUnit == 0x09 ||
    codeUnit == 0x0B ||
    codeUnit == 0x0C ||
    codeUnit == 0x0D;

/// Whether [char] is a single-character whitespace string.
bool _isWhitespaceString(String char) =>
    char == ' ' || char == '\t' || char == '\r' || char == '\f' || char == '\v';

/// Decodes escape sequences allowed within double-quoted values.
String? _decodeDoubleQuotedEscape(String char) {
  switch (char) {
    case 'n':
      return '\n';
    case 'r':
      return '\r';
    case 't':
      return '\t';
    case 'b':
      return '\b';
    case 'f':
      return '\f';
    case 'v':
      return '\u000B';
    case r'\':
      return r'\';
    case '\'':
      return '\'';
    case '"':
      return '"';
    case '0':
      return '\u0000';
    case r'$':
      return r'$';
    default:
      return null;
  }
}

/// Returns `true` when [codeUnit] represents a valid environment identifier
/// character.
bool _isIdentifier(int codeUnit) {
  return (codeUnit >= 0x41 && codeUnit <= 0x5A) || // A-Z
      (codeUnit >= 0x61 && codeUnit <= 0x7A) || // a-z
      (codeUnit >= 0x30 && codeUnit <= 0x39) || // 0-9
      codeUnit == 0x5F; // _
}

/// Character code for `#` used to mark comment boundaries.
const int _hash = 0x23;

/// Character code for `=` delimiting keys from values.
const int _equals = 0x3D;

/// Character code for `$` used when interpolating environment variables.
const int _dollar = 0x24;

/// Character code for `{` introducing braced interpolation identifiers.
const int _leftBrace = 0x7B;

/// Character code for `}` terminating braced interpolation identifiers.
const int _rightBrace = 0x7D;
