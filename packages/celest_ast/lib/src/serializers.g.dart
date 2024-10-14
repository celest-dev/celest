// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Api.serializer)
      ..add(ApiAuthenticated.serializer)
      ..add(ApiHttpConfig.serializer)
      ..add(ApiHttpError.serializer)
      ..add(ApiMiddleware.serializer)
      ..add(ApiPublic.serializer)
      ..add(AppleAuthProvider.serializer)
      ..add(Auth.serializer)
      ..add(AuthProviderType.serializer)
      ..add(CelestDatabaseConfig.serializer)
      ..add(CloudFunction.serializer)
      ..add(CloudFunctionParameter.serializer)
      ..add(DartBool.serializer)
      ..add(DartDouble.serializer)
      ..add(DartEnum.serializer)
      ..add(DartInstance.serializer)
      ..add(DartInt.serializer)
      ..add(DartList.serializer)
      ..add(DartMap.serializer)
      ..add(DartNull.serializer)
      ..add(DartRecord.serializer)
      ..add(DartString.serializer)
      ..add(DartSymbolLiteral.serializer)
      ..add(DartTypeLiteral.serializer)
      ..add(Database.serializer)
      ..add(DatabaseSchemaType.serializer)
      ..add(DriftDatabaseSchema.serializer)
      ..add(EmailAuthProvider.serializer)
      ..add(FeatureFlag.serializer)
      ..add(FirebaseExternalAuthProvider.serializer)
      ..add(GitHubAuthProvider.serializer)
      ..add(GoogleAuthProvider.serializer)
      ..add(NodeReference.serializer)
      ..add(NodeType.serializer)
      ..add(PolicySet.serializer)
      ..add(Project.serializer)
      ..add(Region.serializer)
      ..add(ResolvedApi.serializer)
      ..add(ResolvedAppleAuthProvider.serializer)
      ..add(ResolvedAuth.serializer)
      ..add(ResolvedCelestDatabaseConfig.serializer)
      ..add(ResolvedCloudFunction.serializer)
      ..add(ResolvedDatabase.serializer)
      ..add(ResolvedDriftDatabaseSchema.serializer)
      ..add(ResolvedEmailAuthProvider.serializer)
      ..add(ResolvedFirebaseExternalAuthProvider.serializer)
      ..add(ResolvedGitHubAuthProvider.serializer)
      ..add(ResolvedGoogleAuthProvider.serializer)
      ..add(ResolvedHttpConfig.serializer)
      ..add(ResolvedHttpRoute.serializer)
      ..add(ResolvedProject.serializer)
      ..add(ResolvedSecret.serializer)
      ..add(ResolvedSmsAuthProvider.serializer)
      ..add(ResolvedStreamConfig.serializer)
      ..add(ResolvedSupabaseExternalAuthProvider.serializer)
      ..add(ResolvedVariable.serializer)
      ..add(Sdk.serializer)
      ..add(SdkConfiguration.serializer)
      ..add(SdkType.serializer)
      ..add(Secret.serializer)
      ..add(SmsAuthProvider.serializer)
      ..add(StreamType.serializer)
      ..add(SupabaseExternalAuthProvider.serializer)
      ..add(Variable.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ApiMetadata)]),
          () => new ListBuilder<ApiMetadata>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(CloudFunction)]),
          () => new MapBuilder<String, CloudFunction>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Reference)]),
          () => new SetBuilder<Reference>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AuthProvider)]),
          () => new ListBuilder<AuthProvider>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ExternalAuthProvider)]),
          () => new ListBuilder<ExternalAuthProvider>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DartValue)]),
          () => new ListBuilder<DartValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DartValue)]),
          () => new ListBuilder<DartValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DartValue)]),
          () => new ListBuilder<DartValue>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(DartValue)]),
          () => new MapBuilder<String, DartValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Reference)]),
          () => new ListBuilder<Reference>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CloudFunctionParameter)]),
          () => new ListBuilder<CloudFunctionParameter>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ApiMetadata)]),
          () => new ListBuilder<ApiMetadata>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DartValue)]),
          () => new ListBuilder<DartValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ResolvedAuthProvider)]),
          () => new ListBuilder<ResolvedAuthProvider>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ResolvedExternalAuthProvider)]),
          () => new ListBuilder<ResolvedExternalAuthProvider>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ResolvedHttpRoute)]),
          () => new ListBuilder<ResolvedHttpRoute>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(TypeReference), const FullType(int)]),
          () => new MapBuilder<TypeReference, int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(DartValue), const FullType(DartValue)]),
          () => new MapBuilder<DartValue, DartValue>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Api)]),
          () => new MapBuilder<String, Api>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Variable)]),
          () => new ListBuilder<Variable>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Secret)]),
          () => new ListBuilder<Secret>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(Database)]),
          () => new MapBuilder<String, Database>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(DartValue)]),
          () => new MapBuilder<String, DartValue>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(DartValue)]),
          () => new MapBuilder<String, DartValue>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Policy)]),
          () => new MapBuilder<String, Policy>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Policy)]),
          () => new MapBuilder<String, Policy>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TemplateLink)]),
          () => new ListBuilder<TemplateLink>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(ResolvedApi)]),
          () => new MapBuilder<String, ResolvedApi>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ResolvedVariable)]),
          () => new ListBuilder<ResolvedVariable>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ResolvedSecret)]),
          () => new ListBuilder<ResolvedSecret>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(ResolvedDatabase)]),
          () => new MapBuilder<String, ResolvedDatabase>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(ResolvedCloudFunction)
          ]),
          () => new MapBuilder<String, ResolvedCloudFunction>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(FeatureFlag)]),
          () => new SetBuilder<FeatureFlag>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
