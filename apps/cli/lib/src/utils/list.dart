import 'dart:async';

extension ListHelpers<T> on Iterable<T> {
  Future<List<R>> asyncMap<R>(Future<R> Function(T) mapper) async {
    // Iterates sequentially to mimic the behavior of `Iterable.map` since
    // `Future.wait` executes all tasks at once which may cause race conditions.
    // TODO(dnys1): Find fix which allows parallelization.
    final results = <R>[];
    for (final it in this) {
      results.add(await mapper(it));
    }
    return results;
  }

  Future<List<R>> asyncExpand<R>(Future<Iterable<R>> Function(T) mapper) =>
      asyncMap(mapper).then((it) => it.expand((it) => it).toList());
}
