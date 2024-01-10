import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/src/context.dart';
import 'package:code_builder/code_builder.dart';

final class CelestAllocator implements Allocator {
  CelestAllocator({
    required this.projectPaths,
    required this.forFile,
  });

  static const _doNotPrefix = ['dart:core'];

  final ProjectPaths projectPaths;
  final String forFile;

  final _imports = <String, int>{};
  var _keys = 1;

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol!;
    var url = reference.url;
    if (url == null || _doNotPrefix.contains(url)) {
      return symbol;
    }
    // Fix `file://` and root-relative paths to be relative to the current file.
    final uri = Uri.parse(url);
    url = switch (uri.scheme) {
      'project' => p.relative(
          p.join(projectPaths.projectRoot, uri.path),
          from: p.dirname(forFile),
        ),
      '' || 'file' => p.isRelative(uri.path)
          ? url
          : p.relative(
              p.fromUri(uri),
              from: p.dirname(forFile),
            ),
      _ => url,
    };
    return '_i${_imports.putIfAbsent(url, _nextKey)}.$symbol';
  }

  int _nextKey() => _keys++;

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => Directive.import(u, as: '_i${_imports[u]}'),
      );
}
