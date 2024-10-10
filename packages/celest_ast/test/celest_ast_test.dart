import 'package:celest_ast/celest_ast.dart';
import 'package:code_builder/code_builder.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

void main() {
  test('Proto Interop', () {
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
        flutter: Sdk(
          type: SdkType.flutter,
          version: Version.parse('3.22.0'),
        ),
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
                method: 'PATCH',
                route: ResolvedHttpRoute(
                  path: '/greeting/hello-world',
                ),
                status: 204,
                statusMappings: {
                  TypeReference(
                    (t) => t
                      ..symbol = 'NotFoundException'
                      ..url = 'package:celest_core/celest_core.dart',
                  ): 404,
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
            clientId: ResolvedSecret(
              name: 'GOOGLE_CLIENT_ID',
              value: '123',
            ),
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
        ],
      ),
      variables: [
        ResolvedVariable(
          name: 'HELLO_WORLD',
          value: 'hello',
        ),
      ],
      secrets: [
        ResolvedSecret(
          name: 'HELLO_WORLD_SECRET',
          value: 'world',
        ),
      ],
    );

    final proto = resolvedProject.toProto();
    expect(
      proto.toProto3Json(),
      {
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
                  'method': 'PATCH',
                  'route': {'path': '/greeting/hello-world'},
                  'status': 204,
                  'statusMappings': {
                    'package:celest_core/celest_core.dart#NotFoundException':
                        404,
                  },
                },
                'streamConfig': {
                  'type': 'UNIDIRECTIONAL_CLIENT',
                },
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
                'clientId': {
                  'name': 'GOOGLE_CLIENT_ID',
                  'value': '123',
                },
                'clientSecret': {
                  'name': 'GOOGLE_CLIENT_SECRET',
                  'value': '456',
                },
              },
            },
          ],
          'externalProviders': [
            {
              'authProviderId': 'firebase',
              'type': 'FIREBASE',
              'firebase': {
                'projectId': {
                  'name': 'FIREBASE_PROJECT_ID',
                  'value': 'test-123',
                },
              },
            },
          ],
        },
        'variables': [
          {
            'name': 'HELLO_WORLD',
            'value': 'hello',
          },
        ],
        'secrets': [
          {
            'name': 'HELLO_WORLD_SECRET',
            'value': 'world',
          },
        ],
      },
    );

    final roundtrip = ResolvedProject.fromProto(proto);
    expect(roundtrip, resolvedProject);
  });
}
