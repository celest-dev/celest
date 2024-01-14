// Below is modified from Dart SDK `package:dartdev`

import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:logging/logging.dart';
import 'package:process/process.dart';
import 'package:process/src/interface/common.dart';

/// A utility class for finding and referencing paths within the Dart SDK.
class Sdk {
  Sdk._(this.sdkPath, this.version);

  static final Sdk current = _createSingleton();

  /// Path to SDK directory.
  final String sdkPath;

  /// The SDK's semantic versioning version (x.y.z-a.b.channel).
  final String version;

  String get dart => p.join(sdkPath, 'bin', 'dart');

  String get dartAotRuntime => p.join(sdkPath, 'bin', 'dartaotruntime');

  String get analysisServerSnapshot => p.absolute(
        sdkPath,
        'bin',
        'snapshots',
        'analysis_server.dart.snapshot',
      );

  String get dart2jsSnapshot => p.absolute(
        sdkPath,
        'bin',
        'snapshots',
        'dart2js.dart.snapshot',
      );

  String get ddsSnapshot => p.absolute(
        sdkPath,
        'bin',
        'snapshots',
        'dds.dart.snapshot',
      );

  String get ddsAotSnapshot => p.absolute(
        sdkPath,
        'bin',
        'snapshots',
        'dds_aot.dart.snapshot',
      );

  String get frontendServerSnapshot => p.absolute(
        sdkPath,
        'bin',
        'snapshots',
        'frontend_server.dart.snapshot',
      );

  String get frontendServerAotSnapshot => p.absolute(
        sdkPath,
        'bin',
        'snapshots',
        'frontend_server_aot.dart.snapshot',
      );

  String get devToolsBinaries => p.absolute(
        sdkPath,
        'bin',
        'resources',
        'devtools',
      );

  String get vmPlatformDill => p.absolute(
        sdkPath,
        'lib',
        '_internal',
        'vm_platform_strong.dill',
      );

  /// Follows links when resolving an executable's [path].
  static String _resolveLinks(String path) {
    if (fileSystem.isLinkSync(path)) {
      return fileSystem.link(path).resolveSymbolicLinksSync();
    }
    return path;
  }

  static Sdk _createSingleton() {
    // Find SDK path.

    bool isValid(String sdkPath) =>
        fileSystem.isDirectorySync(p.join(sdkPath, 'bin', 'snapshots'));

    // The common case, and how cli_util.dart computes the Dart SDK directory,
    // [path.dirname] called twice on Platform.resolvedExecutable. We confirm by
    // asserting that the directory `./bin/snapshots/` exists in this directory:
    final resolvedExecutable = _resolveLinks(platform.resolvedExecutable);
    var sdkPath = p.absolute(p.dirname(p.dirname(resolvedExecutable)));
    _logger.finest(
      'Checking resolved executable: $resolvedExecutable -> $sdkPath',
    );
    if (!isValid(sdkPath)) {
      // If the common case fails, we try to find the SDK path by looking for
      // the `dart` executable in the PATH environment variable.
      String? dartPath;
      try {
        dartPath = getExecutablePath(
          'dart',
          fileSystem.currentDirectory.path,
          platform: platform,
          fs: fileSystem,
          throwOnFailure: true,
        );
      } on ProcessPackageExecutableNotFoundException catch (e) {
        _logger.finest('Could not find Dart SDK in PATH.', e);
      }
      if (dartPath == null) {
        throw Exception('Could not find Dart SDK.');
      }
      dartPath = _resolveLinks(dartPath);
      // `sdk/bin/dart` -> `sdk`
      sdkPath = p.dirname(p.dirname(dartPath));
      _logger.finest('Checking resolved PATH: $dartPath -> $sdkPath');
      if (!isValid(sdkPath)) {
        // Check if using Dart from Flutter SDK.
        // `flutter/bin/dart` -> `flutter/bin/cache/dart-sdk`
        sdkPath = p.join(p.dirname(dartPath), 'cache', 'dart-sdk');
        _logger.finest('Checking if Flutter: $dartPath -> $sdkPath');
        if (!isValid(sdkPath)) {
          throw Exception('Could not find Dart SDK.');
        }
      }
    }

    _logger.finest('Found Dart SDK: $sdkPath');

    // Defer to [Runtime] for the version.
    final version = Runtime.current.version;

    return Sdk._(sdkPath, version);
  }

  static final _logger = Logger('Sdk');
}

/// Information about the current runtime.
class Runtime {
  Runtime._(this.version, this.channel);

  static Runtime current = _createSingleton();

  /// The SDK's semantic versioning version (x.y.z-a.b.channel).
  final String version;

  /// The SDK's release channel (`be`, `dev`, `beta`, `stable`).
  ///
  /// May be null if [Platform.version] does not have the expected format.
  final String? channel;

  static Runtime _createSingleton() {
    final versionString = platform.version;
    // Expected format: "version (channel) ..."
    var version = versionString;
    String? channel;
    final versionEnd = versionString.indexOf(' ');
    if (versionEnd > 0) {
      version = versionString.substring(0, versionEnd);
      var channelEnd = versionString.indexOf(' ', versionEnd + 1);
      if (channelEnd < 0) channelEnd = versionString.length;
      if (versionString.startsWith('(', versionEnd + 1) &&
          versionString.startsWith(')', channelEnd - 1)) {
        channel = versionString.substring(versionEnd + 2, channelEnd - 1);
      }
    }
    return Runtime._(version, channel);
  }
}
