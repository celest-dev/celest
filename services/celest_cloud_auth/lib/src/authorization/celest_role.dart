import 'package:cedar/cedar.dart';

extension type const CelestRole._(EntityUid _) implements EntityUid {
  static const CelestRole anonymous =
      CelestRole._(EntityUid.of('Celest::Role', 'anonymous'));

  static const CelestRole authenticated =
      CelestRole._(EntityUid.of('Celest::Role', 'authenticated'));

  static const CelestRole admin =
      CelestRole._(EntityUid.of('Celest::Role', 'admin'));

  static const CelestRole owner =
      CelestRole._(EntityUid.of('Celest::Role', 'owner'));
}
