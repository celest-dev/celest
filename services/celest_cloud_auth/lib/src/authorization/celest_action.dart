import 'package:cedar/cedar.dart';

extension type const CelestAction._(EntityUid _) implements EntityUid {
  static const CelestAction owner =
      CelestAction._(EntityUid.of('Celest::Action', 'owner'));

  static const CelestAction admin =
      CelestAction._(EntityUid.of('Celest::Action', 'admin'));

  static const CelestAction edit =
      CelestAction._(EntityUid.of('Celest::Action', 'edit'));

  static const CelestAction view =
      CelestAction._(EntityUid.of('Celest::Action', 'view'));

  static const CelestAction create =
      CelestAction._(EntityUid.of('Celest::Action', 'create'));

  static const CelestAction get =
      CelestAction._(EntityUid.of('Celest::Action', 'get'));

  static const CelestAction update =
      CelestAction._(EntityUid.of('Celest::Action', 'update'));

  static const CelestAction delete =
      CelestAction._(EntityUid.of('Celest::Action', 'delete'));

  static const CelestAction undelete =
      CelestAction._(EntityUid.of('Celest::Action', 'undelete'));

  static const CelestAction list =
      CelestAction._(EntityUid.of('Celest::Action', 'list'));

  static const CelestAction invoke =
      CelestAction._(EntityUid.of('Celest::Action', 'invoke'));
}
