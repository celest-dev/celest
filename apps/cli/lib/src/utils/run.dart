@pragma('vm:prefer-inline')
R run<R>(R Function() fn) => fn();

extension Let<T> on T {
  @pragma('vm:prefer-inline')
  R let<R>(R Function(T) fn) => fn(this);
}
