import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/src/context.dart';
import 'package:code_builder/code_builder.dart';

abstract final class ClientPaths {
  static String get client =>
      p.join(projectPaths.clientOutputsDir, 'client.dart');
  static String get functions =>
      p.join(projectPaths.clientOutputsDir, 'functions.dart');
}

final class ClientTypes {
  ClientTypes._(this.name, this.uri);

  static ClientTypes get topLevelClient =>
      ClientTypes._('celest', ClientPaths.client);
  static ClientTypes get clientClass =>
      ClientTypes._('Celest', ClientPaths.client);
  static ClientTypes get functionsClass =>
      ClientTypes._('CelestFunctions', ClientPaths.functions);
  static ClientTypes api(Api api) => ClientTypes._(
        '${ClientTypes.functionsClass.name}${api.name.pascalCase}',
        ClientPaths.functions,
      );

  final String name;
  final String uri;

  Reference get ref => refer(name, p.toUri(uri).toString());
}
