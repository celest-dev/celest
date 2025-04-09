import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:celest/src/core/context.dart';
import 'package:celest_cloud/celest_cloud.dart' show CelestCloud;
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:celest_core/_internal.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:grpc/grpc.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

class E2ETester {
  late String databasePath;
  late CelestCloudAuth cloudAuth;
  late CloudHubDatabase database;
  late Process server;
  late ClientChannel channel;
  late CelestCloud service;

  static Future<String> getDatabasePath() async {
    final tempDir = await Directory.systemTemp.createTemp('test_');
    addTearDown(() => tempDir.delete(recursive: true));
    return p.join(tempDir.path, 'cloud-auth.db');
  }

  Future<void> start() async {
    Context.root = Context.of(Zone.current);
    Context.root.put(ContextKey.project, project);

    databasePath = await getDatabasePath();
    database = CloudHubDatabase.localFile(databasePath, verbose: true);
    await database.ping();
    addTearDown(database.close);

    cloudAuth = await CelestCloudAuth.create(database: database);

    server = await Process.start(
      Platform.resolvedExecutable,
      [
        'run',
        Directory.current.uri.resolve('./bin/cloud_hub.dart').toFilePath(),
      ],
      environment: {
        'PORT': '0',
        'CLOUD_HUB_DATABASE_HOST': Uri.file(databasePath).toString(),
      },
    );
    addTearDown(() async {
      server.kill(ProcessSignal.sigkill);
      await server.exitCode.timeout(const Duration(seconds: 1));
      final sock = File('/tmp/cloud_hub.sock');
      if (sock.existsSync()) {
        await sock.delete();
      }
    });
    final stdout =
        server.stdout
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .asBroadcastStream();
    final stderr =
        server.stderr
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .asBroadcastStream();

    final stdoutListener = stdout.listen((line) {
      print('[server] $line');
    });
    final stderrListener = stderr.listen((line) {
      print('[server] $line');
    });

    addTearDown(stdoutListener.cancel);
    addTearDown(stderrListener.cancel);

    await Future.any([
      stdout.firstWhere((line) => line.startsWith('Serving on')),
      server.exitCode.then(
        (code) => throw StateError('Unexpected exit: $code'),
      ),
    ]);

    final (_, cork) = await createUser(
      userId: 'test',
      roles: [const EntityUid.of('Celest::Role', 'authenticated')],
    );

    channel = ClientChannel(
      InternetAddress('/tmp/cloud_hub.sock', type: InternetAddressType.unix),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    addTearDown(channel.shutdown);
    service = CelestCloud.grpc(
      InternetAddress('/tmp/cloud_hub.sock', type: InternetAddressType.unix),
      authenticator: Authenticator.static(token: cork.toString()),
    );
  }

  Future<(User, Cork)> createUser({
    String? userId,
    String email = 'test@celest.dev',
    required List<EntityUid> roles,
  }) async {
    userId ??= typeId<User>();
    final user = await database.cloudAuth.createUser(
      user: User(
        userId: userId,
        roles: roles,
        emails: [Email(email: email, isPrimary: true)],
      ),
    );
    final session = await cloudAuth.sessions.createSession(
      userId: userId,
      factor: AuthenticationFactorEmailOtp(email: email),
    );
    final cork = await cloudAuth.corks.createCork(user: user, session: session);
    addTearDown(() async {
      await cloudAuth.sessions.deleteSession(sessionId: session.sessionId);
      await cloudAuth.users.deleteUser(userId: userId!);
    });
    return (user, cork);
  }
}
