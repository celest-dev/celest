import 'dart:io';

import 'package:celest_cli/compiler/native_assets/native_asset_helpers.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

import '../common/common.dart';

final class LocalTarget extends TestTarget {
  @override
  String get name => 'Local';

  @override
  Future<void> setUpAll() async {
    // Speed up tests by precompiling the CLI to kernel.
    final entrypoint =
        Directory.current.uri.resolve('bin/celest.dart').toFilePath();
    final nativeAssetsYaml =
        tempDir.uri.resolve('native_assets.yaml').toFilePath();
    final output = tempDir.childFile('celest.dill').path;
    await generateNativeAssetsYaml(
      packageRoot: Directory.current.uri,
      outputDir: tempDir,
    );
    await runCommand(<String>[
      Sdk.current.dartAotRuntime,
      Sdk.current.genKernelAotSnapshot,
      // TODO(dnys1): Create AOT snapshot when --enable-asserts is available
      // https://github.com/dart-lang/sdk/issues/53343
      // '--aot',
      '--enable-asserts',
      '--enable-experiment=native-assets',
      '--platform=${Sdk.current.vmPlatformProductDill}',
      '--native-assets=$nativeAssetsYaml',
      '--output=$output',
      entrypoint,
    ]);
    executable = [Sdk.current.dart, output];
  }

  @override
  List<String> get tags => const ['e2e-local'];

  @override
  late final List<String> executable;

  @override
  Map<String, String> get environment => {
        // <root>/apps/cli/ -> <root>/celest/
        'CELEST_LOCAL_PATH': fileSystem
            .currentDirectory.parent.parent.absolute.uri
            .resolve('celest/')
            .toFilePath(),
        'CELEST_TEST': 'true',
      };
}
