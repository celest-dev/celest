import 'package:celest_cli/src/utils/cli.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:yaml_edit/yaml_edit.dart';

/// Pub cache utilities
final pubCache = _PubCache();

final class _PubCache {
  static const packagesToFix = {'native_storage': '^0.1.0', 'jni': '>=0.8.0'};
  static final _logger = Logger('PubCache');

  String? _cachePath;

  // Adapted from `package:pub/src/system_cache.dart`
  String? _findCachePath() {
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

  Future<void> hydate() async {
    for (final package in packagesToFix.entries) {
      // Run serially to avoid flutter lock
      await processManager.start([
        Sdk.current.sdkType.name,
        'pub',
        'cache',
        'add',
        package.key,
        '--version',
        package.value,
        '--all',
      ]).then((process) {
        process.captureStdout(sink: _logger.finest);
        process.captureStderr(sink: _logger.finest);
        return process.exitCode;
      });
    }
  }

  Future<void> fix() async {
    final cachePath = _cachePath ??= _findCachePath();
    if (cachePath == null) {
      _logger.finest('No pub cache found. Skipping fix.');
      return;
    }
    _logger.finest('Pub cache found at $cachePath');
    final cacheDir = fileSystem.directory(cachePath);
    if (!cacheDir.existsSync()) {
      _logger.finest('No pub cache found at $cachePath. Skipping fix.');
      return;
    }
    final hostedPubDevDir =
        cacheDir.childDirectory('hosted').childDirectory('pub.dev');
    if (!hostedPubDevDir.existsSync()) {
      _logger.finest(
        'No pub cache found at ${hostedPubDevDir.path}. ' 'Skipping fix.',
      );
      return;
    }
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
        continue;
      }
      final pubspecYaml = await pubspecFile.readAsString();
      final pubspec = Pubspec.parse(pubspecYaml);
      if (!packagesToFix.containsKey(pubspec.name)) {
        continue;
      }
      final needsFix = pubspec.environment?.containsKey('flutter') ?? false;
      if (!needsFix) {
        continue;
      }
      final editor = YamlEditor(pubspecYaml);
      editor.remove(['environment', 'flutter']);
      await pubspecFile.writeAsString(editor.toString());
      _logger.finest('Fixed pubspec for ${pubspec.name} in ${packageDir.path}');
    }
  }
}
