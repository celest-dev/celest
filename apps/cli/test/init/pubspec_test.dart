import 'package:celest_cli/src/pub/pubspec.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('PubspecToYaml', () {
    setUpAll(initTests);

    test('formats correctly', () {
      final pubspec = Pubspec(
        'hello',
        description: 'Test description',
        publishTo: 'none',
        environment: {'sdk': VersionConstraint.parse('^3.2.0')},
        dependencies: {
          'celest': HostedDependency(version: VersionConstraint.parse('0.1.0')),
        },
        devDependencies: {
          'test': HostedDependency(version: VersionConstraint.parse('0.1.0')),
        },
      );

      expect(
        pubspec.toYaml(),
        equalsIgnoringWhitespace('''
name: hello
description: Test description
publish_to: none

environment:
  sdk: ^3.2.0

dependencies:
  celest: 0.1.0

dev_dependencies:
  test: 0.1.0
'''),
      );
    });
  });
}
