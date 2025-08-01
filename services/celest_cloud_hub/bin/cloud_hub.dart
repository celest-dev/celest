import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

import 'package:async/async.dart';
import 'package:cedar/cedar.dart';
import 'package:celest/celest.dart';
import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/sessions/sessions_repository.dart';
import 'package:celest_cloud_auth/src/users/users_repository.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/db_functions.dart';
import 'package:celest_cloud_hub/src/database/libsql_native.dart';
import 'package:celest_cloud_hub/src/gateway/gateway.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:celest_cloud_hub/src/services/health_service.dart';
import 'package:celest_cloud_hub/src/services/operations_service.dart';
import 'package:celest_cloud_hub/src/services/organizations_service.dart';
import 'package:celest_cloud_hub/src/services/project_environments_service.dart';
import 'package:celest_cloud_hub/src/services/projects_service.dart';
import 'package:celest_core/_internal.dart';
import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:ffi/ffi.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:logging/logging.dart';
import 'package:sentry/sentry.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:stack_trace/stack_trace.dart';

Future<void> main() async {
  context.logger.level = switch (Platform.environment['LOG_LEVEL']) {
    final level? => Level.LEVELS.firstWhere(
      (l) => l.name.toLowerCase() == level.toLowerCase(),
      orElse: () => throw StateError('Invalid log level: $level'),
    ),
    _ => Level.INFO,
  };
  context.logger.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
    if (record.error != null) {
      print(record.error);
    }
    if (record.stackTrace != null) {
      print(record.stackTrace);
    }
  });
  driftRuntimeOptions.debugPrint = (message) {
    context.logger.finest(message);
  };

  context.put(ContextKey.project, project);
  context.put(
    env.environment,
    kDebugMode ? Environment.local : context.environment,
  );

  context.logger.config('Starting Cloud Hub');
  context.logger.config('Environment: ${context.environment}');

  final environmentVariables = Platform.environment.keys.toList()..sort();
  context.logger.config(
    'Environment Variables: ${environmentVariables.join(', ')}',
  );

  final sentryDsn = context.sentryDsn;
  if (sentryDsn != null) {
    await Sentry.init((options) {
      options
        ..dsn = sentryDsn
        ..environment = kDebugMode ? 'dev' : 'prod'
        ..debug = context.logger.level > Level.INFO
        ..tracesSampleRate = 1
        ..sampleRate = 1
        ..attachStacktrace = true
        ..sendDefaultPii = true
        ..attachThreads = true
        ..captureFailedRequests = true
        ..httpClient = context.httpClient
        ..markAutomaticallyCollectedErrorsAsFatal = true
        ..enableDeduplication = true
        ..addIntegration(
          // Only using for breadcrumbs.
          LoggingIntegration(
            minBreadcrumbLevel: Level.ALL,
            minEventLevel: const Level('EVENT', 1500),
          ),
        );
    });
  }

  return _run();
}

Future<void> _run() async {
  context.logger.config('Configuring Cloud Hub database');

  const tursoHost = env('CLOUD_HUB_DATABASE_HOST');
  const tursoAuthToken = secret('CLOUD_HUB_DATABASE_TOKEN');

  final tempDir = await Directory.systemTemp.createTemp('celest_cloud_hub_');
  final localFile = File.fromUri(tempDir.uri.resolve('CloudHubDatabase.db'));
  final localPath = localFile.uri.toFilePath();

  void libsqlLogger(libsql_log_t log) {
    String message;
    try {
      message = log.message.cast<Utf8>().toDartString().trim();
    } on FormatException {
      message = '';
    }
    if (message.isEmpty) {
      return;
    }
    final level = switch (log.level) {
      libsql_tracing_level_t.LIBSQL_TRACING_LEVEL_ERROR => Level.SEVERE,
      libsql_tracing_level_t.LIBSQL_TRACING_LEVEL_WARN => Level.WARNING,
      libsql_tracing_level_t.LIBSQL_TRACING_LEVEL_INFO => Level.INFO,
      libsql_tracing_level_t.LIBSQL_TRACING_LEVEL_DEBUG => Level.FINE,
      libsql_tracing_level_t.LIBSQL_TRACING_LEVEL_TRACE => Level.FINEST,
    };
    context.logger.log(level, 'libsql: $message');
  }

  final nativeReplica = using((arena) {
    final tursoHostValue = context.get(tursoHost);
    final tursoAuthTokenValue = context.get(tursoAuthToken);
    if (tursoHostValue == null || tursoAuthTokenValue == null) {
      return null;
    }

    final config = arena.allocate<libsql_config_t>(sizeOf<libsql_config_t>());
    config.ref.logger =
        NativeCallable<Void Function(libsql_log_t log)>.listener(
          libsqlLogger,
        ).nativeFunction;
    final setupErr = libsql_setup(config.ref);
    if (setupErr != nullptr) {
      final errorMessage = libsql_error_message(setupErr);
      throw StateError(
        'Failed to set up libsql: '
        '${errorMessage.cast<Utf8>().toDartString()}',
      );
    }

    final desc = arena.allocate<libsql_database_desc_t>(
      sizeOf<libsql_database_desc_t>(),
    );
    desc.ref
      ..path = localPath.toNativeUtf8().cast()
      ..url = tursoHostValue.toNativeUtf8().cast()
      ..auth_token = tursoAuthTokenValue.toNativeUtf8().cast()
      ..synced = true
      ..sync_interval = 60 * 1000; // 60 seconds
    final database = libsql_database_init(desc.ref);
    if (database.err != nullptr) {
      final errorMessage = libsql_error_message(database.err);
      throw StateError(
        'Failed to initialize libsql database: '
        '${errorMessage.cast<Utf8>().toDartString()}',
      );
    }

    return database;
  });

  if (nativeReplica != null) {
    context.logger.config('Syncing native libsql replica at $localPath');

    // Sync once.
    await Isolate.run(() {
      final syncResult = libsql_database_sync(nativeReplica);
      if (syncResult.err != nullptr) {
        final errorMessage = libsql_error_message(syncResult.err);
        throw StateError(
          'Failed to sync libsql database: '
          '${errorMessage.cast<Utf8>().toDartString()}',
        );
      }
    });

    context.logger.config('Native libsql replica synced successfully');
  }

  final celestDb = await CelestDatabase.create(
    Context.current,
    name: 'CloudHubDatabase',
    factory: CloudHubDatabase.new,
    hostnameVariable: tursoHost,
    tokenSecret: tursoAuthToken,
    path: nativeReplica != null ? localPath : null,
  );
  final db = await celestDb.connect(
    setup: (db) => db.addHelperFunctions(),
    logStatements: context.logger.level <= Level.FINEST,
  );
  await db.ping();

  final issuer = EntityUid.of('Celest::Service', 'cloud-hub');
  final authorizer = Authorizer(db: db);
  final cryptoKeys = await CryptoKeyRepository.create(db: db);

  final authMiddleware = AuthorizationMiddleware(
    corks: CorksRepository(issuer: issuer, db: db, cryptoKeys: cryptoKeys),
    sessions: SessionsRepository(
      corks: CorksRepository(issuer: issuer, db: db, cryptoKeys: cryptoKeys),
      cryptoKeys: cryptoKeys,
      db: db,
      users: UsersRepository(db: db),
    ),
    db: db.cloudAuth,
  );

  final server = grpc.Server.create(
    services: [
      HealthService(),
      OperationsService(db, authorizer),
      OrganizationsService(db, authorizer),
      ProjectsService(db, authorizer),
      ProjectEnvironmentsService(db, authorizer),
    ],
    interceptors: [
      (call, method) async {
        try {
          await authMiddleware.authenticate(call, method);
          return null;
        } on grpc.GrpcError catch (e) {
          return e;
        } on CloudException catch (e) {
          return e.toGrpcError();
        }
      },
    ],
  );

  context.logger.config('Configuring gateway');
  final grpcSock = File('/tmp/cloud_hub.sock');
  if (grpcSock.existsSync()) {
    grpcSock.deleteSync();
  }
  final grpcAddress = InternetAddress(
    type: InternetAddressType.unix,
    grpcSock.path,
  );

  final gateway = await Gateway.create(
    db: db,
    grpcAddress: grpcAddress,
    port: switch (Platform.environment['PORT']) {
      final port? =>
        int.tryParse(port) ?? (throw StateError('Invalid port: $port')),
      _ => 8080,
    },
  );

  await Chain.capture(
    when: kDebugMode,
    errorZone: true,
    () async {
      context.logger.config('Starting gRPC server on $grpcAddress');
      await server.serve(
        address: grpcAddress,
        security: grpc.ServerLocalCredentials(),
      );

      context.logger.config('Starting gateway server');
      await gateway.start();
    },
    onError: (error, stackTrace) {
      context.logger.shout('Unexpected error', error, stackTrace);
      if (Sentry.isEnabled) {
        Sentry.captureException(error, stackTrace: stackTrace);
      }
    },
  );

  print('Serving on http://0.0.0.0:${gateway.port}');

  final signal = await StreamGroup.merge([
    ProcessSignal.sigint.watch(),
    ProcessSignal.sigterm.watch(),
  ]).first;
  context.logger.fine('Got $signal');

  try {
    await server.shutdown();
    await gateway.close();
    await db.close();
  } finally {
    if (nativeReplica != null) {
      libsql_database_deinit(nativeReplica);
    }
    try {
      await tempDir.delete(recursive: true);
    } on Object catch (e) {
      context.logger.warning('Failed to delete temp dir', e);
    }
  }
  context.logger.fine('Server stopped');
  exit(0);
}
