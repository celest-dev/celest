import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:pub_semver/pub_semver.dart';

final version = Version.parse('0.3.4');

Future<void> main(List<String> args) async {
  await build(args, (input, output) async {
    final targetOS = input.config.code.targetOS;
    final targetArchitecture = input.config.code.targetArchitecture;
    final outputDirectory = Directory.fromUri(input.outputDirectory);
    final file = await downloadAsset(
      targetOS,
      targetArchitecture,
      outputDirectory,
    );
    output.assets.code.add(
      CodeAsset(
        package: input.packageName,
        name: 'src/database/libsql_native.dart',
        linkMode: DynamicLoadingBundled(),
        file: file.uri,
      ),
    );
  });
}

/// Constructs the download URI for a given [target] file name.
Uri downloadUri(String target) => Uri.parse(
  'https://github.com/tursodatabase/libsql-c/releases/download/v$version/$target.zip',
);

/// Downloads an asset for the specified [targetOS] and [targetArchitecture].
Future<File> downloadAsset(
  OS targetOS,
  Architecture targetArchitecture,
  Directory outputDirectory,
) async {
  final targetName = switch ((targetOS, targetArchitecture)) {
    (OS.macOS, Architecture.arm64) => 'aarch64-apple-darwin-release',
    (OS.macOS, Architecture.x64) => 'x86_64-apple-darwin-release',
    (OS.linux, Architecture.arm64) => 'aarch64-unknown-linux-gnu-release',
    (OS.linux, Architecture.x64) => 'x86_64-unknown-linux-gnu-release',
    _ => throw UnsupportedError(
      'Unsupported target OS and architecture: $targetOS, $targetArchitecture',
    ),
  };
  final uri = downloadUri(targetName);
  final request = await HttpClient().getUrl(uri);
  final response = await request.close();
  if (response.statusCode != 200) {
    throw ArgumentError('The request to $uri failed.');
  }
  final zip = File.fromUri(outputDirectory.uri.resolve('$targetName.zip'));
  await zip.create();
  await response.pipe(zip.openWrite());
  await extractFileToDisk(zip.path, outputDirectory.path);
  return File.fromUri(
    outputDirectory.uri.resolve(targetOS.dylibFileName('libsql')),
  );
}
