import 'dart:math';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/sdk/sdk_finder.dart';
import 'package:celest_cloud/celest_cloud.dart' show ProjectAsset_Type;
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_deployment_engine.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:crypto/crypto.dart';
import 'package:file/local.dart';
import 'package:process/process.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

Future<ProjectEnvironmentState> deployTestApp({
  required CloudHubDatabase db,
  App? app,
}) async {
  const processManager = LocalProcessManager();
  const fileSystem = LocalFileSystem();

  const sdkFinder = DartSdkFinder();
  final sdk = (await sdkFinder.findSdk()).sdk;

  const helloWorld = r'''
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
''';

  final tmpDir = fileSystem.systemTempDirectory.createTempSync('celest_').path;
  await fileSystem
      .directory(tmpDir)
      .childFile('hello_world.dart')
      .writeAsString(helloWorld);
  addTearDown(() async {
    try {
      await fileSystem.directory(tmpDir).delete(recursive: true);
    } on Object {
      // OK
    }
  });

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
    '--output-dill=$tmpDir/celest.aot.dill',
    '$tmpDir/hello_world.dart',
  ]);
  if (res.exitCode != 0) {
    fail('Failed to compile hello_world.dart:\n${res.stderr}');
  }
  final bytes = await fileSystem.file('$tmpDir/celest.aot.dill').readAsBytes();

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

  if (app != null) {
    await db.projectEnvironmentsDrift.upsertProjectEnvironmentState(
      projectEnvironmentId: environmentId,
      flyAppName: app.name,
    );
  }

  final deploymentEngine = FlyDeploymentEngine(
    db: db,
    projectAst: ast.ResolvedProject(
      projectId: kCelestTest,
      environmentId: 'production',
      sdkConfig: ast.SdkConfiguration(
        celest: Version(1, 0, 9),
        dart: ast.Sdk(type: ast.SdkType.dart, version: sdk.version),
      ),
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
  return deploymentEngine.deploy();
}
