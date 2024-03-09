extension Let<T extends Object> on T? {
  R? let<R>(R Function(T) f) {
    if (this case final this_?) {
      return f(this_);
    }
    return null;
  }
}
