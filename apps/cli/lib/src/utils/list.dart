import 'dart:async';

extension ListHelpers<T> on Iterable<T> {
  Future<List<R>> asyncMap<R>(Future<R> Function(T) mapper) =>
      Future.wait(eagerError: true, [
        for (final it in this) mapper(it),
      ]);

  Future<List<R>> asyncExpand<R>(Future<Iterable<R>> Function(T) mapper) =>
      asyncMap(mapper).then((it) => it.expand((it) => it).toList());
}
