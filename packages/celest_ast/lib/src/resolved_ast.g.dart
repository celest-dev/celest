// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolved_ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResolvedProject> _$resolvedProjectSerializer =
    _$ResolvedProjectSerializer();
Serializer<ResolvedApi> _$resolvedApiSerializer = _$ResolvedApiSerializer();
Serializer<ResolvedCloudFunction> _$resolvedCloudFunctionSerializer =
    _$ResolvedCloudFunctionSerializer();
Serializer<ResolvedHttpConfig> _$resolvedHttpConfigSerializer =
    _$ResolvedHttpConfigSerializer();
Serializer<ResolvedStreamConfig> _$resolvedStreamConfigSerializer =
    _$ResolvedStreamConfigSerializer();
Serializer<ResolvedHttpRoute> _$resolvedHttpRouteSerializer =
    _$ResolvedHttpRouteSerializer();
Serializer<ResolvedVariable> _$resolvedVariableSerializer =
    _$ResolvedVariableSerializer();
Serializer<ResolvedSecret> _$resolvedSecretSerializer =
    _$ResolvedSecretSerializer();
Serializer<ResolvedAuth> _$resolvedAuthSerializer = _$ResolvedAuthSerializer();
Serializer<ResolvedEmailAuthProvider> _$resolvedEmailAuthProviderSerializer =
    _$ResolvedEmailAuthProviderSerializer();
Serializer<ResolvedSmsAuthProvider> _$resolvedSmsAuthProviderSerializer =
    _$ResolvedSmsAuthProviderSerializer();
Serializer<ResolvedGoogleAuthProvider> _$resolvedGoogleAuthProviderSerializer =
    _$ResolvedGoogleAuthProviderSerializer();
Serializer<ResolvedAppleAuthProvider> _$resolvedAppleAuthProviderSerializer =
    _$ResolvedAppleAuthProviderSerializer();
Serializer<ResolvedGitHubAuthProvider> _$resolvedGitHubAuthProviderSerializer =
    _$ResolvedGitHubAuthProviderSerializer();
Serializer<ResolvedFirebaseExternalAuthProvider>
_$resolvedFirebaseExternalAuthProviderSerializer =
    _$ResolvedFirebaseExternalAuthProviderSerializer();
Serializer<ResolvedSupabaseExternalAuthProvider>
_$resolvedSupabaseExternalAuthProviderSerializer =
    _$ResolvedSupabaseExternalAuthProviderSerializer();
Serializer<ResolvedDriftDatabaseSchema>
_$resolvedDriftDatabaseSchemaSerializer =
    _$ResolvedDriftDatabaseSchemaSerializer();
Serializer<ResolvedDatabase> _$resolvedDatabaseSerializer =
    _$ResolvedDatabaseSerializer();
Serializer<ResolvedCelestDatabaseConfig>
_$resolvedCelestDatabaseConfigSerializer =
    _$ResolvedCelestDatabaseConfigSerializer();

class _$ResolvedProjectSerializer
    implements StructuredSerializer<ResolvedProject> {
  @override
  final Iterable<Type> types = const [ResolvedProject, _$ResolvedProject];
  @override
  final String wireName = 'ResolvedProject';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedProject object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'projectId',
      serializers.serialize(
        object.projectId,
        specifiedType: const FullType(String),
      ),
      'environmentId',
      serializers.serialize(
        object.environmentId,
        specifiedType: const FullType(String),
      ),
      'apis',
      serializers.serialize(
        object.apis,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(String),
          const FullType(ResolvedApi),
        ]),
      ),
      'variables',
      serializers.serialize(
        object.variables,
        specifiedType: const FullType(BuiltList, const [
          const FullType(ResolvedVariable),
        ]),
      ),
      'secrets',
      serializers.serialize(
        object.secrets,
        specifiedType: const FullType(BuiltList, const [
          const FullType(ResolvedSecret),
        ]),
      ),
      'databases',
      serializers.serialize(
        object.databases,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(String),
          const FullType(ResolvedDatabase),
        ]),
      ),
      'sdkConfig',
      serializers.serialize(
        object.sdkConfig,
        specifiedType: const FullType(SdkConfiguration),
      ),
    ];
    Object? value;
    value = object.auth;
    if (value != null) {
      result
        ..add('auth')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(ResolvedAuth),
          ),
        );
    }
    return result;
  }

  @override
  ResolvedProject deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedProjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'projectId':
          result.projectId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'environmentId':
          result.environmentId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'apis':
          result.apis.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ResolvedApi),
              ]),
            )!,
          );
          break;
        case 'variables':
          result.variables.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(ResolvedVariable),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'secrets':
          result.secrets.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(ResolvedSecret),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'auth':
          result.auth.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedAuth),
                )!
                as ResolvedAuth,
          );
          break;
        case 'databases':
          result.databases.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ResolvedDatabase),
              ]),
            )!,
          );
          break;
        case 'sdkConfig':
          result.sdkConfig.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(SdkConfiguration),
                )!
                as SdkConfiguration,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedApiSerializer implements StructuredSerializer<ResolvedApi> {
  @override
  final Iterable<Type> types = const [ResolvedApi, _$ResolvedApi];
  @override
  final String wireName = 'ResolvedApi';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedApi object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'apiId',
      serializers.serialize(
        object.apiId,
        specifiedType: const FullType(String),
      ),
      'functions',
      serializers.serialize(
        object.functions,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(String),
          const FullType(ResolvedCloudFunction),
        ]),
      ),
    ];
    Object? value;
    value = object.policySet;
    if (value != null) {
      result
        ..add('policySet')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(cedar.PolicySet),
          ),
        );
    }
    return result;
  }

  @override
  ResolvedApi deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedApiBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'apiId':
          result.apiId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'functions':
          result.functions.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ResolvedCloudFunction),
              ]),
            )!,
          );
          break;
        case 'policySet':
          result.policySet.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(cedar.PolicySet),
                )!
                as cedar.PolicySet,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedCloudFunctionSerializer
    implements StructuredSerializer<ResolvedCloudFunction> {
  @override
  final Iterable<Type> types = const [
    ResolvedCloudFunction,
    _$ResolvedCloudFunction,
  ];
  @override
  final String wireName = 'ResolvedCloudFunction';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedCloudFunction object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'functionId',
      serializers.serialize(
        object.functionId,
        specifiedType: const FullType(String),
      ),
      'apiId',
      serializers.serialize(
        object.apiId,
        specifiedType: const FullType(String),
      ),
      'httpConfig',
      serializers.serialize(
        object.httpConfig,
        specifiedType: const FullType(ResolvedHttpConfig),
      ),
      'variables',
      serializers.serialize(
        object.variables,
        specifiedType: const FullType(BuiltSet, const [const FullType(String)]),
      ),
      'secrets',
      serializers.serialize(
        object.secrets,
        specifiedType: const FullType(BuiltSet, const [const FullType(String)]),
      ),
    ];
    Object? value;
    value = object.streamConfig;
    if (value != null) {
      result
        ..add('streamConfig')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(ResolvedStreamConfig),
          ),
        );
    }
    value = object.policySet;
    if (value != null) {
      result
        ..add('policySet')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(cedar.PolicySet),
          ),
        );
    }
    return result;
  }

  @override
  ResolvedCloudFunction deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedCloudFunctionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'functionId':
          result.functionId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'apiId':
          result.apiId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'httpConfig':
          result.httpConfig.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedHttpConfig),
                )!
                as ResolvedHttpConfig,
          );
          break;
        case 'streamConfig':
          result.streamConfig.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedStreamConfig),
                )!
                as ResolvedStreamConfig,
          );
          break;
        case 'variables':
          result.variables.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltSet, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltSet<Object?>,
          );
          break;
        case 'secrets':
          result.secrets.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltSet, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltSet<Object?>,
          );
          break;
        case 'policySet':
          result.policySet.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(cedar.PolicySet),
                )!
                as cedar.PolicySet,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedHttpConfigSerializer
    implements StructuredSerializer<ResolvedHttpConfig> {
  @override
  final Iterable<Type> types = const [ResolvedHttpConfig, _$ResolvedHttpConfig];
  @override
  final String wireName = 'ResolvedHttpConfig';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedHttpConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'route',
      serializers.serialize(
        object.route,
        specifiedType: const FullType(ResolvedHttpRoute),
      ),
      'additionalRoutes',
      serializers.serialize(
        object.additionalRoutes,
        specifiedType: const FullType(BuiltList, const [
          const FullType(ResolvedHttpRoute),
        ]),
      ),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
      'statusMappings',
      serializers.serialize(
        object.statusMappings,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(TypeReference),
          const FullType(int),
        ]),
      ),
    ];

    return result;
  }

  @override
  ResolvedHttpConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedHttpConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'route':
          result.route.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedHttpRoute),
                )!
                as ResolvedHttpRoute,
          );
          break;
        case 'additionalRoutes':
          result.additionalRoutes.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(ResolvedHttpRoute),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'status':
          result.status =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'statusMappings':
          result.statusMappings.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(TypeReference),
                const FullType(int),
              ]),
            )!,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedStreamConfigSerializer
    implements StructuredSerializer<ResolvedStreamConfig> {
  @override
  final Iterable<Type> types = const [
    ResolvedStreamConfig,
    _$ResolvedStreamConfig,
  ];
  @override
  final String wireName = 'ResolvedStreamConfig';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedStreamConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(StreamType),
          ),
        );
    }
    return result;
  }

  @override
  ResolvedStreamConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedStreamConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(StreamType),
                  )
                  as StreamType?;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedHttpRouteSerializer
    implements StructuredSerializer<ResolvedHttpRoute> {
  @override
  final Iterable<Type> types = const [ResolvedHttpRoute, _$ResolvedHttpRoute];
  @override
  final String wireName = 'ResolvedHttpRoute';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedHttpRoute object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'method',
      serializers.serialize(
        object.method,
        specifiedType: const FullType(String),
      ),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ResolvedHttpRoute deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedHttpRouteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'method':
          result.method =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'path':
          result.path =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedVariableSerializer
    implements StructuredSerializer<ResolvedVariable> {
  @override
  final Iterable<Type> types = const [ResolvedVariable, _$ResolvedVariable];
  @override
  final String wireName = 'ResolvedVariable';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedVariable object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  ResolvedVariable deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedVariableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedSecretSerializer
    implements StructuredSerializer<ResolvedSecret> {
  @override
  final Iterable<Type> types = const [ResolvedSecret, _$ResolvedSecret];
  @override
  final String wireName = 'ResolvedSecret';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedSecret object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  ResolvedSecret deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedSecretBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedAuthSerializer implements StructuredSerializer<ResolvedAuth> {
  @override
  final Iterable<Type> types = const [ResolvedAuth, _$ResolvedAuth];
  @override
  final String wireName = 'ResolvedAuth';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedAuth object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'providers',
      serializers.serialize(
        object.providers,
        specifiedType: const FullType(BuiltList, const [
          const FullType(ResolvedAuthProvider),
        ]),
      ),
      'externalProviders',
      serializers.serialize(
        object.externalProviders,
        specifiedType: const FullType(BuiltList, const [
          const FullType(ResolvedExternalAuthProvider),
        ]),
      ),
    ];

    return result;
  }

  @override
  ResolvedAuth deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedAuthBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'providers':
          result.providers.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(ResolvedAuthProvider),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'externalProviders':
          result.externalProviders.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(ResolvedExternalAuthProvider),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedEmailAuthProviderSerializer
    implements StructuredSerializer<ResolvedEmailAuthProvider> {
  @override
  final Iterable<Type> types = const [
    ResolvedEmailAuthProvider,
    _$ResolvedEmailAuthProvider,
  ];
  @override
  final String wireName = 'ResolvedEmailAuthProvider';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedEmailAuthProvider object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'authProviderId',
      serializers.serialize(
        object.authProviderId,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(AuthProviderType),
      ),
    ];

    return result;
  }

  @override
  ResolvedEmailAuthProvider deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedEmailAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'authProviderId':
          result.authProviderId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(AuthProviderType),
                  )!
                  as AuthProviderType;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedSmsAuthProviderSerializer
    implements StructuredSerializer<ResolvedSmsAuthProvider> {
  @override
  final Iterable<Type> types = const [
    ResolvedSmsAuthProvider,
    _$ResolvedSmsAuthProvider,
  ];
  @override
  final String wireName = 'ResolvedSmsAuthProvider';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedSmsAuthProvider object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'authProviderId',
      serializers.serialize(
        object.authProviderId,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(AuthProviderType),
      ),
    ];

    return result;
  }

  @override
  ResolvedSmsAuthProvider deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedSmsAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'authProviderId':
          result.authProviderId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(AuthProviderType),
                  )!
                  as AuthProviderType;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedGoogleAuthProviderSerializer
    implements StructuredSerializer<ResolvedGoogleAuthProvider> {
  @override
  final Iterable<Type> types = const [
    ResolvedGoogleAuthProvider,
    _$ResolvedGoogleAuthProvider,
  ];
  @override
  final String wireName = 'ResolvedGoogleAuthProvider';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedGoogleAuthProvider object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'clientId',
      serializers.serialize(
        object.clientId,
        specifiedType: const FullType(ResolvedSecret),
      ),
      'clientSecret',
      serializers.serialize(
        object.clientSecret,
        specifiedType: const FullType(ResolvedSecret),
      ),
      'authProviderId',
      serializers.serialize(
        object.authProviderId,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(AuthProviderType),
      ),
    ];

    return result;
  }

  @override
  ResolvedGoogleAuthProvider deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedGoogleAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'clientId':
          result.clientId.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'clientSecret':
          result.clientSecret.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'authProviderId':
          result.authProviderId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(AuthProviderType),
                  )!
                  as AuthProviderType;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedAppleAuthProviderSerializer
    implements StructuredSerializer<ResolvedAppleAuthProvider> {
  @override
  final Iterable<Type> types = const [
    ResolvedAppleAuthProvider,
    _$ResolvedAppleAuthProvider,
  ];
  @override
  final String wireName = 'ResolvedAppleAuthProvider';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedAppleAuthProvider object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'clientId',
      serializers.serialize(
        object.clientId,
        specifiedType: const FullType(ResolvedSecret),
      ),
      'teamId',
      serializers.serialize(
        object.teamId,
        specifiedType: const FullType(ResolvedSecret),
      ),
      'keyId',
      serializers.serialize(
        object.keyId,
        specifiedType: const FullType(ResolvedSecret),
      ),
      'privateKey',
      serializers.serialize(
        object.privateKey,
        specifiedType: const FullType(ResolvedSecret),
      ),
      'authProviderId',
      serializers.serialize(
        object.authProviderId,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(AuthProviderType),
      ),
    ];

    return result;
  }

  @override
  ResolvedAppleAuthProvider deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedAppleAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'clientId':
          result.clientId.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'teamId':
          result.teamId.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'keyId':
          result.keyId.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'privateKey':
          result.privateKey.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'authProviderId':
          result.authProviderId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(AuthProviderType),
                  )!
                  as AuthProviderType;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedGitHubAuthProviderSerializer
    implements StructuredSerializer<ResolvedGitHubAuthProvider> {
  @override
  final Iterable<Type> types = const [
    ResolvedGitHubAuthProvider,
    _$ResolvedGitHubAuthProvider,
  ];
  @override
  final String wireName = 'ResolvedGitHubAuthProvider';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedGitHubAuthProvider object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'clientId',
      serializers.serialize(
        object.clientId,
        specifiedType: const FullType(ResolvedSecret),
      ),
      'clientSecret',
      serializers.serialize(
        object.clientSecret,
        specifiedType: const FullType(ResolvedSecret),
      ),
      'authProviderId',
      serializers.serialize(
        object.authProviderId,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(AuthProviderType),
      ),
    ];

    return result;
  }

  @override
  ResolvedGitHubAuthProvider deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedGitHubAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'clientId':
          result.clientId.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'clientSecret':
          result.clientSecret.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'authProviderId':
          result.authProviderId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(AuthProviderType),
                  )!
                  as AuthProviderType;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedFirebaseExternalAuthProviderSerializer
    implements StructuredSerializer<ResolvedFirebaseExternalAuthProvider> {
  @override
  final Iterable<Type> types = const [
    ResolvedFirebaseExternalAuthProvider,
    _$ResolvedFirebaseExternalAuthProvider,
  ];
  @override
  final String wireName = 'ResolvedFirebaseExternalAuthProvider';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedFirebaseExternalAuthProvider object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'projectId',
      serializers.serialize(
        object.projectId,
        specifiedType: const FullType(ResolvedVariable),
      ),
      'authProviderId',
      serializers.serialize(
        object.authProviderId,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(AuthProviderType),
      ),
    ];

    return result;
  }

  @override
  ResolvedFirebaseExternalAuthProvider deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedFirebaseExternalAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'projectId':
          result.projectId.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedVariable),
                )!
                as ResolvedVariable,
          );
          break;
        case 'authProviderId':
          result.authProviderId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(AuthProviderType),
                  )!
                  as AuthProviderType;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedSupabaseExternalAuthProviderSerializer
    implements StructuredSerializer<ResolvedSupabaseExternalAuthProvider> {
  @override
  final Iterable<Type> types = const [
    ResolvedSupabaseExternalAuthProvider,
    _$ResolvedSupabaseExternalAuthProvider,
  ];
  @override
  final String wireName = 'ResolvedSupabaseExternalAuthProvider';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedSupabaseExternalAuthProvider object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'projectUrl',
      serializers.serialize(
        object.projectUrl,
        specifiedType: const FullType(ResolvedVariable),
      ),
      'authProviderId',
      serializers.serialize(
        object.authProviderId,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(AuthProviderType),
      ),
    ];
    Object? value;
    value = object.jwtSecret;
    if (value != null) {
      result
        ..add('jwtSecret')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(ResolvedSecret),
          ),
        );
    }
    return result;
  }

  @override
  ResolvedSupabaseExternalAuthProvider deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedSupabaseExternalAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'projectUrl':
          result.projectUrl.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedVariable),
                )!
                as ResolvedVariable,
          );
          break;
        case 'jwtSecret':
          result.jwtSecret.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
        case 'authProviderId':
          result.authProviderId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(AuthProviderType),
                  )!
                  as AuthProviderType;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedDriftDatabaseSchemaSerializer
    implements StructuredSerializer<ResolvedDriftDatabaseSchema> {
  @override
  final Iterable<Type> types = const [
    ResolvedDriftDatabaseSchema,
    _$ResolvedDriftDatabaseSchema,
  ];
  @override
  final String wireName = 'ResolvedDriftDatabaseSchema';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedDriftDatabaseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'databaseSchemaId',
      serializers.serialize(
        object.databaseSchemaId,
        specifiedType: const FullType(String),
      ),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(int)),
      'schemaJson',
      serializers.serialize(
        object.$schemaJson,
        specifiedType: const FullType(JsonObject),
      ),
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(DatabaseSchemaType),
      ),
    ];

    return result;
  }

  @override
  ResolvedDriftDatabaseSchema deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedDriftDatabaseSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'databaseSchemaId':
          result.databaseSchemaId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'version':
          result.version =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'schemaJson':
          result.$schemaJson =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(JsonObject),
                  )!
                  as JsonObject;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DatabaseSchemaType),
                  )!
                  as DatabaseSchemaType;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedDatabaseSerializer
    implements StructuredSerializer<ResolvedDatabase> {
  @override
  final Iterable<Type> types = const [ResolvedDatabase, _$ResolvedDatabase];
  @override
  final String wireName = 'ResolvedDatabase';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedDatabase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'databaseId',
      serializers.serialize(
        object.databaseId,
        specifiedType: const FullType(String),
      ),
      'schema',
      serializers.serialize(
        object.schema,
        specifiedType: const FullType(ResolvedDatabaseSchema),
      ),
      'config',
      serializers.serialize(
        object.config,
        specifiedType: const FullType(ResolvedDatabaseConfig),
      ),
    ];

    return result;
  }

  @override
  ResolvedDatabase deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedDatabaseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'databaseId':
          result.databaseId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'schema':
          result.schema =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(ResolvedDatabaseSchema),
                  )!
                  as ResolvedDatabaseSchema;
          break;
        case 'config':
          result.config =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(ResolvedDatabaseConfig),
                  )!
                  as ResolvedDatabaseConfig;
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedCelestDatabaseConfigSerializer
    implements StructuredSerializer<ResolvedCelestDatabaseConfig> {
  @override
  final Iterable<Type> types = const [
    ResolvedCelestDatabaseConfig,
    _$ResolvedCelestDatabaseConfig,
  ];
  @override
  final String wireName = 'ResolvedCelestDatabaseConfig';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResolvedCelestDatabaseConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'hostname',
      serializers.serialize(
        object.hostname,
        specifiedType: const FullType(ResolvedVariable),
      ),
      'token',
      serializers.serialize(
        object.token,
        specifiedType: const FullType(ResolvedSecret),
      ),
    ];

    return result;
  }

  @override
  ResolvedCelestDatabaseConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolvedCelestDatabaseConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hostname':
          result.hostname.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedVariable),
                )!
                as ResolvedVariable,
          );
          break;
        case 'token':
          result.token.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResolvedSecret),
                )!
                as ResolvedSecret,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedProject extends ResolvedProject {
  @override
  final String projectId;
  @override
  final String environmentId;
  @override
  final BuiltMap<String, ResolvedApi> apis;
  @override
  final BuiltList<ResolvedVariable> variables;
  @override
  final BuiltList<ResolvedSecret> secrets;
  @override
  final ResolvedAuth? auth;
  @override
  final BuiltMap<String, ResolvedDatabase> databases;
  @override
  final SdkConfiguration sdkConfig;

  factory _$ResolvedProject([void Function(ResolvedProjectBuilder)? updates]) =>
      (ResolvedProjectBuilder()..update(updates))._build();

  _$ResolvedProject._({
    required this.projectId,
    required this.environmentId,
    required this.apis,
    required this.variables,
    required this.secrets,
    this.auth,
    required this.databases,
    required this.sdkConfig,
  }) : super._();
  @override
  ResolvedProject rebuild(void Function(ResolvedProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedProjectBuilder toBuilder() => ResolvedProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedProject &&
        projectId == other.projectId &&
        environmentId == other.environmentId &&
        apis == other.apis &&
        variables == other.variables &&
        secrets == other.secrets &&
        auth == other.auth &&
        databases == other.databases &&
        sdkConfig == other.sdkConfig;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, projectId.hashCode);
    _$hash = $jc(_$hash, environmentId.hashCode);
    _$hash = $jc(_$hash, apis.hashCode);
    _$hash = $jc(_$hash, variables.hashCode);
    _$hash = $jc(_$hash, secrets.hashCode);
    _$hash = $jc(_$hash, auth.hashCode);
    _$hash = $jc(_$hash, databases.hashCode);
    _$hash = $jc(_$hash, sdkConfig.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedProject')
          ..add('projectId', projectId)
          ..add('environmentId', environmentId)
          ..add('apis', apis)
          ..add('variables', variables)
          ..add('secrets', secrets)
          ..add('auth', auth)
          ..add('databases', databases)
          ..add('sdkConfig', sdkConfig))
        .toString();
  }
}

class ResolvedProjectBuilder
    implements Builder<ResolvedProject, ResolvedProjectBuilder> {
  _$ResolvedProject? _$v;

  String? _projectId;
  String? get projectId => _$this._projectId;
  set projectId(String? projectId) => _$this._projectId = projectId;

  String? _environmentId;
  String? get environmentId => _$this._environmentId;
  set environmentId(String? environmentId) =>
      _$this._environmentId = environmentId;

  MapBuilder<String, ResolvedApi>? _apis;
  MapBuilder<String, ResolvedApi> get apis =>
      _$this._apis ??= MapBuilder<String, ResolvedApi>();
  set apis(MapBuilder<String, ResolvedApi>? apis) => _$this._apis = apis;

  ListBuilder<ResolvedVariable>? _variables;
  ListBuilder<ResolvedVariable> get variables =>
      _$this._variables ??= ListBuilder<ResolvedVariable>();
  set variables(ListBuilder<ResolvedVariable>? variables) =>
      _$this._variables = variables;

  ListBuilder<ResolvedSecret>? _secrets;
  ListBuilder<ResolvedSecret> get secrets =>
      _$this._secrets ??= ListBuilder<ResolvedSecret>();
  set secrets(ListBuilder<ResolvedSecret>? secrets) =>
      _$this._secrets = secrets;

  ResolvedAuthBuilder? _auth;
  ResolvedAuthBuilder get auth => _$this._auth ??= ResolvedAuthBuilder();
  set auth(ResolvedAuthBuilder? auth) => _$this._auth = auth;

  MapBuilder<String, ResolvedDatabase>? _databases;
  MapBuilder<String, ResolvedDatabase> get databases =>
      _$this._databases ??= MapBuilder<String, ResolvedDatabase>();
  set databases(MapBuilder<String, ResolvedDatabase>? databases) =>
      _$this._databases = databases;

  SdkConfigurationBuilder? _sdkConfig;
  SdkConfigurationBuilder get sdkConfig =>
      _$this._sdkConfig ??= SdkConfigurationBuilder();
  set sdkConfig(SdkConfigurationBuilder? sdkConfig) =>
      _$this._sdkConfig = sdkConfig;

  ResolvedProjectBuilder();

  ResolvedProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectId = $v.projectId;
      _environmentId = $v.environmentId;
      _apis = $v.apis.toBuilder();
      _variables = $v.variables.toBuilder();
      _secrets = $v.secrets.toBuilder();
      _auth = $v.auth?.toBuilder();
      _databases = $v.databases.toBuilder();
      _sdkConfig = $v.sdkConfig.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedProject other) {
    _$v = other as _$ResolvedProject;
  }

  @override
  void update(void Function(ResolvedProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedProject build() => _build();

  _$ResolvedProject _build() {
    _$ResolvedProject _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedProject._(
            projectId: BuiltValueNullFieldError.checkNotNull(
              projectId,
              r'ResolvedProject',
              'projectId',
            ),
            environmentId: BuiltValueNullFieldError.checkNotNull(
              environmentId,
              r'ResolvedProject',
              'environmentId',
            ),
            apis: apis.build(),
            variables: variables.build(),
            secrets: secrets.build(),
            auth: _auth?.build(),
            databases: databases.build(),
            sdkConfig: sdkConfig.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apis';
        apis.build();
        _$failedField = 'variables';
        variables.build();
        _$failedField = 'secrets';
        secrets.build();
        _$failedField = 'auth';
        _auth?.build();
        _$failedField = 'databases';
        databases.build();
        _$failedField = 'sdkConfig';
        sdkConfig.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedProject',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedApi extends ResolvedApi {
  @override
  final String apiId;
  @override
  final BuiltMap<String, ResolvedCloudFunction> functions;
  @override
  final cedar.PolicySet? policySet;

  factory _$ResolvedApi([void Function(ResolvedApiBuilder)? updates]) =>
      (ResolvedApiBuilder()..update(updates))._build();

  _$ResolvedApi._({
    required this.apiId,
    required this.functions,
    this.policySet,
  }) : super._();
  @override
  ResolvedApi rebuild(void Function(ResolvedApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedApiBuilder toBuilder() => ResolvedApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedApi &&
        apiId == other.apiId &&
        functions == other.functions &&
        policySet == other.policySet;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apiId.hashCode);
    _$hash = $jc(_$hash, functions.hashCode);
    _$hash = $jc(_$hash, policySet.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedApi')
          ..add('apiId', apiId)
          ..add('functions', functions)
          ..add('policySet', policySet))
        .toString();
  }
}

class ResolvedApiBuilder implements Builder<ResolvedApi, ResolvedApiBuilder> {
  _$ResolvedApi? _$v;

  String? _apiId;
  String? get apiId => _$this._apiId;
  set apiId(String? apiId) => _$this._apiId = apiId;

  MapBuilder<String, ResolvedCloudFunction>? _functions;
  MapBuilder<String, ResolvedCloudFunction> get functions =>
      _$this._functions ??= MapBuilder<String, ResolvedCloudFunction>();
  set functions(MapBuilder<String, ResolvedCloudFunction>? functions) =>
      _$this._functions = functions;

  cedar.PolicySetBuilder? _policySet;
  cedar.PolicySetBuilder get policySet =>
      _$this._policySet ??= cedar.PolicySetBuilder();
  set policySet(cedar.PolicySetBuilder? policySet) =>
      _$this._policySet = policySet;

  ResolvedApiBuilder();

  ResolvedApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiId = $v.apiId;
      _functions = $v.functions.toBuilder();
      _policySet = $v.policySet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedApi other) {
    _$v = other as _$ResolvedApi;
  }

  @override
  void update(void Function(ResolvedApiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedApi build() => _build();

  _$ResolvedApi _build() {
    _$ResolvedApi _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedApi._(
            apiId: BuiltValueNullFieldError.checkNotNull(
              apiId,
              r'ResolvedApi',
              'apiId',
            ),
            functions: functions.build(),
            policySet: _policySet?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'functions';
        functions.build();
        _$failedField = 'policySet';
        _policySet?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedApi',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedCloudFunction extends ResolvedCloudFunction {
  @override
  final String functionId;
  @override
  final String apiId;
  @override
  final ResolvedHttpConfig httpConfig;
  @override
  final ResolvedStreamConfig? streamConfig;
  @override
  final BuiltSet<String> variables;
  @override
  final BuiltSet<String> secrets;
  @override
  final cedar.PolicySet? policySet;

  factory _$ResolvedCloudFunction([
    void Function(ResolvedCloudFunctionBuilder)? updates,
  ]) => (ResolvedCloudFunctionBuilder()..update(updates))._build();

  _$ResolvedCloudFunction._({
    required this.functionId,
    required this.apiId,
    required this.httpConfig,
    this.streamConfig,
    required this.variables,
    required this.secrets,
    this.policySet,
  }) : super._();
  @override
  ResolvedCloudFunction rebuild(
    void Function(ResolvedCloudFunctionBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedCloudFunctionBuilder toBuilder() =>
      ResolvedCloudFunctionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedCloudFunction &&
        functionId == other.functionId &&
        apiId == other.apiId &&
        httpConfig == other.httpConfig &&
        streamConfig == other.streamConfig &&
        variables == other.variables &&
        secrets == other.secrets &&
        policySet == other.policySet;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, functionId.hashCode);
    _$hash = $jc(_$hash, apiId.hashCode);
    _$hash = $jc(_$hash, httpConfig.hashCode);
    _$hash = $jc(_$hash, streamConfig.hashCode);
    _$hash = $jc(_$hash, variables.hashCode);
    _$hash = $jc(_$hash, secrets.hashCode);
    _$hash = $jc(_$hash, policySet.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedCloudFunction')
          ..add('functionId', functionId)
          ..add('apiId', apiId)
          ..add('httpConfig', httpConfig)
          ..add('streamConfig', streamConfig)
          ..add('variables', variables)
          ..add('secrets', secrets)
          ..add('policySet', policySet))
        .toString();
  }
}

class ResolvedCloudFunctionBuilder
    implements Builder<ResolvedCloudFunction, ResolvedCloudFunctionBuilder> {
  _$ResolvedCloudFunction? _$v;

  String? _functionId;
  String? get functionId => _$this._functionId;
  set functionId(String? functionId) => _$this._functionId = functionId;

  String? _apiId;
  String? get apiId => _$this._apiId;
  set apiId(String? apiId) => _$this._apiId = apiId;

  ResolvedHttpConfigBuilder? _httpConfig;
  ResolvedHttpConfigBuilder get httpConfig =>
      _$this._httpConfig ??= ResolvedHttpConfigBuilder();
  set httpConfig(ResolvedHttpConfigBuilder? httpConfig) =>
      _$this._httpConfig = httpConfig;

  ResolvedStreamConfigBuilder? _streamConfig;
  ResolvedStreamConfigBuilder get streamConfig =>
      _$this._streamConfig ??= ResolvedStreamConfigBuilder();
  set streamConfig(ResolvedStreamConfigBuilder? streamConfig) =>
      _$this._streamConfig = streamConfig;

  SetBuilder<String>? _variables;
  SetBuilder<String> get variables =>
      _$this._variables ??= SetBuilder<String>();
  set variables(SetBuilder<String>? variables) => _$this._variables = variables;

  SetBuilder<String>? _secrets;
  SetBuilder<String> get secrets => _$this._secrets ??= SetBuilder<String>();
  set secrets(SetBuilder<String>? secrets) => _$this._secrets = secrets;

  cedar.PolicySetBuilder? _policySet;
  cedar.PolicySetBuilder get policySet =>
      _$this._policySet ??= cedar.PolicySetBuilder();
  set policySet(cedar.PolicySetBuilder? policySet) =>
      _$this._policySet = policySet;

  ResolvedCloudFunctionBuilder();

  ResolvedCloudFunctionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _functionId = $v.functionId;
      _apiId = $v.apiId;
      _httpConfig = $v.httpConfig.toBuilder();
      _streamConfig = $v.streamConfig?.toBuilder();
      _variables = $v.variables.toBuilder();
      _secrets = $v.secrets.toBuilder();
      _policySet = $v.policySet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedCloudFunction other) {
    _$v = other as _$ResolvedCloudFunction;
  }

  @override
  void update(void Function(ResolvedCloudFunctionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedCloudFunction build() => _build();

  _$ResolvedCloudFunction _build() {
    _$ResolvedCloudFunction _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedCloudFunction._(
            functionId: BuiltValueNullFieldError.checkNotNull(
              functionId,
              r'ResolvedCloudFunction',
              'functionId',
            ),
            apiId: BuiltValueNullFieldError.checkNotNull(
              apiId,
              r'ResolvedCloudFunction',
              'apiId',
            ),
            httpConfig: httpConfig.build(),
            streamConfig: _streamConfig?.build(),
            variables: variables.build(),
            secrets: secrets.build(),
            policySet: _policySet?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'httpConfig';
        httpConfig.build();
        _$failedField = 'streamConfig';
        _streamConfig?.build();
        _$failedField = 'variables';
        variables.build();
        _$failedField = 'secrets';
        secrets.build();
        _$failedField = 'policySet';
        _policySet?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedCloudFunction',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedHttpConfig extends ResolvedHttpConfig {
  @override
  final ResolvedHttpRoute route;
  @override
  final BuiltList<ResolvedHttpRoute> additionalRoutes;
  @override
  final int status;
  @override
  final BuiltMap<TypeReference, int> statusMappings;

  factory _$ResolvedHttpConfig([
    void Function(ResolvedHttpConfigBuilder)? updates,
  ]) => (ResolvedHttpConfigBuilder()..update(updates))._build();

  _$ResolvedHttpConfig._({
    required this.route,
    required this.additionalRoutes,
    required this.status,
    required this.statusMappings,
  }) : super._();
  @override
  ResolvedHttpConfig rebuild(
    void Function(ResolvedHttpConfigBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedHttpConfigBuilder toBuilder() =>
      ResolvedHttpConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedHttpConfig &&
        route == other.route &&
        additionalRoutes == other.additionalRoutes &&
        status == other.status &&
        statusMappings == other.statusMappings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, route.hashCode);
    _$hash = $jc(_$hash, additionalRoutes.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, statusMappings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedHttpConfig')
          ..add('route', route)
          ..add('additionalRoutes', additionalRoutes)
          ..add('status', status)
          ..add('statusMappings', statusMappings))
        .toString();
  }
}

class ResolvedHttpConfigBuilder
    implements Builder<ResolvedHttpConfig, ResolvedHttpConfigBuilder> {
  _$ResolvedHttpConfig? _$v;

  ResolvedHttpRouteBuilder? _route;
  ResolvedHttpRouteBuilder get route =>
      _$this._route ??= ResolvedHttpRouteBuilder();
  set route(ResolvedHttpRouteBuilder? route) => _$this._route = route;

  ListBuilder<ResolvedHttpRoute>? _additionalRoutes;
  ListBuilder<ResolvedHttpRoute> get additionalRoutes =>
      _$this._additionalRoutes ??= ListBuilder<ResolvedHttpRoute>();
  set additionalRoutes(ListBuilder<ResolvedHttpRoute>? additionalRoutes) =>
      _$this._additionalRoutes = additionalRoutes;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  MapBuilder<TypeReference, int>? _statusMappings;
  MapBuilder<TypeReference, int> get statusMappings =>
      _$this._statusMappings ??= MapBuilder<TypeReference, int>();
  set statusMappings(MapBuilder<TypeReference, int>? statusMappings) =>
      _$this._statusMappings = statusMappings;

  ResolvedHttpConfigBuilder();

  ResolvedHttpConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _route = $v.route.toBuilder();
      _additionalRoutes = $v.additionalRoutes.toBuilder();
      _status = $v.status;
      _statusMappings = $v.statusMappings.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedHttpConfig other) {
    _$v = other as _$ResolvedHttpConfig;
  }

  @override
  void update(void Function(ResolvedHttpConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedHttpConfig build() => _build();

  _$ResolvedHttpConfig _build() {
    ResolvedHttpConfig._defaults(this);
    _$ResolvedHttpConfig _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedHttpConfig._(
            route: route.build(),
            additionalRoutes: additionalRoutes.build(),
            status: BuiltValueNullFieldError.checkNotNull(
              status,
              r'ResolvedHttpConfig',
              'status',
            ),
            statusMappings: statusMappings.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'route';
        route.build();
        _$failedField = 'additionalRoutes';
        additionalRoutes.build();

        _$failedField = 'statusMappings';
        statusMappings.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedHttpConfig',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedStreamConfig extends ResolvedStreamConfig {
  @override
  final StreamType? type;

  factory _$ResolvedStreamConfig([
    void Function(ResolvedStreamConfigBuilder)? updates,
  ]) => (ResolvedStreamConfigBuilder()..update(updates))._build();

  _$ResolvedStreamConfig._({this.type}) : super._();
  @override
  ResolvedStreamConfig rebuild(
    void Function(ResolvedStreamConfigBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedStreamConfigBuilder toBuilder() =>
      ResolvedStreamConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedStreamConfig && type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedStreamConfig')
      ..add('type', type)).toString();
  }
}

class ResolvedStreamConfigBuilder
    implements Builder<ResolvedStreamConfig, ResolvedStreamConfigBuilder> {
  _$ResolvedStreamConfig? _$v;

  StreamType? _type;
  StreamType? get type => _$this._type;
  set type(StreamType? type) => _$this._type = type;

  ResolvedStreamConfigBuilder();

  ResolvedStreamConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedStreamConfig other) {
    _$v = other as _$ResolvedStreamConfig;
  }

  @override
  void update(void Function(ResolvedStreamConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedStreamConfig build() => _build();

  _$ResolvedStreamConfig _build() {
    final _$result = _$v ?? _$ResolvedStreamConfig._(type: type);
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedHttpRoute extends ResolvedHttpRoute {
  @override
  final String method;
  @override
  final String path;

  factory _$ResolvedHttpRoute([
    void Function(ResolvedHttpRouteBuilder)? updates,
  ]) => (ResolvedHttpRouteBuilder()..update(updates))._build();

  _$ResolvedHttpRoute._({required this.method, required this.path}) : super._();
  @override
  ResolvedHttpRoute rebuild(void Function(ResolvedHttpRouteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedHttpRouteBuilder toBuilder() =>
      ResolvedHttpRouteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedHttpRoute &&
        method == other.method &&
        path == other.path;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, method.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedHttpRoute')
          ..add('method', method)
          ..add('path', path))
        .toString();
  }
}

class ResolvedHttpRouteBuilder
    implements Builder<ResolvedHttpRoute, ResolvedHttpRouteBuilder> {
  _$ResolvedHttpRoute? _$v;

  String? _method;
  String? get method => _$this._method;
  set method(String? method) => _$this._method = method;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  ResolvedHttpRouteBuilder();

  ResolvedHttpRouteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _method = $v.method;
      _path = $v.path;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedHttpRoute other) {
    _$v = other as _$ResolvedHttpRoute;
  }

  @override
  void update(void Function(ResolvedHttpRouteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedHttpRoute build() => _build();

  _$ResolvedHttpRoute _build() {
    ResolvedHttpRoute._defaults(this);
    final _$result =
        _$v ??
        _$ResolvedHttpRoute._(
          method: BuiltValueNullFieldError.checkNotNull(
            method,
            r'ResolvedHttpRoute',
            'method',
          ),
          path: BuiltValueNullFieldError.checkNotNull(
            path,
            r'ResolvedHttpRoute',
            'path',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedVariable extends ResolvedVariable {
  @override
  final String name;
  @override
  final String value;

  factory _$ResolvedVariable([
    void Function(ResolvedVariableBuilder)? updates,
  ]) => (ResolvedVariableBuilder()..update(updates))._build();

  _$ResolvedVariable._({required this.name, required this.value}) : super._();
  @override
  ResolvedVariable rebuild(void Function(ResolvedVariableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedVariableBuilder toBuilder() =>
      ResolvedVariableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedVariable &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedVariable')
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class ResolvedVariableBuilder
    implements Builder<ResolvedVariable, ResolvedVariableBuilder> {
  _$ResolvedVariable? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  ResolvedVariableBuilder();

  ResolvedVariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedVariable other) {
    _$v = other as _$ResolvedVariable;
  }

  @override
  void update(void Function(ResolvedVariableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedVariable build() => _build();

  _$ResolvedVariable _build() {
    final _$result =
        _$v ??
        _$ResolvedVariable._(
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'ResolvedVariable',
            'name',
          ),
          value: BuiltValueNullFieldError.checkNotNull(
            value,
            r'ResolvedVariable',
            'value',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedSecret extends ResolvedSecret {
  @override
  final String name;
  @override
  final String value;

  factory _$ResolvedSecret([void Function(ResolvedSecretBuilder)? updates]) =>
      (ResolvedSecretBuilder()..update(updates))._build();

  _$ResolvedSecret._({required this.name, required this.value}) : super._();
  @override
  ResolvedSecret rebuild(void Function(ResolvedSecretBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedSecretBuilder toBuilder() => ResolvedSecretBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedSecret &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedSecret')
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class ResolvedSecretBuilder
    implements Builder<ResolvedSecret, ResolvedSecretBuilder> {
  _$ResolvedSecret? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  ResolvedSecretBuilder();

  ResolvedSecretBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedSecret other) {
    _$v = other as _$ResolvedSecret;
  }

  @override
  void update(void Function(ResolvedSecretBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedSecret build() => _build();

  _$ResolvedSecret _build() {
    final _$result =
        _$v ??
        _$ResolvedSecret._(
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'ResolvedSecret',
            'name',
          ),
          value: BuiltValueNullFieldError.checkNotNull(
            value,
            r'ResolvedSecret',
            'value',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedAuth extends ResolvedAuth {
  @override
  final BuiltList<ResolvedAuthProvider> providers;
  @override
  final BuiltList<ResolvedExternalAuthProvider> externalProviders;

  factory _$ResolvedAuth([void Function(ResolvedAuthBuilder)? updates]) =>
      (ResolvedAuthBuilder()..update(updates))._build();

  _$ResolvedAuth._({required this.providers, required this.externalProviders})
    : super._();
  @override
  ResolvedAuth rebuild(void Function(ResolvedAuthBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedAuthBuilder toBuilder() => ResolvedAuthBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedAuth &&
        providers == other.providers &&
        externalProviders == other.externalProviders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providers.hashCode);
    _$hash = $jc(_$hash, externalProviders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedAuth')
          ..add('providers', providers)
          ..add('externalProviders', externalProviders))
        .toString();
  }
}

class ResolvedAuthBuilder
    implements Builder<ResolvedAuth, ResolvedAuthBuilder> {
  _$ResolvedAuth? _$v;

  ListBuilder<ResolvedAuthProvider>? _providers;
  ListBuilder<ResolvedAuthProvider> get providers =>
      _$this._providers ??= ListBuilder<ResolvedAuthProvider>();
  set providers(ListBuilder<ResolvedAuthProvider>? providers) =>
      _$this._providers = providers;

  ListBuilder<ResolvedExternalAuthProvider>? _externalProviders;
  ListBuilder<ResolvedExternalAuthProvider> get externalProviders =>
      _$this._externalProviders ??= ListBuilder<ResolvedExternalAuthProvider>();
  set externalProviders(
    ListBuilder<ResolvedExternalAuthProvider>? externalProviders,
  ) => _$this._externalProviders = externalProviders;

  ResolvedAuthBuilder();

  ResolvedAuthBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providers = $v.providers.toBuilder();
      _externalProviders = $v.externalProviders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedAuth other) {
    _$v = other as _$ResolvedAuth;
  }

  @override
  void update(void Function(ResolvedAuthBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedAuth build() => _build();

  _$ResolvedAuth _build() {
    _$ResolvedAuth _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedAuth._(
            providers: providers.build(),
            externalProviders: externalProviders.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'providers';
        providers.build();
        _$failedField = 'externalProviders';
        externalProviders.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedAuth',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ResolvedAuthProviderBuilder {
  void replace(ResolvedAuthProvider other);
  void update(void Function(ResolvedAuthProviderBuilder) updates);
  String? get authProviderId;
  set authProviderId(String? authProviderId);

  AuthProviderType? get type;
  set type(AuthProviderType? type);
}

abstract mixin class ResolvedExternalAuthProviderBuilder {
  void replace(ResolvedExternalAuthProvider other);
  void update(void Function(ResolvedExternalAuthProviderBuilder) updates);
  String? get authProviderId;
  set authProviderId(String? authProviderId);

  AuthProviderType? get type;
  set type(AuthProviderType? type);
}

class _$ResolvedEmailAuthProvider extends ResolvedEmailAuthProvider {
  @override
  final String authProviderId;
  @override
  final AuthProviderType type;

  factory _$ResolvedEmailAuthProvider([
    void Function(ResolvedEmailAuthProviderBuilder)? updates,
  ]) => (ResolvedEmailAuthProviderBuilder()..update(updates))._build();

  _$ResolvedEmailAuthProvider._({
    required this.authProviderId,
    required this.type,
  }) : super._();
  @override
  ResolvedEmailAuthProvider rebuild(
    void Function(ResolvedEmailAuthProviderBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedEmailAuthProviderBuilder toBuilder() =>
      ResolvedEmailAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedEmailAuthProvider &&
        authProviderId == other.authProviderId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, authProviderId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedEmailAuthProvider')
          ..add('authProviderId', authProviderId)
          ..add('type', type))
        .toString();
  }
}

class ResolvedEmailAuthProviderBuilder
    implements
        Builder<ResolvedEmailAuthProvider, ResolvedEmailAuthProviderBuilder>,
        ResolvedAuthProviderBuilder {
  _$ResolvedEmailAuthProvider? _$v;

  String? _authProviderId;
  String? get authProviderId => _$this._authProviderId;
  set authProviderId(covariant String? authProviderId) =>
      _$this._authProviderId = authProviderId;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  ResolvedEmailAuthProviderBuilder();

  ResolvedEmailAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _authProviderId = $v.authProviderId;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedEmailAuthProvider other) {
    _$v = other as _$ResolvedEmailAuthProvider;
  }

  @override
  void update(void Function(ResolvedEmailAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedEmailAuthProvider build() => _build();

  _$ResolvedEmailAuthProvider _build() {
    ResolvedEmailAuthProvider._finalize(this);
    final _$result =
        _$v ??
        _$ResolvedEmailAuthProvider._(
          authProviderId: BuiltValueNullFieldError.checkNotNull(
            authProviderId,
            r'ResolvedEmailAuthProvider',
            'authProviderId',
          ),
          type: BuiltValueNullFieldError.checkNotNull(
            type,
            r'ResolvedEmailAuthProvider',
            'type',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedSmsAuthProvider extends ResolvedSmsAuthProvider {
  @override
  final String authProviderId;
  @override
  final AuthProviderType type;

  factory _$ResolvedSmsAuthProvider([
    void Function(ResolvedSmsAuthProviderBuilder)? updates,
  ]) => (ResolvedSmsAuthProviderBuilder()..update(updates))._build();

  _$ResolvedSmsAuthProvider._({
    required this.authProviderId,
    required this.type,
  }) : super._();
  @override
  ResolvedSmsAuthProvider rebuild(
    void Function(ResolvedSmsAuthProviderBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedSmsAuthProviderBuilder toBuilder() =>
      ResolvedSmsAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedSmsAuthProvider &&
        authProviderId == other.authProviderId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, authProviderId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedSmsAuthProvider')
          ..add('authProviderId', authProviderId)
          ..add('type', type))
        .toString();
  }
}

class ResolvedSmsAuthProviderBuilder
    implements
        Builder<ResolvedSmsAuthProvider, ResolvedSmsAuthProviderBuilder>,
        ResolvedAuthProviderBuilder {
  _$ResolvedSmsAuthProvider? _$v;

  String? _authProviderId;
  String? get authProviderId => _$this._authProviderId;
  set authProviderId(covariant String? authProviderId) =>
      _$this._authProviderId = authProviderId;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  ResolvedSmsAuthProviderBuilder();

  ResolvedSmsAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _authProviderId = $v.authProviderId;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedSmsAuthProvider other) {
    _$v = other as _$ResolvedSmsAuthProvider;
  }

  @override
  void update(void Function(ResolvedSmsAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedSmsAuthProvider build() => _build();

  _$ResolvedSmsAuthProvider _build() {
    ResolvedSmsAuthProvider._finalize(this);
    final _$result =
        _$v ??
        _$ResolvedSmsAuthProvider._(
          authProviderId: BuiltValueNullFieldError.checkNotNull(
            authProviderId,
            r'ResolvedSmsAuthProvider',
            'authProviderId',
          ),
          type: BuiltValueNullFieldError.checkNotNull(
            type,
            r'ResolvedSmsAuthProvider',
            'type',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedGoogleAuthProvider extends ResolvedGoogleAuthProvider {
  @override
  final ResolvedSecret clientId;
  @override
  final ResolvedSecret clientSecret;
  @override
  final String authProviderId;
  @override
  final AuthProviderType type;

  factory _$ResolvedGoogleAuthProvider([
    void Function(ResolvedGoogleAuthProviderBuilder)? updates,
  ]) => (ResolvedGoogleAuthProviderBuilder()..update(updates))._build();

  _$ResolvedGoogleAuthProvider._({
    required this.clientId,
    required this.clientSecret,
    required this.authProviderId,
    required this.type,
  }) : super._();
  @override
  ResolvedGoogleAuthProvider rebuild(
    void Function(ResolvedGoogleAuthProviderBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedGoogleAuthProviderBuilder toBuilder() =>
      ResolvedGoogleAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedGoogleAuthProvider &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret &&
        authProviderId == other.authProviderId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jc(_$hash, authProviderId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedGoogleAuthProvider')
          ..add('clientId', clientId)
          ..add('clientSecret', clientSecret)
          ..add('authProviderId', authProviderId)
          ..add('type', type))
        .toString();
  }
}

class ResolvedGoogleAuthProviderBuilder
    implements
        Builder<ResolvedGoogleAuthProvider, ResolvedGoogleAuthProviderBuilder>,
        ResolvedAuthProviderBuilder {
  _$ResolvedGoogleAuthProvider? _$v;

  ResolvedSecretBuilder? _clientId;
  ResolvedSecretBuilder get clientId =>
      _$this._clientId ??= ResolvedSecretBuilder();
  set clientId(covariant ResolvedSecretBuilder? clientId) =>
      _$this._clientId = clientId;

  ResolvedSecretBuilder? _clientSecret;
  ResolvedSecretBuilder get clientSecret =>
      _$this._clientSecret ??= ResolvedSecretBuilder();
  set clientSecret(covariant ResolvedSecretBuilder? clientSecret) =>
      _$this._clientSecret = clientSecret;

  String? _authProviderId;
  String? get authProviderId => _$this._authProviderId;
  set authProviderId(covariant String? authProviderId) =>
      _$this._authProviderId = authProviderId;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  ResolvedGoogleAuthProviderBuilder();

  ResolvedGoogleAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId.toBuilder();
      _clientSecret = $v.clientSecret.toBuilder();
      _authProviderId = $v.authProviderId;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedGoogleAuthProvider other) {
    _$v = other as _$ResolvedGoogleAuthProvider;
  }

  @override
  void update(void Function(ResolvedGoogleAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedGoogleAuthProvider build() => _build();

  _$ResolvedGoogleAuthProvider _build() {
    ResolvedGoogleAuthProvider._finalize(this);
    _$ResolvedGoogleAuthProvider _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedGoogleAuthProvider._(
            clientId: clientId.build(),
            clientSecret: clientSecret.build(),
            authProviderId: BuiltValueNullFieldError.checkNotNull(
              authProviderId,
              r'ResolvedGoogleAuthProvider',
              'authProviderId',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'ResolvedGoogleAuthProvider',
              'type',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientId';
        clientId.build();
        _$failedField = 'clientSecret';
        clientSecret.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedGoogleAuthProvider',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedAppleAuthProvider extends ResolvedAppleAuthProvider {
  @override
  final ResolvedSecret clientId;
  @override
  final ResolvedSecret teamId;
  @override
  final ResolvedSecret keyId;
  @override
  final ResolvedSecret privateKey;
  @override
  final String authProviderId;
  @override
  final AuthProviderType type;

  factory _$ResolvedAppleAuthProvider([
    void Function(ResolvedAppleAuthProviderBuilder)? updates,
  ]) => (ResolvedAppleAuthProviderBuilder()..update(updates))._build();

  _$ResolvedAppleAuthProvider._({
    required this.clientId,
    required this.teamId,
    required this.keyId,
    required this.privateKey,
    required this.authProviderId,
    required this.type,
  }) : super._();
  @override
  ResolvedAppleAuthProvider rebuild(
    void Function(ResolvedAppleAuthProviderBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedAppleAuthProviderBuilder toBuilder() =>
      ResolvedAppleAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedAppleAuthProvider &&
        clientId == other.clientId &&
        teamId == other.teamId &&
        keyId == other.keyId &&
        privateKey == other.privateKey &&
        authProviderId == other.authProviderId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, teamId.hashCode);
    _$hash = $jc(_$hash, keyId.hashCode);
    _$hash = $jc(_$hash, privateKey.hashCode);
    _$hash = $jc(_$hash, authProviderId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedAppleAuthProvider')
          ..add('clientId', clientId)
          ..add('teamId', teamId)
          ..add('keyId', keyId)
          ..add('privateKey', privateKey)
          ..add('authProviderId', authProviderId)
          ..add('type', type))
        .toString();
  }
}

class ResolvedAppleAuthProviderBuilder
    implements
        Builder<ResolvedAppleAuthProvider, ResolvedAppleAuthProviderBuilder>,
        ResolvedAuthProviderBuilder {
  _$ResolvedAppleAuthProvider? _$v;

  ResolvedSecretBuilder? _clientId;
  ResolvedSecretBuilder get clientId =>
      _$this._clientId ??= ResolvedSecretBuilder();
  set clientId(covariant ResolvedSecretBuilder? clientId) =>
      _$this._clientId = clientId;

  ResolvedSecretBuilder? _teamId;
  ResolvedSecretBuilder get teamId =>
      _$this._teamId ??= ResolvedSecretBuilder();
  set teamId(covariant ResolvedSecretBuilder? teamId) =>
      _$this._teamId = teamId;

  ResolvedSecretBuilder? _keyId;
  ResolvedSecretBuilder get keyId => _$this._keyId ??= ResolvedSecretBuilder();
  set keyId(covariant ResolvedSecretBuilder? keyId) => _$this._keyId = keyId;

  ResolvedSecretBuilder? _privateKey;
  ResolvedSecretBuilder get privateKey =>
      _$this._privateKey ??= ResolvedSecretBuilder();
  set privateKey(covariant ResolvedSecretBuilder? privateKey) =>
      _$this._privateKey = privateKey;

  String? _authProviderId;
  String? get authProviderId => _$this._authProviderId;
  set authProviderId(covariant String? authProviderId) =>
      _$this._authProviderId = authProviderId;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  ResolvedAppleAuthProviderBuilder();

  ResolvedAppleAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId.toBuilder();
      _teamId = $v.teamId.toBuilder();
      _keyId = $v.keyId.toBuilder();
      _privateKey = $v.privateKey.toBuilder();
      _authProviderId = $v.authProviderId;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedAppleAuthProvider other) {
    _$v = other as _$ResolvedAppleAuthProvider;
  }

  @override
  void update(void Function(ResolvedAppleAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedAppleAuthProvider build() => _build();

  _$ResolvedAppleAuthProvider _build() {
    ResolvedAppleAuthProvider._finalize(this);
    _$ResolvedAppleAuthProvider _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedAppleAuthProvider._(
            clientId: clientId.build(),
            teamId: teamId.build(),
            keyId: keyId.build(),
            privateKey: privateKey.build(),
            authProviderId: BuiltValueNullFieldError.checkNotNull(
              authProviderId,
              r'ResolvedAppleAuthProvider',
              'authProviderId',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'ResolvedAppleAuthProvider',
              'type',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientId';
        clientId.build();
        _$failedField = 'teamId';
        teamId.build();
        _$failedField = 'keyId';
        keyId.build();
        _$failedField = 'privateKey';
        privateKey.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedAppleAuthProvider',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedGitHubAuthProvider extends ResolvedGitHubAuthProvider {
  @override
  final ResolvedSecret clientId;
  @override
  final ResolvedSecret clientSecret;
  @override
  final String authProviderId;
  @override
  final AuthProviderType type;

  factory _$ResolvedGitHubAuthProvider([
    void Function(ResolvedGitHubAuthProviderBuilder)? updates,
  ]) => (ResolvedGitHubAuthProviderBuilder()..update(updates))._build();

  _$ResolvedGitHubAuthProvider._({
    required this.clientId,
    required this.clientSecret,
    required this.authProviderId,
    required this.type,
  }) : super._();
  @override
  ResolvedGitHubAuthProvider rebuild(
    void Function(ResolvedGitHubAuthProviderBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedGitHubAuthProviderBuilder toBuilder() =>
      ResolvedGitHubAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedGitHubAuthProvider &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret &&
        authProviderId == other.authProviderId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jc(_$hash, authProviderId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedGitHubAuthProvider')
          ..add('clientId', clientId)
          ..add('clientSecret', clientSecret)
          ..add('authProviderId', authProviderId)
          ..add('type', type))
        .toString();
  }
}

class ResolvedGitHubAuthProviderBuilder
    implements
        Builder<ResolvedGitHubAuthProvider, ResolvedGitHubAuthProviderBuilder>,
        ResolvedAuthProviderBuilder {
  _$ResolvedGitHubAuthProvider? _$v;

  ResolvedSecretBuilder? _clientId;
  ResolvedSecretBuilder get clientId =>
      _$this._clientId ??= ResolvedSecretBuilder();
  set clientId(covariant ResolvedSecretBuilder? clientId) =>
      _$this._clientId = clientId;

  ResolvedSecretBuilder? _clientSecret;
  ResolvedSecretBuilder get clientSecret =>
      _$this._clientSecret ??= ResolvedSecretBuilder();
  set clientSecret(covariant ResolvedSecretBuilder? clientSecret) =>
      _$this._clientSecret = clientSecret;

  String? _authProviderId;
  String? get authProviderId => _$this._authProviderId;
  set authProviderId(covariant String? authProviderId) =>
      _$this._authProviderId = authProviderId;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  ResolvedGitHubAuthProviderBuilder();

  ResolvedGitHubAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId.toBuilder();
      _clientSecret = $v.clientSecret.toBuilder();
      _authProviderId = $v.authProviderId;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedGitHubAuthProvider other) {
    _$v = other as _$ResolvedGitHubAuthProvider;
  }

  @override
  void update(void Function(ResolvedGitHubAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedGitHubAuthProvider build() => _build();

  _$ResolvedGitHubAuthProvider _build() {
    ResolvedGitHubAuthProvider._finalize(this);
    _$ResolvedGitHubAuthProvider _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedGitHubAuthProvider._(
            clientId: clientId.build(),
            clientSecret: clientSecret.build(),
            authProviderId: BuiltValueNullFieldError.checkNotNull(
              authProviderId,
              r'ResolvedGitHubAuthProvider',
              'authProviderId',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'ResolvedGitHubAuthProvider',
              'type',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientId';
        clientId.build();
        _$failedField = 'clientSecret';
        clientSecret.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedGitHubAuthProvider',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedFirebaseExternalAuthProvider
    extends ResolvedFirebaseExternalAuthProvider {
  @override
  final ResolvedVariable projectId;
  @override
  final String authProviderId;
  @override
  final AuthProviderType type;

  factory _$ResolvedFirebaseExternalAuthProvider([
    void Function(ResolvedFirebaseExternalAuthProviderBuilder)? updates,
  ]) =>
      (ResolvedFirebaseExternalAuthProviderBuilder()..update(updates))._build();

  _$ResolvedFirebaseExternalAuthProvider._({
    required this.projectId,
    required this.authProviderId,
    required this.type,
  }) : super._();
  @override
  ResolvedFirebaseExternalAuthProvider rebuild(
    void Function(ResolvedFirebaseExternalAuthProviderBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedFirebaseExternalAuthProviderBuilder toBuilder() =>
      ResolvedFirebaseExternalAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedFirebaseExternalAuthProvider &&
        projectId == other.projectId &&
        authProviderId == other.authProviderId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, projectId.hashCode);
    _$hash = $jc(_$hash, authProviderId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedFirebaseExternalAuthProvider')
          ..add('projectId', projectId)
          ..add('authProviderId', authProviderId)
          ..add('type', type))
        .toString();
  }
}

class ResolvedFirebaseExternalAuthProviderBuilder
    implements
        Builder<
          ResolvedFirebaseExternalAuthProvider,
          ResolvedFirebaseExternalAuthProviderBuilder
        >,
        ResolvedExternalAuthProviderBuilder {
  _$ResolvedFirebaseExternalAuthProvider? _$v;

  ResolvedVariableBuilder? _projectId;
  ResolvedVariableBuilder get projectId =>
      _$this._projectId ??= ResolvedVariableBuilder();
  set projectId(covariant ResolvedVariableBuilder? projectId) =>
      _$this._projectId = projectId;

  String? _authProviderId;
  String? get authProviderId => _$this._authProviderId;
  set authProviderId(covariant String? authProviderId) =>
      _$this._authProviderId = authProviderId;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  ResolvedFirebaseExternalAuthProviderBuilder();

  ResolvedFirebaseExternalAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectId = $v.projectId.toBuilder();
      _authProviderId = $v.authProviderId;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedFirebaseExternalAuthProvider other) {
    _$v = other as _$ResolvedFirebaseExternalAuthProvider;
  }

  @override
  void update(
    void Function(ResolvedFirebaseExternalAuthProviderBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedFirebaseExternalAuthProvider build() => _build();

  _$ResolvedFirebaseExternalAuthProvider _build() {
    ResolvedFirebaseExternalAuthProvider._finalize(this);
    _$ResolvedFirebaseExternalAuthProvider _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedFirebaseExternalAuthProvider._(
            projectId: projectId.build(),
            authProviderId: BuiltValueNullFieldError.checkNotNull(
              authProviderId,
              r'ResolvedFirebaseExternalAuthProvider',
              'authProviderId',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'ResolvedFirebaseExternalAuthProvider',
              'type',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'projectId';
        projectId.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedFirebaseExternalAuthProvider',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedSupabaseExternalAuthProvider
    extends ResolvedSupabaseExternalAuthProvider {
  @override
  final ResolvedVariable projectUrl;
  @override
  final ResolvedSecret? jwtSecret;
  @override
  final String authProviderId;
  @override
  final AuthProviderType type;

  factory _$ResolvedSupabaseExternalAuthProvider([
    void Function(ResolvedSupabaseExternalAuthProviderBuilder)? updates,
  ]) =>
      (ResolvedSupabaseExternalAuthProviderBuilder()..update(updates))._build();

  _$ResolvedSupabaseExternalAuthProvider._({
    required this.projectUrl,
    this.jwtSecret,
    required this.authProviderId,
    required this.type,
  }) : super._();
  @override
  ResolvedSupabaseExternalAuthProvider rebuild(
    void Function(ResolvedSupabaseExternalAuthProviderBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedSupabaseExternalAuthProviderBuilder toBuilder() =>
      ResolvedSupabaseExternalAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedSupabaseExternalAuthProvider &&
        projectUrl == other.projectUrl &&
        jwtSecret == other.jwtSecret &&
        authProviderId == other.authProviderId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, projectUrl.hashCode);
    _$hash = $jc(_$hash, jwtSecret.hashCode);
    _$hash = $jc(_$hash, authProviderId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedSupabaseExternalAuthProvider')
          ..add('projectUrl', projectUrl)
          ..add('jwtSecret', jwtSecret)
          ..add('authProviderId', authProviderId)
          ..add('type', type))
        .toString();
  }
}

class ResolvedSupabaseExternalAuthProviderBuilder
    implements
        Builder<
          ResolvedSupabaseExternalAuthProvider,
          ResolvedSupabaseExternalAuthProviderBuilder
        >,
        ResolvedExternalAuthProviderBuilder {
  _$ResolvedSupabaseExternalAuthProvider? _$v;

  ResolvedVariableBuilder? _projectUrl;
  ResolvedVariableBuilder get projectUrl =>
      _$this._projectUrl ??= ResolvedVariableBuilder();
  set projectUrl(covariant ResolvedVariableBuilder? projectUrl) =>
      _$this._projectUrl = projectUrl;

  ResolvedSecretBuilder? _jwtSecret;
  ResolvedSecretBuilder get jwtSecret =>
      _$this._jwtSecret ??= ResolvedSecretBuilder();
  set jwtSecret(covariant ResolvedSecretBuilder? jwtSecret) =>
      _$this._jwtSecret = jwtSecret;

  String? _authProviderId;
  String? get authProviderId => _$this._authProviderId;
  set authProviderId(covariant String? authProviderId) =>
      _$this._authProviderId = authProviderId;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  ResolvedSupabaseExternalAuthProviderBuilder();

  ResolvedSupabaseExternalAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectUrl = $v.projectUrl.toBuilder();
      _jwtSecret = $v.jwtSecret?.toBuilder();
      _authProviderId = $v.authProviderId;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedSupabaseExternalAuthProvider other) {
    _$v = other as _$ResolvedSupabaseExternalAuthProvider;
  }

  @override
  void update(
    void Function(ResolvedSupabaseExternalAuthProviderBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedSupabaseExternalAuthProvider build() => _build();

  _$ResolvedSupabaseExternalAuthProvider _build() {
    ResolvedSupabaseExternalAuthProvider._finalize(this);
    _$ResolvedSupabaseExternalAuthProvider _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedSupabaseExternalAuthProvider._(
            projectUrl: projectUrl.build(),
            jwtSecret: _jwtSecret?.build(),
            authProviderId: BuiltValueNullFieldError.checkNotNull(
              authProviderId,
              r'ResolvedSupabaseExternalAuthProvider',
              'authProviderId',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'ResolvedSupabaseExternalAuthProvider',
              'type',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'projectUrl';
        projectUrl.build();
        _$failedField = 'jwtSecret';
        _jwtSecret?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedSupabaseExternalAuthProvider',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ResolvedDatabaseSchemaBuilder {
  void replace(ResolvedDatabaseSchema other);
  void update(void Function(ResolvedDatabaseSchemaBuilder) updates);
  String? get databaseSchemaId;
  set databaseSchemaId(String? databaseSchemaId);

  DatabaseSchemaType? get type;
  set type(DatabaseSchemaType? type);
}

class _$ResolvedDriftDatabaseSchema extends ResolvedDriftDatabaseSchema {
  @override
  final String databaseSchemaId;
  @override
  final int version;
  @override
  final JsonObject $schemaJson;
  @override
  final DatabaseSchemaType type;

  factory _$ResolvedDriftDatabaseSchema([
    void Function(ResolvedDriftDatabaseSchemaBuilder)? updates,
  ]) => (ResolvedDriftDatabaseSchemaBuilder()..update(updates))._build();

  _$ResolvedDriftDatabaseSchema._({
    required this.databaseSchemaId,
    required this.version,
    required this.$schemaJson,
    required this.type,
  }) : super._();
  @override
  ResolvedDriftDatabaseSchema rebuild(
    void Function(ResolvedDriftDatabaseSchemaBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedDriftDatabaseSchemaBuilder toBuilder() =>
      ResolvedDriftDatabaseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedDriftDatabaseSchema &&
        databaseSchemaId == other.databaseSchemaId &&
        version == other.version &&
        $schemaJson == other.$schemaJson &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, databaseSchemaId.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, $schemaJson.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedDriftDatabaseSchema')
          ..add('databaseSchemaId', databaseSchemaId)
          ..add('version', version)
          ..add('\$schemaJson', $schemaJson)
          ..add('type', type))
        .toString();
  }
}

class ResolvedDriftDatabaseSchemaBuilder
    implements
        Builder<
          ResolvedDriftDatabaseSchema,
          ResolvedDriftDatabaseSchemaBuilder
        >,
        ResolvedDatabaseSchemaBuilder {
  _$ResolvedDriftDatabaseSchema? _$v;

  String? _databaseSchemaId;
  String? get databaseSchemaId => _$this._databaseSchemaId;
  set databaseSchemaId(covariant String? databaseSchemaId) =>
      _$this._databaseSchemaId = databaseSchemaId;

  int? _version;
  int? get version => _$this._version;
  set version(covariant int? version) => _$this._version = version;

  JsonObject? _$schemaJson;
  JsonObject? get $schemaJson => _$this._$schemaJson;
  set $schemaJson(covariant JsonObject? $schemaJson) =>
      _$this._$schemaJson = $schemaJson;

  DatabaseSchemaType? _type;
  DatabaseSchemaType? get type => _$this._type;
  set type(covariant DatabaseSchemaType? type) => _$this._type = type;

  ResolvedDriftDatabaseSchemaBuilder();

  ResolvedDriftDatabaseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _databaseSchemaId = $v.databaseSchemaId;
      _version = $v.version;
      _$schemaJson = $v.$schemaJson;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedDriftDatabaseSchema other) {
    _$v = other as _$ResolvedDriftDatabaseSchema;
  }

  @override
  void update(void Function(ResolvedDriftDatabaseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedDriftDatabaseSchema build() => _build();

  _$ResolvedDriftDatabaseSchema _build() {
    final _$result =
        _$v ??
        _$ResolvedDriftDatabaseSchema._(
          databaseSchemaId: BuiltValueNullFieldError.checkNotNull(
            databaseSchemaId,
            r'ResolvedDriftDatabaseSchema',
            'databaseSchemaId',
          ),
          version: BuiltValueNullFieldError.checkNotNull(
            version,
            r'ResolvedDriftDatabaseSchema',
            'version',
          ),
          $schemaJson: BuiltValueNullFieldError.checkNotNull(
            $schemaJson,
            r'ResolvedDriftDatabaseSchema',
            '\$schemaJson',
          ),
          type: BuiltValueNullFieldError.checkNotNull(
            type,
            r'ResolvedDriftDatabaseSchema',
            'type',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedDatabase extends ResolvedDatabase {
  @override
  final String databaseId;
  @override
  final ResolvedDatabaseSchema schema;
  @override
  final ResolvedDatabaseConfig config;

  factory _$ResolvedDatabase([
    void Function(ResolvedDatabaseBuilder)? updates,
  ]) => (ResolvedDatabaseBuilder()..update(updates))._build();

  _$ResolvedDatabase._({
    required this.databaseId,
    required this.schema,
    required this.config,
  }) : super._();
  @override
  ResolvedDatabase rebuild(void Function(ResolvedDatabaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedDatabaseBuilder toBuilder() =>
      ResolvedDatabaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedDatabase &&
        databaseId == other.databaseId &&
        schema == other.schema &&
        config == other.config;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, databaseId.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedDatabase')
          ..add('databaseId', databaseId)
          ..add('schema', schema)
          ..add('config', config))
        .toString();
  }
}

class ResolvedDatabaseBuilder
    implements Builder<ResolvedDatabase, ResolvedDatabaseBuilder> {
  _$ResolvedDatabase? _$v;

  String? _databaseId;
  String? get databaseId => _$this._databaseId;
  set databaseId(String? databaseId) => _$this._databaseId = databaseId;

  ResolvedDatabaseSchema? _schema;
  ResolvedDatabaseSchema? get schema => _$this._schema;
  set schema(ResolvedDatabaseSchema? schema) => _$this._schema = schema;

  ResolvedDatabaseConfig? _config;
  ResolvedDatabaseConfig? get config => _$this._config;
  set config(ResolvedDatabaseConfig? config) => _$this._config = config;

  ResolvedDatabaseBuilder();

  ResolvedDatabaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _databaseId = $v.databaseId;
      _schema = $v.schema;
      _config = $v.config;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedDatabase other) {
    _$v = other as _$ResolvedDatabase;
  }

  @override
  void update(void Function(ResolvedDatabaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedDatabase build() => _build();

  _$ResolvedDatabase _build() {
    final _$result =
        _$v ??
        _$ResolvedDatabase._(
          databaseId: BuiltValueNullFieldError.checkNotNull(
            databaseId,
            r'ResolvedDatabase',
            'databaseId',
          ),
          schema: BuiltValueNullFieldError.checkNotNull(
            schema,
            r'ResolvedDatabase',
            'schema',
          ),
          config: BuiltValueNullFieldError.checkNotNull(
            config,
            r'ResolvedDatabase',
            'config',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedCelestDatabaseConfig extends ResolvedCelestDatabaseConfig {
  @override
  final ResolvedVariable hostname;
  @override
  final ResolvedSecret token;

  factory _$ResolvedCelestDatabaseConfig([
    void Function(ResolvedCelestDatabaseConfigBuilder)? updates,
  ]) => (ResolvedCelestDatabaseConfigBuilder()..update(updates))._build();

  _$ResolvedCelestDatabaseConfig._({
    required this.hostname,
    required this.token,
  }) : super._();
  @override
  ResolvedCelestDatabaseConfig rebuild(
    void Function(ResolvedCelestDatabaseConfigBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ResolvedCelestDatabaseConfigBuilder toBuilder() =>
      ResolvedCelestDatabaseConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedCelestDatabaseConfig &&
        hostname == other.hostname &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hostname.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedCelestDatabaseConfig')
          ..add('hostname', hostname)
          ..add('token', token))
        .toString();
  }
}

class ResolvedCelestDatabaseConfigBuilder
    implements
        Builder<
          ResolvedCelestDatabaseConfig,
          ResolvedCelestDatabaseConfigBuilder
        > {
  _$ResolvedCelestDatabaseConfig? _$v;

  ResolvedVariableBuilder? _hostname;
  ResolvedVariableBuilder get hostname =>
      _$this._hostname ??= ResolvedVariableBuilder();
  set hostname(ResolvedVariableBuilder? hostname) =>
      _$this._hostname = hostname;

  ResolvedSecretBuilder? _token;
  ResolvedSecretBuilder get token => _$this._token ??= ResolvedSecretBuilder();
  set token(ResolvedSecretBuilder? token) => _$this._token = token;

  ResolvedCelestDatabaseConfigBuilder();

  ResolvedCelestDatabaseConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hostname = $v.hostname.toBuilder();
      _token = $v.token.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolvedCelestDatabaseConfig other) {
    _$v = other as _$ResolvedCelestDatabaseConfig;
  }

  @override
  void update(void Function(ResolvedCelestDatabaseConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedCelestDatabaseConfig build() => _build();

  _$ResolvedCelestDatabaseConfig _build() {
    _$ResolvedCelestDatabaseConfig _$result;
    try {
      _$result =
          _$v ??
          _$ResolvedCelestDatabaseConfig._(
            hostname: hostname.build(),
            token: token.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hostname';
        hostname.build();
        _$failedField = 'token';
        token.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ResolvedCelestDatabaseConfig',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
