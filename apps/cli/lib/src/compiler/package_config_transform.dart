import 'package:celest_cli/src/context.dart';
import 'package:package_config/package_config.dart';
import 'package:package_config/src/package_config_io.dart';

/// Transforms a package config to use the new root.
Future<String> transformPackageConfig({
  required String packageConfigPath,
  required String fromRoot,
  required String toRoot,
}) async {
  final packageConfig = await loadPackageConfig(
    fileSystem.file(packageConfigPath),
  );
  final newPackages = packageConfig.packages.map((package) {
    return Package(
      package.name,
      switch (package.root.scheme) {
        '' => Uri(
          path: p.relative(
            p.join(fromRoot, '.dart_tool', package.root.path),
            from: p.join(toRoot, '.dart_tool'),
          ),
        ),
        _ => package.root,
      },
      packageUriRoot: package.packageUriRoot,
      languageVersion: package.languageVersion,
      extraData: package.extraData,
      relativeRoot: package.relativeRoot,
    );
  }).toList();
  final newPackageConfig = PackageConfig(
    newPackages,
    extraData: packageConfig.extraData,
  );
  final toRootDir = fileSystem.directory(toRoot);
  final newPackageConfigBuf = StringBuffer();
  PackageConfig.writeString(newPackageConfig, newPackageConfigBuf);
  final newPackageConfigFile = toRootDir
      .childDirectory('.dart_tool')
      .childFile(packageConfigFileName);
  await newPackageConfigFile.create(recursive: true);
  await newPackageConfigFile.writeAsString(newPackageConfigBuf.toString());
  return newPackageConfigFile.path;
}
