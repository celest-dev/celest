import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/pub/project_dependency.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/utils/cli.dart';
import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:yaml_edit/yaml_edit.dart';

/// Pub cache utilities
final pubCache = PubCache();

final class PubCache {
  static final packagesToFix = {
    // This is the only syntax that reliably works with both dart/flutter
    'native_storage': '>=0.2.2 <1.0.0',
    'native_authentication': '>=0.1.0 <1.0.0',
    'jni': '>=0.11.0 <1.0.0',
    'celest_auth': '>=$currentMinorVersion <2.0.0',
    'celest': '>=$currentMinorVersion <2.0.0',
    'celest_core': '>=$currentMinorVersion <2.0.0',
    'objective_c': '>=2.0.0 <8.0.0',
  };
  static final _logger = Logger('PubCache');

  String? _cachePath;

  // Adapted from `package:pub/src/system_cache.dart`
  String? findCachePath() {
    if (platform.environment['PUB_CACHE'] case final cacheDir?) {
      return p.absolute(cacheDir);
    }
    if (platform.isWindows) {
      // %LOCALAPPDATA% is used as the cache location over %APPDATA%, because
      // the latter is synchronised between devices when the user roams between
      // them, whereas the former is not.
      final localAppData = platform.environment['LOCALAPPDATA'];
      if (localAppData == null) {
        _logger.finest(
          'Could not find the pub cache. No `LOCALAPPDATA` environment variable exists.',
        );
        return null;
      }
      return p.join(localAppData, 'Pub', 'Cache');
    }
    final home = platform.environment['HOME'];
    if (home == null) {
      _logger.finest(
        'Could not find the pub cache. No `HOME` environment variable exists.',
      );
      return null;
    }
    return p.join(home, '.pub-cache');
  }

  String? latestVersionPath(String packageName) {
    final cachePath = _cachePath ??= findCachePath();
    if (cachePath == null) {
      return null;
    }
    final packageDir = localFileSystem
        .directory(cachePath)
        .childDirectory('hosted')
        .childDirectory('pub.dev');
    if (!packageDir.existsSync()) {
      return null;
    }
    final packageVersions = packageDir.listSync().whereType<Directory>();
    final allVersions = <Version>[];
    for (final packageVersion in packageVersions) {
      final basename = p.basename(packageVersion.path);
      if (!basename.startsWith(packageName)) {
        continue;
      }
      final versionString = basename.substring(packageName.length + 1 /* - */);
      allVersions.add(Version.parse(versionString));
    }
    if (allVersions.isEmpty) {
      return null;
    }
    final latestVersion = maxBy(allVersions, (v) => v)!;
    final path = p.join(
      packageDir.path,
      '$packageName-${latestVersion.canonicalizedVersion}',
    );
    return '$path/'; // Ensure it ends with a slash
  }

  /// Runs `pub cache add` for each package in [packagesToFix].
  ///
  /// Returns the exit codes and output for each package.
  Future<List<(int, String)>> hydrate() async {
    final results = <(int, String)>[];
    for (final package in packagesToFix.entries) {
      // Run serially to avoid flutter lock
      final result = await processManager
          .start(runInShell: true, [
            Sdk.current.sdkType.name,
            'pub',
            'cache',
            'add',
            package.key,
            '--version',
            package.value,
            '--all',
          ])
          .then((process) async {
            final combinedOutput = StringBuffer();
            process.captureStdout(
              sink: (line) {
                _logger.finest(line);
                combinedOutput.writeln(line);
              },
            );
            process.captureStderr(
              sink: (line) {
                _logger.finest(line);
                combinedOutput.writeln(line);
              },
            );
            return (await process.exitCode, combinedOutput.toString());
          });
      results.add(result);
    }
    return results;
  }

  /// Fixes the pubspec for each package in [packagesToFix].
  ///
  /// Returns the number of packages fixed.
  Future<int> fix({@visibleForTesting bool throwOnError = false}) async {
    final cachePath = _cachePath ??= findCachePath();
    if (cachePath == null) {
      if (throwOnError) {
        throw Exception('Could not find the pub cache.');
      }
      _logger.finest('No pub cache found. Skipping fix.');
      return 0;
    }
    _logger.finest('Pub cache found at $cachePath');
    final cacheDir = localFileSystem.directory(cachePath);
    if (!cacheDir.existsSync()) {
      if (throwOnError) {
        throw Exception('No pub cache found at $cachePath.');
      }
      _logger.finest('No pub cache found at $cachePath. Skipping fix.');
      return 0;
    }
    final hostedPubDevDir = cacheDir
        .childDirectory('hosted')
        .childDirectory('pub.dev');
    if (!hostedPubDevDir.existsSync()) {
      if (throwOnError) {
        throw Exception('No pub cache found at ${hostedPubDevDir.path}.');
      }
      _logger.finest(
        'No pub cache found at ${hostedPubDevDir.path}. '
        'Skipping fix.',
      );
      return 0;
    }
    var fixed = 0;
    await for (final packageDir
        in hostedPubDevDir.list().whereType<Directory>()) {
      var fixPackage = false;
      for (final packageToFix in packagesToFix.keys) {
        if (p.basename(packageDir.path).startsWith('$packageToFix-')) {
          fixPackage = true;
          break;
        }
      }
      if (!fixPackage) {
        continue;
      }
      final pubspecFile = packageDir.childFile('pubspec.yaml');
      if (!pubspecFile.existsSync()) {
        if (throwOnError) {
          throw Exception('No pubspec found in ${packageDir.path}.');
        }
        _logger.finest('No pubspec found in ${packageDir.path}. Skipping fix.');
        continue;
      }
      final pubspecYaml = await pubspecFile.readAsString();
      final pubspec = Pubspec.parse(pubspecYaml);
      if (!packagesToFix.containsKey(pubspec.name)) {
        if (throwOnError) {
          throw Exception('Pubspec for ${pubspec.name} does not need fixing.');
        }
        continue;
      }
      final needsEnvFix = pubspec.environment.containsKey('flutter');
      final needsDepsFix = pubspec.dependencies.containsKey('flutter');
      if (!needsEnvFix && !needsDepsFix) {
        continue;
      }
      final editor = YamlEditor(pubspecYaml);
      if (needsEnvFix) {
        editor.remove(['environment', 'flutter']);
      }
      if (needsDepsFix) {
        editor.remove(['dependencies', 'flutter']);
      }
      await pubspecFile.writeAsString(editor.toString());
      _logger.finest('Fixed pubspec for ${pubspec.name} in ${packageDir.path}');
      fixed++;
    }
    return fixed;
  }

  @visibleForTesting
  Future<ProcessResult> repair() async {
    return processManager.run([Sdk.current.dart, 'pub', 'cache', 'repair']);
  }
}
