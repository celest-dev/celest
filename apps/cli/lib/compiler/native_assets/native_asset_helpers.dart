// Coped from: https://github.com/dart-lang/sdk/blob/553df4be869f1175ee2c098584f58e0d860f42fa/pkg/dartdev/lib/src/commands/build.dart#L126
library;

import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:native_assets_builder/native_assets_builder.dart';
import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:native_assets_cli/native_assets_cli_internal.dart';

final Logger _logger = Logger('NativeAssetsBuilder');

Future<File> generateNativeAssetsYaml({
  Uri? packageRoot,
  Directory? outputDir,
}) async {
  final target = Target.current;
  final buildResult = await NativeAssetsBuildRunner(
    dartExecutable: Uri.file(Sdk.current.dart),
    logger: _logger,
  ).build(
    workingDirectory: packageRoot ?? fileSystem.currentDirectory.uri,
    target: target,
    linkModePreference: LinkModePreferenceImpl.dynamic,
    buildMode: BuildModeImpl.release,
    includeParentEnvironment: true,
    supportedAssetTypes: [
      NativeCodeAsset.type,
    ],
  );
  if (!buildResult.success) {
    throw StateError('Native assets build failed.');
  }
  final assets = buildResult.assets;
  final nativeAssets = assets.whereType<NativeCodeAssetImpl>();
  _logger.finest('Copying native assets.');
  KernelAsset targetLocation(NativeCodeAssetImpl asset) {
    final linkMode = asset.linkMode;
    final KernelAssetPath kernelAssetPath;
    switch (linkMode) {
      case DynamicLoadingSystemImpl _:
        kernelAssetPath = KernelAssetSystemPath(linkMode.uri);
      case LookupInExecutableImpl _:
        kernelAssetPath = KernelAssetInExecutable();
      case LookupInProcessImpl _:
        kernelAssetPath = KernelAssetInProcess();
      case DynamicLoadingBundledImpl _:
        kernelAssetPath = KernelAssetRelativePath(
          Uri(path: asset.file!.pathSegments.last),
        );
      default:
        throw Exception(
          'Unsupported NativeCodeAsset linkMode ${linkMode.runtimeType} in '
          'asset $asset',
        );
    }
    return KernelAsset(
      id: asset.id,
      target: target,
      path: kernelAssetPath,
    );
  }

  outputDir ??=
      await fileSystem.systemTempDirectory.createTemp('native_assets_');

  final assetTargetLocations = {
    for (final asset in nativeAssets) asset: targetLocation(asset),
  };
  final copiedFiles = await Future.wait([
    for (final assetMapping in assetTargetLocations.entries)
      if (assetMapping.value.path is KernelAssetRelativePath)
        fileSystem.file(assetMapping.key.file).copy(
              outputDir.uri
                  .resolveUri(
                    (assetMapping.value.path as KernelAssetRelativePath).uri,
                  )
                  .toFilePath(),
            ),
  ]);
  _logger.finest('Copied ${copiedFiles.length} native assets.');

  final nativeAssetsFile = outputDir.childFile('native_assets.yaml');
  final assetsContent =
      KernelAssets(assetTargetLocations.values.toList()).toNativeAssetsFile();
  await nativeAssetsFile.writeAsString(assetsContent);
  return nativeAssetsFile;
}
