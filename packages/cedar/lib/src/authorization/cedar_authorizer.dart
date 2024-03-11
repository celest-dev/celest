import 'package:cedar/cedar.dart';

abstract interface class CedarAuthorizer {
  /// Responds to an authorization [request].
  CedarAuthorizationResponse isAuthorized(
    CedarAuthorizationRequest request,
  );
}
