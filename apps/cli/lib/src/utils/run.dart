R run<R>(R Function() fn) => fn();

extension Let<T> on T {
  R let<R>(R Function(T) fn) => fn(this);
}
