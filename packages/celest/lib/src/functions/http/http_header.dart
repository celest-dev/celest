import 'package:meta/meta_meta.dart';

/// {@template celest.http.http_header}
/// An HTTP header key.
/// {@endtemplate}
@Target({TargetKind.parameter})
final class httpHeader {
  /// {@macro celest.http.http_header}
  const httpHeader(this.name);

  /// The name of the HTTP header.
  final String name;
}
