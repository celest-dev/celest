import 'package:celest_cli/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/path.dart';
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

  static Map<String, PathDependency>? localDependencyOverrides({
    required String projectRoot,
  }) {
    final localPath = celestLocalPath;
    if (localPath == null) {
      return null;
    }

    String packagePath(String packageName) {
      return p.url.relative(
        p.join(localPath, 'packages', packageName).to(p.url),
        from: projectRoot.to(p.url),
      );
    }

    const packages = ['celest', 'celest_core', 'celest_auth', 'celest_cloud'];
    return {
      for (final packageName in packages)
        packageName: PathDependency(packagePath(packageName)),
    };
  }

  static final Map<String, ProjectDependency> all = {
    celest.name: celest,
    celestCore.name: celestCore,
    firebaseAuth.name: firebaseAuth,
    gotrue.name: gotrue,
    http.name: http,
    nativeStorage.name: nativeStorage,
    streamTransform.name: streamTransform,
    lints.name: lints,
    test.name: test,
  };

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

  static final ProjectDependency firebaseAuth = ProjectDependency._(
    'firebase_auth',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('5.2.0')),
    ),
  );

  static final ProjectDependency gotrue = ProjectDependency._(
    'gotrue',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('2.8.0')),
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

  static final ProjectDependency nativeStorage = ProjectDependency._(
    'native_storage',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('0.2.2')),
    ),
  );

  static final ProjectDependency streamTransform = ProjectDependency._(
    'stream_transform',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('2.1.0')),
    ),
  );

  static final ProjectDependency lints = ProjectDependency._(
    'lints',
    DependencyType.devDependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('4.0.0')),
    ),
  );

  static final ProjectDependency test = ProjectDependency._(
    'test',
    DependencyType.devDependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('1.25.0')),
    ),
  );

  static final Map<String, HostedDependency> dependencies = {
    celest.name: celest.pubDependency,
    celestCore.name: celestCore.pubDependency,
    http.name: http.pubDependency,
  };

  static final Map<String, HostedDependency> devDependencies = {
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
    final expectedVersion = expected[name]!.version;
    return switch (actual[name]) {
      // Add the dependency
      null => false,

      // Compare to existing constraint
      final HostedDependency actual => expectedVersion == actual.version,

      // Don't overwrite path/git dependencies
      _ => true,
    };
  }
}
