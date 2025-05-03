import 'dart:math';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/sdk/sdk_finder.dart';
import 'package:celest_cloud/celest_cloud.dart' show ProjectAsset_Type, Region;
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart';
import 'package:celest_cloud_hub/src/deploy/deployment_engine.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart' show Insertable, TableStatements;
import 'package:file/local.dart';
import 'package:process/process.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

typedef WithInitialState =
    Insertable<ProjectEnvironmentState> Function(String id);

Future<ProjectEnvironmentState> deployTestApp({
  required CloudHubDatabase db,
  required bool withTurso,
  Region region = Region.NORTH_AMERICA,
  WithInitialState? withInitialState,
}) async {
  const processManager = LocalProcessManager();
  const fileSystem = LocalFileSystem();

  const sdkFinder = DartSdkFinder();
  final sdk = (await sdkFinder.findSdk()).sdk;

  final project = d.dir('celest', [
    d.file(
      'main.dart',
      withTurso
          // TODO(dnys1): Actually use the database
          ? r'''
import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

Future<void> main() async {
  final hostname = Platform.environment['CELEST_DATABASE_HOST'];
  final token = Platform.environment['CELEST_DATABASE_TOKEN'];

  if (hostname == null || token == null) {
    throw StateError('CELEST_DATABASE_HOST and CELEST_DATABASE_TOKEN must be set');
  }

  final database = sqlite3.openInMemory();

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  print('Listening on http://localhost:$port');
  await for (final request in server) {
    final resultSet = database.select("SELECT 'Hello, world!'");
    request.response.write(resultSet.first.values.first);
    await request.response.close();
  }
}
'''
          : r'''
import 'dart:io';

Future<void> main() async {
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  print('Listening on http://localhost:$port');
  await for (final request in server) {
    request.response.write('Hello, world!');
    await request.response.close();
  }
}
''',
    ),
    d.file('pubspec.yaml', '''
name: hello_world

environment:
  sdk: ^3.7.0

${withTurso ? 'dependencies: {sqlite3: any}' : ''}
'''),
  ]);
  await project.create();

  final pubGet = await processManager.run([
    sdk.dart,
    'pub',
    'get',
    '--offline',
    '--directory',
    d.path('celest'),
  ]);
  expect(
    pubGet.exitCode,
    0,
    reason: 'Failed to run pub get:\n${pubGet.stderr}',
  );

  print('Compiling server');
  final res = await processManager.run([
    sdk.dartAotRuntime,
    sdk.frontendServerAotSnapshot,
    '--sdk-root',
    sdk.sdkPath,
    '--platform',
    sdk.vmPlatformProductDill,
    '--aot',
    '--tfa',
    '--no-support-mirrors',
    '--link-platform',
    '--target=vm',
    '-Ddart.vm.product=true',
    '--packages',
    d.path('celest/.dart_tool/package_config.json'),
    '--output-dill=${d.path('celest.aot.dill')}',
    d.path('celest/main.dart'),
  ]);
  if (res.exitCode != 0) {
    fail('Failed to compile hello_world.dart:\n${res.stderr}');
  }
  final bytes = await fileSystem.file(d.path('celest.aot.dill')).readAsBytes();

  print('Creating organization');
  final orgId = typeId('org');
  await db.organizationsDrift.createOrganization(
    id: orgId,
    organizationId: 'celest-test-${Random().nextInt(10000)}',
    state: 'ACTIVE',
    displayName: 'My Organization',
  );

  print('Creating project');
  final projectId = typeId('prj');
  await db.projectsDrift.createProject(
    id: projectId,
    parentType: 'Celest::Organization',
    parentId: orgId,
    projectId: kCelestTest,
    state: 'ACTIVE',
    regions: '',
  );

  print('Creating environment');
  final environmentId = typeId('env');
  final environment =
      (await db.projectEnvironmentsDrift.createProjectEnvironment(
        id: environmentId,
        parentType: 'Celest::Project',
        parentId: projectId,
        projectEnvironmentId: 'production',
        state: 'CREATING',
      )).first;

  final initialState =
      withInitialState?.call(environment.id) ??
      ProjectEnvironmentStatesCompanion.insert(
        projectEnvironmentId: environmentId,
      );
  await db.projectEnvironmentStates.insertOne(initialState);

  final deploymentEngine = DeploymentEngine(
    db: db,
    region: region,
    projectAst: ast.ResolvedProject(
      projectId: kCelestTest,
      environmentId: 'production',
      sdkConfig: ast.SdkConfiguration(
        celest: Version(1, 0, 9),
        dart: ast.Sdk(type: ast.SdkType.dart, version: sdk.version),
      ),
      databases: {
        if (withTurso)
          'default': ast.ResolvedDatabase(
            databaseId: 'default',
            schema: ast.ResolvedDriftDatabaseSchema(
              databaseSchemaId: 'default',
              version: 1,
              schemaJson: {},
            ),
            config: ast.ResolvedCelestDatabaseConfig(
              hostname: ast.ResolvedVariable(
                name: 'CELEST_DATABASE_HOST',
                value: '',
              ),
              token: ast.ResolvedSecret(
                name: 'CELEST_DATABASE_TOKEN',
                value: '',
              ),
            ),
          ),
      },
    ),
    environment: environment,
    kernelAsset: (
      type: ProjectAsset_Type.DART_KERNEL,
      inline: bytes,
      filename: 'main.aot.dill',
      etag: md5.convert(bytes).toString(),
    ),
    flutterAssetsBundle: null,
  );

  print('Deploying');
  final deployed = await deploymentEngine.deploy();

  if (withTurso) {
    expect(deployed.tursoDatabaseName, isNotNull);

    final secrets = await context.fly.listSecrets(
      appName: deployed.flyAppName!,
    );
    expect(secrets, contains('CELEST_DATABASE_TOKEN'));
  } else {
    expect(deployed.tursoDatabaseName, isNull);
  }

  return deployed;
}
