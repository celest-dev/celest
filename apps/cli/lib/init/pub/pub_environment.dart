import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pub_semver/pub_semver.dart';

abstract final class PubEnvironment {
  /// The version of the Dart SDK that this version of the CLI is compatible
  /// with.
  static final VersionConstraint dartSdkConstraint =
      VersionConstraint.compatibleWith(minSupportedDartSdk);
}
