import 'dart:async';
import 'dart:convert';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_migration.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:stream_transform/stream_transform.dart';

/// Updates the macOS entitlements plist to include the network client
/// capability.
final class MacOsEntitlements extends ProjectMigration {
  const MacOsEntitlements(super.projectRoot, this.appRoot);

  final String appRoot;

  static final _logger = Logger('MacOsEntitlements');

  @override
  String get name => 'core.flutter.macos_entitlements';

  @override
  bool get needsMigration =>
      platform.isMacOS &&
      fileSystem.directory(appRoot).childDirectory('macos').existsSync();

  @override
  Future<ProjectMigrationResult> create() async {
    if (!platform.isMacOS) {
      return const ProjectMigrationSkipped();
    }
    final macosDir = fileSystem.directory(appRoot).childDirectory('macos');
    if (!macosDir.existsSync()) {
      _logger.finest('No macos directory. Skipping entitlements update.');
      return const ProjectMigrationSkipped();
    }
    final entitlementFiles = await macosDir
        .list()
        .whereType<Directory>()
        .asyncExpand(
          (dir) => dir.list().whereType<File>().where(
                (file) => p.extension(file.path) == '.entitlements',
              ),
        )
        .toList();

    _logger.finest(() {
      final entitlementFileNames = entitlementFiles
          .map((e) => p.relative(e.path, from: macosDir.path))
          .join(', ');
      return 'Found ${entitlementFiles.length} entitlements files: '
          '$entitlementFileNames';
    });
    for (final entitlements in entitlementFiles) {
      _logger.fine('Updating entitlements file at ${entitlements.path}...');
      final add = await processManager.run(
        [
          '/usr/libexec/PlistBuddy',
          '-c',
          'Add :com.apple.security.network.client bool true',
          entitlements.path,
        ],
        stdoutEncoding: utf8,
        stderrEncoding: utf8,
      );
      if (add.exitCode != 0) {
        if (add.stderr.toString().contains('Entry Already Exists')) {
          _logger.fine('Network client entitlement already exists.');
        } else {
          performance.captureError(
            'Failed to add network client entitlement to ${entitlements.path}: '
            '${add.stdout}\n${add.stderr}',
          );
        }
        continue;
      }
    }
    return const ProjectMigrationSuccess();
  }
}
