import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';

import '../common/common.dart';

final class LocalTarget extends TestTarget {
  @override
  String get name => 'Local';

  @override
  Future<void> setUpAll() async {
    // Speed up tests by precompiling the CLI to kernel.
    final entrypoint =
        Directory.current.uri.resolve('bin/celest.dart').toFilePath();
    final output = tempDir.childFile('celest.dill').path;
    await runCommand(<String>[
      Sdk.current.dartAotRuntime,
      Sdk.current.genKernelAotSnapshot,
      // TODO(dnys1): Create AOT snapshot when --enable-asserts is available
      // https://github.com/dart-lang/sdk/issues/53343
      // '--aot',
      '--enable-asserts',
      '--platform=${Sdk.current.vmPlatformProductDill}',
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
