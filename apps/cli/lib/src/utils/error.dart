class _UnreachableError extends Error {
  _UnreachableError(this.message);

  final String message;

  @override
  String toString() => message;
}

Never unreachable([String message = 'Unreachable code reached']) =>
    throw _UnreachableError(message);

Never todo() => throw UnimplementedError();
