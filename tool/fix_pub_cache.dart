import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml_edit/yaml_edit.dart';

const fixPackages = [
  'native_storage',
  'native_authentication',
  'jni',
  'objective_c',
];

Future<void> main() async {
  final pubCache = p.join(
    Platform.environment['PUB_CACHE'] ??
        p.join(Platform.environment['HOME']!, '.pub-cache'),
    'hosted',
    'pub.dev',
  );
  final pubCacheDir = Directory(pubCache);
  if (!pubCacheDir.existsSync()) {
    print('No pub cache found at $pubCache');
    exit(1);
  }

  for (final package in fixPackages) {
    print('Adding $package to pub cache');
    final proc = await Process.start(
      Platform.resolvedExecutable,
      [
        'pub',
        'cache',
        'add',
        package,
        '--all',
      ],
      mode: ProcessStartMode.inheritStdio,
    );
    if (await proc.exitCode != 0) {
      print('Failed to add $package to pub cache');
      exit(1);
    }
  }

  await for (final packageDir in pubCacheDir.list()) {
    print('Checking ${packageDir.path}');
    if (packageDir is! Directory) {
      continue;
    }
    var fixPackage = false;
    for (final packageToFix in fixPackages) {
      if (p.basename(packageDir.path).startsWith('$packageToFix-')) {
        fixPackage = true;
        break;
      }
    }
    if (!fixPackage) {
      continue;
    }
    final pubspecFile = File(p.join(packageDir.path, 'pubspec.yaml'));
    if (!pubspecFile.existsSync()) {
      continue;
    }
    final pubspecYaml = await pubspecFile.readAsString();
    final pubspec = Pubspec.parse(pubspecYaml);
    if (!fixPackages.contains(pubspec.name)) {
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
    print('Fixed pubspec for ${pubspec.name} in ${packageDir.path}');
  }
}
