import 'dart:io';

import 'package:path/path.dart' as p;

final policyDir = Directory.fromUri(
  Directory.current.uri.resolve('lib/src/authorization/cedar'),
);

Future<void> main() async {
  final policyFiles = await policyDir.list(recursive: true).toList();
  final policies = policyFiles.whereType<File>().where(
    (f) => p.extension(f.path) == '.cedar',
  );
  final policyOutput = StringBuffer('''
/// The core policy set, in Cedar IDL.
const corePolicySetCedar = \'\'\'
''');
  for (final policy in policies) {
    final policyData = await policy.readAsString();
    final policyFilename = p.basename(policy.path);
    policyOutput
      ..writeln('// ${'-' * (policyFilename.length + 6)} //')
      ..writeln('// -- $policyFilename -- //')
      ..writeln('// ${'-' * (policyFilename.length + 6)} //')
      ..writeln()
      ..writeln(policyData.trim());
  }
  policyOutput.write('\'\'\';');
  final output = '''
// This file is generated. To update, run `dart tool/generate_policy_set.dart`.
library;

import 'package:cedar/cedar.dart';

/// The core policy set.
///
/// Included policies:
${policies.map((f) => p.basename(f.path)).map((p) => '/// - $p').join('\n')}
final corePolicySet = PolicySet.parse(corePolicySetCedar);

$policyOutput
''';
  await File.fromUri(
    Directory.current.uri.resolve('lib/src/authorization/policy_set.g.dart'),
  ).writeAsString(output);
  print('Generated lib/src/policies.dart');
}
