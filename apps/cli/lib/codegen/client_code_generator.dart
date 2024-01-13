import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class ClientCodeGenerator {
  ClientCodeGenerator({
    required this.project,
  });

  final ast.Project project;

  Future<void> generate() async {
    final generator = ClientGenerator(project: project);
    final outputs = generator.generate();
    final outputFutures = <Future<void>>[];
    outputs.forEach((path, library) {
      final code = CodeGenerator.emit(library, forFile: path);
      outputFutures.add(
        Future<void>(() async {
          final file = fileSystem.file(path);
          await file.create(recursive: true);
          await file.writeAsString(code);
        }),
      );
    });
    await Future.wait(outputFutures);
  }
}
