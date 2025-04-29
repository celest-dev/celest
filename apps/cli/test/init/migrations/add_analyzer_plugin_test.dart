import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/migrations/add_analyzer_plugin.dart';
import 'package:celest_cli/src/sdk/versions.dart';
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;
import 'package:yaml/yaml.dart';

void main() {
  Future<void> testMigration({
    required String? analysisOptionsContent,
    required bool needsMigration,
    required bool addsPlugin,
  }) async {
    final app = d.dir('app', [
      d.file('pubspec.yaml', '''
name: app

environment:
  sdk: ^$minSupportedDartSdk
  flutter: ">=$minSupportedFlutterSdk"

dependencies:
  flutter:
    sdk: flutter
'''),
      if (analysisOptionsContent != null)
        d.file('analysis_options.yaml', analysisOptionsContent),
      d.dir('celest', [
        d.file('pubspec.yaml', '''
name: celest_backend
'''),
      ]),
    ]);
    await app.create();

    final migration = AddAnalyzerPlugin(d.path('app/celest'), d.path('app'));
    expect(migration.needsMigration, needsMigration);

    if (needsMigration) {
      await migration.create();
    }

    final analysisOptions = fileSystem.file(
      d.path('app/analysis_options.yaml'),
    );
    expect(analysisOptions.existsSync(), isTrue);
    final yaml = loadYaml(analysisOptions.readAsStringSync()) as YamlMap;
    expect(
      yaml,
      isA<YamlMap>().having(
        (e) => e['analyzer'],
        'analyzer',
        isA<YamlMap>().having(
          (e) => e['plugins'],
          'plugins',
          isA<YamlList>().having(
            (e) => e.value,
            'plugins values',
            addsPlugin ? contains('celest') : isNot(contains('celest')),
          ),
        ),
      ),
    );
  }

  group('AddAnalyzerPlugin', () {
    test('no analysis_options.yaml', () async {
      await testMigration(
        analysisOptionsContent: null,
        needsMigration: true,
        addsPlugin: true,
      );
    });

    test('empty analysis_options.yaml', () async {
      await testMigration(
        analysisOptionsContent: '',
        needsMigration: true,
        addsPlugin: true,
      );
    });

    test('no plugins section', () async {
      await testMigration(
        analysisOptionsContent: '''
analyzer:
  errors:
    avoid_print: ignore
''',
        needsMigration: true,
        addsPlugin: true,
      );
    });

    test('no celest plugin', () async {
      await testMigration(
        analysisOptionsContent: '''
analyzer:
  plugins:
    - some_other_plugin
  errors:
    avoid_print: ignore
''',
        needsMigration: true,
        // Shouldn't replace existing plugin as the current plugin system
        // allows only one plugin to be listed.
        addsPlugin: false,
      );
    });

    test('celest plugin already present', () async {
      await testMigration(
        analysisOptionsContent: '''
analyzer:
  plugins:
    - celest
    - some_other_plugin
  errors:
    avoid_print: ignore
''',
        needsMigration: false,
        addsPlugin: true,
      );
    });
  });
}
