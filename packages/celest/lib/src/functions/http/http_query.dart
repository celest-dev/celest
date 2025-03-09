import 'package:meta/meta_meta.dart';

/// {@template celest.functions.http.http_query}
/// An HTTP query parameter key.
/// {@endtemplate}
@Target({TargetKind.parameter})
final class httpQuery {
  /// {@macro celest.functions.http.http_query}
  const httpQuery([this.name]);

  /// The name of the HTTP query parameter.
  ///
  /// If `null`, the name of the parameter will be used.
  final String? name;
}
