import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:crypto/crypto.dart';

final class DeployProjectEnvironmentCommand
    extends BaseCloudCommand<DeployProjectEnvironmentResponse>
    with CloudOperationCommand<DeployProjectEnvironmentResponse> {
  @override
  String get description => 'Deploys a Celest Cloud project environment.';

  @override
  String get name => 'deploy';

  @override
  String get resourceType => 'ProjectEnvironment';

  @override
  DeployProjectEnvironmentResponse createEmptyResource() =>
      DeployProjectEnvironmentResponse();

  @override
  CloudVerbs get verbs => const (
        run: 'deploy',
        running: 'Deploying',
        completed: 'deployed',
      );

  @override
  CloudOperation<DeployProjectEnvironmentResponse> callService() async* {
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
    final tmpDir =
        fileSystem.systemTempDirectory.createTempSync('celest_').path;
    await fileSystem
        .directory(tmpDir)
        .childFile('hello_world.dart')
        .writeAsString(helloWorld);
    final res = await processManager.run([
      Sdk.current.dartAotRuntime,
      Sdk.current.frontendServerAotSnapshot,
      '--sdk-root',
      Sdk.current.sdkPath,
      '--platform',
      Sdk.current.vmPlatformProductDill,
      '--aot',
      '--tfa',
      '--no-support-mirrors',
      '--link-platform',
      '--target=vm',
      '-Ddart.vm.product=true',
      '--output-dill=$tmpDir/main.aot.dill',
      '$tmpDir/hello_world.dart',
    ]);
    if (res.exitCode != 0) {
      throw CelestException(
        'Failed to compile hello_world.dart:\n${res.stderr}',
      );
    }
    final bytes = await fileSystem.file('$tmpDir/main.aot.dill').readAsBytes();
    final etag = md5.convert(bytes).toString();
    yield* cloud.projects.environments.deploy(
      options.resourceId,
      // TODO: Take in celest_ast type
      assets: [
        pb.ProjectAsset(
          type: pb.ProjectAsset_Type.DART_KERNEL,
          filename: 'main.aot.dill',
          inline: bytes,
          etag: etag,
        ),
      ],
      resolvedProject: pb.ResolvedProject(
        name: 'hello',
        sdk: pb.SdkInfo(
          type: pb.SdkType.DART,
          version: pb.Version(
            major: Sdk.current.version.major,
            minor: Sdk.current.version.minor,
            patch: Sdk.current.version.patch,
            canonicalizedVersion: Sdk.current.version.canonicalizedVersion,
          ),
        ),
      ),
      requestId: options.requestId,
      validateOnly: options.validateOnly,
    );
  }
}
