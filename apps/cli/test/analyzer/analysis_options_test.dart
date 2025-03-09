import 'package:celest_cli/analyzer/analysis_options.dart';
import 'package:celest_cli/src/context.dart';
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

import '../common.dart';

String get path => p.join(d.sandbox, 'analysis_options.yaml');

void main() {
  group('AnalysisOptions', () {
    setUpAll(initTests);

    group('load', () {
      test('enabled experiments', () async {
        await d.file('analysis_options.yaml', '''
analyzer:
  enable-experiment:
    - inline-class
''').create();

        final analysisOptions = await AnalysisOptions.load(path);
        expect(analysisOptions.enabledExperiments, ['inline-class']);
      });

      test('gracefully handles invalid analysis options', () async {
        await d.file('analysis_options.yaml', '''
analyzer:
  enable-experiment: inline-class
''').create();

        final analysisOptions = await AnalysisOptions.load(path);
        expect(analysisOptions.enabledExperiments, const <String>[]);
      });
    });
  });
}
