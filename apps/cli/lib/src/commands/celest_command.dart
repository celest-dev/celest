import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:async/async.dart';
import 'package:celest_cli/src/cli/cli_runtime.dart';
import 'package:celest_cli/src/cli/stop_signal.dart';
import 'package:celest_cli/src/commands/auth/auth_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/models.dart';
import 'package:celest_cli/src/releases/celest_release_info.dart';
import 'package:celest_cli/src/releases/latest_release.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/version.dart';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';

/// Base class for all commands in this package providing common functionality.
abstract base class CelestCommand extends Command<int> {
  CelestCommand() {
    // Initialize immediately instead of lazily since _stopSub is never accessed
    // directly until `close`.
    _stopSub ??= StreamGroup.merge([
      ProcessSignal.sigint.watch(),
      // SIGTERM is not supported on Windows. Attempting to register a SIGTERM
      // handler raises an exception.
      if (!Platform.isWindows) ProcessSignal.sigterm.watch(),
    ]).listen((signal) {
      Logger.root.fine('Got exit signal: $signal');
      if (!_stopSignal.isStopped) {
        _stopSignal.complete(signal);
      }
    });
  }

  late final Logger logger = Logger(name);

  /// The version of the CLI.
  late final String version;

  /// Whether verbose logging is enabled.
  bool get verbose => globalResults?.flag('verbose') ?? false;

  /// Whether JSON output is enabled.
  bool get jsonOutput => globalResults?.flag('json') ?? false;

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

  Future<void> checkForLatestVersion({bool? includeDev}) async {
    final (latestVersion, _) = await getLatestVersion(includeDev: includeDev);
    if (latestVersion < currentVersion) {
      cliLogger.warn(
        'A new version of Celest is available! Run `celest upgrade` '
        'to get the latest changes.',
      );
    }
  }

  Future<(Version, CelestReleaseInfo?)> getLatestVersion({
    bool? includeDev,
  }) async {
    includeDev ??= currentVersion.isPreRelease;
    try {
      final (latestVersion, releaseInfo) = await performance.trace(
        'CelestCommand',
        'retrieveLatestRelease',
        () => switch (CliRuntime.current) {
          CliRuntime.aot => retrieveLatestRelease(includeDev: includeDev!)
              .then((release) => (release.version, release)),
          CliRuntime.local => Future.value((currentVersion, null)),
          CliRuntime.pubGlobal => _latestVersionPub(includeDev: includeDev!)
              .then((version) => (version, null)),
        }
            .timeout(const Duration(seconds: 3)),
      );
      return (latestVersion, releaseInfo);
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
      return (currentVersion, null);
    }
  }

  Future<Version> _latestVersionPub({
    bool includeDev = false,
  }) async {
    final versionInfo = await resolveVersionInfo('celest_cli');
    if (versionInfo == null) {
      throw Exception(
        'Failed to resolve version information for celest_cli.',
      );
    }
    return maxBy(
      [
        currentVersion,
        versionInfo.latestVersion,
        if (includeDev) versionInfo.latestPrerelease,
      ].nonNulls,
      (v) => v,
    )!;
  }

  /// {@macro celest.cli.stop_signal}
  StopSignal get stopSignal => _stopSignal;

  /// {@macro celest.cli.stop_signal}
  static final StopSignal _stopSignal = StopSignal();

  /// Subscription to [ProcessSignal.sigint] and [ProcessSignal.sigterm] which
  /// forwards to [stopSignal] when triggered.
  static StreamSubscription<ProcessSignal>? _stopSub;

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
        // Don't record args for auth commands, which may contain tokens.
        if (parent is! AuthCommand) 'args': argResults!.arguments.join(' '),
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
      Future.value(_stopSub?.cancel()),
      for (final deferred in _deferred) Future.value(deferred()),
    ]);
  }
}
