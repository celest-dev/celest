import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:collection/collection.dart';

final class CodeOutputs extends DelegatingMap<String, String> {
  const CodeOutputs(super.base);

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
    await Future.wait(outputFutures);
  }
}
