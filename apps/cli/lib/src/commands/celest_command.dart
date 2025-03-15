import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/models.dart';
import 'package:celest_cli/src/releases/latest_release.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:cli_util/cli_util.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';

/// Base class for all commands in this package providing common functionality.
abstract base class CelestCommand extends Command<int> {
  late final Logger logger = Logger(name);

  /// The version of the CLI.
  late final String version;

  /// Whether verbose logging is enabled.
  bool get verbose => globalResults?['verbose'] as bool? ?? false;

  /// The path to the Flutter SDK, if installed.
  late final String? flutterRoot = () {
    final dartSdkPath = getSdkPath();
    final flutterBin = p.dirname(p.dirname(dartSdkPath));
    if (File(p.join(flutterBin, 'flutter')).existsSync()) {
      return p.dirname(flutterBin);
    }
    return null;
  }();

  /// Resolves the latest version information from `pub.dev`.
  Future<PubVersionInfo?> resolveVersionInfo(String package) async {
    // Get the currently published version of the package.
    final uri = Uri.parse('https://pub.dev/api/packages/$package');
    final resp = await httpClient.get(
      uri,
      headers: const {HttpHeaders.acceptHeader: 'application/vnd.pub.v2+json'},
    );

    // Package is unpublished
    if (resp.statusCode == 404) {
      return null;
    }
    if (resp.statusCode != 200) {
      throw http.ClientException(resp.body, uri);
    }

    final respJson = jsonDecode(resp.body) as Map<String, Object?>;
    final versions = (respJson['versions'] as List<Object?>?) ?? <Object?>[];
    final semvers = <Version>[];
    for (final version in versions) {
      final map = (version as Map).cast<String, Object?>();
      final semver = map['version'] as String?;
      if (semver == null) {
        continue;
      }
      semvers.add(Version.parse(semver));
    }

    return PubVersionInfo(semvers..sort());
  }

  Future<void> checkForLatestVersion() async {
    try {
      final latestRelease = await performance.trace(
        'CelestCommand',
        'retrieveLatestRelease',
        () =>
            retrieveLatestRelease(version).timeout(const Duration(seconds: 3)),
      );
      if (latestRelease.version > Version.parse(version)) {
        cliLogger.warn(
          'A new version of Celest is available! Run `celest upgrade` '
          'to get the latest changes.',
        );
      }
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
    }
  }

  @override
  @mustCallSuper
  Future<int> run() async {
    logger.finest(
      'Running `celest $name` from "${fileSystem.currentDirectory.path}"',
    );
    analytics.capture(
      'cli',
      properties: {
        'command': name,
        'args': argResults!.arguments.join(' '),
        'environment': kCliEnvironment,
        'version': version,
        'sdk_version': Sdk.current.version.toString(),
        if (Sdk.current.flutterVersion case final flutterVersion?)
          'flutter_sdk_version': flutterVersion.toString(),
      },
    );
    return 0;
  }

  final _deferred = <FutureOr<void> Function()>[];

  /// Defers a function to be called when the command is closed.
  void defer(FutureOr<void> Function() fn) {
    _deferred.add(fn);
  }

  @mustCallSuper
  Future<void> close() async {
    await Future.wait([
      for (final deferred in _deferred) Future.value(deferred()),
    ]);
  }
}
