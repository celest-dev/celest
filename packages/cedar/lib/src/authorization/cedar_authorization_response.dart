import 'package:cedar/cedar.dart';

/// The decision of an authorization request.
enum CedarAuthorizationDecision { allow, deny }

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
        errors = errors ?? const [];

  /// The decision of the authorization request.
  final CedarAuthorizationDecision decision;

  /// The policy IDs of the policies that contributed to the decision.
  ///
  /// If no policies applied to the request, this will be empty.
  final List<String> reasons;

  /// The policy IDs which caused evaluation errors during the request.
  ///
  /// If no errors occurred, this will be empty.
  final List<String> errors;
}
