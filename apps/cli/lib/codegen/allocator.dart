import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/path.dart';
import 'package:code_builder/code_builder.dart';

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

  final String forFile;
  final PrefixingStrategy prefixingStrategy;

  final _imports = <String, int>{};
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
    if (uri.scheme == 'file' && p.equals(p.fromUri(uri), forFile)) {
      return symbol;
    }
    url = switch (uri.scheme) {
      'project' => p
          .relative(
            p.joinAll([projectPaths.projectRoot, ...p.split(uri.path)]),
            from: p.dirname(forFile),
          )
          .to(p.url),
      '' || 'file' => p.isRelative(uri.path)
          ? url.replaceAll(p.separator, p.url.separator)
          : p
              .relative(
                p.fromUri(uri),
                from: p.dirname(forFile),
              )
              .to(p.url),
      _ => url,
    };
    return _importFor(url, symbol);
  }

  String _importFor(String url, String symbol) {
    switch (prefixingStrategy) {
      case PrefixingStrategy.indexed:
        return '_i${_imports.putIfAbsent(url, _nextKey)}.$symbol';
      case PrefixingStrategy.none:
        return symbol;
    }
  }

  int _nextKey() => _keys++;

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => Directive.import(u, as: '_i${_imports[u]}'),
      );
}
