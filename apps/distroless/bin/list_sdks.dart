import 'dart:convert';

import 'package:distroless/src/sdk/sdk_manager.dart';
import 'package:pub_semver/pub_semver.dart';

final Version minDartSdkVersion = Version(3, 5, 0);
final Version minFlutterSdkVersion = Version(3, 24, 0);

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
  final versions =
      releases.entries
          .map((it) => {'version': it.key.toString(), 'channel': it.value.name})
          .toList();

  final versionsJson = jsonEncode(versions);
  print(versionsJson);
}
