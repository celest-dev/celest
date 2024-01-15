// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Api.serializer)
      ..add(ApiAuthenticated.serializer)
      ..add(ApiMiddleware.serializer)
      ..add(ApiPublic.serializer)
      ..add(CloudFunction.serializer)
      ..add(CloudFunctionAction.serializer)
      ..add(CloudFunctionParameter.serializer)
      ..add(EnvironmentVariable.serializer)
      ..add(NodeId.serializer)
      ..add(NodeReference.serializer)
      ..add(NodeType.serializer)
      ..add(Policy.serializer)
      ..add(PolicyStatement.serializer)
      ..add(Project.serializer)
      ..add(ResolvedApi.serializer)
      ..add(ResolvedCloudFunction.serializer)
      ..add(ResolvedEnvironmentVariable.serializer)
      ..add(ResolvedProject.serializer)
      ..add(Role.serializer)
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
          const FullType(
              BuiltList, const [const FullType(CloudFunctionParameter)]),
          () => new ListBuilder<CloudFunctionParameter>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ApiMetadata)]),
          () => new ListBuilder<ApiMetadata>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Reference)]),
          () => new ListBuilder<Reference>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Expression)]),
          () => new ListBuilder<Expression>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Expression)]),
          () => new ListBuilder<Expression>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Api)]),
          () => new MapBuilder<String, Api>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(EnvironmentVariable)]),
          () => new ListBuilder<EnvironmentVariable>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(ResolvedApi)]),
          () => new MapBuilder<String, ResolvedApi>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ResolvedEnvironmentVariable)]),
          () => new ListBuilder<ResolvedEnvironmentVariable>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(ResolvedCloudFunction)
          ]),
          () => new MapBuilder<String, ResolvedCloudFunction>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(CelestAction)]),
          () => new SetBuilder<CelestAction>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(PolicyStatement)]),
          () => new SetBuilder<PolicyStatement>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
