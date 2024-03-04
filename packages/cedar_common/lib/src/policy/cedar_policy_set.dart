import 'package:cedar_common/cedar_common.dart';

final class CedarPolicySet {
  const CedarPolicySet({
    this.policies = const {},
  });

  factory CedarPolicySet.fromJson(Map<String, Object?> json) {
    return CedarPolicySet(
      policies: {
        for (final MapEntry(key: id, value: json) in json.entries)
          id: CedarPolicy.fromJson(json as Map<String, Object?>)
              .rebuild((p) => p..id ??= id),
      },
    );
  }

  final Map<String, CedarPolicy> policies;
  // TODO(dnys1): Templates
}
