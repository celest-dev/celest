import 'package:celest/http.dart';
import 'package:meta/meta_meta.dart';

/// {@template celest.functions.http}
/// HTTP configuration options for cloud functions.
/// {@endtemplate}
@Target({TargetKind.library, TargetKind.function})
final class http {
  /// {@macro celest.functions.http}
  const http({
    this.method = HttpMethod.post,
    this.statusCode = HttpStatus.ok,
  });

  /// The HTTP method this function supports.
  final HttpMethod method;

  /// The status code returned for a successful response.
  final HttpStatus statusCode;
}
