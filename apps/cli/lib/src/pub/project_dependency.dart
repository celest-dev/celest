import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/pub/pubspec.dart';
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

    const packages = [
      'celest',
      'celest_ast',
      'celest_auth',
      'celest_core',
      'celest_cloud',
    ];

    String servicePath(String serviceName) {
      return p.url.relative(
        p.join(localPath, 'services', serviceName).to(p.url),
        from: projectRoot.to(p.url),
      );
    }

    const services = ['celest_cloud_auth', 'celest_cloud_core'];

    return {
      for (final packageName in packages)
        packageName: PathDependency(packagePath(packageName)),
      for (final serviceName in services)
        serviceName: PathDependency(servicePath(serviceName)),
    };
  }

  static final Map<String, ProjectDependency> all = {
    celest.name: celest,
    celestAst.name: celestAst,
    celestCloudAuth.name: celestCloudAuth,
    celestCore.name: celestCore,
    firebaseAuth.name: firebaseAuth,
    driftHrana.name: driftHrana,
    gotrue.name: gotrue,
    http.name: http,
    meta.name: meta,
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

  static final ProjectDependency celestAst = ProjectDependency._(
    'celest_ast',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('0.1.0')),
    ),
  );

  static final ProjectDependency celestCloudAuth = ProjectDependency._(
    'celest_cloud_auth',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(
        Version.parse('0.3.0').firstPreRelease,
      ),
    ),
  );

  static final ProjectDependency celestCore = ProjectDependency._(
    'celest_core',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(currentMinorVersion),
    ),
  );

  static final ProjectDependency drift = ProjectDependency._(
    'drift',
    DependencyType.dependency,
    HostedDependency(
      version: VersionRange(
        min: Version.parse('2.26.0'),
        max: Version.parse('2.27.0'),
        includeMin: true,
        includeMax: false,
      ),
    ),
  );

  static final ProjectDependency driftHrana = ProjectDependency._(
    'drift_hrana',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('1.0.2')),
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
      version: VersionConstraint.compatibleWith(Version.parse('1.0.0')),
    ),
  );

  static final ProjectDependency meta = ProjectDependency._(
    'meta',
    DependencyType.dependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('1.12.0')),
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
      version: VersionConstraint.compatibleWith(Version.parse('5.0.0')),
    ),
  );

  static final ProjectDependency test = ProjectDependency._(
    'test',
    DependencyType.devDependency,
    HostedDependency(
      version: VersionConstraint.compatibleWith(Version.parse('1.25.0')),
    ),
  );

  static final Map<String, ProjectDependency> backendDependencies = {
    celest.name: celest,
    celestCore.name: celestCore,
    meta.name: meta,
  };

  static final Map<String, ProjectDependency> clientDependencies = {
    celest.name: celest,
    celestCore.name: celestCore,
    http.name: http,
    nativeStorage.name: nativeStorage,
  };

  static final Map<String, ProjectDependency> devDependencies = {
    lints.name: lints,
    test.name: test,
  };

  bool upToDate(Pubspec pubspec) {
    final (expected, actual) = switch (type) {
      DependencyType.dependency when pubspec.name == 'celest_backend' => (
          backendDependencies,
          pubspec.dependencies,
        ),
      DependencyType.dependency => (clientDependencies, pubspec.dependencies),
      DependencyType.devDependency => (
          devDependencies,
          pubspec.devDependencies,
        ),
      _ => unreachable(),
    };
    final expectedVersion = expected[name]!.pubDependency.version;
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

extension DependencyMap on Map<String, ProjectDependency> {
  bool upToDate(Pubspec pubspec) {
    return values.every((dep) => dep.upToDate(pubspec));
  }

  Map<String, HostedDependency> toPub() {
    return map((key, value) => MapEntry(key, value.pubDependency));
  }
}
