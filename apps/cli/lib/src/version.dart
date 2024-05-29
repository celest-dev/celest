import 'package:celest_cli/src/utils/run.dart';
import 'package:pub_semver/pub_semver.dart';

const String _version = '0.4.1';

final String packageVersion = run(() {
  const override = String.fromEnvironment('celest.version');
  if (override.isEmpty) {
    return _version;
  }
  Version.parse(override); // Trigger a format exception if invalid.
  return override;
});
