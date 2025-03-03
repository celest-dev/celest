// ignore_for_file: avoid_print

import 'dart:io';

import 'package:celest_cli/src/context.dart' as ctx;
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:file/chroot.dart';
import 'package:file/local.dart';
import 'package:logging/logging.dart';
import 'package:platform/platform.dart';
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.message}');
  });

  group('Sdk', () {
    group('Flutter', () {
      test('homebrew', testOn: '!windows', () async {
        // Mimics the directory structure of a Homebrew-installed Flutter SDK.
        final root = d.dir('opt', [
          d.dir('homebrew', [
            d.dir('bin', [
              link(
                'flutter',
                '/opt/homebrew/Caskroom/flutter/3.22.2/flutter/bin/flutter',
              ),
            ]),
            d.dir('Caskroom', [
              d.dir('flutter', [
                d.dir('3.22.2', [
                  d.dir('flutter', [
                    d.dir('bin', [
                      d.file('flutter'),
                      d.dir('cache', [
                        d.dir('dart-sdk', [
                          d.dir('bin', [d.file('dart'), d.dir('snapshots')]),
                        ]),
                      ]),
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
          environment: {'PATH': '/opt/homebrew/bin'},
          // Fake the resolved exe since this is checked first and would
          // otherwise point to the Dart SDK running this test.
          resolvedExecutable: '/fake-dart',
        );

        // Make `flutter` executable
        for (final target in [
          '/opt/homebrew/bin/flutter',
          '/opt/homebrew/Caskroom/flutter/3.22.2/flutter/bin/flutter',
        ]) {
          await Process.run('chmod', ['+x', '${d.sandbox}$target']);
        }

        expect(
          Sdk.load().sdkPath,
          '/opt/homebrew/Caskroom/flutter/3.22.2/flutter/bin/cache/dart-sdk',
        );
      });
    });

    group('Dart', () {
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
                    d.dir('bin', [d.file('dart'), d.dir('snapshots')]),
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
          environment: {'PATH': '/opt/homebrew/bin'},
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

        expect(Sdk.load().sdkPath, '/opt/homebrew/Cellar/dart/3.2.0/libexec');
      });

      test('snap', testOn: '!windows', () async {
        // Mimics the directory structure of a Snap-installed Dart SDK.
        final usr = d.dir('usr', [
          d.dir('bin', [d.file('snap')]),
        ]);
        await usr.create();
        await usr.validate();

        final snap = d.dir('snap', [
          d.dir('bin', [
            link('flutter.dart', '/usr/bin/snap'),
            link('dart', '/snap/bin/flutter.dart'),
          ]),
        ]);
        await snap.create();
        await snap.validate();

        final home = d.dir('home', [
          d.dir('user', [
            d.dir('snap', [
              d.dir('flutter', [
                d.dir('common', [
                  d.dir('flutter', [
                    d.dir('bin', [
                      d.file('dart'),
                      d.dir('cache', [
                        d.dir('dart-sdk', [
                          d.dir('bin', [d.file('dart'), d.dir('snapshots')]),
                        ]),
                      ]),
                    ]),
                  ]),
                ]),
              ]),
            ]),
          ]),
        ]);
        await home.create();
        await home.validate();

        const localPlatform = LocalPlatform();
        ctx.fileSystem = ChrootFileSystem(const LocalFileSystem(), d.sandbox);
        ctx.platform = FakePlatform(
          operatingSystem: localPlatform.operatingSystem,
          version: localPlatform.version,
          environment: {'PATH': '/usr/bin:/snap/bin', 'HOME': '/home/user'},
          // Fake the resolved exe since this is checked first and would
          // otherwise point to the Dart SDK running this test.
          resolvedExecutable: '/fake-dart',
        );

        // Make `dart` executable
        for (final target in [
          '/usr/bin/snap',
          '/home/user/snap/flutter/common/flutter/bin/dart',
          '/home/user/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/dart',
        ]) {
          await Process.run('chmod', ['+x', '${d.sandbox}$target']);
        }

        expect(
          Sdk.load().sdkPath,
          '/home/user/snap/flutter/common/flutter/bin/cache/dart-sdk',
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
