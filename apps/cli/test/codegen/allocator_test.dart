import 'package:celest_cli/codegen/allocator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:test/test.dart';

void main() {
  group('CelestAllocator', () {
    group('Windows', testOn: 'windows', () {
      // When the temp dir (generated outputs) is on a separate drive from the source project,
      // ensure that paths are absolute and not relative since there is no way to express a
      // relative path between drives.
      test('separate drives', () {
        final reference = refer(
          'sayHello',
          r'D:\workspace\celest_example\celest\functions\greeting.dart',
        );
        const generatingForPath =
            r'C:\Users\celest\AppData\Local\Temp\af0ceaa9\functions\greeting\sayHello.dart';
        final allocator = CelestAllocator(
          forFile: generatingForPath,
          pathStrategy: PathStrategy.robust,
          prefixingStrategy: PrefixingStrategy.pretty,
        );
        final symbol = allocator.allocate(reference);
        expect(symbol, r'_$greeting.sayHello');
        expect(
          allocator.imports.single,
          isA<Directive>().having(
            (d) => d.url,
            'url',
            'file:///D:/workspace/celest_example/celest/functions/greeting.dart',
          ),
        );
      });
    });

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
