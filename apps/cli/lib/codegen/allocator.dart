import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/path.dart';
import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as path;

enum PrefixingStrategy {
  indexed,
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
  });

  static const _doNotPrefix = [
    'dart:core',
    'package:meta/meta.dart',
  ];

  final String forFile;
  final PrefixingStrategy prefixingStrategy;
  final PathStrategy pathStrategy;

  late final _fileContext = path.Context(
    current: p.dirname(forFile),
    style: p.style,
  );
  final _imports = <String, String?>{};
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
    switch (uri.scheme) {
      case '' || 'file':
        final urlPath = p.fromUri(uri);
        if (p.equals(urlPath, forFile)) {
          return symbol;
        }
        url = switch (pathStrategy) {
          PathStrategy.pretty => p.isRelative(urlPath)
              ? urlPath.to(p.url)
              : _fileContext.relative(urlPath).to(p.url),
          PathStrategy.robust => uri.toString(),
        };
      case 'project':
        url = switch (pathStrategy) {
          PathStrategy.pretty => _fileContext
              .relative(p.join(projectPaths.projectRoot, uri.path))
              .to(p.url),
          PathStrategy.robust =>
            Uri.file(p.join(projectPaths.projectRoot, uri.path)).toString(),
        };
      case 'package' || 'dart':
        break;
      default:
        unreachable('Unexpected reference URL: $url ($uri)');
    }
    return _importFor(url, uri, symbol);
  }

  String _importFor(String url, Uri uri, String symbol) {
    switch (prefixingStrategy) {
      case PrefixingStrategy.indexed:
        return '${_imports.putIfAbsent(url, _nextKey)}.$symbol';
      case PrefixingStrategy.none:
        final import = _imports.putIfAbsent(
          url,
          () => _prefixForUrl(uri),
        );
        return switch (import) {
          final import? => '$import.$symbol',
          null => symbol,
        };
      case PrefixingStrategy.noImports:
        return symbol;
    }
  }

  String? _prefixForUrl(Uri uri) {
    final allocatedPrefixes = _imports.values.nonNulls.toSet();
    String prefix;
    switch (uri) {
      case Uri(scheme: 'package', pathSegments: ['celest_backend', ...]):
        return null;
      case Uri(scheme: 'package', pathSegments: [final package, ...])
          when package.startsWith('celest'):
        return r'_$celest';
      case Uri(scheme: '' || 'file'):
        return null;
      case Uri(:final path):
        final segments = p.posix.split(path);
        prefix =
            segments.removeLast().replaceAll('.dart', '').replaceAll('.', '_');
        while (allocatedPrefixes.contains(prefix)) {
          if (segments.isEmpty) {
            throw StateError('Could not allocate prefix for URL: $uri');
          }
          prefix = '${segments.removeLast().replaceAll('.', '_')}_$prefix';
        }
    }
    if (!allocatedPrefixes.add(prefix)) {
      // TODO(dnys1): What to do here?
      throw StateError('Could not allocate prefix for URL: $uri');
    }
    return '_\$$prefix';
  }

  String _nextKey() => '_i${_keys++}';

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => Directive.import(u, as: _imports[u]),
      );
}
