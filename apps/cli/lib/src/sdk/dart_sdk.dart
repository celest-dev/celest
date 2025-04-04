// Below is modified from Dart SDK `package:dartdev`

import 'dart:ffi';
import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:pub_semver/pub_semver.dart';

export 'package:celest_ast/celest_ast.dart' show SdkType;

/// A utility class for finding and referencing paths within the Dart SDK.
class Sdk {
  factory Sdk(String sdkRoot, {required SdkType sdkType, Version? version}) =>
      switch (sdkType) {
        SdkType.dart => Sdk.dart(sdkRoot, version: version),
        SdkType.flutter => Sdk.flutter(sdkRoot, version: version),
        _ => throw ArgumentError.value(sdkType, 'sdkType'),
      };

  Sdk._({
    required this.sdkPath,
    this.flutterSdkRoot,
    Version? version,
    Version? flutterVersion,
    FileSystem? fileSystem,
  })  : sdkType = flutterSdkRoot == null ? SdkType.dart : SdkType.flutter,
        _version = version,
        _flutterVersion = flutterVersion,
        _fileSystem = fileSystem ?? const LocalFileSystem();

  Sdk.flutter(String sdkRoot, {Version? version, FileSystem? fileSystem})
      : this._(
          sdkPath: p.join(sdkRoot, 'bin', 'cache', 'dart-sdk'),
          flutterSdkRoot: sdkRoot,
          flutterVersion: version,
          fileSystem: fileSystem,
        );

  Sdk.dart(String sdkPath, {Version? version, FileSystem? fileSystem})
      : this._(sdkPath: sdkPath, version: version, fileSystem: fileSystem);

  static late Sdk current;

  /// Path to SDK directory.
  final String sdkPath;

  final SdkType sdkType;

  Version? _version;
  Version? _flutterVersion;

  /// The SDK's semantic versioning version (x.y.z-a.b.channel).
  Version get version => _version ??= _parseVersion(sdkPath);

  /// The Flutter SDK's semantic versioning version (x.y.z-a.b.channel).
  Version? get flutterVersion => _flutterVersion ??= switch (flutterSdkRoot) {
        final flutterSdkRoot? => _parseVersion(flutterSdkRoot),
        null => null,
      };

  /// If using the Flutter SDK, the root directory of the Flutter SDK.
  ///
  /// This is used in executions of `pub` to ensure that pub can correctly
  /// fallback to the Flutter SDK as needed.
  final String? flutterSdkRoot;

  /// The identifier of the current platform for Flutter artifacts.
  late final String flutterOsArtifacts = () {
    final osDir = switch (Abi.current()) {
      Abi.macosX64 || Abi.macosArm64 => 'darwin-x64',
      Abi.linuxX64 || Abi.linuxArm64 => 'linux-x64',
      Abi.windowsX64 || Abi.windowsArm64 => 'windows-x64',
      final unknownAbi => throw UnsupportedError('Unknown ABI: $unknownAbi'),
    };
    return p.join(
      flutterSdkRoot!,
      'bin',
      'cache',
      'artifacts',
      'engine',
      osDir,
    );
  }();

  final FileSystem _fileSystem;

  Version _parseVersion(String path) {
    final versionFile = _fileSystem.file(p.join(path, 'version'));
    if (!versionFile.existsSync()) {
      throw StateError(
        'Could not find Dart SDK version file at ${versionFile.path}.',
      );
    }
    return Version.parse(versionFile.readAsStringSync().trim());
  }

  String get dart => p.join(sdkPath, 'bin', 'dart');

  String? get flutter {
    if (flutterSdkRoot case final flutterRoot?) {
      return p.join(flutterRoot, 'bin', 'flutter');
    }
    return null;
  }

  String get dartAotRuntime => p.join(sdkPath, 'bin', 'dartaotruntime');

  String get analysisServerSnapshot =>
      p.absolute(sdkPath, 'bin', 'snapshots', 'analysis_server.dart.snapshot');

  String get dart2jsSnapshot =>
      p.absolute(sdkPath, 'bin', 'snapshots', 'dart2js.dart.snapshot');

  String get ddsSnapshot =>
      p.absolute(sdkPath, 'bin', 'snapshots', 'dds.dart.snapshot');

  String get ddsAotSnapshot =>
      p.absolute(sdkPath, 'bin', 'snapshots', 'dds_aot.dart.snapshot');

  String get frontendServerSnapshot =>
      p.absolute(sdkPath, 'bin', 'snapshots', 'frontend_server.dart.snapshot');

  String? get flutterPatchedSdk => flutterSdkRoot == null
      ? null
      : p.absolute(
          flutterSdkRoot!,
          'bin',
          'cache',
          'artifacts',
          'engine',
          'common',
          'flutter_patched_sdk',
        );

  String get flutterTester => p.join(flutterOsArtifacts, 'flutter_tester');

  // flutterSdkRoot == null
  //     ? p.absolute(
  //         sdkPath,
  //         'bin',
  //         'snapshots',
  //         'frontend_server.dart.snapshot',
  //       )
  //     : p.absolute(
  //         flutterSdkRoot!,
  //         'bin',
  //         'cache',
  //         'artifacts',
  //         'engine',
  //         flutterArtifactOS,
  //         'frontend_server.dart.snapshot',
  //       );

  String get frontendServerAotSnapshot => p.absolute(
        sdkPath,
        'bin',
        'snapshots',
        'frontend_server_aot.dart.snapshot',
      );

  // flutterSdkRoot == null
  //     ? p.absolute(
  //         sdkPath,
  //         'bin',
  //         'snapshots',
  //         'frontend_server_aot.dart.snapshot',
  //       )
  //     : p.absolute(
  //         flutterSdkRoot!,
  //         'bin',
  //         'cache',
  //         'artifacts',
  //         'engine',
  //         flutterArtifactOS,
  //         'frontend_server_aot.dart.snapshot',
  //       );

  String get genKernelAotSnapshot =>
      p.join(sdkPath, 'bin', 'snapshots', 'gen_kernel_aot.dart.snapshot');

  String get genSnapshot => p.absolute(sdkPath, 'bin', 'utils', 'gen_snapshot');

  String get devToolsBinaries =>
      p.absolute(sdkPath, 'bin', 'resources', 'devtools');

  String? get flutterPlatformDill => flutterSdkRoot == null
      ? null
      : p.absolute(
          flutterSdkRoot!,
          'bin',
          'cache',
          'artifacts',
          'engine',
          'common',
          'flutter_patched_sdk',
          'platform_strong.dill',
        );

  String? get flutterPlatformProductDill => flutterSdkRoot == null
      ? null
      : p.absolute(
          flutterSdkRoot!,
          'bin',
          'cache',
          'artifacts',
          'engine',
          'common',
          'flutter_patched_sdk_product',
          'platform_strong.dill',
        );

  String get vmPlatformDill =>
      p.absolute(sdkPath, 'lib', '_internal', 'vm_platform_strong.dill');

  String get vmPlatformProductDill => p.absolute(
        sdkPath,
        'lib',
        '_internal',
        'vm_platform_strong_product.dill',
      );

  /// The version when the new bytecode format and compiler was [introduced](https://github.com/dart-lang/sdk/commit/3abf78212c480cbbbfd43f6382ff262532c90e4d).
  ///
  /// Currently, the SDK does not bundle the `dart2bytecode` tool, so this
  /// version just signifies the runtime version that supports the new bytecode
  /// format.
  static final bytecodeVersion = Version.parse('3.6.0-133.0.dev');

  /// Whether or not the current SDK supports the new bytecode format.
  ///
  /// Trying to use the `dart2bytecode` tool on an SDK that does not support
  /// the new bytecode format will result in an error.
  bool get supportsBytecode {
    return version >= bytecodeVersion;
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
