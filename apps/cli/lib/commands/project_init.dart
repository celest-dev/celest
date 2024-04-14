import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/releases/celest_release_info.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/version.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_cli_common/src/platform/windows_paths.dart';
import 'package:http/http.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

base mixin Configure on CelestCommand {
  // TODO(dnys1): Move to ProjectPaths. Rename to CelestProject.
  late final Pubspec pubspec;
  late final bool isExistingProject;

  static Never _throwNoProject() => throw const CelestException(
        'No Celest project found in the current directory.',
      );

  static void _noOp() {}

  Future<void> configure({
    FutureOr<String> Function() createProject = _throwNoProject,
    FutureOr<void> Function() migrateProject = _noOp,
  }) async {
    final currentDir = Directory.current;
    final pubspecFile = fileSystem.file(
      p.join(currentDir.path, 'pubspec.yaml'),
    );
    if (!pubspecFile.existsSync()) {
      throw const CelestException(
        'No pubspec.yaml file found in the current directory. '
        'Make sure to run this command from your Flutter project directory.',
      );
    }
    final pubspecYaml = await pubspecFile.readAsString();
    pubspec = Pubspec.parse(pubspecYaml);

    final (celestDir, isExistingProject) =
        switch (pubspec.dependencies.containsKey('celest')) {
      true => (currentDir, true),
      false => () {
          final dir = Directory(p.join(currentDir.path, 'celest'));
          return (dir, dir.existsSync());
        }(),
    };

    final projectRoot = celestDir.path;
    this.isExistingProject = isExistingProject;
    await init(
      projectRoot: projectRoot,
    );

    if (!isExistingProject) {
      await createProject();
    } else {
      await migrateProject();
    }

    await _pubUpgrade();

    if (platform.isWindows &&
        !DynamicLibrary.process().providesSymbol('cedar_init')) {
      final appDir = PathProviderWindows().getApplicationSupportPath()!;
      final file =
          fileSystem.file(p.join(appDir, packageVersion, 'cedar_ffi.dll'));
      if (!file.existsSync()) {
        final downloadProgress =
            cliLogger.progress('Downloading additional resources');
        try {
          // TODO(dnys1): Fix native asset build
          // final thisRelease = releases.releases[packageVersion];
          // if (thisRelease == null) {
          //   throw Exception(
          //     'Failed to find release information for version $packageVersion.',
          //   );
          // }
          // https://releases.celest.devcelest-latest-windows_x64.appx
          final dll = CelestReleasesInfo.baseUri.resolve(
            '${Abi.current()}/latest/cedar_ffi.dll',
          );
          logger.finest('Downloading cedar_ffi.dll from $dll');
          final download = await httpClient.send(Request('GET', dll));
          if (download.statusCode != 200) {
            throw Exception('Failed to download cedar_ffi.dll');
          }
          await file.create(recursive: true);
          await download.stream.pipe(file.openWrite());
          downloadProgress.complete();
        } on Object {
          downloadProgress.fail();
          rethrow;
        }
      }
      DynamicLibrary.open(file.path);
    }
  }

  // TODO(dnys1): Improve logic here so that we don't run pub upgrade if
  // the dependencies in the lockfile are already up to date.
  Future<void> _pubUpgrade() async {
    final projectRoot = projectPaths.projectRoot;
    logger.fine('Running pub upgrade in "$projectRoot"...');
    await Future.wait(eagerError: true, [
      runPub(
        action: PubAction.upgrade,
        workingDirectory: projectRoot,
      ),
      runPub(
        exe: 'flutter',
        action: PubAction.upgrade,
        workingDirectory: projectPaths.appRoot,
      ),
    ]);
  }
}
