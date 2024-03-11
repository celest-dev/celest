import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:cedar/cedar.dart';

part 'serializers.g.dart';

/// `package:built_value` serializers for Cedar types.
@SerializersFor([
  CedarEntityId,
  CedarEntity,
  CedarPolicySet,
  CedarPolicy,
  CedarPolicyEffect,
  CedarPolicyOp,
  CedarPolicyConditionKind,
  CedarPolicyPrincipal,
  CedarPolicyAction,
  CedarPolicyResource,
  CedarPolicyCondition,
])
final Serializers cedarSerializers = _$cedarSerializers;
