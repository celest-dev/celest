import 'package:celest_cli/init/pub/pubspec.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/version.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

final Version currentMinorVersion = () {
  final currentVersion = Version.parse(packageVersion);
  if (currentVersion.isPreRelease) {
    return Version(currentVersion.major, currentVersion.minor, 0, pre: '0');
  }
  return Version(currentVersion.major, currentVersion.minor, 0);
}();

final class ProjectDependency {
  const ProjectDependency._(this.name, this.type, this.pubDependency);

  final String name;
  final DependencyType type;
  final HostedDependency pubDependency;

  static final ProjectDependency celest = ProjectDependency._(
    'celest',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(currentMinorVersion),
    ),
  );
  static final ProjectDependency celestCore = ProjectDependency._(
    'celest_core',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(currentMinorVersion),
    ),
  );
  static final ProjectDependency celestAuth = ProjectDependency._(
    'celest_auth',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(currentMinorVersion),
    ),
  );

  static final ProjectDependency http = ProjectDependency._(
    'http',
    DependencyType.dependency,
    HostedDependency(
      version: VersionRange(
        min: Version.parse('0.13.0'),
        max: Version.parse('2.0.0'),
        includeMin: true,
        includeMax: false,
      ),
    ),
  );

  static final ProjectDependency lints = ProjectDependency._(
    'lints',
    DependencyType.devDependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('3.0.0')),
    ),
  );

  static final ProjectDependency test = ProjectDependency._(
    'test',
    DependencyType.devDependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('1.24.0')),
    ),
  );

  static final Map<String, Dependency> dependencies = {
    celest.name: celest.pubDependency,
    celestCore.name: celestCore.pubDependency,
    celestAuth.name: celestAuth.pubDependency,
    http.name: http.pubDependency,
  };

  static final Map<String, Dependency> devDependencies = {
    lints.name: lints.pubDependency,
    test.name: test.pubDependency,
  };

  bool upToDate(Pubspec pubspec) {
    final (expected, actual) = switch (type) {
      DependencyType.dependency => (dependencies, pubspec.dependencies),
      DependencyType.devDependency => (
          devDependencies,
          pubspec.devDependencies
        ),
      _ => unreachable(),
    };
    return (expected[name] as HostedDependency).version ==
        (actual[name] as HostedDependency?)?.version;
  }
}
