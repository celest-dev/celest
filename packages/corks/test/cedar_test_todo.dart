// TODO(dnys1): Get this working with a dependency on cedar.

// import 'package:cedar/cedar.dart' as cedar;
// import 'package:cedar/testing/cedar_test_corpus.dart';
// import 'package:corks/src/interop/proto_interop.dart';
// import 'package:test/test.dart';

// void main() {
//   group('Corpus', () {
//     for (final CedarTest(
//           :name,
//           :policiesCedar,
//         ) in cedarCorpusTests.values) {
//       group(name, () {
//         test('can interop policies', () async {
//           final policies = cedar.CedarPolicySet.parse(policiesCedar);
//           for (final policy in policies.policies.values.cast<CedarPolicy>()) {
//             final protoJson = policy.toProtoJson();
//             expect(
//               CedarPolicy.fromProtoJson(protoJson).toJson(),
//               equals(policy.toJson()),
//             );

//             final protoBuffer = policy.toProtoBuffer();
//             expect(
//               CedarPolicy.fromProtoBuffer(protoBuffer).toJson(),
//               equals(policy.toJson()),
//             );
//           }
//         });
//       });
//     }
//   });
// }
