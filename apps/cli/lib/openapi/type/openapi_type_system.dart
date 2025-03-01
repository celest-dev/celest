// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema_resolver.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';

final class OpenApiTypeSystem {
  factory OpenApiTypeSystem() => _instance;

  OpenApiTypeSystem._();

  static final OpenApiTypeSystem _instance = OpenApiTypeSystem._();

  final bottomType = OpenApiEmptyType.instance;
  final topType = OpenApiAnyType(
    schema: OpenApiAnyTypeSchema(isNullable: true),
    typeReference: DartTypes.core.object.nullable.toTypeReference,
    isNullable: true,
  );

  late final OpenApiType anyType = OpenApiAnyType(
    schema: anyTypeSchema,
    typeReference: DartTypes.core.object.toTypeReference,
    isNullable: false,
  );
  late final OpenApiTypeSchema anyTypeSchema = OpenApiAnyTypeSchema();
  late final OpenApiType integerType = OpenApiIntegerType(
    schema: integerTypeSchema,
    typeReference: DartTypes.core.int.toTypeReference,
    isNullable: false,
  );
  late final OpenApiTypeSchema integerTypeSchema = OpenApiIntegerTypeSchema(
    format: 'int64',
  );

  /// Return `true` for any type which is in the equivalence class of `Object`.
  bool _isObject(OpenApiType type) {
    if (type.isNullable) {
      return false;
    }

    // OBJECT(Object) is true
    if (type is OpenApiAnyType) {
      return true;
    }

    // OBJECT(T) is false otherwise
    return false;
  }

  /// Return `true` for any type which is in the equivalence class of top types.
  bool _isTop(OpenApiType type) {
    // TOP(T?) is true iff TOP(T) or OBJECT(T)
    if (type.isNullable) {
      final T = type.withNullability(false);
      return _isTop(T) || _isObject(T);
    }

    // TOP(T) is false otherwise
    return false;
  }

  /// Defines a total order on top and Object types.
  bool _isMoreTop(OpenApiType T, OpenApiType S) {
    final T_isNullable = T.isNullable;
    final S_isNullable = S.isNullable;

    // MORETOP(Object, S) = true
    if (!T_isNullable && T is OpenApiAnyType) {
      return true;
    }

    // MORETOP(T, Object) = false
    if (!S_isNullable && S is OpenApiAnyType) {
      return false;
    }

    // MORETOP(T?, S?) = MORETOP(T, S)
    if (T_isNullable && S_isNullable) {
      final T2 = T.withNullability(false);
      final S2 = S.withNullability(false);
      return _isMoreTop(T2, S2);
    }

    // MORETOP(T?, S) = false
    if (T_isNullable) {
      return false;
    }

    return false;
  }

  /// Return `true`  for things in the equivalence class of `Never`.
  bool _isBottom(OpenApiType type) {
    if (type.isNullable) {
      return false;
    }
    return identical(type, OpenApiEmptyType.instance);
  }

  /// Defines an (almost) total order on bottom and `Null` types. This does not
  /// currently consistently order two different type variables with the same
  /// bound.
  bool _isMoreBottom(OpenApiType T, OpenApiType S) {
    final T_isNullable = T.isNullable;
    final S_isNullable = S.isNullable;

    // MOREBOTTOM(Never, T) = true
    if (identical(T, OpenApiEmptyType.instance)) {
      return true;
    }

    // MOREBOTTOM(T, Never) = false
    if (identical(S, OpenApiEmptyType.instance)) {
      return false;
    }

    // MOREBOTTOM(Null, T) = true
    if (identical(T, OpenApiNullType.instance)) {
      assert(T_isNullable);
      return true;
    }

    // MOREBOTTOM(T, Null) = false
    if (identical(S, OpenApiNullType.instance)) {
      assert(S_isNullable);
      return false;
    }

    // MOREBOTTOM(T?, S?) = MOREBOTTOM(T, S)
    if (T_isNullable && S_isNullable) {
      final T2 = T.withNullability(false);
      final S2 = S.withNullability(false);
      return _isMoreBottom(T2, S2);
    }

    // MOREBOTTOM(T, S?) = true
    if (S_isNullable) {
      assert(!T_isNullable);
      return true;
    }

    // MOREBOTTOM(T?, S) = false
    if (T_isNullable) {
      assert(!S_isNullable);
      return false;
    }

    return false;
  }

  /// Return `true` for things in the equivalence class of `Null`.
  bool _isNull(OpenApiType type) {
    // NULL(Null) is true
    // Also includes `Null?` and `Null*` from the rules below.
    // TODO(dnys1): Do we need to represent `Null?`
    if (identical(type, OpenApiNullType.instance)) {
      return true;
    }

    // NULL(T?) is true iff NULL(T) or BOTTOM(T)
    if (type.isNullable) {
      final T = type.withNullability(false);
      return _isBottom(T);
    }

    // NULL(T) is false otherwise
    return false;
  }

  OpenApiType greatestLowerBound(
    OpenApiType T1,
    OpenApiType T2, {
    required OpenApiTypeSchemaResolver resolver,
  }) {
    // DOWN(T, T) = T
    if (identical(T1, T2) || T1 == T2) {
      return T1;
    }

    final T1_isTop = _isTop(T1);
    final T2_isTop = _isTop(T2);

    // DOWN(T1, T2) where TOP(T1) and TOP(T2)
    if (T1_isTop && T2_isTop) {
      // * T1 if MORETOP(T2, T1)
      // * T2 otherwise
      if (_isMoreTop(T2, T1)) {
        return T1;
      } else {
        return T2;
      }
    }

    // DOWN(T1, T2) = T2 if TOP(T1)
    if (T1_isTop) {
      return T2;
    }

    // DOWN(T1, T2) = T1 if TOP(T2)
    if (T2_isTop) {
      return T1;
    }

    final T1_isBottom = _isBottom(T1);
    final T2_isBottom = _isBottom(T2);

    // DOWN(T1, T2) where BOTTOM(T1) and BOTTOM(T2)
    if (T1_isBottom && T2_isBottom) {
      // * T1 if MOREBOTTOM(T1, T2)
      // * T2 otherwise
      if (_isMoreBottom(T1, T2)) {
        return T1;
      } else {
        return T2;
      }
    }

    // DOWN(T1, T2) = T1 if BOTTOM(T1)
    if (T1_isBottom) {
      return T1;
    }

    // DOWN(T1, T2) = T2 if BOTTOM(T2)
    if (T2_isBottom) {
      return T2;
    }

    final T1_isNull = _isNull(T1);
    final T2_isNull = _isNull(T2);

    // DOWN(T1, T2) where NULL(T1) and NULL(T2)
    if (T1_isNull && T2_isNull) {
      // * T1 if MOREBOTTOM(T1, T2)
      // * T2 otherwise
      if (_isMoreBottom(T1, T2)) {
        return T1;
      } else {
        return T2;
      }
    }

    final T1_isNullable = T1.isNullable;
    final T2_isNullable = T2.isNullable;

    // DOWN(Null, T2)
    if (T1 is OpenApiNullType) {
      // * Null if Null <: T2
      // * Never otherwise
      if (isSubtypeOf(OpenApiNullType.instance, T2)) {
        return OpenApiNullType.instance;
      } else {
        return OpenApiEmptyType.instance;
      }
    }

    // DOWN(T1, Null)
    if (T2 is OpenApiNullType) {
      // * Null if Null <: T1
      // * Never otherwise
      if (isSubtypeOf(OpenApiNullType.instance, T1)) {
        return OpenApiNullType.instance;
      } else {
        return OpenApiEmptyType.instance;
      }
    }

    final T1_isObject = _isObject(T1);
    final T2_isObject = _isObject(T2);

    // DOWN(T1, T2) where OBJECT(T1) and OBJECT(T2)
    if (T1_isObject && T2_isObject) {
      // * T1 if MORETOP(T2, T1)
      // * T2 otherwise
      if (_isMoreTop(T2, T1)) {
        return T1;
      } else {
        return T2;
      }
    }

    // DOWN(T1, T2) where OBJECT(T1)
    if (T1_isObject) {
      // * T2 if T2 is non-nullable
      if (!T2_isNullable) {
        return T2;
      }

      // * NonNull(T2) if NonNull(T2) is non-nullable
      final T2_nonNull = T2.withNullability(false);
      return T2_nonNull;
    }

    // DOWN(T1, T2) where OBJECT(T2)
    if (T2_isObject) {
      // * T1 if T1 is non-nullable
      if (!T1_isNullable) {
        return T1;
      }

      // * NonNull(T1) if NonNull(T1) is non-nullable
      final T1_nonNull = T1.withNullability(false);
      return T1_nonNull;
    }

    assert(!T1_isNullable);
    assert(!T2_isNullable);

    // DOWN(T1, T2) = T1 if T1 <: T2
    if (isSubtypeOf(T1, T2)) {
      return T1;
    }

    // DOWN(T1, T2) = T2 if T2 <: T1
    if (isSubtypeOf(T2, T1)) {
      return T2;
    }

    if (T1 is OpenApiStructType && T2 is OpenApiStructType) {
      final mergedFields = <String, OpenApiFieldSchema>{};
      T1.fields.forEach((name, T1_field) {
        if (T2.fields[name] case final T2_field?) {
          final mergedType = greatestLowerBound(
            T1_field.type,
            T2_field.type,
            resolver: resolver,
          );
          if (identical(mergedType, bottomType)) {
            throw UnimplementedError('TODO: cannot resolve types');
            // Probably just skip the field
            // return;
          }
          assert(T1_field.dartName == T2_field.dartName);
          mergedFields[name] = OpenApiFieldSchema(
            name: name,
            schema: mergedType.schema,
          );
        } else {
          mergedFields[name] = OpenApiFieldSchema(
            name: name,
            schema: T1_field.type.schema,
          );
        }
      });
      T2.fields.forEach((name, T2_field) {
        if (!T1.fields.containsKey(name)) {
          mergedFields[name] = OpenApiFieldSchema(
            name: name,
            schema: T2_field.type.schema,
          );
        }
      });
      final T1_discriminator = T1.discriminator;
      final T2_discriminator = T2.discriminator;
      if (T1_discriminator != null &&
          T2_discriminator != null &&
          T1_discriminator != T2_discriminator) {
        throw StateError('Cannot resolve two structs with discriminators');
      }
      // final discriminator = T1_discriminator ?? T2_discriminator;
      final schema = OpenApiStructTypeSchema(
        fields: mergedFields,
        // discriminator: discriminator,
        isNullable: false,
      );
      return schema.accept(resolver);
    }

    return bottomType;
  }

  /// Compute the least upper bound of two types.
  ///
  /// Modified from the Dart analyzer version, this blends in specifics and edge
  /// cases of the OpenAPI type system.
  OpenApiType leastUpperBound(
    OpenApiType T1,
    OpenApiType T2, {
    required OpenApiTypeSchemaResolver resolver,
  }) {
    // UP(T, T) = T
    if (identical(T1, T2) || T1 == T2) {
      return T1;
    }

    final T1_isTop = _isTop(T1);
    final T2_isTop = _isTop(T2);

    // UP(T1, T2) where TOP(T1) and TOP(T2)
    if (T1_isTop && T2_isTop) {
      // * T1 if MORETOP(T1, T2)
      // * T2 otherwise
      if (_isMoreTop(T1, T2)) {
        return T1;
      } else {
        return T2;
      }
    }

    // UP(T1, T2) = T1 if TOP(T1)
    if (T1_isTop) {
      return T1;
    }

    // UP(T1, T2) = T2 if TOP(T2)
    if (T2_isTop) {
      return T2;
    }

    final T1_isBottom = _isBottom(T1);
    final T2_isBottom = _isBottom(T2);

    // UP(T1, T2) where BOTTOM(T1) and BOTTOM(T2)
    if (T1_isBottom && T2_isBottom) {
      // * T2 if MOREBOTTOM(T1, T2)
      // * T1 otherwise
      if (_isMoreBottom(T1, T2)) {
        return T2;
      } else {
        return T1;
      }
    }

    // UP(T1, T2) = T2 if BOTTOM(T1)
    if (T1_isBottom) {
      return T2;
    }

    // UP(T1, T2) = T1 if BOTTOM(T2)
    if (T2_isBottom) {
      return T1;
    }

    final T1_isNull = _isNull(T1);
    final T2_isNull = _isNull(T2);

    // UP(T1, T2) where NULL(T1) and NULL(T2)
    if (T1_isNull && T2_isNull) {
      // * T2 if MOREBOTTOM(T1, T2)
      // * T1 otherwise
      if (_isMoreBottom(T1, T2)) {
        return T2;
      } else {
        return T1;
      }
    }

    final T1_isNullable = T1.isNullable;
    final T2_isNullable = T2.isNullable;

    final T1_isNonNullable = !T1_isNullable;
    final T2_isNonNullable = !T2_isNullable;

    // UP(T1, T2) where NULL(T1)
    if (T1_isNull) {
      // * T2 if T2 is nullable
      // * T2? otherwise
      if (T2_isNullable) {
        return T2;
      } else {
        return T2.withNullability(true);
      }
    }

    // UP(T1, T2) where NULL(T2)
    if (T2_isNull) {
      // * T1 if T1 is nullable
      // * T1? otherwise
      if (T1_isNullable) {
        return T1;
      } else {
        return T1.withNullability(true);
      }
    }

    final T1_isObject = _isObject(T1);
    final T2_isObject = _isObject(T2);

    // UP(T1, T2) where OBJECT(T1) and OBJECT(T2)
    if (T1_isObject && T2_isObject) {
      // * T1 if MORETOP(T1, T2)
      // * T2 otherwise
      if (_isMoreTop(T1, T2)) {
        return T1;
      } else {
        return T2;
      }
    }

    // UP(T1, T2) where OBJECT(T1)
    if (T1_isObject) {
      // * T1 if T2 is non-nullable
      // * T1? otherwise
      if (T2_isNonNullable) {
        return T1;
      } else {
        return T1.withNullability(true);
      }
    }

    // UP(T1, T2) where OBJECT(T2)
    if (T2_isObject) {
      // * T2 if T1 is non-nullable
      // * T2? otherwise
      if (T1_isNonNullable) {
        return T2;
      } else {
        return T2.withNullability(true);
      }
    }

    // UP(T1?, T2?) = S? where S is UP(T1, T2)
    // UP(T1?, T2) = S? where S is UP(T1, T2)
    // UP(T1, T2?) = S? where S is UP(T1, T2)
    if (T1_isNullable || T2_isNullable) {
      final T1_none = T1.withNullability(false);
      final T2_none = T2.withNullability(false);
      final S = leastUpperBound(T1_none, T2_none, resolver: resolver);
      return S.withNullability(true);
    }

    assert(T1_isNonNullable);
    assert(T2_isNonNullable);

    // UP(T1, T2) = T2 if T1 <: T2
    // UP(T1, T2) = T1 if T2 <: T1
    // And other, more complex variants of interface types.

    assert(T1 is OpenApiInterfaceType);
    assert(T2 is OpenApiInterfaceType);

    if (T1 is OpenApiIterableInterface && T2 is OpenApiIterableInterface) {
      final itemType = leastUpperBound(
        T1.itemType,
        T2.itemType,
        resolver: resolver,
      );
      final schema = OpenApiArrayTypeSchema(
        uniqueItems: false,
        itemType: itemType.schema,
        isNullable: false,
      );
      return schema.accept(resolver);
    }

    if (T1 is OpenApiRecordType && T2 is OpenApiRecordType) {
      final valueType = leastUpperBound(
        T1.valueType,
        T2.valueType,
        resolver: resolver,
      );
      final schema = OpenApiRecordTypeSchema(
        valueType: valueType.schema,
        isNullable: false,
      );
      return schema.accept(resolver);
    }

    if (T1 is OpenApiStructType && T2 is OpenApiStructType) {
      final mergedFields = <String, OpenApiFieldSchema>{};
      T1.fields.forEach((name, T1_field) {
        if (T2.fields[name] case final T2_field?) {
          final mergedType = leastUpperBound(
            T1_field.type,
            T2_field.type,
            resolver: resolver,
          );
          assert(T1_field.dartName == T2_field.dartName);
          mergedFields[name] = OpenApiFieldSchema(
            name: name,
            schema: mergedType.schema,
          );
        } else {
          mergedFields[name] = OpenApiFieldSchema(
            name: name,
            schema: T1_field.type.schema,
          );
        }
      });
      T2.fields.forEach((name, T2_field) {
        if (!T1.fields.containsKey(name)) {
          mergedFields[name] = OpenApiFieldSchema(
            name: name,
            schema: T2_field.type.schema,
          );
        }
      });
      final schema = OpenApiStructTypeSchema(
        fields: mergedFields,
        // discriminator:
        //     T1.discriminator == T2.discriminator ? T1.discriminator : null,
        isNullable: false,
      );
      return schema.accept(resolver);
    }

    final T1_interface = T1 as OpenApiInterfaceType;
    final T2_interface = T2 as OpenApiInterfaceType;

    for (
      var T1_super = T1_interface.superType;
      T1_super != null;
      T1_super = T1_super.superType
    ) {
      for (
        var T2_super = T2_interface.superType;
        T2_super != null;
        T2_super = T2_super.superType
      ) {
        if (T1_super == T2_super) {
          return T1_super;
        }
      }
    }

    return topType;
  }

  static bool _chooseNullability(
    OpenApiInterfaceType type1,
    OpenApiInterfaceType type2,
  ) {
    return type1.isNullable && type2.isNullable;
  }

  // Models [SubtypeHelper.isSubtypeOf].
  bool isSubtypeOf(OpenApiType T0, OpenApiType T1) {
    // Reflexivity: if `T0` and `T1` are the same type then `T0 <: T1`.
    if (identical(T0, T1)) {
      return true;
    }

    final T0_isNullable = T0.isNullable;
    final T1_isNullable = T1.isNullable;

    // Right Top: if `T1` is a top type (i.e. `dynamic`, or `void`, or
    // `Object?`) then `T0 <: T1`.
    if (identical(T1, topType)) {
      return true;
    }

    // Left Top: if `T0` is `dynamic` or `void`,
    //   then `T0 <: T1` if `Object? <: T1`.
    {}

    // Left Bottom: if `T0` is `Never`, then `T0 <: T1`.
    if (identical(T0, OpenApiEmptyType.instance)) {
      return true;
    }

    // Right Object: if `T1` is `Object` then:
    if (!T1_isNullable && T1 is OpenApiAnyType) {
      // ...

      // Otherwise `T0 <: T1` is true.
      return true;
    }

    // Left Null: if `T0` is `Null` then:
    if (T0_isNullable && T0 is OpenApiNullType) {
      // If `T1` is `Null`, `S?` or `S*` for some `S`, then the query is true.
      if (T1_isNullable) {
        return true;
      }

      // Otherwise, the query is false.
      return false;
    }

    // Left Nullable: if `T0` is `S0?` then:
    //   * `T0 <: T1` iff `S0 <: T1` and `Null <: T1`.
    if (T0_isNullable) {
      final S0 = T0.withNullability(false);
      return isSubtypeOf(S0, T1) && isSubtypeOf(OpenApiNullType.instance, T1);
    }

    // Right Nullable: if `T1` is `S1?` then:
    if (T1_isNullable) {
      final S1 = T1.withNullability(false);
      // `T0 <: T1` iff any of the following hold:
      // * either `T0 <: S1`
      if (isSubtypeOf(T0, S1)) {
        return true;
      }
      // * or `T0 <: Null`
      if (isSubtypeOf(T0, OpenApiNullType.instance)) {
        return true;
      }
      // iff
      return false;
    }

    if (T0 is OpenApiInterfaceType && T1 is OpenApiInterfaceType) {
      return _isInterfaceSubtypeOf(T0, T1);
    }

    return false;
  }

  // Models [SubtypeHelper._isInterfaceSubtypeOf].
  // `TODO`: Add OpenApiInterfaceType
  bool _isInterfaceSubtypeOf(
    OpenApiInterfaceType subType,
    OpenApiInterfaceType superType,
  ) {
    // Note: we should never reach `_isInterfaceSubtypeOf` with `i2 == Object`,
    // because top types are eliminated before `isSubtypeOf` calls this.
    assert(superType is! OpenApiAnyType);

    if (identical(subType, superType)) {
      return true;
    }

    // Object cannot subtype anything but itself (handled above).
    if (subType is OpenApiAnyType) {
      return false;
    }

    for (final interface in subType.allSuperTypes) {
      if (interface.runtimeType == superType.runtimeType) {
        return true; // Handle subtyping of records/lists/svcs
      }
    }

    return false;
  }
}
