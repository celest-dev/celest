import 'package:celest_cli/src/codegen/allocator.dart';
import 'package:celest_cli/src/project/project_paths.dart';
import 'package:code_builder/code_builder.dart';
import 'package:test/test.dart';

void main() {
  group('CelestAllocator', () {
    test('de-dups import prefixes', () async {
      // Only applies in pretty mode.
      const prefixingStrategy = PrefixingStrategy.pretty;

      // These should all get unique import prefixes.
      final uris = [
        Uri.parse('package:package_1/a.dart'),
        Uri.parse('package:package_2/a.dart'),
        Uri.parse('package:package_3/a.dart'),
      ];

      final allocator = CelestAllocator(
        forFile: '/test.dart',
        pathStrategy: PathStrategy.pretty,
        prefixingStrategy: prefixingStrategy,
        packageName: 'celest_backend',
        clientPackageName: 'test_client',
        projectPaths: ProjectPaths('/'),
      );
      for (final uri in uris) {
        allocator.allocate(refer('A', uri.toString()));
      }

      expect(allocator.imports, hasLength(3));
      expect(
        allocator.importMap,
        equals({
          'package:package_1/a.dart': r'_$package_1_a',
          'package:package_2/a.dart': r'_$package_2_a',
          'package:package_3/a.dart': r'_$package_3_a',
        }),
      );
    });
  });
}
