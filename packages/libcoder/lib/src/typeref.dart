import 'package:meta/meta.dart';

@immutable
sealed class Typeref<T extends Object> {
  const factory Typeref({
    String? typeName,
  }) = _StaticTyperef<T>;

  const factory Typeref.extensionType({
    required String typeName,
  }) = ExtensionTyperef<T>._;

  factory Typeref.runtime({
    required Type runtimeType,
    String? typeName,
  }) = _RuntimeTyperef<T>;

  const Typeref._();

  /// A stringified representation of the type, useful for debugging.
  String get typeName;

  /// The referenced type object, if meaningful at runtime.
  ///
  /// For extension type references, this will always be `null`.
  Type? get type;

  @override
  String toString() => typeName;
}

final class _StaticTyperef<T extends Object> extends Typeref<T> {
  const _StaticTyperef({
    String? typeName,
  })  : _typeName = typeName,
        super._();

  final String? _typeName;

  @override
  Type get type => T;

  @override
  String get typeName => _typeName ?? T.toString();
}

/// A reference to a static extension type.
final class ExtensionTyperef<T extends Object> extends Typeref<T> {
  const ExtensionTyperef._({
    required this.typeName,
  }) : super._();

  @override
  Type? get type => null;

  @override
  final String typeName;
}

final class _RuntimeTyperef<T extends Object> extends Typeref<T> {
  _RuntimeTyperef({
    required Type runtimeType,
    String? typeName,
  })  : _runtimeType = runtimeType,
        typeName = typeName ?? runtimeType.toString(),
        super._();

  final Type _runtimeType;

  @override
  Type get type => _runtimeType;

  @override
  final String typeName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _RuntimeTyperef && identical(_runtimeType, other._runtimeType);

  @override
  int get hashCode => _runtimeType.hashCode;
}
