import 'package:cedar/cedar.dart';
import 'package:json_annotation/json_annotation.dart';

/// The decision of an authorization request.
enum CedarAuthorizationDecision {
  @JsonValue('Allow')
  allow,

  @JsonValue('Deny')
  deny,
}

/// {@template cedar.cedar_authorization_response}
/// The response to a [CedarAuthorizer] request.
/// {@endtemplate}
final class CedarAuthorizationResponse {
  /// {@macro cedar.cedar_authorization_response}
  const CedarAuthorizationResponse({
    required this.decision,
    List<String>? reasons,
    List<String>? errors,
  })  : reasons = reasons ?? const [],
        errorMessages = errors ?? const [];

  /// The decision of the authorization request.
  final CedarAuthorizationDecision decision;

  /// The policy IDs of the policies that contributed to the decision.
  ///
  /// If no policies applied to the request, this will be empty.
  final List<String> reasons;

  /// Any evaluation errors which occurred during the request.
  ///
  /// If no errors occurred, this will be empty.
  final List<String> errorMessages;
}
