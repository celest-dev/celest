import 'package:celest_ast/celest_ast.dart';
import 'package:celest_ast/src/proto/celest/ast/v1/resolved_ast.pb.dart' as pb;
import 'package:code_builder/code_builder.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

void main() {
  test('Proto Interop', () {
    final databaseSchemaJson = <String, Object?>{
      'entities': [
        {
          'id': 0,
          'references': <Object?>[],
          'type': 'table',
          'data': {
            'name': 'organizations',
            'was_declared_in_moor': true,
            'columns': [
              {
                'name': 'id',
                'getter_name': 'id',
                'moor_type': 'string',
                'nullable': false,
                'customConstraints': 'NOT NULL PRIMARY KEY',
                'default_dart': null,
                'default_client_dart': null,
                'dsl_features': ['primary-key'],
              },
            ],
            'is_virtual': false,
            'without_rowid': false,
            'constraints': <Object?>[],
          },
        },
      ],
    };
    final resolvedProject = ResolvedProject(
      projectId: 'test',
      environmentId: 'local',
      sdkConfig: SdkConfiguration(
        celest: Version.parse('1.0.0'),
        dart: Sdk(
          type: SdkType.dart,
          version: Version.parse('3.5.0'),
          enabledExperiments: ['native-assets'],
        ),
        flutter: Sdk(type: SdkType.flutter, version: Version.parse('3.22.0')),
        targetSdk: SdkType.dart,
        featureFlags: [FeatureFlag.streaming],
      ),
      apis: {
        'greeting': ResolvedApi(
          apiId: 'greeting',
          functions: {
            'hello-world': ResolvedCloudFunction(
              apiId: 'greeting',
              functionId: 'hello-world',
              variables: ['HELLO_WORLD'],
              secrets: ['HELLO_WORLD_SECRET'],
              streamConfig: ResolvedStreamConfig(
                type: StreamType.unidirectionalClient,
              ),
              httpConfig: ResolvedHttpConfig(
                route: ResolvedHttpRoute(
                  method: 'PATCH',
                  path: '/greeting/hello-world',
                ),
                status: 204,
                statusMappings: {
                  TypeReference(
                        (t) =>
                            t
                              ..symbol = 'NotFoundException'
                              ..url = 'package:celest_core/celest_core.dart',
                      ):
                      404,
                },
              ),
            ),
          },
        ),
      },
      auth: ResolvedAuth(
        providers: [
          ResolvedGoogleAuthProvider(
            authProviderId: 'google',
            clientId: ResolvedSecret(name: 'GOOGLE_CLIENT_ID', value: '123'),
            clientSecret: ResolvedSecret(
              name: 'GOOGLE_CLIENT_SECRET',
              value: '456',
            ),
          ),
        ],
        externalProviders: [
          ResolvedFirebaseExternalAuthProvider(
            authProviderId: 'firebase',
            projectId: ResolvedVariable(
              name: 'FIREBASE_PROJECT_ID',
              value: 'test-123',
            ),
          ),
          ResolvedSupabaseExternalAuthProvider(
            authProviderId: 'supabase',
            projectUrl: ResolvedVariable(
              name: 'SUPABASE_URL',
              value: 'https://test.supabase.co',
            ),
            jwtSecret: ResolvedSecret(
              name: 'SUPABASE_JWT_SECRET',
              value: 'jwt-secret',
            ),
          ),
        ],
      ),
      variables: [ResolvedVariable(name: 'HELLO_WORLD', value: 'hello')],
      secrets: [ResolvedSecret(name: 'HELLO_WORLD_SECRET', value: 'world')],
      databases: {
        'default': ResolvedDatabase(
          databaseId: 'default',
          schema: ResolvedDriftDatabaseSchema(
            databaseSchemaId: 'default',
            version: 1,
            schemaJson: databaseSchemaJson,
          ),
          config: ResolvedCelestDatabaseConfig(
            hostname: ResolvedVariable(
              name: 'CELEST_DATABASE_DEFAULT_HOST',
              value: '',
            ),
            token: ResolvedSecret(
              name: 'CELEST_DATABASE_DEFAULT_TOKEN',
              value: '',
            ),
          ),
        ),
      },
    );

    expect(
      resolvedProject.databases.values.first.schema,
      isA<ResolvedDriftDatabaseSchema>().having(
        (s) => s.schemaJson,
        'schemaJson',
        databaseSchemaJson,
      ),
    );

    final pb.ResolvedProject proto = resolvedProject.toProto();
    expect(proto.toProto3Json(), {
      'projectId': 'test',
      'environmentId': 'local',
      'sdkConfig': {
        'celest': {
          'major': 1,
          'minor': 0,
          'patch': 0,
          'canonicalizedVersion': '1.0.0',
        },
        'dart': {
          'type': 'DART',
          'version': {
            'major': 3,
            'minor': 5,
            'patch': 0,
            'canonicalizedVersion': '3.5.0',
          },
          'enabledExperiments': ['native-assets'],
        },
        'flutter': {
          'type': 'FLUTTER',
          'version': {
            'major': 3,
            'minor': 22,
            'patch': 0,
            'canonicalizedVersion': '3.22.0',
          },
        },
        'targetSdk': 'DART',
        'featureFlags': ['STREAMING'],
      },
      'apis': {
        'greeting': {
          'apiId': 'greeting',
          'functions': {
            'hello-world': {
              'functionId': 'hello-world',
              'parentId': 'greeting',
              'variables': ['HELLO_WORLD'],
              'secrets': ['HELLO_WORLD_SECRET'],
              'httpConfig': {
                'route': {'method': 'PATCH', 'path': '/greeting/hello-world'},
                'status': 204,
                'statusMappings': {
                  'package:celest_core/celest_core.dart#NotFoundException': 404,
                },
              },
              'streamConfig': {'type': 'UNIDIRECTIONAL_CLIENT'},
            },
          },
        },
      },
      'auth': {
        'providers': [
          {
            'authProviderId': 'google',
            'type': 'GOOGLE',
            'google': {
              'clientId': {'name': 'GOOGLE_CLIENT_ID', 'value': '123'},
              'clientSecret': {'name': 'GOOGLE_CLIENT_SECRET', 'value': '456'},
            },
          },
        ],
        'externalProviders': [
          {
            'authProviderId': 'firebase',
            'type': 'FIREBASE',
            'firebase': {
              'projectId': {'name': 'FIREBASE_PROJECT_ID', 'value': 'test-123'},
            },
          },
          {
            'authProviderId': 'supabase',
            'type': 'SUPABASE',
            'supabase': {
              'projectUrl': {
                'name': 'SUPABASE_URL',
                'value': 'https://test.supabase.co',
              },
              'jwtSecret': {
                'name': 'SUPABASE_JWT_SECRET',
                'value': 'jwt-secret',
              },
            },
          },
        ],
      },
      'variables': [
        {'name': 'HELLO_WORLD', 'value': 'hello'},
      ],
      'secrets': [
        {'name': 'HELLO_WORLD_SECRET', 'value': 'world'},
      ],
      'databases': {
        'default': {
          'databaseId': 'default',
          'type': 'CELEST',
          'schema': {
            'databaseSchemaId': 'default',
            'type': 'DRIFT',
            'drift': {
              'version': 1,
              'schemaJson': {
                'entities': [
                  {
                    'id': 0,
                    'references': <Object?>[],
                    'type': 'table',
                    'data': {
                      'name': 'organizations',
                      'was_declared_in_moor': true,
                      'columns': [
                        {
                          'name': 'id',
                          'getter_name': 'id',
                          'moor_type': 'string',
                          'nullable': false,
                          'customConstraints': 'NOT NULL PRIMARY KEY',
                          'default_dart': null,
                          'default_client_dart': null,
                          'dsl_features': ['primary-key'],
                        },
                      ],
                      'is_virtual': false,
                      'without_rowid': false,
                      'constraints': <Object?>[],
                    },
                  },
                ],
              },
            },
          },
          'celest': {
            'hostname': {'name': 'CELEST_DATABASE_DEFAULT_HOST', 'value': ''},
            'token': {'name': 'CELEST_DATABASE_DEFAULT_TOKEN', 'value': ''},
          },
        },
      },
    });

    final roundtrip = ResolvedProject.fromProto(proto);
    expect(roundtrip, resolvedProject);
  });
}
