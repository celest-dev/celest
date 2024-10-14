import 'package:cedar/cedar.dart';

extension type const CelestAction._(EntityUid _) implements EntityUid {
  static const CelestAction create =
      CelestAction._(EntityUid.of('Celest::Action', 'create'));

  static const CelestAction get =
      CelestAction._(EntityUid.of('Celest::Action', 'get'));

  static const CelestAction update =
      CelestAction._(EntityUid.of('Celest::Action', 'update'));

  static const CelestAction delete =
      CelestAction._(EntityUid.of('Celest::Action', 'delete'));

  static const CelestAction list =
      CelestAction._(EntityUid.of('Celest::Action', 'list'));

  static const CelestAction invoke =
      CelestAction._(EntityUid.of('Celest::Action', 'invoke'));
}
