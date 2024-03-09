import 'dart:convert';
import 'dart:ffi';

import 'package:cedar/cedar.dart';
import 'package:cedar_ffi/src/ffi/cedar_bindings.g.dart' as bindings;
import 'package:ffi/ffi.dart';

/// An FFI extension of [CedarPolicySet].
extension type CedarPolicySetFfi._(CedarPolicySet _policySet)
    implements CedarPolicySet {
  /// Parses a set of Cedar policies from the given [policiesIdl].
  CedarPolicySetFfi.fromCedar(String policiesIdl)
      : _policySet = CedarPolicySet.fromJson(parsePolicies(policiesIdl));
}

/// Parses a set of Cedar policies from the given [policiesIdl] using the
/// Cedar Rust engine via FFI.
Map<String, Map<String, Object?>> parsePolicies(String policiesIdl) {
  return using((arena) {
    final cPolicies = bindings.cedar_parse_policy_set(
      policiesIdl.toNativeUtf8(allocator: arena).cast(),
    );
    switch (cPolicies) {
      case bindings.CCedarPolicySetResult(:final errors, :final errors_len)
          when errors_len > 0:
        final errorStrings = <String>[];
        for (var i = 0; i < errors_len; i++) {
          errorStrings.add(errors[i].cast<Utf8>().toDartString());
        }
        throw FormatException(
          'Error parsing policies: '
          '${errorStrings.join(', ')}',
          policiesIdl,
        );
      case bindings.CCedarPolicySetResult(
          :final policies,
          :final policy_ids,
          :final policies_len
        ):
        return {
          for (var i = 0; i < policies_len; i++)
            policy_ids[i].cast<Utf8>().toDartString():
                jsonDecode(policies[i].cast<Utf8>().toDartString())
                    as Map<String, Object?>,
        };
    }
  });
}
