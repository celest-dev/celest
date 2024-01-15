import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'actions.g.dart';

sealed class CelestAction {}

class CloudFunctionAction extends EnumClass implements CelestAction {
  const CloudFunctionAction._(super.name);

  static const CloudFunctionAction invoke = _$invoke;

  static BuiltSet<CloudFunctionAction> get values =>
      _$CloudFunctionActionValues;
  static CloudFunctionAction valueOf(String name) =>
      _$CloudFunctionActionValueOf(name);

  static Serializer<CloudFunctionAction> get serializer =>
      _$cloudFunctionActionSerializer;
}
