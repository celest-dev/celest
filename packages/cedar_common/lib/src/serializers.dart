import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:cedar_common/cedar_common.dart';

part 'serializers.g.dart';

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
