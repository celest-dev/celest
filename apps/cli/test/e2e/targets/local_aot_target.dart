import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';

import '../common/common.dart';

final class LocalAotTarget extends TestTarget {
  @override
  String get name => 'Local (AOT)';

  @override
  Future<void> setUpAll() async {
    // Speed up tests by precompiling the CLI to kernel.
    final entrypoint =
        Directory.current.uri.resolve('bin/celest.dart').toFilePath();
    final output = tempDir.childFile('celest.aot').path;
    await runCommand(<String>[
      Sdk.current.dart,
      'compile',
      'aot-snapshot',
      '-Ddart.vm.product=false',
      '--enable-asserts',
      '--output=$output',
      entrypoint,
    ]);
    executable = [Sdk.current.dartAotRuntime, output];
  }

  @override
  List<String> get tags => const ['e2e-local', 'aot'];

  @override
  late final List<String> executable;

  @override
  Map<String, String> get environment => {
    // <root>/apps/cli/ -> <root>/
    'CELEST_LOCAL_PATH':
        fileSystem.currentDirectory.parent.parent.absolute.path,
    'CELEST_TEST': 'true',
  };
}
