import 'package:api_celest/ast.dart' as ast;
import 'package:celest_cli/src/context.dart';
import 'package:package_config/package_config.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

final class FeatureFlags {
  FeatureFlags._({
    required Version runtimeVersion,
  }) : _runtimeVersion = runtimeVersion;

  static Future<FeatureFlags> load() async {
    final packageConfigFile = fileSystem.file(projectPaths.packagesConfig);
    final packageConfig = await loadPackageConfig(packageConfigFile);
    final celestRuntime = packageConfig.packages
        .firstWhere((package) => package.name == 'celest');
    final celestRuntimeRoot = celestRuntime.root;
    final celestRuntimePubspec = Pubspec.parse(
      await fileSystem
          .file(celestRuntimeRoot.resolve('pubspec.yaml'))
          .readAsString(),
    );
    final runtimeVersion = celestRuntimePubspec.version!;
    return FeatureFlags._(
      runtimeVersion: runtimeVersion,
    );
  }

  final Version _runtimeVersion;

  late final FeatureFlag streaming = FeatureFlag(
    name: 'streaming',
    runtimeVersion: _runtimeVersion,
    enabledVersion: Version(0, 4, 2),
  );

  Iterable<ast.FeatureFlag> toAst() sync* {
    for (final flag in allFlags) {
      if (flag.enabled) {
        yield ast.FeatureFlag.valueOf(flag.name);
      }
    }
  }

  List<FeatureFlag> get allFlags => [
        streaming,
      ];
}

final class FeatureFlag {
  factory FeatureFlag({
    required String name,
    required Version runtimeVersion,
    required Version enabledVersion,
  }) {
    return FeatureFlag._(
      name: name,
      enabledVersion: enabledVersion,
      enabled: runtimeVersion >= enabledVersion,
    );
  }

  const FeatureFlag._({
    required this.name,
    required this.enabledVersion,
    required this.enabled,
  });

  final String name;
  final Version enabledVersion;
  final bool enabled;

  @override
  String toString() {
    return 'FeatureFlag($name): ${enabled ? 'enabled' : 'disabled'}';
  }
}
