import 'dart:convert';

import 'package:distroless/src/sdk/sdk_manager.dart';
import 'package:pub_semver/pub_semver.dart';

final Version minDartSdkVersion = Version(3, 9, 0);
final Version minFlutterSdkVersion = Version(3, 35, 0);

/// SDKs where the tagged Dart SDK version does not match the published one.
final List<Version> badFlutterSdks = [
  Version.parse('3.30.0-0.1.pre'),
  Version.parse('3.31.0-0.1.pre'),
];

Future<void> main(List<String> args) async {
  final type = args.isNotEmpty ? args[0] : 'dart';
  final (sdkManager, minVersion) = switch (type) {
    'dart' => (DartSdkManager(), minDartSdkVersion),
    'flutter' => (FlutterSdkManager(), minFlutterSdkVersion),
    _ => throw ArgumentError('Unknown SDK type: $type'),
  };
  final allVersions = await sdkManager.listRemote();
  sdkManager.close();

  final releases = Map.fromEntries(
    allVersions.allReleases.entries.where((v) => v.key >= minVersion).toList()
      ..sort((a, b) => a.key.compareTo(b.key)),
  );
  if (type == 'flutter') {
    for (final version in badFlutterSdks) {
      releases.remove(version);
    }
  }
  final versions =
      releases.entries
          .map((it) => {'version': it.key.toString(), 'channel': it.value.name})
          .toList();

  final versionsJson = jsonEncode(versions);
  print(versionsJson);
}
