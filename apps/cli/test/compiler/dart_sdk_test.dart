import 'dart:io';

import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/src/context.dart' as ctx;
import 'package:file/chroot.dart';
import 'package:file/local.dart';
import 'package:platform/platform.dart';
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

import '../common.dart';

void main() {
  initTests();

  group('Sdk', () {
    group('current', () {
      test('homebrew', testOn: '!windows', () async {
        // Mimics the directory structure of a Homebrew-installed Dart SDK.
        final root = d.dir('opt', [
          d.dir('homebrew', [
            d.dir('bin', [
              link('dart', '/opt/homebrew/Cellar/dart/3.2.0/bin/dart'),
            ]),
            d.dir('Cellar', [
              d.dir('dart', [
                d.dir('3.2.0', [
                  d.dir('bin', [
                    link(
                      'dart',
                      '/opt/homebrew/Cellar/dart/3.2.0/libexec/bin/dart',
                    ),
                  ]),
                  d.dir('libexec', [
                    d.dir('bin', [
                      d.file('dart'),
                      d.dir('snapshots'),
                    ]),
                  ]),
                ]),
              ]),
            ]),
          ]),
        ]);
        await root.create();
        await root.validate();
        print(root.describe());

        const localPlatform = LocalPlatform();
        ctx.fileSystem = ChrootFileSystem(const LocalFileSystem(), d.sandbox);
        ctx.platform = FakePlatform(
          operatingSystem: localPlatform.operatingSystem,
          version: localPlatform.version,
          environment: {
            'PATH': '/opt/homebrew/bin',
          },
          // Fake the resolved exe since this is checked first and would
          // otherwise point to the Dart SDK running this test.
          resolvedExecutable: '/fake-dart',
        );

        // Make `dart` executable
        for (final target in [
          '/opt/homebrew/bin/dart',
          '/opt/homebrew/Cellar/dart/3.2.0/bin/dart',
          '/opt/homebrew/Cellar/dart/3.2.0/libexec/bin/dart',
        ]) {
          await Process.run('chmod', ['+x', '${d.sandbox}$target']);
        }

        expect(
          Sdk.current.sdkPath,
          '/opt/homebrew/Cellar/dart/3.2.0/libexec',
        );
      });
    });
  });
}

d.Descriptor link(String name, String target) => _LinkDescriptor(name, target);

final class _LinkDescriptor extends d.Descriptor {
  _LinkDescriptor(super.name, this.target);

  /// The sandbox-relative path to the target of the link.
  final String target;

  @override
  Future<void> create([String? parent]) async {
    final linkPath = p.join(parent ?? d.sandbox, name);
    await Link(linkPath).create(target);
  }

  @override
  String describe() => '$name -> $target';

  @override
  Future<void> validate([String? parent]) async {
    final linkPath = p.join(parent ?? d.sandbox, name);
    if (!await Link(linkPath).exists()) {
      fail('Link not found: "$linkPath".');
    }
    if (await Link(linkPath).target() != target) {
      fail('Link "$linkPath" does not point to "$target".');
    }
  }
}
