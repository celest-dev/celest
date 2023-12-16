// Below is copied from Dart SDK `package:dartdev`

import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';

/// A utility class for finding and referencing paths within the Dart SDK.
class Sdk {
  Sdk._(this.sdkPath, this.version);

  static final Sdk current = _createSingleton();

  /// Path to SDK directory.
  final String sdkPath;

  /// The SDK's semantic versioning version (x.y.z-a.b.channel).
  final String version;

  // Assume that we want to use the same Dart executable that we used to spawn
  // DartDev. We should be able to run programs with out/ReleaseX64/dart even
  // if the SDK isn't completely built.
  String get dart => Platform.resolvedExecutable;

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

  static Sdk _createSingleton() {
    // Find SDK path.

    // The common case, and how cli_util.dart computes the Dart SDK directory,
    // [path.dirname] called twice on Platform.resolvedExecutable. We confirm by
    // asserting that the directory `./bin/snapshots/` exists in this directory:
    final sdkPath =
        p.absolute(p.dirname(p.dirname(Platform.resolvedExecutable)));
    final snapshotsDir = p.join(sdkPath, 'bin', 'snapshots');
    if (!Directory(snapshotsDir).existsSync()) {
      // Otherwise, running in AOT mode, likely.
      TODO();
    }

    // Defer to [Runtime] for the version.
    final version = Runtime.current.version;

    return Sdk._(sdkPath, version);
  }
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
    final versionString = Platform.version;
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
