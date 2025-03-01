import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/codegen/client_code_generator.dart';
import 'package:celest_cli/codegen/cloud/cloud_client_types.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';

const kClientHeader = [
  'Generated by Celest. This file should not be modified manually, but',
  'it can be checked into version control.',
];

/// Generates the `celest` global for the backend, similar to the frontend
/// `celest` global.
final class CloudClientGenerator {
  CloudClientGenerator({required this.project}) {
    _library =
        LibraryBuilder()
          ..name = ''
          ..comments.addAll(kClientHeader)
          ..body.addAll([
            _client,
            _globalContext,
            lazySpec(_clientClass.build),
            _contextWrapper,
          ]);
    _configLibrary =
        LibraryBuilder()
          ..name = ''
          ..comments.addAll(kClientHeader)
          ..body.addAll([
            _celestEnvironment,
            _variablesClass,
            if (project.secrets.isNotEmpty) _secretsClass,
          ]);
    _dataLibrary =
        LibraryBuilder()
          ..name = ''
          ..comments.addAll(kClientHeader)
          ..body.addAll([_dataClass]);
    _authLibrary =
        LibraryBuilder()
          ..name = ''
          ..comments.addAll(kClientHeader)
          ..body.addAll([_authClass]);
  }

  final ast.Project project;
  late final LibraryBuilder _library;
  late final LibraryBuilder _configLibrary;
  late final LibraryBuilder _dataLibrary;
  late final LibraryBuilder _authLibrary;

  final _client = Field(
    (f) =>
        f
          ..docs.addAll([
            '/// The interface to your Celest backend.',
            '///',
            '/// Similar to the `celest` global in the frontend, this ',
            '/// provides access to the backend environment and services',
            '/// configured for your project.',
          ])
          ..modifier = FieldModifier.constant
          ..type = CloudClientTypes.clientClass.ref
          ..name = CloudClientTypes.topLevelClient.name
          ..assignment =
              CloudClientTypes.clientClass.ref.constInstanceNamed('_', []).code,
  );

  final _globalContext = Method(
    (m) =>
        m
          ..docs.addAll([
            '/// A per-request context object which propogates request information and common',
            '/// accessors to the Celest server environment.',
          ])
          ..type = MethodType.getter
          ..returns = CloudClientTypes.contextClass.ref
          ..name = CloudClientTypes.topLevelContext.name
          ..lambda = true
          ..body =
              CloudClientTypes.contextClass.ref.newInstanceNamed('_', [
                DartTypes.celest.globalContext,
              ]).code,
  );

  late final _celestEnvironment = ExtensionType(
    (e) =>
        e
          ..name = 'CelestEnvironment'
          ..constant = true
          ..primaryConstructorName = '_'
          ..representationDeclaration = RepresentationDeclaration(
            (d) =>
                d
                  ..name = '_env'
                  ..declaredRepresentationType = DartTypes.core.string,
          )
          ..implements.addAll([
            DartTypes.celest.environment,
            DartTypes.core.string,
          ])
          ..docs.addAll([
            '/// An environment of a deployed Celest service.',
            '///',
            '/// Celest services can have multiple isolated branches, for example',
            '/// a `development` and `production` environment.',
          ])
          ..fields.addAll([
            Field(
              (f) =>
                  f
                    ..static = true
                    ..modifier = FieldModifier.constant
                    ..type = refer('CelestEnvironment')
                    ..name = 'local'
                    ..docs.addAll([
                      '/// The local Celest environment, used to delineate when a',
                      '/// Celest service is running on a developer machine as opposed',
                      '/// to the cloud.',
                    ])
                    ..assignment =
                        refer('CelestEnvironment').constInstanceNamed('_', [
                          literalString('local'),
                        ]).code,
            ),
            Field(
              (f) =>
                  f
                    ..static = true
                    ..modifier = FieldModifier.constant
                    ..type = refer('CelestEnvironment')
                    ..name = 'production'
                    ..docs.addAll([
                      '/// The production Celest environment which is common to all',
                      '/// Celest projects and labels the environment which is considered',
                      '/// live and served to end-users.',
                    ])
                    ..assignment =
                        refer('CelestEnvironment').constInstanceNamed('_', [
                          literalString('production'),
                        ]).code,
            ),
          ])
          ..methods.addAll([
            Method(
              (m) =>
                  m
                    ..type = MethodType.getter
                    ..returns = DartTypes.core.bool
                    ..name = 'isLocal'
                    ..lambda = true
                    ..docs.addAll([
                      '/// Whether `this` represents the [local] environment.',
                    ])
                    ..body = refer('this').equalTo(refer('local')).code,
            ),
            Method(
              (m) =>
                  m
                    ..type = MethodType.getter
                    ..returns = DartTypes.core.bool
                    ..name = 'isProduction'
                    ..lambda = true
                    ..docs.addAll([
                      '/// Whether `this` represents the [production] environment.',
                    ])
                    ..body = refer('this').equalTo(refer('production')).code,
            ),
          ]),
  );

  late final _contextWrapper = ExtensionType((e) {
    e
      ..name = CloudClientTypes.contextClass.name
      ..docs.addAll([
        '/// A per-request context object which propogates request information and common',
        '/// accessors to the Celest server environment.',
      ])
      ..primaryConstructorName = '_'
      ..representationDeclaration = RepresentationDeclaration(
        (d) =>
            d
              ..name = '_context'
              ..declaredRepresentationType = DartTypes.celest.context,
      )
      ..implements.add(DartTypes.celest.context);
  });

  late final _clientClass =
      ClassBuilder()
        ..name = CloudClientTypes.clientClass.name
        ..docs.addAll([
          '/// The interface to your Celest backend.',
          '///',
          '/// Similar to the `Celest` class in the frontend, this class',
          '/// provides access to the backend environment and services',
          '/// configured for your project.',
        ])
        ..constructors.add(
          Constructor(
            (c) =>
                c
                  ..constant = true
                  ..name = '_',
          ),
        )
        ..methods.addAll([
          Method(
            (m) =>
                m
                  ..returns = CloudClientTypes.environmentClass.ref
                  ..type = MethodType.getter
                  ..name = 'currentEnvironment'
                  ..lambda = true
                  ..docs.addAll([
                    '/// The current environment of the Celest service.',
                    '///',
                    '/// This is determined by the `CELEST_ENVIRONMENT` variable',
                    '/// which is set for you by the deployment environment.',
                  ])
                  ..body =
                      refer('variables')
                          .property('currentEnvironment')
                          .asA(CloudClientTypes.environmentClass.ref)
                          .code,
          ),
          Method(
            (m) =>
                m
                  ..returns = CloudClientTypes.variablesClass.ref
                  ..type = MethodType.getter
                  ..name = 'variables'
                  ..lambda = true
                  ..docs.addAll([
                    '/// The variables of the Celest service.',
                    '///',
                    '/// This class provides access to the values configured for the',
                    '/// [currentEnvironment].',
                  ])
                  ..body =
                      CloudClientTypes.variablesClass.ref
                          .constInstance([])
                          .code,
          ),
          if (project.secrets.isNotEmpty)
            Method(
              (m) =>
                  m
                    ..returns = CloudClientTypes.secretsClass.ref
                    ..type = MethodType.getter
                    ..name = 'secrets'
                    ..lambda = true
                    ..docs.addAll([
                      '/// The secrets for the Celest service.',
                      '///',
                      '/// This class provides access to the secret values that are configured',
                      '/// for the [currentEnvironment].',
                    ])
                    ..body =
                        CloudClientTypes.secretsClass.ref
                            .constInstance([])
                            .code,
            ),
          if (project.databases.isNotEmpty)
            Method(
              (m) =>
                  m
                    ..returns = CloudClientTypes.dataClass.ref
                    ..type = MethodType.getter
                    ..name = 'data'
                    ..lambda = true
                    ..docs.addAll([
                      '/// The data services for the Celest backend.',
                      '///',
                      '/// This class provides access to the databases that are configured',
                      '/// for the [currentEnvironment].',
                    ])
                    ..body =
                        CloudClientTypes.dataClass.ref.constInstance([]).code,
            ),
        ]);

  late final _variablesClass = Class((b) {
    b
      ..name = CloudClientTypes.variablesClass.name
      ..docs.addAll([
        '/// The environment variables for the Celest service.',
        '///',
        '/// This class provides access to the environment variable values',
        '/// that are configured for the current [CelestEnvironment].',
      ])
      ..constructors.add(Constructor((c) => c..constant = true))
      ..methods.addAll([
        Method((m) {
          m
            ..type = MethodType.getter
            ..returns = DartTypes.core.string
            ..name = 'currentEnvironment'
            ..docs.addAll([
              '/// The environment variable that determines the current environment.',
              '///',
              '/// This is set by the deployment environment and is used to',
              '/// determine the current environment of the Celest service.',
            ])
            ..body =
                DartTypes.celest.globalContext.property('expect').call([
                  DartTypes.celest.environmentVariable.property('environment'),
                ]).code;
        }),
        for (final envVar in project.variables)
          Method((m) {
            m
              ..type = MethodType.getter
              ..returns = DartTypes.core.string
              ..name = envVar.dartName ?? envVar.name.camelCase
              ..docs.addAll(
                envVar.docs.isNotEmpty
                    ? envVar.docs
                    : [
                      '/// The value of the `${envVar.name}` environment variable.',
                    ],
              )
              ..body =
                  DartTypes.celest.globalContext.property('expect').call([
                    DartTypes.celest.environmentVariable.constInstance([
                      literalString(
                        envVar.name,
                        raw: envVar.name.contains(r'$'),
                      ),
                    ]),
                  ]).code;
          }),
      ]);
  });

  late final _secretsClass = Class((b) {
    b
      ..name = CloudClientTypes.secretsClass.name
      ..docs.addAll([
        '/// The secrets for the Celest service.',
        '///',
        '/// This class provides access to the secret values that are configured',
        '/// for the current [CelestEnvironment].',
      ])
      ..constructors.add(Constructor((c) => c..constant = true))
      ..methods.addAll([
        for (final secret in project.secrets)
          Method((m) {
            m
              ..type = MethodType.getter
              ..returns = DartTypes.core.string
              ..name = secret.dartName ?? secret.name.camelCase
              ..docs.addAll(
                secret.docs.isNotEmpty
                    ? secret.docs
                    : ['/// The value of the `${secret.name}` secret.'],
              )
              ..body =
                  DartTypes.celest.globalContext.property('expect').call([
                    DartTypes.celest.environmentVariable.constInstance([
                      literalString(
                        secret.name,
                        raw: secret.name.contains(r'$'),
                      ),
                    ]),
                  ]).code;
          }),
      ]);
  });

  late final _dataClass = Class((b) {
    b
      ..name = CloudClientTypes.dataClass.name
      ..docs.addAll([
        '/// The data services for the Celest backend.',
        '///',
        '/// This class provides access to the databases that are configured',
        '/// for the current [CelestEnvironment].',
      ])
      ..constructors.add(Constructor((c) => c..constant = true))
      ..methods.addAll([
        Method((m) {
          m
            ..static = true
            ..name = 'init'
            ..returns = DartTypes.core.future(DartTypes.core.void$)
            ..requiredParameters.add(
              Parameter(
                (p) =>
                    p
                      ..name = 'context'
                      ..type = DartTypes.celest.context,
              ),
            )
            ..modifier = MethodModifier.async
            ..docs.addAll([
              '/// Initializes the databases attached to this project in the given [context].',
            ])
            ..body = Block((b) {
              for (final database in project.databases.values) {
                final config = database.config as ast.CelestDatabaseConfig;
                b.addExpression(
                  refer('context').property('put').call([
                    refer('_${database.dartName}Key'),
                    refer(
                          'connect',
                          'package:celest/src/runtime/data/connect.dart',
                        )
                        .call(
                          [refer('context')],
                          {
                            'name': literalString(
                              database.name,
                              raw: database.name.contains(r'$'),
                            ),
                            'factory': database.schema.declaration.property(
                              'new',
                            ),
                            'hostnameVariable': DartTypes
                                .celest
                                .environmentVariable
                                .constInstance([
                                  literalString(config.hostname.name),
                                ]),
                            'tokenSecret': DartTypes.celest.secret
                                .constInstance([
                                  literalString(config.token.name),
                                ]),
                          },
                        )
                        .awaited,
                  ]),
                );
              }
            });
        }),
        for (final database in project.databases.values) ...[
          Method((m) {
            final schemaType = switch (database.schema) {
              ast.DriftDatabaseSchema(:final declaration) => declaration,
            };
            m
              ..type = MethodType.getter
              ..returns = schemaType
              ..name = database.dartName
              ..docs.addAll(
                database.docs.isNotEmpty
                    ? database.docs
                    : [
                      '/// The `${schemaType.symbol}` instance for this project.',
                    ],
              )
              ..body =
                  DartTypes.celest.context
                      .property('current')
                      .property('expect')
                      .call([refer('_${database.dartName}Key')])
                      .code;
          }),
          Method((m) {
            final schemaType = switch (database.schema) {
              ast.DriftDatabaseSchema(:final declaration) => declaration,
            };
            m
              ..static = true
              ..type = MethodType.getter
              ..returns = DartTypes.celest.contextKey.toTypeReference.rebuild(
                (t) => t.types.add(schemaType),
              )
              ..name = '_${database.dartName}Key'
              ..docs.addAll(
                database.docs.isNotEmpty
                    ? database.docs
                    : [
                      '/// The context key for the [${database.dartName}] instance.',
                    ],
              )
              ..body =
                  DartTypes.celest.contextKey.constInstance([
                    literalString(
                      database.name,
                      raw: database.name.contains(r'$'),
                    ),
                  ]).code;
          }),
        ],
      ]);
  });

  late final _authClass = Class((b) {
    b
      ..name = CloudClientTypes.authClass.name
      ..docs.addAll([
        '/// The auth service for the Celest backend.',
        '///',
        '/// This class provides access to authentication and authorization',
        '/// operations for the current [CelestEnvironment].',
      ])
      ..constructors.add(Constructor((c) => c..constant = true))
      ..methods.addAll([
        Method((m) {
          m
            ..static = true
            ..name = 'init'
            ..returns = DartTypes.core.future(DartTypes.core.void$)
            ..requiredParameters.add(
              Parameter(
                (p) =>
                    p
                      ..name = 'context'
                      ..type = DartTypes.celest.context,
              ),
            )
            ..modifier = MethodModifier.async
            ..docs.addAll([
              '/// Initializes the Celest Auth service in the given [context].',
            ])
            ..body = Block((b) {
              final database = declareFinal('database').assign(
                refer('connect', 'package:celest/src/runtime/data/connect.dart')
                    .call(
                      [refer('context')],
                      {
                        'name': literalString('CelestAuthDatabase'),
                        'factory': refer(
                          'AuthDatabase',
                          'package:celest_cloud_auth/celest_cloud_auth.dart',
                        ).property('new'),
                        'hostnameVariable': DartTypes.celest.environmentVariable
                            .constInstance([
                              literalString('CELEST_AUTH_DATABASE_HOST'),
                            ]),
                        'tokenSecret': DartTypes.celest.secret.constInstance([
                          literalString('CELEST_AUTH_DATABASE_TOKEN'),
                        ]),
                      },
                    )
                    .awaited,
              );
              b.addExpression(database);
              b.addExpression(
                declareFinal('service').assign(
                  refer(
                    'CelestCloudAuth',
                    'package:celest_cloud_auth/celest_cloud_auth.dart',
                  ).property('create').call([], {
                    'database': refer('database'),
                  }).awaited,
                ),
              );
              b.addExpression(
                refer('context').property('router').property('mount').call([
                  literalString('/v1alpha1/auth/'),
                  refer('service').property('handler'),
                ]),
              );
              b.addExpression(
                refer('context').property('put').call([
                  refer('CelestCloudAuth').property('contextKey'),
                  refer('service'),
                ]),
              );
            });
        }),
      ]);
  });

  Map<Uri, Library> generate() {
    final libraries = <Uri, Library>{};
    libraries[CloudPaths.config] = _configLibrary.build();
    if (project.databases.isNotEmpty) {
      CodegenDependencies.current.add('drift_hrana');
      libraries[CloudPaths.data] = _dataLibrary.build();
    }
    if (project.auth?.providers.isNotEmpty ?? false) {
      CodegenDependencies.current.add('celest_cloud_auth');
      CodegenDependencies.current.add('drift_hrana');
      libraries[CloudPaths.auth] = _authLibrary.build();
    }
    libraries[CloudPaths.client] = _library.build();
    return libraries;
  }
}
