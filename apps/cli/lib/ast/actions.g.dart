// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CloudFunctionAction _$invoke = const CloudFunctionAction._('invoke');

CloudFunctionAction _$CloudFunctionActionValueOf(String name) {
  switch (name) {
    case 'invoke':
      return _$invoke;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CloudFunctionAction> _$CloudFunctionActionValues =
    new BuiltSet<CloudFunctionAction>(const <CloudFunctionAction>[
  _$invoke,
]);

Serializer<CloudFunctionAction> _$cloudFunctionActionSerializer =
    new _$CloudFunctionActionSerializer();

class _$CloudFunctionActionSerializer
    implements PrimitiveSerializer<CloudFunctionAction> {
  @override
  final Iterable<Type> types = const <Type>[CloudFunctionAction];
  @override
  final String wireName = 'CloudFunctionAction';

  @override
  Object serialize(Serializers serializers, CloudFunctionAction object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  CloudFunctionAction deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CloudFunctionAction.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
