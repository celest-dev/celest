import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/src/context.dart' show cliLogger, storage;
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:dcli/dcli.dart' as dcli;
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:platform/platform.dart';
import 'package:process/process.dart';
// ignore: implementation_imports
import 'package:process/src/interface/common.dart';
import 'package:pub_semver/pub_semver.dart';

abstract interface class SdkFinder {
  const SdkFinder();

  Future<SdkFinderResult> findSdk();
}

sealed class SdkFinderResult {
  const SdkFinderResult();

  Sdk? get sdk => null;
}

final class SdkFound extends SdkFinderResult {
  SdkFound(this.sdk);

  @override
  final Sdk sdk;

  @override
  String toString() => 'Found SDK: $sdk';
}

final class SdkNotFound extends SdkFinderResult {
  const SdkNotFound({this.searchPath = const [], this.candidates = const []});

  final List<String> searchPath;
  final List<String> candidates;

  @override
  String toString() {
    final buffer = StringBuffer('Could not find SDK');
    if (candidates.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln(' candidates:');
      for (final candidate in candidates) {
        buffer.writeln('  - $candidate');
      }
    }
    if (searchPath.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln(' search path:');
      for (final path in searchPath) {
        buffer.writeln('  - $path');
      }
    }
    return buffer.toString();
  }
}

final class DartSdkFinder implements SdkFinder {
  const DartSdkFinder({
    this.platform = const LocalPlatform(),
    this.fileSystem = const LocalFileSystem(),
    this.projectRoot,
  });

  static final Logger _logger = Logger('Sdk');

  /// Follows links when resolving an executable's [path].
  String _resolveLinks(String path) {
    if (fileSystem.isLinkSync(path)) {
      return p.canonicalize(fileSystem.link(path).resolveSymbolicLinksSync());
    }
    return p.canonicalize(path);
  }

  bool isValid(String sdkPath) =>
      fileSystem.isDirectorySync(p.join(sdkPath, 'bin', 'snapshots'));

  Future<Sdk> _found(SdkType type, String sdkPath) async {
    final factory = type == SdkType.flutter ? Sdk.flutter : Sdk.dart;
    late Version version;

    // Check for new Flutter version JSON and old Flutter `version` file /
    // current Dart `version` file
    //
    // Flutter: https://github.com/flutter/flutter/issues/171900
    final versionFile = fileSystem
        .directory(sdkPath)
        .childDirectory('bin')
        .childDirectory('cache')
        .childFile('flutter.version.json');
    if (versionFile.existsSync()) {
      final versionJson = await versionFile.readAsString();
      final versionData = jsonDecode(versionJson) as Map<String, dynamic>;
      version = Version.parse(versionData['flutterVersion'] as String);
    } else {
      final versionFile = fileSystem.directory(sdkPath).childFile('version');
      if (!versionFile.existsSync()) {
        throw StateError(
          'Could not find Dart SDK version file at ${versionFile.path}.',
        );
      }
      final versionStr = await versionFile.readAsString();
      version = Version.parse(versionStr.trim());
    }

    return factory(sdkPath, version: version, fileSystem: fileSystem);
  }

  final Platform platform;
  final FileSystem fileSystem;
  final String? projectRoot;

  Future<SdkFinderResult> _findFlutterExe() async {
    late String flutterPath;
    try {
      flutterPath = getExecutablePath(
        'flutter',
        fileSystem.currentDirectory.path,
        platform: platform,
        fs: fileSystem,
        throwOnFailure: true,
      )!; // never null when `throwOnFailure: true`
    } on ProcessPackageExecutableNotFoundException catch (e) {
      _logger.finest('Could not find Flutter SDK in PATH.', e);
      return SdkNotFound(searchPath: e.searchPath, candidates: e.candidates);
    }

    final searchPath = <String>[];
    final candidates = <String>[];

    candidates.add(flutterPath);
    flutterPath = _resolveLinks(flutterPath);
    candidates.add(flutterPath);
    final sdkPath = p.canonicalize(
      p.join(p.dirname(flutterPath), 'cache', 'dart-sdk'),
    );

    searchPath.add(sdkPath);
    _logger.finest('Checking if Flutter: $flutterPath -> $sdkPath');
    if (isValid(sdkPath)) {
      final flutterSdkPath = p.canonicalize(p.dirname(p.dirname(flutterPath)));
      return SdkFound(await _found(SdkType.flutter, flutterSdkPath));
    }

    return SdkNotFound(searchPath: searchPath, candidates: candidates);
  }

  Future<SdkFinderResult> _findDartExe() async {
    late String dartPath;
    try {
      dartPath = getExecutablePath(
        'dart',
        fileSystem.currentDirectory.path,
        platform: platform,
        fs: fileSystem,
        throwOnFailure: true,
      )!; // never null when `throwOnFailure: true`
    } on ProcessPackageExecutableNotFoundException catch (e) {
      _logger.finest('Could not find Dart SDK in PATH.', e);
      return SdkNotFound(searchPath: e.searchPath, candidates: e.candidates);
    }

    final searchPath = <String>[];
    final candidates = <String>[];

    dartPath = _resolveLinks(dartPath);
    candidates.add(dartPath);
    var sdkPath = switch (p.basename(dartPath)) {
      // `dart` and `flutter` are aliased to /usr/bin/snap on Ubuntu snap installation.
      // See `/snap/flutter/current/env.sh`
      'snap' => p.join(
        platform.environment['HOME']!,
        'snap',
        'flutter',
        'common',
        'flutter',
        'bin',
        'cache',
        'dart-sdk',
      ),
      // `sdk/bin/dart` -> `sdk`
      _ => p.dirname(p.dirname(dartPath)),
    };
    searchPath.add(sdkPath);

    _logger.finest('Checking if Dart: $dartPath -> $sdkPath');
    if (isValid(sdkPath)) {
      return SdkFound(await _found(SdkType.dart, sdkPath));
    }

    // Check if using Dart from Flutter SDK.
    // `flutter/bin/dart` -> `flutter/bin/cache/dart-sdk`
    sdkPath = p.join(p.dirname(dartPath), 'cache', 'dart-sdk');
    searchPath.add(sdkPath);

    _logger.finest('Checking if Flutter: $dartPath -> $sdkPath');
    if (isValid(sdkPath)) {
      final flutterSdkPath = p.dirname(p.dirname(dartPath));
      return SdkFound(await _found(SdkType.flutter, flutterSdkPath));
    }

    return SdkNotFound(searchPath: searchPath, candidates: candidates);
  }

  @override
  Future<SdkFound> findSdk() async {
    // Check for existing Flutter SDK preference.
    if (storage.read('sdk.flutter.preferred')
        case final preferredFlutterPath?) {
      // Ensure the preferred path is still valid.
      final sdkPath = p.join(preferredFlutterPath, 'bin', 'cache', 'dart-sdk');
      if (isValid(sdkPath)) {
        return SdkFound(await _found(SdkType.flutter, preferredFlutterPath));
      } else {
        _logger.finest(
          'Invalid preferred Flutter SDK path: $preferredFlutterPath',
        );
        // Otherwise, clear the preference.
        storage.delete('sdk.flutter.preferred');
        storage.delete('sdk.dart.preferred');
      }
    }

    // Do the same check for Dart
    if (storage.read('sdk.dart.preferred') case final preferredDartPath?) {
      if (isValid(preferredDartPath)) {
        return SdkFound(await _found(SdkType.dart, preferredDartPath));
      } else {
        _logger.finest('Invalid preferred Dart SDK path: $preferredDartPath');
        storage.delete('sdk.dart.preferred');
      }
    }

    // Check for FVM configuration.
    if (projectRoot != null) {
      final fvmRcFile = fileSystem.directory(projectRoot).childFile('.fvmrc');
      if (fvmRcFile.existsSync()) {
        final fvmRc = jsonDecode(await fvmRcFile.readAsString());
        if (fvmRc case {'flutter': final String flutterVersion}) {
          final fvmPath = _resolveLinks(
            p.join(projectRoot!, '.fvm', 'versions', flutterVersion),
          );
          if (fileSystem.isDirectorySync(fvmPath)) {
            return SdkFound(await _found(SdkType.flutter, fvmPath));
          }
        }
      }
    }

    final fullSearchPath = <String>[];
    final allCandidates = <String>[];

    // Start by looking for the Flutter SDK.
    //
    // If we find it, we'll have found the Dart SDK as well.
    try {
      final flutterExeResult = await _findFlutterExe();
      switch (flutterExeResult) {
        case SdkFound():
          return flutterExeResult;
        case SdkNotFound(:final searchPath, :final candidates):
          fullSearchPath.addAll(searchPath);
          allCandidates.addAll(candidates);
      }
    } on Object catch (e, st) {
      _logger.finest('Unexpected error searching for Flutter SDK', e, st);
    }

    // The common case, and how cli_util.dart computes the Dart SDK directory,
    // [path.dirname] called twice on Platform.resolvedExecutable. We confirm by
    // asserting that the directory `./bin/snapshots/` exists in this directory:
    final resolvedExecutable = _resolveLinks(platform.resolvedExecutable);

    final sdkPath = p.dirname(p.dirname(resolvedExecutable));
    _logger.finest(
      'Checking resolved executable: $resolvedExecutable -> $sdkPath',
    );
    if (isValid(sdkPath)) {
      return SdkFound(await _found(SdkType.dart, sdkPath));
    }

    // If the common case fails, we try to find the SDK path by looking for
    // the `dart` executable in the PATH environment variable.
    try {
      final dartExeResult = await _findDartExe();
      switch (dartExeResult) {
        case SdkFound():
          return dartExeResult;
        case SdkNotFound(:final searchPath, :final candidates):
          fullSearchPath.addAll(searchPath);
          allCandidates.addAll(candidates);
      }
    } on Object catch (e, st) {
      _logger.finest('Unexpected error searching for Dart SDK', e, st);
    }

    // If we get here, we couldn't find the SDK.
    //
    // Prompt the user as a last resort.
    _logger.finest(
      'Could not find the Flutter or Dart SDK.',
      SdkNotFound(searchPath: fullSearchPath, candidates: allCandidates),
    );
    cliLogger.err('Could not find the Flutter SDK.');
    final alreadyInstalled = dcli.confirm(
      'Have you installed it already?',
      defaultValue: true,
    );
    if (alreadyInstalled) {
      final homeDir = platform.environment['HOME'];
      String? flutterSdkPath;
      while (flutterSdkPath == null) {
        flutterSdkPath = dcli.ask('Please enter the path to the Flutter SDK:');
        if (flutterSdkPath.startsWith('~/')) {
          flutterSdkPath = p.join(homeDir!, flutterSdkPath.substring(2));
        }
        flutterSdkPath = p.canonicalize(flutterSdkPath);
        final sdkPath = p.join(flutterSdkPath, 'bin', 'cache', 'dart-sdk');
        if (!isValid(sdkPath)) {
          cliLogger.err('Invalid Flutter SDK path: $flutterSdkPath');
          flutterSdkPath = null;
          continue;
        }
        final sdk = await _found(SdkType.flutter, flutterSdkPath);

        // Save the preference for later so we don't need to prompt again.
        storage.write('sdk.flutter.preferred', flutterSdkPath);
        storage.write('sdk.dart.preferred', sdkPath);
        return SdkFound(sdk);
      }
    }

    // TODO(dnys1): Consider installing it for them.
    cliLogger.warn('Please install the Flutter SDK before continuing.');
    cliLogger.info('https://flutter.dev/docs/get-started/install');
    await Future(() => exit(1));
  }
}
