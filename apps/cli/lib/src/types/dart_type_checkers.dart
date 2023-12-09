import 'dart:core' as core;
import 'dart:typed_data';

// ignore: implementation_imports
import 'package:analyzer/src/dart/element/type.dart';
import 'package:celest_cli/src/types/type_checker.dart';

/// Common type references used throughout code generation.
abstract final class DartTypeCheckers {
  /// `dart:core` types.
  static const core = _Core();

  /// `dart:typed_data` types.
  static const typedData = _TypedData();
}

/// `dart:core` types
final class _Core {
  const _Core();

  static const _url = 'dart:core';

  /// Creates a [core.BigInt] type checker.
  TypeChecker get bigInt => const TypeChecker.fromUrl('$_url#BigInt');

  /// Creates a [core.bool] type checker.
  TypeChecker get bool => const TypeChecker.fromUrl('$_url#bool');

  /// Creates a [core.DateTime] type checker.
  TypeChecker get dateTime => const TypeChecker.fromUrl('$_url#DateTime');

  /// Creates a [core.Deprecated] type checker.
  TypeChecker get deprecated => const TypeChecker.fromUrl('$_url#Deprecated');

  /// Creates a [core.double] type checker.
  TypeChecker get double => const TypeChecker.fromUrl('$_url#double');

  /// Creates a [core.Duration] type checker.
  TypeChecker get duration => const TypeChecker.fromUrl('$_url#Duration');

  /// Creates a [dynamic] type checker.
  TypeChecker get dynamic => TypeChecker.fromStatic(DynamicTypeImpl.instance);

  /// Creates a [core.Exception] type checker.
  TypeChecker get exception => const TypeChecker.fromUrl('$_url#Exception');

  /// Creates a [core.Function] type checker.
  TypeChecker get function => const TypeChecker.fromUrl('$_url#Function');

  /// Creates an [core.int] type checker.
  TypeChecker get int => const TypeChecker.fromUrl('$_url#int');

  /// Creates a [core.Iterable] type checker.
  TypeChecker get iterable => const TypeChecker.fromUrl('$_url#Iterable');

  /// Creates a [core.List] type checker.
  TypeChecker get list => const TypeChecker.fromUrl('$_url#List');

  /// Creates a [core.Map] type checker.
  TypeChecker get map => const TypeChecker.fromUrl('$_url#Map');

  /// Creates an [core.MapEntry] type checker.
  TypeChecker get mapEntry => const TypeChecker.fromUrl('$_url#MapEntry');

  /// Creates an [core.Never] type checker.
  TypeChecker get never => const TypeChecker.fromUrl('$_url#Never');

  /// Creates a [core.Null] type checker.
  TypeChecker get null$ => const TypeChecker.fromUrl('$_url#Null');

  /// Creates an [core.Object] type checker.
  TypeChecker get object => const TypeChecker.fromUrl('$_url#Object');

  /// Creates a [core.RegExp] type checker.
  TypeChecker get regExp => const TypeChecker.fromUrl('$_url#RegExp');

  /// Creates a [core.Set] type checker.
  TypeChecker get set => const TypeChecker.fromUrl('$_url#Set');

  /// Creates a [core.StackTrace] type checker.
  TypeChecker get stackTrace => const TypeChecker.fromUrl('$_url#StackTrace');

  /// Create a [core.StateError] type checker.
  TypeChecker get stateError => const TypeChecker.fromUrl('$_url#StateError');

  /// Creates a [core.String] type checker.
  TypeChecker get string => const TypeChecker.fromUrl('$_url#String');

  /// Creates a [core.Type] type checker.
  TypeChecker get type => const TypeChecker.fromUrl('$_url#Type');

  /// Creates a [core.Uri] type checker.
  TypeChecker get uri => const TypeChecker.fromUrl('$_url#Uri');

  /// Creates a [core.UriData] type checker.
  TypeChecker get uriData => const TypeChecker.fromUrl('$_url#UriData');

  /// Creates a `void` type checker.
  TypeChecker get void$ => TypeChecker.fromStatic(VoidTypeImpl.instance);
}

/// `dart:typed_data` types
class _TypedData {
  const _TypedData();

  static const _url = 'dart:typed_data';

  /// Creates a [Uint8List] type checker.
  TypeChecker get uint8List => const TypeChecker.fromUrl('$_url#Uint8List');
}
