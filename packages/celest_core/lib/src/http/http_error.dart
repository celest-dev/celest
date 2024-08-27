import 'package:meta/meta_meta.dart';

/// {@template celest.http.http_error}
/// Configures an HTTP error response for a cloud function.
/// {@endtemplate}
@Target({
  TargetKind.library,
  TargetKind.function,
  TargetKind.classType,
  TargetKind.extensionType,
})
final class httpError {
  /// {@macro celest.http.http_error}
  const httpError(
    this.statusCode, [
    this.type,
    this.type1,
    this.type2,
    this.type3,
    this.type4,
    this.type5,
    this.type6,
    this.type7,
  ]);

  /// The status code returned when any of the specified types are thrown.
  final int statusCode;

  /// The error type this configuration applies to.
  final Type? type;

  /// Additional error type this configuration applies to.
  final Type? type1;

  /// Additional error type this configuration applies to.
  final Type? type2;

  /// Additional error type this configuration applies to.
  final Type? type3;

  /// Additional error type this configuration applies to.
  final Type? type4;

  /// Additional error type this configuration applies to.
  final Type? type5;

  /// Additional error type this configuration applies to.
  final Type? type6;

  /// Additional error type this configuration applies to.
  final Type? type7;
}
