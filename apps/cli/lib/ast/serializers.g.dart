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
      ..add(CloudFunctionParameter.serializer)
      ..add(EnvironmentVariable.serializer)
      ..add(NodeReference.serializer)
      ..add(NodeType.serializer)
      ..add(Project.serializer)
      ..add(SourceLocation.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ApiMetadata)]),
          () => new ListBuilder<ApiMetadata>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(CloudFunction)]),
          () => new MapBuilder<String, CloudFunction>())
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
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Api)]),
          () => new MapBuilder<String, Api>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(EnvironmentVariable)]),
          () => new ListBuilder<EnvironmentVariable>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
