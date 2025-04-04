import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:cedar/cedar.dart';
import 'package:celest/celest.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/connect.dart';
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/db_functions.dart';
import 'package:celest_cloud_hub/src/gateway/gateway.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:celest_cloud_hub/src/services/operations_service.dart';
import 'package:celest_cloud_hub/src/services/project_environments_service.dart';
import 'package:celest_core/_internal.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:logging/logging.dart';

Future<void> main() async {
  context.logger.level = Level.ALL;
  context.logger.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  context.put(ContextKey.project, project);
  context.put(
    env.environment,
    kDebugMode ? Environment.local : Environment.production,
  );

  context.logger.config('Starting Cloud Hub');

  context.logger.config('Configuring Cloud Hub database');
  final db = await connect(
    Context.current,
    name: 'CloudHubDatabase',
    factory: CloudHubDatabase.new,
    hostnameVariable: const env('CLOUD_HUB_DATABASE_HOST'),
    tokenSecret: const secret('CLOUD_HUB_DATABASE_TOKEN'),
    setup: (db) => db.addHelperFunctions(),
  );
  await db.ping();

  final issuer = EntityUid.of('Celest::Service', 'cloud-hub');
  final authorizer = Authorizer(db: db);
  final cryptoKeys = await CryptoKeyRepository.create(db: db);

  final authMiddleware = AuthorizationMiddleware(
    corks: CorksRepository(issuer: issuer, db: db, cryptoKeys: cryptoKeys),
    db: db.cloudAuth,
  );

  final server = grpc.Server.create(
    services: [ProjectEnvironmentsService(), OperationsService(db, authorizer)],
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

  await runZonedGuarded(
    () async {
      context.logger.config('Starting gRPC server on $grpcAddress');
      await server.serve(
        address: grpcAddress,
        security: grpc.ServerLocalCredentials(),
      );

      context.logger.config('Starting gateway server');
      await gateway.start();
    },
    (error, stackTrace) {
      context.logger.severe('Unexpected error', error, stackTrace);
      exit(1);
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
}
