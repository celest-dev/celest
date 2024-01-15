import 'package:celest_cli/src/version.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

final class ProjectDependency {
  const ProjectDependency._(this.name, this.pubDependency);

  final String name;
  final Dependency pubDependency;

  static final ProjectDependency celest = ProjectDependency._(
    'celest',
    HostedDependency(version: Version.parse(packageVersion)),
  );
  static ProjectDependency celestLocal(Uri pubServer) => ProjectDependency._(
        'celest',
        HostedDependency(
          version: Version.parse(packageVersion),
          hosted: HostedDetails('celest', pubServer),
        ),
      );
  static ProjectDependency celestCoreLocal(Uri pubServer) =>
      ProjectDependency._(
        'celest_core',
        HostedDependency(
          version: Version.parse(packageVersion),
          hosted: HostedDetails('celest_core', pubServer),
        ),
      );
  static ProjectDependency celestRuntimeCloudLocal(Uri pubServer) =>
      ProjectDependency._(
        'celest_runtime_cloud',
        HostedDependency(
          version: Version.parse(packageVersion),
          hosted: HostedDetails('celest_runtime_cloud', pubServer),
        ),
      );

  static final ProjectDependency lints = ProjectDependency._(
    'lints',
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('3.0.0')),
    ),
  );

  static final ProjectDependency test = ProjectDependency._(
    'test',
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('1.24.0')),
    ),
  );

  static Map<String, Dependency> dependencies(Uri pubServer) {
    final celest = celestLocal(pubServer);
    return {
      celest.name: celest.pubDependency,
    };
  }

  static Map<String, Dependency> dependencyOverrides(Uri pubServer) {
    final celest = celestLocal(pubServer);
    final celestCore = celestCoreLocal(pubServer);
    final celestRuntimeCloud = celestRuntimeCloudLocal(pubServer);
    return {
      celest.name: celest.pubDependency,
      celestCore.name: celestCore.pubDependency,
      celestRuntimeCloud.name: celestRuntimeCloud.pubDependency,
    };
  }

  static Map<String, Dependency> devDependencies(Uri pubServer) {
    return {
      lints.name: lints.pubDependency,
      test.name: test.pubDependency,
    };
  }
}
