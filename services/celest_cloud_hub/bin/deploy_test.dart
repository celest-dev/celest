import 'dart:io';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/sdk/sdk_finder.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_deployment_engine.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:file/local.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:process/process.dart';
import 'package:pub_semver/pub_semver.dart';

const fileSystem = LocalFileSystem();
const processManager = LocalProcessManager();

Future<void> main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(
      '[${record.loggerName.split('.').last}] ${record.level}: ${record.message}',
    );
  });

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
    throw Exception('Failed to compile hello_world.dart:\n${res.stderr}');
  }
  final bytes = await fileSystem.file('$tmpDir/celest.aot.dill').readAsBytes();

  final db = CloudHubDatabase.memory();

  print('Creating organization');
  final orgId = typeId('org');
  await db.organizationsDrift.createOrganization(
    id: orgId,
    organizationId: 'my-org',
    state: 'ACTIVE',
    displayName: 'My Organization',
  );

  print('Creating project');
  final projectId = typeId('prj');
  await db.projectsDrift.createProject(
    id: projectId,
    parentType: 'Celest::Organization',
    parentId: orgId,
    projectId: 'my-project',
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
  final flyApiToken = Platform.environment['FLY_API_TOKEN']!;
  final deploymentEngine = FlyDeploymentEngine(
    db: db,
    flyApiToken: flyApiToken,
    projectAst: ast.ResolvedProject(
      projectId: 'my-project',
      environmentId: 'production',
      sdkConfig: ast.SdkConfiguration(
        celest: Version(1, 0, 9),
        dart: ast.Sdk(type: ast.SdkType.dart, version: sdk.version),
      ),
    ),
    kernelAsset: bytes,
    flutterAssetsBundle: null,
    environment: environment,
  );

  print('Deploying');
  final state = await deploymentEngine.deploy();
  deploymentEngine.close();

  final uri = Uri.parse('https://${state.domainName}');
  final response = await http.get(uri);
  if (response.statusCode != 200) {
    throw http.ClientException(
      'Bad response: ${response.statusCode} ${response.body}',
      uri,
    );
  }
  print(response.body);
}
