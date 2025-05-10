import 'package:celest_cloud_auth/src/context.dart' show context;
import 'package:collection/collection.dart';
import 'package:petitparser/petitparser.dart';

/// {@template celest_cloud_auth.model.route}
/// A route is a path template that is used for routing HTTP requests and for
/// linking them back to the appropriate cloud function definition.
///
/// This is especially important in Auth since authorization happens on a
/// per-function and per-API basis.
/// {@endtemplate}
final class Route extends Parser<Map<String, String>> {
  /// {@macro celest_cloud_auth.model.route}
  Route({required this.template, required this.segments, this.verb});

  /// Parses a path [template] into a [Route].
  ///
  /// {@macro celest_cloud_auth.model.route}
  factory Route.parse(String template) {
    final parsed = _segmentParser.parse(template);
    switch (parsed) {
      case Success(value: (final segments, final verb)):
        return Route(template: template, segments: segments, verb: verb);
      case Failure(:final message, :final position):
        throw FormatException(message, template, position);
    }
  }

  /// Folows the path template syntax defined [here](https://github.com/googleapis/googleapis/blob/master/google/api/http.proto#L220).
  static final Parser<(List<RouteSegment>, RouteVerb?)> _segmentParser = () {
    final ident = word().plus().flatten();

    // FieldPath = IDENT { "." IDENT } ;
    final fieldPath = ident.plusSeparated(char('.'));

    final segment = undefined<RouteSegment>();

    // Segments = Segment { "/" Segment } ;
    final segments = segment.plusSeparated(char('/'));

    // Variable = "{" FieldPath [ "=" Segments ] "}" ;
    final variable = seq2(fieldPath.flatten().skip(after: char('=')), segments)
        .map2(
          (variable, segments) =>
              RouteParameter(variable: variable, segments: segments.elements),
        )
        .skip(before: char('{'), after: char('}'));

    final literal = (word() | char('-')).plus().flatten();

    // Segment  = "*" | "**" | LITERAL | Variable ;
    segment.set(
      [
        string('**').map((_) => RouteWildcard(greedy: true)),
        char('*').map((_) => RouteWildcard(greedy: false)),
        variable,
        literal.map(RouteLiteral.new),
      ].toChoiceParser(),
    );

    // Verb     = ":" LITERAL ;
    final verb = word()
        .plus()
        .flatten()
        .map(RouteVerb.new)
        .skip(before: char(':'));

    // Template = "/" Segments [ Verb ] ;
    final parser =
        seq2(segments, verb.optional()).skip(before: char('/')).end();

    return parser.map((result) => (result.$1.elements, result.$2));
  }();

  /// The template used to create this route.
  final String template;

  /// The segments of this route.
  ///
  /// A segment is either a [RouteLiteral], a [RouteWildcard], or a
  /// [RouteParameter].
  ///
  /// They are matched sequentially against the path segments of a request.
  final List<RouteSegment> segments;

  /// The verb of this route.
  final RouteVerb? verb;

  late final Parser<void> _parser =
      segments
          .map((segment) => segment.skip(before: char('/')))
          .toSequenceParser()
          .seq(verb ?? epsilon())
          .end();

  /// Returns a map of variables to values captured from the [path] if it
  /// matches this route.
  Map<String, String>? match(String path, {bool debug = false}) {
    final result = parse(path);
    switch (result) {
      case Success(:final value):
        return value;
      case Failure(:final message, :final position):
        if (debug) {
          final error = FormatException(message, path, position);
          context.logger.finest(
            'Failed to parse route "$path" (pattern=$this)',
            error,
          );
        }
        return null;
    }
  }

  /// Returns `true` if the [path] matches this route.
  bool matches(String path, {bool debug = false}) {
    return match(path, debug: debug) != null;
  }

  @override
  Result<Map<String, String>> parseOn(Context context) {
    final result = _parser.parseOn(context);
    if (result is Failure) {
      return result;
    }
    return result.success({
      for (final segment in segments.whereType<RouteParameter>())
        segment.variable: segment._value,
    });
  }

  @override
  List<Parser<String>> get children => segments;

  @override
  Parser<Map<String, String>> copy() {
    return Route(
      template: template,
      segments: List.of(segments.map((it) => it.copy())),
    );
  }

  @override
  String toString() => '/${segments.join('/')}${verb ?? ''}';
}

/// A segment of a route.
sealed class RouteSegment extends Parser<String> {
  @override
  RouteSegment copy();
}

/// {@template celest_cloud_auth.model.route_literal}
/// A literal segment of a route.
/// {@endtemplate}
final class RouteLiteral extends RouteSegment {
  /// {@macro celest_cloud_auth.model.route_literal}
  RouteLiteral(this.literal);

  /// The literal segment.
  final String literal;

  @override
  Result<String> parseOn(Context context) {
    return string(literal).parseOn(context);
  }

  @override
  RouteLiteral copy() {
    return RouteLiteral(literal);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RouteLiteral && literal == other.literal;
  }

  @override
  int get hashCode => literal.hashCode;

  @override
  String toString() => literal;
}

/// {@template celest_cloud_auth.model.route_wildcard}
/// A wildcard segment of a route.
///
/// If [greedy] is `true`, the wildcard will match zero or multiple path segments
/// and must be the last segment of the route.
///
/// Otherwise, it will match a single path segment.
/// {@endtemplate}
final class RouteWildcard extends RouteSegment {
  /// {@macro celest_cloud_auth.model.route_wildcard}
  RouteWildcard({required this.greedy});

  /// Whether the wildcard consumes all remaining path segments.
  final bool greedy;

  /// The maximum length of a URL.
  ///
  /// Not a standard, but a generally accepted upper bound on reasonable URLs.
  static const int _maxUrlLength = 2048;

  /// Allowed characters in a URL path segment.
  // TODO(dnys1): Handle percent-encoded characters.
  // https://github.com/googleapis/googleapis/blob/master/google/api/http.proto#L241
  static final Parser<String> _validChar = pattern('-_.~0-9a-zA-Z');

  late final Parser<String> _parser =
      greedy
          // The syntax `**` matches zero or more URL path segments
          ? (_validChar | char('/'))
              .repeatLazy(endOfInput(), 0, _maxUrlLength)
              .flatten('**')
          // The syntax `*` matches a single URL path segment.
          : _validChar.plus().flatten('*');

  @override
  Result<String> parseOn(Context context) {
    return _parser.parseOn(context);
  }

  @override
  RouteWildcard copy() {
    return RouteWildcard(greedy: greedy);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RouteWildcard && greedy == other.greedy;
  }

  @override
  int get hashCode => greedy.hashCode;

  @override
  String toString() => greedy ? '**' : '*';
}

/// {@template celest_cloud_auth.model.route_parameter}
/// A parameter of a route which binds a [variable] to a value which is the
/// concatenation of one or more [segments].
/// {@endtemplate}
final class RouteParameter extends RouteSegment {
  /// {@macro celest_cloud_auth.model.route_parameter}
  RouteParameter({required this.variable, required this.segments});

  /// The variable name of this parameter.
  final String variable;

  /// The sub-segments of this parameter.
  final List<RouteSegment> segments;

  /// The value which is computed upon parsing.
  late String _value;

  late final Parser<String> _parser = segments
      .expandIndexed((index, segment) {
        if (index == 0) {
          return [segment];
        }
        return [char('/'), segment];
      })
      .toSequenceParser()
      .flatten(segments.join('/'))
      .map((value) => _value = value);

  @override
  Result<String> parseOn(Context context) {
    return _parser.parseOn(context);
  }

  @override
  RouteParameter copy() {
    return RouteParameter(
      variable: variable,
      segments: List.of(segments.map((it) => it.copy())),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RouteParameter &&
            variable == other.variable &&
            segments.equals(other.segments);
  }

  @override
  int get hashCode => Object.hashAll([variable, ...segments]);

  @override
  String toString() => '{$variable=${segments.join('/')}}';
}

/// {@template celest_cloud_auth.model.route_verb}
/// A verb literal which is optionally appended to a route.
/// {@endtemplate}
final class RouteVerb extends RouteSegment {
  /// {@macro celest_cloud_auth.model.route_verb}
  RouteVerb(this.verb);

  /// The literal verb.
  final String verb;

  late final _parser = [
    char(':'),
    string(verb),
  ].toSequenceParser().flatten(':$verb');

  @override
  Result<String> parseOn(Context context) {
    return _parser.parseOn(context);
  }

  @override
  RouteVerb copy() {
    return RouteVerb(verb);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is RouteVerb && verb == other.verb;
  }

  @override
  int get hashCode => verb.hashCode;

  @override
  String toString() => ':$verb';
}
