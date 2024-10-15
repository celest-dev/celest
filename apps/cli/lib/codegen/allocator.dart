import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/path.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

enum PrefixingStrategy {
  indexed,
  pretty,
  none,

  /// Useful for generating part of libraries.
  ///
  /// In this mode, all imports must be manually managed.
  noImports;
}

enum PathStrategy {
  /// Pretty, relative paths, the way a user would type it.
  ///
  /// Used for client-facing codegen where relative paths are guaranteed to exist.
  pretty,

  /// Robust path handling, with little manipulation.
  ///
  /// Used for non-client-facing codegen where the aesthetics do not matter and pretty,
  /// relative paths may fail.
  robust;
}

final class CelestAllocator implements Allocator {
  CelestAllocator({
    required this.forFile,
    this.prefixingStrategy = PrefixingStrategy.indexed,
    required this.pathStrategy,
    @visibleForTesting String? packageName,
    @visibleForTesting String? clientPackageName,
  })  : packageName = packageName ?? celestProject.pubspec.name,
        clientPackageName =
            clientPackageName ?? celestProject.clientPubspec.name;

  static const _doNotPrefix = [
    'dart:core',
    'package:meta/meta.dart',
  ];
  static final Logger _logger = Logger('CelestAllocator');

  final String forFile;
  final PrefixingStrategy prefixingStrategy;
  final PathStrategy pathStrategy;

  final String packageName;
  final String clientPackageName;

  late final _fileContext = path.Context(
    current: p.dirname(forFile),
    style: p.style,
  );
  final importMap = <String, String?>{};
  var _keys = 1;

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol!;
    var url = reference.url;
    if (url == null || _doNotPrefix.contains(url) || p.equals(url, forFile)) {
      return symbol;
    }
    // Fix `file://` and root-relative paths to match expected `pathStrategy`.
    var uri = Uri.parse(url);
    const supportedSchemes = ['', 'file', 'project', 'package', 'dart'];
    if (!supportedSchemes.contains(uri.scheme)) {
      final fileUri = p.toUri(url);
      if (!supportedSchemes.contains(fileUri.scheme)) {
        unreachable('Unexpected reference URL: $url (Tried: [$uri, $fileUri])');
      }
      uri = fileUri;
    }
    switch (uri) {
      case Uri(scheme: '' || 'file'):
        final path = uri.toFilePath();
        final absolutePath =
            _fileContext.isRelative(path) ? _fileContext.absolute(path) : path;
        if (p.equals(absolutePath, forFile)) {
          return symbol;
        }

        final normalizedUri = projectPaths.fileToPackageUri(absolutePath);
        if (normalizedUri.scheme != 'package') {
          _logger.finest('Failed to normalize $normalizedUri');
          // Ensure that the path being imported is in the outputs directory,
          // the only place we should ever use non-package: imports.
          assert(p.isWithin(projectPaths.outputsDir, forFile));

          // To prevent compilation issues, we must also assert that the file
          // doing the import is also in the outputs directory.
          assert(p.isWithin(projectPaths.outputsDir, path));

          // We need to use relative paths because the path will be made
          // absolute by the frontend server, but needs paths that translate
          // to the virtual filesystem root.
          final urlStylePath = absolutePath.to(p.url);
          final urlStyleRoot = p.dirname(forFile).to(p.url);
          url = p.url.relative(urlStylePath, from: urlStyleRoot);
          uri = Uri.file(url);
          break;
        }

        _logger.finest('Normalized $uri to $normalizedUri');
        uri = normalizedUri;
        url = uri.toString();

      case Uri(
            scheme: 'package',
            pathSegments: [final package, ...final segments]
          )
          when package == packageName || package == clientPackageName:
        final importFilepath = p.joinAll([
          if (package == packageName)
            projectPaths.packageRoot
          else
            projectPaths.clientPackageRoot,
          ...segments,
        ]);
        if (p.equals(importFilepath, forFile)) {
          return symbol;
        }
      case Uri(scheme: 'package' || 'dart'):
        break;
      default:
        unreachable('Unexpected reference URL: $url ($uri)');
    }
    return _importFor(url, uri, symbol);
  }

  String _importFor(String url, Uri uri, String symbol) {
    switch (prefixingStrategy) {
      case PrefixingStrategy.indexed:
        return '${importMap.putIfAbsent(url, _nextKey)}.$symbol';
      case PrefixingStrategy.pretty:
        final import = importMap.putIfAbsent(
          url,
          () => prefixForUrl(uri),
        );
        return switch (import) {
          final import? => '$import.$symbol',
          null => symbol,
        };
      case PrefixingStrategy.none:
        importMap.putIfAbsent(url, () => null);
        return symbol;
      case PrefixingStrategy.noImports:
        return symbol;
    }
  }

  String? prefixForUrl(Uri uri) {
    switch (uri) {
      case Uri(scheme: 'package', pathSegments: [final package, ...])
          when package == packageName || package == clientPackageName:
        return null;
      case Uri(scheme: 'package', pathSegments: [final package, ...])
          when package.startsWith('celest'):
        return r'_$celest';
      case Uri(scheme: '' || 'file'):
        return null;
      case Uri(pathSegments: [final packageName, ..., final filename]):
        // TODO(dnys1): This may start causing issues if, for example, Celest
        // starts importing internal libraries where the types conflict with
        // public members.
        //
        // But this should be fairly robust and I don't expect we'll see any
        // issues.
        return '_\$${packageName}_${p.url.basenameWithoutExtension(filename)}';
      default:
        _logger.fine('Could not allocate prefix.', 'Unexpected URI: $uri');
    }
    return null;
  }

  String _nextKey() => '_i${_keys++}';

  @override
  Iterable<Directive> get imports => importMap.keys.map(
        (u) => Directive.import(u, as: importMap[u]),
      );
}
