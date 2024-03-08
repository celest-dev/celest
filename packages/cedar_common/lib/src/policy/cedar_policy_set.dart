import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cedar_common/cedar_common.dart';

part 'cedar_policy_set.g.dart';

abstract class CedarPolicySet
    implements Built<CedarPolicySet, CedarPolicySetBuilder> {
  factory CedarPolicySet({
    Map<String, CedarPolicy> policies = const {},
  }) {
    return _$CedarPolicySet._(policies: policies.build());
  }

  factory CedarPolicySet.fromJson(Map<String, Object?> json) {
    return CedarPolicySet(
      policies: {
        for (final MapEntry(key: id, value: json) in json.entries)
          id: CedarPolicy.fromJson(json as Map<String, Object?>)
              .rebuild((p) => p..id ??= id),
      },
    );
  }

  factory CedarPolicySet.build([
    void Function(CedarPolicySetBuilder) updates,
  ]) = _$CedarPolicySet;

  const CedarPolicySet._();

  BuiltMap<String, CedarPolicy> get policies;
  // TODO(dnys1): Templates

  Map<String, Object?> toJson() =>
      policies.asMap().map((key, value) => MapEntry(key, value.toJson()));

  static Serializer<CedarPolicySet> get serializer =>
      _$cedarPolicySetSerializer;
}
