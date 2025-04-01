import 'dart:async';

import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/src/database/auth_database.dart';
import 'package:celest_core/celest_core.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

class Authorizer {
  Authorizer({required AuthDatabase db}) : _db = db;

  static final Logger _logger = Logger('Celest.Authorizer');

  final AuthDatabase _db;

  Future<void> expectAuthorized({
    Component? principal,
    Component? resource,
    EntityUid? action,
    Map<String, Value>? context,
  }) async {
    final response = await authorize(
      principal: principal,
      resource: resource,
      action: action,
      context: context,
    );
    response.expectAuthorized(
      request: AuthorizationRequest(
        principal: principal?.uid,
        resource: resource?.uid,
        action: action,
        context: context,
      ),
    );
  }

  @useResult
  Future<AuthorizationResponse> authorize({
    Component? principal,
    Component? resource,
    EntityUid? action,
    Map<String, Value>? context,
  }) async {
    final (policySet, closure) = await (
      _db.effectivePolicySet,
      _db.computeRequestClosure(
        principal: principal,
        resource: resource,
      ),
    ).wait;
    final request = AuthorizationRequest(
      principal: principal?.uid,
      resource: resource?.uid,
      action: action,
      context: context,
      entities: {
        // The principal and resource may represent yet-tobe-created entities.
        // Thus, they will not be present in the closure which is pulled from
        // the database. We add them here to ensure they are included in the
        // authorization decision.
        if (principal case final Entity principal) principal.uid: principal,
        if (resource case final Entity resource) resource.uid: resource,
        ...closure,
      },
    );
    final response = policySet.isAuthorized(request);
    unawaited(_recordAuthorization(request, response));
    return response;
  }

  Future<void> _recordAuthorization(
    AuthorizationRequest request,
    AuthorizationResponse response,
  ) async {
    try {
      await _db.cedarDrift.recordAuthorization(
        principalType: request.principal?.type,
        principalId: request.principal?.id,
        actionType: request.action?.type,
        actionId: request.action?.id,
        resourceType: request.resource?.type,
        resourceId: request.resource?.id,
        contextJson: request.context ?? const {},
        decision: response.decision == Decision.allow,
        reasonsJson: response.reasons,
        errorsJson: response.errors,
      );
    } on Object catch (e, st) {
      _logger.severe('Failed to record authorization', e, st);
    }
  }
}

@internal
extension ExpectAuthorized on AuthorizationResponse {
  void expectAuthorized({required AuthorizationRequest request}) {
    if (decision != Decision.allow) {
      // If the principal is `null`, that means that either one could not be
      // extracted from the cork (invalid cork) or that there is no cork.
      //
      // In either case, we want to return the appropriate HTTP response code
      // of 401 via an `UnauthorizedException`.
      final principal = request.principal;
      if (principal == null) {
        throw const UnauthorizedException();
      }
      const unknown = EntityUid.of('', '<unknown>');
      final EntityUid(type: principalType, id: principalId) = principal.uid;
      final EntityUid(type: resourceType, id: resourceId) =
          (request.resource ?? unknown).uid;
      final actionId = request.action?.id;
      throw PermissionDeniedException(
        '${principalType.split('::').last}::"$principalId" '
        'is not authorized to perform Action::"$actionId" on '
        '${resourceType.split('::').last}::"$resourceId"',
      );
    }
  }
}
