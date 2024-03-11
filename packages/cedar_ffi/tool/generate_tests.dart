import 'dart:convert';
import 'dart:io';

import 'package:cedar_ffi/testing/cedar_test_corpus.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  final testRoot = p.join(
    Directory.current.path,
    'third_party',
    'cedar',
    'cedar-integration-tests',
  );
  final outputFile = File.fromUri(
    Directory.current.uri.resolve('lib/src/testing/corpus.json'),
  );
  await outputFile.create(recursive: true);
  final testFiles = Directory(p.join(testRoot, 'corpus_tests'))
      .listSync()
      .cast<File>()
      .where((file) {
    final name = p.basename(file.path);
    return name.endsWith('.json') &&
        !name.startsWith('schema_') &&
        !name.startsWith('policies_') &&
        !name.startsWith('entities_');
  });
  const skipTests = {
    '57b7cfe0e1f8f9067164d7fb9f13e8b5da276ba5': 'Bad policy set',
    '38d1fcf284cdf4f1c53cb41c358b757918075cc0': 'Bad policy set',
    '7ca848ce836993ff836dd884591a6ae2ea97250e': 'Bad policy set',
    'c1b7e2298e77b88e1c25cf5efb2f048a18475ba3': 'Bad policy set',
  };
  final testData = <String, CedarTest>{};
  for (final testFile in testFiles) {
    final name = p.basenameWithoutExtension(testFile.path);
    if (skipTests[name] case final reason?) {
      print('Skipping $name: $reason');
      continue;
    }
    final json =
        jsonDecode(testFile.readAsStringSync()) as Map<String, Object?>;
    switch (json) {
      case {
          'schema': final String schemaPath,
          'policies': final String policiesPath,
          'should_validate': final bool shouldValidate,
          'entities': final String entitiesPath,
          'queries': final List<Object?> queries,
        }:
        final test = CedarTest(
          name: name,
          schemaJson: jsonDecode(
            File(p.join(testRoot, schemaPath)).readAsStringSync(),
          ) as Map<String, Object?>,
          policiesCedar:
              File(p.join(testRoot, policiesPath)).readAsStringSync(),
          shouldValidate: shouldValidate,
          entitiesJson: jsonDecode(
            File(p.join(testRoot, entitiesPath)).readAsStringSync(),
          ) as List<Object?>,
          queries: queries
              .map(
                (query) => CedarQuery.fromJson(query as Map<String, Object?>),
              )
              .toList(),
        );
        testData[name] = test;
      default:
        throw ArgumentError.value(json, 'json', 'Invalid test data ($name)');
    }
  }
  await outputFile.writeAsString(
    jsonEncode(testData.map((k, v) => MapEntry(k, v.toJson()))),
  );
  final result = await Process.run(
    Platform.resolvedExecutable,
    [
      '--enable-experiment=native-assets',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs'
    ],
  );
  if (result.exitCode != 0) {
    throw ProcessException(
      'dart',
      ['build_runner', 'build', '--delete-conflicting-outputs'],
      '${result.stdout}\n${result.stderr}',
      result.exitCode,
    );
  }
}
