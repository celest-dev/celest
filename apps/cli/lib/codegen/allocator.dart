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

  static const _doNotPrefix = ['dart:core'];

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
    return _importFor(url, symbol);
  }

  String _importFor(String url, String symbol) {
    switch (prefixingStrategy) {
      case PrefixingStrategy.indexed:
        return '${_imports.putIfAbsent(url, _nextKey)}.$symbol';
      case PrefixingStrategy.none:
        final import = _imports.putIfAbsent(
          url,
          () => _prefixForUrl(url),
        );
        return switch (import) {
          final import? => '$import.$symbol',
          null => symbol,
        };
      case PrefixingStrategy.noImports:
        return symbol;
    }
  }

  String? _prefixForUrl(String url) {
    final uri = Uri.parse(url);
    if (uri
        case Uri(
          scheme: 'package',
          // The only members we should not prefix are core libraries.
          //
          // We could choose to not prefix their backend library but the Celest types
          // are so ubiquitous in clientgen, that this helps reduce the prefix
          // clutter.
          //
          // This is also required so that, for example, clients can define
          // their own types with the same name as core lib types.
          pathSegments: ['celest' || 'celest_core' || 'meta' || 'libcoder', ...]
        )) {
      return null;
    }
    if (uri.scheme.isEmpty) {
      return null;
    }
    final allocatedPrefixes = _imports.values.nonNulls.toSet();
    if (url.indexOf(':') case final index && != -1) {
      url = url.substring(index + 1);
    }
    final urlSegments = url
        .split('/')
        .map((s) => s.replaceFirst('.dart', ''))
        .where((s) => s.isNotEmpty && !s.contains('.'))
        .toList();
    if (urlSegments.isEmpty) {
      throw StateError('Could not allocate prefix for URL: $url');
    }
    var prefix = urlSegments.removeLast();
    while (allocatedPrefixes.contains(prefix)) {
      prefix = '${urlSegments.removeLast()}_$prefix';
    }
    if (!allocatedPrefixes.add(prefix)) {
      // TODO(dnys1): What to do here?
      throw StateError('Could not allocate prefix for URL: $url');
    }
    return '_\$$prefix';
  }

  String _nextKey() => '_i${_keys++}';

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => Directive.import(u, as: _imports[u]),
      );
}
