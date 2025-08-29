import 'package:celest_cli/src/codegen/client_code_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:collection/collection.dart';

final class CodeOutputs extends DelegatingMap<String, String> {
  const CodeOutputs(super.base, {required this.codegenDependencies});

  /// Dependencies added as part of the code generation process.
  ///
  /// These must be added to the respective pubspec.yaml after generation
  /// to ensure referenced types are available.
  final CodegenDependencies codegenDependencies;

  Future<void> write() async {
    final outputFutures = <Future<void>>[];
    forEach((path, library) {
      assert(p.isAbsolute(path), 'Path must be absolute: $path');
      outputFutures.add(
        Future<void>(() async {
          final file = fileSystem.file(path);
          await file.create(recursive: true);
          await file.writeAsString(library);
        }),
      );
    });
    if (codegenDependencies.isNotEmpty) {
      outputFutures.add(codegenDependencies.save());
    }
    await Future.wait(outputFutures);
  }
}
