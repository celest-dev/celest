import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/celest_action.dart' as auth;
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_core/celest_core.dart';
import 'package:logging/logging.dart';

export 'package:celest_cloud/celest_cloud.dart'
    show DateTimeProto, DurationProto;
export 'package:celest_cloud_auth/src/authorization/celest_action.dart';
export 'package:celest_cloud_auth/src/util/typeid.dart';

extension type const ProjectEnvironmentAction._(EntityUid uid)
    implements auth.CelestAction {
  static const ProjectEnvironmentAction deploy = ProjectEnvironmentAction._(
    EntityUid.of('Celest::Action', 'deploy'),
  );
}

mixin ServiceMixin {
  CloudHubDatabase get db;
  Authorizer get authorizer;
  Logger get logger;

  Future<void> authorize({
    Component? principal,
    required auth.CelestAction action,
    Component? resource,
  }) async {
    try {
      await authorizer.expectAuthorized(
        principal: principal,
        resource: resource,
        action: action.uid,
      );
    } on CloudException catch (e, st) {
      Error.throwWithStackTrace(e.toGrpcError(), st);
    } on Object catch (e, st) {
      logger.severe('Unexpected error authorizing', e, st);
      rethrow;
    }
  }
}
