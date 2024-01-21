import 'package:celest_cli/src/context.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

import 'common.dart';

enum _Style {
  posix,
  windows;

  path.Context get context => switch (this) {
        _Style.posix => p.posix,
        _Style.windows => p.windows,
      };
}

void main() {
  group('paths', () {
    setUpAll(() async {
      await initTests();
      await init(projectRoot: d.sandbox);
    });

    for (final style in _Style.values) {
      group(style.name, () {
        final p = style.context;

        test('resolves project-relative paths', () {
          final projectRoot = projectPaths.projectRoot;
          final analysisOptions = projectPaths.analysisOptionsYaml;

          expect(
            p.relative(analysisOptions, from: projectRoot),
            equals('analysis_options.yaml'),
          );
        });
      });
    }
  });
}
