import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/codegen/client/categories/client_auth_generator.dart';
import 'package:celest_cli/codegen/client/categories/client_functions_generator.dart';
import 'package:celest_cli/codegen/client/categories/client_serializers_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/path.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

const kClientHeader = [
  'Generated by Celest. This file should not be modified manually, but',
  'it can be checked into version control.',
];

final class _ReferencedTypesCollector extends ast.AstVisitor<void> {
  _ReferencedTypesCollector();

  final Set<Reference> _types = {};
  Set<Reference> get types {
    return {
      for (final type in _types)
        if (type.url case final url?)
          if (url.startsWith('package:celest_backend')) type,
    };
  }

  @override
  void visitApi(ast.Api api) {
    _types.addAll(api.exceptionTypes);
    api.functions.values.forEach(visitFunction);
  }

  @override
  void visitFunction(ast.CloudFunction function) {
    _types.add(function.flattenedReturnType);
    function.parameters.forEach(visitParameter);
  }

  @override
  void visitParameter(ast.CloudFunctionParameter parameter) {
    _types.add(parameter.type);
  }

  @override
  void visitProject(ast.Project project) {
    project.apis.values.forEach(visitApi);
  }

  @override
  void visitApiAuthenticated(ast.ApiAuthenticated annotation) {}

  @override
  void visitApiHttpMetadata(ast.ApiHttpMetadata metadata) {}

  @override
  void visitApiMiddleware(ast.ApiMiddleware annotation) {}

  @override
  void visitApiPublic(ast.ApiPublic annotation) {}

  @override
  void visitAuth(ast.Auth auth) {}

  @override
  void visitAuthProvider(ast.AuthProvider provider) {}

  @override
  void visitVariable(ast.Variable variable) {}

  @override
  void visitSecret(ast.Secret secret) {}

  @override
  void visitExternalAuthProvider(ast.ExternalAuthProvider provider) {}
}

final class ClientGenerator {
  ClientGenerator({
    required this.project,
    required this.projectUris,
  }) {
    final referencedTypes = _ReferencedTypesCollector();
    project.accept(referencedTypes);
    _library = LibraryBuilder()
      ..name = ''
      ..comments.addAll(kClientHeader)
      ..directives.addAll([
        if (project.auth != null) ...[
          Directive.export(
            p
                .relative(
                  ClientPaths.auth,
                  from: p.dirname(ClientPaths.client),
                )
                .to(p.posix),
          ),
          // TODO(dnys1): This may cause conflicts with other packages/types
          Directive.export('package:celest_auth/celest_auth.dart'),
        ],
        ...referencedTypes.types.groupSetsBy((ref) => ref.url!).entries.map(
              (symbols) => Directive.export(
                symbols.key,
                show: symbols.value.map((s) => s.symbol!).toSet().toList(),
              ),
            ),
      ])
      ..body.addAll([
        _client,
        _celestEnvironment,
        lazySpec(_clientClass.build),
      ]);
  }

  final ast.Project project;
  final CelestProjectUris projectUris;
  late final LibraryBuilder _library;

  bool get _hasServer => project.apis.isNotEmpty || project.auth != null;

  final _client = Field(
    (f) => f
      ..modifier = FieldModifier.final$
      ..type = ClientTypes.clientClass.ref
      ..name = ClientTypes.topLevelClient.name
      ..assignment = ClientTypes.clientClass.ref.newInstance([]).code,
  );
  late final _celestEnvironment = Enum(
    (e) => e
      ..name = 'CelestEnvironment'
      ..methods.addAll([
        Method(
          (m) => m
            ..type = MethodType.getter
            ..returns = DartTypes.core.uri
            ..name = 'baseUri'
            ..lambda = true
            ..body = Block.of([
              const Code('switch (this) {'),
              const Code('local => '),
              DartTypes.globals.kIsWeb
                  .or(DartTypes.io.platform.property('isAndroid').negate())
                  .conditional(
                    DartTypes.core.uri.property('parse').call([
                      literalString(projectUris.localUri.toString()),
                    ]),
                    DartTypes.core.uri.property('parse').call([
                      literalString(
                        'http://10.0.2.2:${projectUris.localUri.port}',
                      ),
                    ]),
                  )
                  .code,
              const Code(','),
              if (projectUris.productionUri case final productionUri?) ...[
                const Code('production => '),
                DartTypes.core.uri.property('parse').call([
                  literalString(productionUri.toString()),
                ]).code,
                const Code(','),
              ],
              const Code('}'),
            ]),
        ),
      ])
      ..values.addAll([
        EnumValue((v) => v..name = 'local'),
        if (projectUris.productionUri != null)
          EnumValue((v) => v..name = 'production'),
      ]),
  );
  late final _clientClass = ClassBuilder()
    ..name = ClientTypes.clientClass.name
    ..mixins.addAll([
      if (_hasServer) refer('CelestBase', 'package:celest_core/_internal.dart'),
    ])
    ..methods.addAll([
      Method(
        (m) => m
          ..returns = refer('T')
          ..name = '_checkInitialized'
          ..types.add(refer('T'))
          ..requiredParameters.add(
            Parameter(
              (p) => p
                ..name = 'value'
                ..type = FunctionType((f) => f..returnType = refer('T')),
            ),
          )
          ..body = Block(
            (b) => b
              ..statements.add(
                DartTypes.core.stateError
                    .newInstance([
                      literalString(
                        'Celest has not been initialized. Make sure to call '
                        '`celest.init()` at the start of your `main` method.',
                      ),
                    ])
                    .thrown
                    .wrapWithBlockIf(
                      refer('_initialized').negate(),
                    ),
              )
              ..addExpression(
                refer('value').call([]).returned,
              ),
          ),
      ),
      Method(
        (m) => m
          ..returns = refer('CelestEnvironment')
          ..type = MethodType.getter
          ..name = 'currentEnvironment'
          ..lambda = true
          ..body = refer('_checkInitialized').call([
            Method((m) => m..body = refer('_currentEnvironment').code).closure,
          ]).code,
      ),
      if (_hasServer) ...[
        Method(
          (m) => m
            ..annotations.add(DartTypes.core.override)
            ..returns = DartTypes.core.uri
            ..type = MethodType.getter
            ..name = 'baseUri'
            ..lambda = true
            ..body = refer('_checkInitialized').call([
              Method((m) => m..body = refer('_baseUri').code).closure,
            ]).code,
        ),
      ],
    ])
    ..fields.addAll([
      Field(
        (f) => f
          ..modifier = FieldModifier.var$
          ..name = '_initialized'
          ..assignment = literalBool(false).code,
      ),
      Field(
        (f) => f
          ..late = true
          ..type = refer('CelestEnvironment')
          ..name = '_currentEnvironment',
      ),
      if (_hasServer) ...[
        Field(
          (f) => f
            // TODO(dnys1): Add back in 0.5.0
            // ..annotations.add(DartTypes.core.override)
            ..late = true
            ..modifier = FieldModifier.final$
            ..type = DartTypes.nativeStorage.nativeStorage
            ..name = 'nativeStorage'
            ..assignment =
                DartTypes.nativeStorage.nativeStorage.newInstance([], {
              'scope': literalString('celest'),
            }).code,
        ),
        Field(
          (f) => f
            ..annotations.add(DartTypes.core.override)
            ..late = true
            ..type = DartTypes.http.client
            ..name = 'httpClient'
            ..assignment = refer(
              'CelestHttpClient',
              'package:celest_core/_internal.dart',
            ).newInstance([], {
              'secureStorage': refer('nativeStorage').property('secure'),
            }).code,
        ),
        Field(
          (f) => f
            ..late = true
            ..type = DartTypes.core.uri
            ..name = '_baseUri',
        ),
      ],
    ]);

  Map<String, Library> generate() {
    final libraries = <String, Library>{};

    final clientInitBody = BlockBuilder();

    // Common setup work
    clientInitBody.addExpression(
      refer('_currentEnvironment').assign(refer('environment')),
    );
    if (_hasServer) {
      clientInitBody.addExpression(
        refer('_baseUri').assign(refer('environment').property('baseUri')),
      );
    }

    var customSerializers = <SerializerDefinition>{};
    var anonymousRecordTypes = <String, RecordType>{};

    final hasExternalAuth = project.auth?.externalProviders.isNotEmpty ?? false;

    final apis = project.apis.values;
    if (apis.isNotEmpty) {
      final functionsGenerator = ClientFunctionsGenerator(
        project: project,
        apis: apis.toList(),
      );
      libraries[ClientPaths.functions] = functionsGenerator.generate();
      _clientClass
        ..fields.add(
          Field(
            (f) => f
              ..modifier = FieldModifier.final$
              ..name = '_functions'
              ..assignment =
                  ClientTypes.functionsClass.ref.newInstance([]).code,
          ),
        )
        ..methods.add(
          Method(
            (m) => m
              ..returns = ClientTypes.functionsClass.ref
              ..type = MethodType.getter
              ..name = 'functions'
              ..lambda = true
              ..body = refer('_checkInitialized').call([
                Method((m) => m..body = refer('_functions').code).closure,
              ]).code,
          ),
        );
      customSerializers = functionsGenerator.customSerializers;
      anonymousRecordTypes = functionsGenerator.anonymousRecordTypes;
    }
    if (project.auth case final auth?) {
      final authLibrary = ClientAuthGenerator(auth: auth).generate();
      libraries[ClientPaths.auth] = authLibrary;
      _clientClass
        ..fields.add(
          Field(
            (f) => f
              ..late = true
              ..modifier = FieldModifier.final$
              ..type = ClientTypes.authClass.ref
              ..name = '_auth'
              ..assignment = ClientTypes.authClass.ref.newInstance([
                refer('this'),
              ], {
                'storage': refer('nativeStorage'),
              }).code,
          ),
        )
        ..methods.add(
          Method(
            (m) => m
              ..returns = ClientTypes.authClass.ref
              ..type = MethodType.getter
              ..name = 'auth'
              ..lambda = true
              ..body = refer('_checkInitialized').call([
                Method((m) => m..body = refer('_auth').code).closure,
              ]).code,
          ),
        );
      clientInitBody
        ..statements.insert(
          0,
          refer('_auth').property('signOut').call([]).wrapWithBlockIf(
            refer('_initialized').and(
              refer('environment').notEqualTo(refer('_currentEnvironment')),
            ),
          ),
        )
        ..addExpression(
          refer('scheduleMicrotask', 'dart:async').call([
            if (hasExternalAuth)
              Method(
                (m) => m
                  ..body = refer('_auth').property('init').call([], {
                    'externalAuth': refer('externalAuth'),
                  }).code,
              ).closure
            else
              refer('_auth').property('init'),
          ]),
        );
    }

    if (customSerializers.isNotEmpty) {
      final clientSerializers = ClientSerializersGenerator(
        customSerializers: customSerializers,
        anonymousRecordTypes: anonymousRecordTypes,
      );
      libraries[ClientPaths.serializers] = clientSerializers.generate();

      final initSerializers =
          refer('initSerializers', ClientPaths.serializers).call([], {
        'serializers': refer('serializers'),
      }).statement;
      clientInitBody.statements.add(
        initSerializers.wrapWithBlockIf(refer('_initialized').negate()),
      );
    }

    clientInitBody.addExpression(
      refer('_initialized').assign(literalBool(true)),
    );

    // Add client methods
    final clientInit = Method(
      (m) => m
        ..name = 'init'
        ..returns = DartTypes.core.void$
        ..optionalParameters.addAll([
          Parameter(
            (p) => p
              ..name = 'environment'
              ..type = refer('CelestEnvironment')
              ..named = true
              ..defaultTo = refer('CelestEnvironment').property('local').code,
          ),
          Parameter(
            (p) => p
              ..name = 'serializers'
              ..type = DartTypes.celest.serializers.nullable
              ..named = true,
          ),
          if (hasExternalAuth)
            Parameter(
              (p) => p
                ..name = 'externalAuth'
                ..type = refer('ExternalAuth', ClientPaths.auth).nullable
                ..named = true,
            ),
        ])
        ..body = clientInitBody.build(),
    );
    _clientClass.methods.add(clientInit);
    libraries[ClientPaths.client] = _library.build();

    return libraries;
  }
}
