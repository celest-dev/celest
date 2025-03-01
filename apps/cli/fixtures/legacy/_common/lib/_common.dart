/// Common types and functions, used for testing APIs which reference other
/// packages.
library;

final class CustomException implements Exception {
  CustomException(this.message);

  final String message;

  @override
  String toString() => 'CustomException: $message';
}

final class CommonException implements Exception {
  CommonException(this.message);

  final String message;

  @override
  String toString() => 'CommonException: $message';
}

void throwsCustomException() {
  throw CustomException('message');
}

void throwsCommonException() {
  throw CommonException('message');
}

final class NestedParent {
  const NestedParent(this.child);

  factory NestedParent.fromJson(String value) =>
      NestedParent(NestedChild(value));

  final NestedChild child;

  String toJson() => child.value;
}

final class NestedChild {
  const NestedChild(this.value);

  factory NestedChild.fromJson(String value) => NestedChild(value);

  final String value;

  String toJson() => value;
}

final class OverriddenException implements Exception {
  const OverriddenException(this.message);

  factory OverriddenException.fromJson(String value) =>
      OverriddenException(value);

  final String message;

  String toJson() => message;

  @override
  String toString() => 'OverriddenException: $message';
}

void throwsOverriddenException() {
  throw const OverriddenException('message');
}
