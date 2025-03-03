import 'dart:ffi';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:async/async.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/releases/celest_release_info.dart';
import 'package:celest_core/_internal.dart';
import 'package:file/file.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:sqlite3/open.dart';

extension type SqliteVersion(Version _version) {
  String get semVer => _version.toString();

  String get fullVersion {
    final versionString = StringBuffer();
    versionString.write(_version.major);
    versionString.write(_version.minor.toString().padLeft(2, '0'));
    versionString.write(_version.patch.toString().padLeft(2, '0'));
    versionString.write('00');
    return versionString.toString();
  }
}

final defaultSqliteVersion = SqliteVersion(Version(3, 46, 1));

Future<void> loadSqlite3({
  SqliteVersion? version,
  required Logger logger,
}) async {
  version ??= defaultSqliteVersion;
  final config = await CelestConfig.load();
  final file = config.configDir.childFile(_libraryName);
  final wasmFile = config.configDir.childFile('sqlite3.wasm');
  if (!file.existsSync() || !wasmFile.existsSync()) {
    final downloadProgress = cliLogger.progress(
      'Downloading additional resources',
    );
    try {
      await Future.wait([
        _downloadSqlite3(version, file, logger: logger),
        _downloadSqliteWasm(file: wasmFile, logger: logger),
      ]);
      downloadProgress.complete();
    } on Object {
      downloadProgress.fail();
      if (kReleaseMode) {
        rethrow;
      } else {
        return;
      }
    }
  } else {
    logger.finest('Using cached sqlite3 library');
  }
  final sqlite3Path = file.absolute.path;
  logger.fine('Sqlite3 precached at: $sqlite3Path');
  open.overrideForAll(() => DynamicLibrary.open(sqlite3Path));
}

Future<String> _downloadSqliteWasm({
  required File file,
  required Logger logger,
}) async {
  final uri = Uri.parse(
    'https://github.com/simolus3/sqlite3.dart/releases/download/sqlite3-2.4.6/sqlite3.wasm',
  );
  final download = await httpClient.send(http.Request('GET', uri));
  if (download.statusCode != 200) {
    throw Exception('Failed to download SQLite3');
  }
  final bytes = await collectBytes(download.stream);
  await file.create(recursive: true);
  await file.writeAsBytes(bytes, flush: true);
  return file.absolute.path;
}

Future<void> _downloadSqlite3(
  SqliteVersion version,
  File file, {
  required Logger logger,
}) async {
  final bucketKey = 'sqlite3/${version.fullVersion}/${Abi.current()}.tar.gz';
  final uri = CelestReleasesInfo.baseUri.resolve(bucketKey);
  logger.finest('Downloading SQLite3 from $uri');
  final download = await httpClient.send(http.Request('GET', uri));
  if (download.statusCode != 200) {
    throw Exception('Failed to download SQLite3');
  }
  final bytes = await collectBytes(download.stream.transform(gzip.decoder));
  final archive = TarDecoder().decodeBytes(bytes);
  await file.create(recursive: true);
  await file.writeAsBytes(archive.fileData(0), flush: true);
}

String get _libraryName {
  return switch (Abi.current()) {
    Abi.linuxArm64 || Abi.linuxX64 => 'libsqlite3.so',
    Abi.macosArm64 || Abi.macosX64 => 'libsqlite3.dylib',
    Abi.windowsArm64 || Abi.windowsX64 => 'sqlite3.dll',
    final unsupported =>
      throw UnsupportedError('Unsupported ABI: $unsupported'),
  };
}
