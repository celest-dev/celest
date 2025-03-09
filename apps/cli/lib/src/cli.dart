import 'dart:async';
import 'dart:io' as io show Platform;
import 'dart:io' hide Platform;

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:async/async.dart';
import 'package:celest_cli/commands/celest_command.dart';
import 'package:celest_cli/src/analytics/noop.dart';
import 'package:celest_cli/src/analytics/posthog.dart';
import 'package:celest_cli/src/context.dart' as ctx;
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/logging/cli_json_logger.dart';
import 'package:celest_cli/src/logging/log_event.dart';
import 'package:celest_cli/src/performance/local_perf.dart';
import 'package:celest_cli/src/performance/sentry_perf.dart';
import 'package:celest_cli/src/process/logging_process_manager.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/sdk/sdk_finder.dart';
import 'package:celest_cli/src/sdk/versions.dart';
import 'package:celest_cli/src/storage/storage.dart';
import 'package:celest_cli/src/utils/json.dart';
import 'package:celest_core/_internal.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:http/http.dart' as http;
import 'package:io/ansi.dart';
import 'package:logging/logging.dart';
import 'package:native_storage/native_storage.dart';
import 'package:platform/platform.dart';
import 'package:process/process.dart';
import 'package:sentry/sentry.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:stack_trace/stack_trace.dart';

final class Cli {
  Cli(
    this.name,
    this.description, {
    required this.version,
    this.sentryConfig,
    this.postHogConfig,
  }) {
    _loggerQueue = StreamQueue(Logger.root.onRecord);
  }

  final String name;
  final String description;
  final String version;
  final SentryConfig? sentryConfig;
  final PostHogConfig? postHogConfig;

  late final CommandRunner<int> _runner = CommandRunner<int>(name, description);
  StreamSubscription<LogRecord>? _loggerSub;
  IOSink? _logFile;

  /// Buffers log records until after CLI is configured.
  late final StreamQueue<LogRecord> _loggerQueue;

  static final Logger _logger = Logger('Cli');

  static Future<void> configure({
    required bool verbose,
    bool jsonOutput = false,
    String? sentryDsn,
    PostHogConfig? postHogConfig,
    FileSystem? fileSystem,
    Platform? platform,
    http.Client? httpClient,
    ProcessManager? processManager,
    Storage? storage,
  }) async {
    hierarchicalLoggingEnabled = true;
    Logger.root.level = Level.ALL; // Filtered later, but needed for Sentry.
    ctx.kCliLogLevel = verbose ? Level.ALL : Level.INFO;
    ctx.verbose = verbose;
    if (jsonOutput) {
      ctx.cliLogger = CliJsonLogger();
    }
    ctx.processManager = processManager ?? const LoggingProcessManager();
    ctx.fileSystem = fileSystem ?? const LocalFileSystem();
    ctx.platform = platform ?? const LocalPlatform();
    ctx.httpClient =
        httpClient ??
        (sentryDsn == null
            ? ctx.httpClient
            : SentryHttpClient(client: ctx.httpClient));
    ctx.performance =
        (sentryDsn == null ||
                io.Platform.environment.containsKey('CELEST_NO_ANALYTICS'))
            ? const CelestPerformance()
            : const SentryPerformance();
    ctx.storage = storage ?? Storage();

    try {
      _logger.finest('Initializing secure storage');
      await ctx.secureStorage.init();
    } on Object catch (e, st) {
      _logger.fine('Failed to initialize storage', e, st);
      // TODO(dnys1): Need glib/gio linked on Linux.
      if (kReleaseMode) {
        if (ctx.platform.isLinux) {
          throw const CliException(
            'libsecret is not installed. Please run `apt-get install libsecret-1-dev` '
            'or equivalent before running Celest.',
          );
        }
        // This shouldn't happen in release mode, since permissioning should
        // be set up correctly via signing.
        rethrow;
      }
      // Fallback to in memory storage.
      //
      // This allows, for example, running the CLI without signing on macOS.
      // TODO(dnys1): Add a persistent storage fallback.
      ctx.secureStorage = NativeMemoryStorage(namespace: Storage.cliNamespace);
    }

    ctx.analytics =
        postHogConfig == null ||
                io.Platform.environment.containsKey('CELEST_NO_ANALYTICS')
            ? const NoopAnalytics()
            : PostHog(
              config: postHogConfig,
              client: ctx.httpClient,
              storage: ctx.secureStorage,
            );

    if (kReleaseMode) {
      ctx.analytics.identifyUser(setOnce: {'local_iterations_mvp': true});
    }

    const sdkFinder = DartSdkFinder();
    final result = await sdkFinder.findSdk();
    Sdk.current = Sdk(
      result.sdk.path,
      sdkType: result.sdk.type,
      version: result.sdk.version,
    );
  }

  void _setVersion(CelestCommand command) {
    command.version = version;
    for (final subcommand
        in command.subcommands.values.whereType<CelestCommand>()) {
      _setVersion(subcommand);
    }
  }

  void addCommand(CelestCommand command) {
    _setVersion(command);
    _runner.addCommand(command);
  }

  Future<void> run(List<String> args) async {
    var verbose = ctx.platform.environment.containsKey('CELEST_VERBOSE');
    var jsonOutput = false;
    _runner.argParser
      ..addFlag(
        'verbose',
        abbr: 'v',
        help: 'Enable verbose logging',
        negatable: false,
        defaultsTo: false,
        callback: (v) => verbose = v,
      )
      ..addFlag(
        'json',
        negatable: false,
        help: 'Run CLI with JSON input/output',
        hide: true,
        callback: (j) => jsonOutput = j,
      )
      ..addFlag(
        'version',
        negatable: false,
        help: 'Print the version of Celest',
      );
    final argResults = _runner.parse(args);

    await configure(
      verbose: verbose,
      jsonOutput: jsonOutput,
      sentryDsn: sentryConfig?.dsn,
      postHogConfig: postHogConfig,
    );

    return overrideAnsiOutput(ctx.ansiColorsEnabled, () async {
      if (sentryConfig == null) {
        return _run(argResults);
      }
      return Sentry.init(
        (options) {
          if (const String.fromEnvironment('gitSha') case final gitSha
              when gitSha.isNotEmpty) {
            options.dist = gitSha;
          }
          options
            ..dsn = sentryConfig!.dsn
            ..release = '$name@$version'
            ..environment = ctx.kCliEnvironment
            ..debug = verbose
            ..tracesSampleRate =
                1 // TODO: Lower as needed
            ..sampleRate =
                1 // TODO: Lower as needed
            ..attachStacktrace = true
            ..sendDefaultPii =
                true // TODO: Turn off for compliance
            ..attachThreads = true
            ..captureFailedRequests = true
            ..httpClient = ctx.httpClient
            ..markAutomaticallyCollectedErrorsAsFatal = true
            ..enableDeduplication = true
            ..beforeSend = (SentryEvent event, Hint hint) async {
              event =
                  sentryConfig!.beforeSend?.call(event, hint: hint) ?? event;
              final (:distinctId, :deviceId) = await ctx.secureStorage.init();
              return event.copyWith(
                user: SentryUser(
                  id: deviceId,
                  data: {'distinct_id': distinctId},
                ),
              );
            }
            ..addIntegration(
              // Only using for breadcrumbs.
              LoggingIntegration(
                minBreadcrumbLevel: Level.ALL,
                minEventLevel: LogEvent.level,
              ),
            );
        },
        appRunner: () => _run(argResults),
        // ignore: invalid_use_of_internal_member
        callAppRunnerInRunZonedGuarded: false,
      );
    });
  }

  Future<void> _run(ArgResults argResults) async {
    if (ctx.platform.environment['CELEST_LOG_FILE'] case final logFilepath?) {
      // Try writing to path to make sure it is valid
      final testLogFile = ctx.fileSystem.file(logFilepath);
      try {
        testLogFile.writeAsStringSync('', mode: FileMode.append);
        _logFile = testLogFile.openWrite(mode: FileMode.append);
      } on Object {
        // Invalid log file
        _logger.finest('Could not open log file at $logFilepath');
      }
    }

    try {
      _loggerSub = _loggerQueue.rest.listen((record) {
        // Create non-verbose message
        final message = StringBuffer()..write(record.message);
        if (record.error case final error?) {
          message.write(': $error');
        }

        // Create verbose message
        final verboseMessage = StringBuffer();
        if (record.loggerName != name) {
          verboseMessage.write('[${record.loggerName}] ');
        }
        verboseMessage.write('${record.level.name}: ${record.message}');
        if (record.error case final error?) {
          verboseMessage.write('\n$error');
        }
        if (record.stackTrace case final stackTrace?) {
          verboseMessage.write('\n$stackTrace');
        }
        _logFile?.write(switch (verboseMessage.toString()) {
          final message when message.endsWith(io.Platform.lineTerminator) =>
            message,
          final message => '$message${io.Platform.lineTerminator}',
        });

        if (record.level < ctx.kCliLogLevel) {
          return;
        }

        final cliMessage =
            ctx.verbose ? verboseMessage.toString() : message.toString();
        switch (record.level) {
          case Level.FINEST ||
              Level.FINER ||
              Level.FINE ||
              Level.CONFIG ||
              LogEvent.level:
            ctx.cliLogger.detail(cliMessage);
          case Level.WARNING:
            ctx.cliLogger.warn(cliMessage);
          case Level.SEVERE || Level.SHOUT:
            ctx.cliLogger.err(cliMessage);
          case Level.INFO:
            ctx.cliLogger.info(cliMessage);
          default:
            throw UnimplementedError('Unknown log level: ${record.level}');
        }
      });

      final sdk = Sdk.current;
      final sdkInfo =
          StringBuffer()
            ..writeln('Celest version: $version')
            ..writeln('Dart SDK version: ${sdk.version} (${sdk.dart})');
      if ((sdk.flutterVersion, sdk.flutterSdkRoot) case (
        final flutterVersion?,
        final flutterRoot?,
      )) {
        sdkInfo.writeln('Flutter SDK version: $flutterVersion ($flutterRoot)');
      }

      if (argResults.wasParsed('version') && argResults['version'] as bool) {
        stdout.write(ctx.verbose ? sdkInfo : version);
        return;
      }

      if (sdk.version < minSupportedDartSdk) {
        throw CliException(
          'Celest requires Dart $minSupportedDartSdk or later, but you are '
          'using Dart ${sdk.version}.',
        );
      }

      final configuration = {'verbose': ctx.verbose};
      _logger
        ..finest('Running with config: ${prettyPrintJson(configuration)}')
        ..finest(sdkInfo);

      var failed = false;
      final result = await Chain.capture(
        () => _runner.runCommand(argResults),
        // By attaching an `onError` callback to `Chain.capture` we can create
        // an error zone which can handle otherwise unhandled exceptions.
        //
        // However, control flow is fundamentally broken when an unhandled
        // exception is raised, and even though we await the `Chain.capture`
        // future, all code following the `await` will never be called since the
        // returned future is scrubbed of listeners when an unhandled exception
        // is raised.
        //
        // The `onError` callback is the only oppoortunity to capture the error
        // and perform cleanup.
        //
        // See: https://api.dart.dev/stable/3.3.3/dart-async/Zone/errorZone.html
        onError: (error, stackTrace) async {
          // onError can be called multiple times. But we only want to handle
          // the first error.
          if (failed) return;
          failed = true;
          await _handleError(error, stackTrace);
          // If onError is called, execution of the main body will be stopped
          // since all callbacks attached to the Future are removed.
          await _cleanUp();
        },
      );
      exitCode = result ?? 0;
    } on Object catch (e, st) {
      await _handleError(e, st);
    } finally {
      await _cleanUp();
    }
  }

  Future<void> _handleError(Object error, StackTrace stackTrace) async {
    switch (error) {
      case UsageException():
        stderr.writeln(error);
        exitCode = 1;
      case CliException():
        _logFile
          ?..writeln(error)
          ..writeln(stackTrace);
        ctx.cliLogger.err(error.message);
        if (ctx.verbose) {
          stderr
            ..writeln(error)
            ..writeln(stackTrace);
        }
        exitCode = 1;
      default:
        _logFile
          ?..writeln(error)
          ..writeln(stackTrace);
        ctx.cliLogger
          ..err(error.toString())
          ..detail(stackTrace.toString());
    }
  }

  /// Free up resources before exiting.
  Future<void> _cleanUp() async {
    await Future.wait([
      for (final command in _runner.commands.values.whereType<CelestCommand>())
        command.close(),
    ]);
    await _loggerSub?.cancel();
    await _logFile?.flush();
    await _logFile?.close();
    ctx.httpClient.close();
    exit(exitCode);
  }
}
