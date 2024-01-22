import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/codegen/client/categories/client_functions_generator.dart';
import 'package:celest_cli/codegen/client/categories/client_serializers_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';

const kClientHeader = [
  'Generated by Celest. This file should not be modified manually, but',
  'it can be checked into version control.',
];

final class ClientGenerator {
  ClientGenerator({
    required this.project,
    required this.projectOutputs,
  }) {
    _library = LibraryBuilder()
      ..name = ''
      ..directives.addAll([
        if (fileSystem.file(ClientPaths.exceptions).existsSync())
          Directive.export('exceptions.dart'),
        if (fileSystem.file(ClientPaths.models).existsSync())
          Directive.export('models.dart'),
      ])
      ..comments.addAll(kClientHeader)
      ..body.addAll([
        _client,
        lazySpec(_clientClass.build),
      ]);
  }

  final ast.Project project;
  final ast.DeployedProject projectOutputs;
  late final LibraryBuilder _library;

  final _client = Field(
    (f) => f
      ..modifier = FieldModifier.final$
      ..type = ClientTypes.clientClass.ref
      ..name = ClientTypes.topLevelClient.name
      ..assignment = ClientTypes.clientClass.ref.newInstance([]).code,
  );
  late final _clientClass = ClassBuilder()
    ..name = ClientTypes.clientClass.name
    ..fields.addAll([
      if (project.apis.values.isNotEmpty) ...[
        Field(
          (f) => f
            ..late = true
            ..type = DartTypes.http.client
            ..name = 'httpClient'
            ..assignment = DartTypes.http.client.newInstance([]).code,
        ),
        Field(
          (f) => f
            ..late = true
            ..modifier = FieldModifier.final$
            ..type = DartTypes.core.uri
            ..name = 'baseUri'
            ..assignment = DartTypes.globals.kIsWeb
                .or(DartTypes.io.platform.property('isAndroid').negate())
                .conditional(
                  DartTypes.core.uri.property('parse').call([
                    literalString(
                      'http://localhost:${(projectOutputs as ast.LocalDeployedProject).port}',
                    ),
                  ]),
                  DartTypes.core.uri.property('parse').call([
                    literalString(
                      'http://10.0.2.2:${(projectOutputs as ast.LocalDeployedProject).port}',
                    ),
                  ]),
                )
                .code,
        ),
      ],
    ]);

  Map<String, Library> generate() {
    final libraries = <String, Library>{};

    final clientInitBody = BlockBuilder();

    var customSerializers = <Class>{};
    var anonymousRecordTypes = <String, RecordType>{};

    final apis = project.apis.values;
    if (apis.isNotEmpty) {
      final functionsGenerator = ClientFunctionsGenerator(
        apis: apis.toList(),
        apiOutputs: projectOutputs.apis.asMap(),
      );
      libraries[ClientPaths.functions] = functionsGenerator.generate();
      _clientClass.fields.add(
        Field(
          (f) => f
            ..modifier = FieldModifier.final$
            ..name = 'functions'
            ..assignment = ClientTypes.functionsClass.ref.newInstance([]).code,
        ),
      );
      customSerializers = functionsGenerator.customSerializers;
      anonymousRecordTypes = functionsGenerator.anonymousRecordTypes;
    }

    if (customSerializers.isNotEmpty) {
      final clientSerializers = ClientSerializersGenerator(
        customSerializers: customSerializers,
        anonymousRecordTypes: anonymousRecordTypes,
      );
      libraries[ClientPaths.serializers] = clientSerializers.generate();

      for (final serializer in customSerializers) {
        clientInitBody.addExpression(
          DartTypes.celest.serializers
              .property('instance')
              .property('put')
              .call([
            refer(
              serializer.name,
              p.toUri(ClientPaths.serializers).toString(),
            ).constInstance([]),
          ]),
        );
      }
    }

    // Add client methods
    final clientInit = Method(
      (m) => m
        ..name = 'init'
        ..returns = DartTypes.core.void$
        ..body = clientInitBody.build(),
    );
    _clientClass.methods.add(clientInit);
    libraries[ClientPaths.client] = _library.build();

    return libraries;
  }
}
