import 'package:cedar/cedar.dart';

/// {@template cedar.cedar_authorization_request}
/// A request for authorization to a [CedarEngine].
/// {@endtemplate}
final class CedarAuthorizationRequest {
  /// {@macro cedar.cedar_authorization_request}
  const CedarAuthorizationRequest({
    this.principal,
    this.action,
    this.resource,
    this.context,
  });

  /// The principal component of the request.
  final CedarEntityId? principal;

  /// The action component of the request.
  final CedarEntityId? action;

  /// The resource component of the request.
  final CedarEntityId? resource;

  /// The context of the request.
  final Map<String, CedarValueJson>? context;
}
