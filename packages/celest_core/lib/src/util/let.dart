/// {@template celest_core.utils.let}
/// Provides a [let] extension method to allow chained processing over values
/// without introducing local variables.
/// {@endtemplate}
extension Let<T> on T? {
  /// {@macro celest_core.utils.let}
  R let<R>(R Function(T) block) {
    if (this == null) {
      return null as R;
    }
    return block(this as T);
  }
}
