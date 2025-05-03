import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:cedar/cedar.dart';
import 'package:celest/celest.dart';
import 'package:celest/src/runtime/data/connect.dart';
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
import 'package:celest_cloud_hub/src/gateway/gateway.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:celest_cloud_hub/src/services/health_service.dart';
import 'package:celest_cloud_hub/src/services/operations_service.dart';
import 'package:celest_cloud_hub/src/services/organizations_service.dart';
import 'package:celest_cloud_hub/src/services/project_environments_service.dart';
import 'package:celest_cloud_hub/src/services/projects_service.dart';
import 'package:celest_core/_internal.dart';
import 'package:drift/drift.dart' show driftRuntimeOptions;
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
  if (sentryDsn == null) {
    return _run();
  }
  return Sentry.init(
    (options) {
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
    },
    appRunner: _run,
    // ignore: invalid_use_of_internal_member
    callAppRunnerInRunZonedGuarded: false,
  );
}

Future<void> _run() async {
  context.logger.config('Configuring Cloud Hub database');
  final db = await connect(
    Context.current,
    name: 'CloudHubDatabase',
    factory: CloudHubDatabase.new,
    hostnameVariable: const env('CLOUD_HUB_DATABASE_HOST'),
    tokenSecret: const secret('CLOUD_HUB_DATABASE_TOKEN'),
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

  final signal =
      await StreamGroup.merge([
        ProcessSignal.sigint.watch(),
        ProcessSignal.sigterm.watch(),
      ]).first;
  context.logger.fine('Got $signal');

  await server.shutdown();
  await gateway.close();
  await db.close();
  context.logger.fine('Server stopped');
  exit(0);
}
