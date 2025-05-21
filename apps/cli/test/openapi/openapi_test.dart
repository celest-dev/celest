import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/openapi/loader/openapi_loader.dart';
import 'package:celest_cli/src/openapi/renderer/openapi_renderer.dart';
import 'package:test/test.dart';
import 'package:yaml/src/equality.dart' as equality;
import 'package:yaml/yaml.dart';

void main() {
  group('OpenAPI', () {
    final fixturesDir =
        Directory.current.uri.resolve('./test/openapi/fixtures');
    final fixtureSpecs = Directory.fromUri(fixturesDir)
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.json'));

    for (final fixtureSpec in fixtureSpecs) {
      final basename = p.basename(fixtureSpec.path);
      group(basename, () {
        final fixtureSpecJson = fixtureSpec.readAsStringSync();

        test('can load document', () {
          expect(
            () => loadOpenApiDocument(
              fixtureSpecJson,
              sourceUri: fixtureSpec.uri,
            ),
            returnsNormally,
          );
        });

        test('can render to YAML', () {
          final document = loadOpenApiDocument(
            fixtureSpecJson,
            sourceUri: fixtureSpec.uri,
          );
          final documentFile = File(p.setExtension(fixtureSpec.path, '.spec'));
          documentFile.writeAsStringSync(document.toString());

          final rendered = document.toYaml();
          final renderedFile = File(p.setExtension(fixtureSpec.path, '.yaml'));
          renderedFile.writeAsStringSync(rendered);

          final documentJson =
              jsonDecode(fixtureSpecJson) as Map<String, Object?>;
          final renderedYaml = loadYaml(rendered);
          expect(renderedYaml, equals(deepEqualsMap(documentJson)));
        });
      });
    }
  });
}

// Copied from `package:yaml`

/// Returns a matcher that asserts that the value equals [expected].
///
/// This handles recursive loops and considers `NaN` to equal itself.
Matcher deepEquals(Object? expected) => predicate(
    (actual) => equality.deepEquals(actual, expected), 'equals $expected');

/// Constructs a new yaml.YamlMap, optionally from a normal Map.
Map<Object?, Object?> deepEqualsMap([Map<Object?, Object?>? from]) {
  final map = equality.deepEqualsMap<Object?, Object?>();
  if (from != null) map.addAll(from);
  return map;
}
