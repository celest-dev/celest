import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/path.dart';
import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as path;

enum PrefixingStrategy {
  indexed,
  none;
}

final class CelestAllocator implements Allocator {
  CelestAllocator({
    required this.forFile,
    this.prefixingStrategy = PrefixingStrategy.indexed,
  });

  static const _doNotPrefix = ['dart:core'];
  static const _defaultImports = {
    'package:http/http.dart': 'http',
  };

  final String forFile;
  final PrefixingStrategy prefixingStrategy;

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
    // Fix `file://` and root-relative paths to be relative to the current file.
    final uri = Uri.parse(url);
    switch (uri.scheme) {
      case 'file' || '':
        final urlPath = p.fromUri(uri);
        if (p.equals(urlPath, forFile)) {
          return symbol;
        }
        url = p.isRelative(urlPath)
            ? urlPath.to(p.url)
            : _fileContext.relative(urlPath).to(p.url);
      case 'project':
        url = _fileContext
            .relative(p.join(projectPaths.projectRoot, uri.path))
            .to(p.url);
      case _:
        break;
    }
    return _importFor(url, symbol);
  }

  String _importFor(String url, String symbol) {
    switch (prefixingStrategy) {
      case PrefixingStrategy.indexed:
        return '${_imports.putIfAbsent(url, _nextKey)}.$symbol';
      case PrefixingStrategy.none:
        final import = _imports.putIfAbsent(url, () => _defaultImports[url]);
        return switch (import) {
          final import? => '$import.$symbol',
          null => symbol,
        };
    }
  }

  String _nextKey() => '_i${_keys++}';

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => Directive.import(u, as: _imports[u]),
      );
}
