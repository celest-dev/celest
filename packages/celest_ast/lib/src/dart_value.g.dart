// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dart_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DartString> _$dartStringSerializer = _$DartStringSerializer();
Serializer<DartInt> _$dartIntSerializer = _$DartIntSerializer();
Serializer<DartDouble> _$dartDoubleSerializer = _$DartDoubleSerializer();
Serializer<DartBool> _$dartBoolSerializer = _$DartBoolSerializer();
Serializer<DartList> _$dartListSerializer = _$DartListSerializer();
Serializer<DartMap> _$dartMapSerializer = _$DartMapSerializer();
Serializer<DartNull> _$dartNullSerializer = _$DartNullSerializer();
Serializer<DartRecord> _$dartRecordSerializer = _$DartRecordSerializer();
Serializer<DartEnum> _$dartEnumSerializer = _$DartEnumSerializer();
Serializer<DartInstance> _$dartInstanceSerializer = _$DartInstanceSerializer();
Serializer<DartTypeLiteral> _$dartTypeLiteralSerializer =
    _$DartTypeLiteralSerializer();
Serializer<DartSymbolLiteral> _$dartSymbolLiteralSerializer =
    _$DartSymbolLiteralSerializer();

class _$DartStringSerializer implements StructuredSerializer<DartString> {
  @override
  final Iterable<Type> types = const [DartString, _$DartString];
  @override
  final String wireName = 'DartString';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartString object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartString deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartStringBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartIntSerializer implements StructuredSerializer<DartInt> {
  @override
  final Iterable<Type> types = const [DartInt, _$DartInt];
  @override
  final String wireName = 'DartInt';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartInt object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartInt deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartIntBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartDoubleSerializer implements StructuredSerializer<DartDouble> {
  @override
  final Iterable<Type> types = const [DartDouble, _$DartDouble];
  @override
  final String wireName = 'DartDouble';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartDouble object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(double),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartDouble deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartDoubleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartBoolSerializer implements StructuredSerializer<DartBool> {
  @override
  final Iterable<Type> types = const [DartBool, _$DartBool];
  @override
  final String wireName = 'DartBool';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartBool object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(bool)),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartBool deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartBoolBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartListSerializer implements StructuredSerializer<DartList> {
  @override
  final Iterable<Type> types = const [DartList, _$DartList];
  @override
  final String wireName = 'DartList';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(BuiltList, const [
          const FullType(DartValue),
        ]),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartList deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(DartValue),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartMapSerializer implements StructuredSerializer<DartMap> {
  @override
  final Iterable<Type> types = const [DartMap, _$DartMap];
  @override
  final String wireName = 'DartMap';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartMap object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(DartValue),
          const FullType(DartValue),
        ]),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartMap deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartMapBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(DartValue),
                const FullType(DartValue),
              ]),
            )!,
          );
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartNullSerializer implements StructuredSerializer<DartNull> {
  @override
  final Iterable<Type> types = const [DartNull, _$DartNull];
  @override
  final String wireName = 'DartNull';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartNull object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartNull deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartNullBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartRecordSerializer implements StructuredSerializer<DartRecord> {
  @override
  final Iterable<Type> types = const [DartRecord, _$DartRecord];
  @override
  final String wireName = 'DartRecord';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartRecord object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'positionalFields',
      serializers.serialize(
        object.positionalFields,
        specifiedType: const FullType(BuiltList, const [
          const FullType(DartValue),
        ]),
      ),
      'namedFields',
      serializers.serialize(
        object.namedFields,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(String),
          const FullType(DartValue),
        ]),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartRecord deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'positionalFields':
          result.positionalFields.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(DartValue),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'namedFields':
          result.namedFields.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(DartValue),
              ]),
            )!,
          );
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartEnumSerializer implements StructuredSerializer<DartEnum> {
  @override
  final Iterable<Type> types = const [DartEnum, _$DartEnum];
  @override
  final String wireName = 'DartEnum';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enumRef',
      serializers.serialize(
        object.enumRef,
        specifiedType: const FullType(TypeReference),
      ),
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartEnum deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartEnumBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enumRef':
          result.enumRef.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartInstanceSerializer implements StructuredSerializer<DartInstance> {
  @override
  final Iterable<Type> types = const [DartInstance, _$DartInstance];
  @override
  final String wireName = 'DartInstance';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartInstance object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'classRef',
      serializers.serialize(
        object.classRef,
        specifiedType: const FullType(TypeReference),
      ),
      'constructor',
      serializers.serialize(
        object.constructor,
        specifiedType: const FullType(String),
      ),
      'positionalArguments',
      serializers.serialize(
        object.positionalArguments,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(String),
          const FullType(DartValue),
        ]),
      ),
      'namedArguments',
      serializers.serialize(
        object.namedArguments,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(String),
          const FullType(DartValue),
        ]),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartInstance deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartInstanceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'classRef':
          result.classRef.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
        case 'constructor':
          result.constructor =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'positionalArguments':
          result.positionalArguments.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(DartValue),
              ]),
            )!,
          );
          break;
        case 'namedArguments':
          result.namedArguments.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(DartValue),
              ]),
            )!,
          );
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartTypeLiteralSerializer
    implements StructuredSerializer<DartTypeLiteral> {
  @override
  final Iterable<Type> types = const [DartTypeLiteral, _$DartTypeLiteral];
  @override
  final String wireName = 'DartTypeLiteral';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartTypeLiteral object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(TypeReference),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartTypeLiteral deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartTypeLiteralBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartSymbolLiteralSerializer
    implements StructuredSerializer<DartSymbolLiteral> {
  @override
  final Iterable<Type> types = const [DartSymbolLiteral, _$DartSymbolLiteral];
  @override
  final String wireName = 'DartSymbolLiteral';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DartSymbolLiteral object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      ),
      'staticType',
      serializers.serialize(
        object.staticType,
        specifiedType: const FullType(TypeReference),
      ),
    ];

    return result;
  }

  @override
  DartSymbolLiteral deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DartSymbolLiteralBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'staticType':
          result.staticType.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(TypeReference),
                )!
                as TypeReference,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DartString extends DartString {
  @override
  final String value;
  @override
  final TypeReference staticType;

  factory _$DartString([void Function(DartStringBuilder)? updates]) =>
      (DartStringBuilder()..update(updates))._build();

  _$DartString._({required this.value, required this.staticType}) : super._();
  @override
  DartString rebuild(void Function(DartStringBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartStringBuilder toBuilder() => DartStringBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartString &&
        value == other.value &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartString')
          ..add('value', value)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartStringBuilder implements Builder<DartString, DartStringBuilder> {
  _$DartString? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartStringBuilder();

  DartStringBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartString other) {
    _$v = other as _$DartString;
  }

  @override
  void update(void Function(DartStringBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartString build() => _build();

  _$DartString _build() {
    _$DartString _$result;
    try {
      _$result =
          _$v ??
          _$DartString._(
            value: BuiltValueNullFieldError.checkNotNull(
              value,
              r'DartString',
              'value',
            ),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartString',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartInt extends DartInt {
  @override
  final int value;
  @override
  final TypeReference staticType;

  factory _$DartInt([void Function(DartIntBuilder)? updates]) =>
      (DartIntBuilder()..update(updates))._build();

  _$DartInt._({required this.value, required this.staticType}) : super._();
  @override
  DartInt rebuild(void Function(DartIntBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartIntBuilder toBuilder() => DartIntBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartInt &&
        value == other.value &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartInt')
          ..add('value', value)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartIntBuilder implements Builder<DartInt, DartIntBuilder> {
  _$DartInt? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartIntBuilder();

  DartIntBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartInt other) {
    _$v = other as _$DartInt;
  }

  @override
  void update(void Function(DartIntBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartInt build() => _build();

  _$DartInt _build() {
    _$DartInt _$result;
    try {
      _$result =
          _$v ??
          _$DartInt._(
            value: BuiltValueNullFieldError.checkNotNull(
              value,
              r'DartInt',
              'value',
            ),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartInt',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartDouble extends DartDouble {
  @override
  final double value;
  @override
  final TypeReference staticType;

  factory _$DartDouble([void Function(DartDoubleBuilder)? updates]) =>
      (DartDoubleBuilder()..update(updates))._build();

  _$DartDouble._({required this.value, required this.staticType}) : super._();
  @override
  DartDouble rebuild(void Function(DartDoubleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartDoubleBuilder toBuilder() => DartDoubleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartDouble &&
        value == other.value &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartDouble')
          ..add('value', value)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartDoubleBuilder implements Builder<DartDouble, DartDoubleBuilder> {
  _$DartDouble? _$v;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartDoubleBuilder();

  DartDoubleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartDouble other) {
    _$v = other as _$DartDouble;
  }

  @override
  void update(void Function(DartDoubleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartDouble build() => _build();

  _$DartDouble _build() {
    _$DartDouble _$result;
    try {
      _$result =
          _$v ??
          _$DartDouble._(
            value: BuiltValueNullFieldError.checkNotNull(
              value,
              r'DartDouble',
              'value',
            ),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartDouble',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartBool extends DartBool {
  @override
  final bool value;
  @override
  final TypeReference staticType;

  factory _$DartBool([void Function(DartBoolBuilder)? updates]) =>
      (DartBoolBuilder()..update(updates))._build();

  _$DartBool._({required this.value, required this.staticType}) : super._();
  @override
  DartBool rebuild(void Function(DartBoolBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartBoolBuilder toBuilder() => DartBoolBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartBool &&
        value == other.value &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartBool')
          ..add('value', value)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartBoolBuilder implements Builder<DartBool, DartBoolBuilder> {
  _$DartBool? _$v;

  bool? _value;
  bool? get value => _$this._value;
  set value(bool? value) => _$this._value = value;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartBoolBuilder();

  DartBoolBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartBool other) {
    _$v = other as _$DartBool;
  }

  @override
  void update(void Function(DartBoolBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartBool build() => _build();

  _$DartBool _build() {
    _$DartBool _$result;
    try {
      _$result =
          _$v ??
          _$DartBool._(
            value: BuiltValueNullFieldError.checkNotNull(
              value,
              r'DartBool',
              'value',
            ),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartBool',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartList extends DartList {
  @override
  final BuiltList<DartValue> value;
  @override
  final TypeReference staticType;

  factory _$DartList([void Function(DartListBuilder)? updates]) =>
      (DartListBuilder()..update(updates))._build();

  _$DartList._({required this.value, required this.staticType}) : super._();
  @override
  DartList rebuild(void Function(DartListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartListBuilder toBuilder() => DartListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartList &&
        value == other.value &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartList')
          ..add('value', value)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartListBuilder implements Builder<DartList, DartListBuilder> {
  _$DartList? _$v;

  ListBuilder<DartValue>? _value;
  ListBuilder<DartValue> get value =>
      _$this._value ??= ListBuilder<DartValue>();
  set value(ListBuilder<DartValue>? value) => _$this._value = value;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartListBuilder();

  DartListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartList other) {
    _$v = other as _$DartList;
  }

  @override
  void update(void Function(DartListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartList build() => _build();

  _$DartList _build() {
    _$DartList _$result;
    try {
      _$result =
          _$v ??
          _$DartList._(value: value.build(), staticType: staticType.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartList',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartMap extends DartMap {
  @override
  final BuiltMap<DartValue, DartValue> value;
  @override
  final TypeReference staticType;

  factory _$DartMap([void Function(DartMapBuilder)? updates]) =>
      (DartMapBuilder()..update(updates))._build();

  _$DartMap._({required this.value, required this.staticType}) : super._();
  @override
  DartMap rebuild(void Function(DartMapBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartMapBuilder toBuilder() => DartMapBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartMap &&
        value == other.value &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartMap')
          ..add('value', value)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartMapBuilder implements Builder<DartMap, DartMapBuilder> {
  _$DartMap? _$v;

  MapBuilder<DartValue, DartValue>? _value;
  MapBuilder<DartValue, DartValue> get value =>
      _$this._value ??= MapBuilder<DartValue, DartValue>();
  set value(MapBuilder<DartValue, DartValue>? value) => _$this._value = value;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartMapBuilder();

  DartMapBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartMap other) {
    _$v = other as _$DartMap;
  }

  @override
  void update(void Function(DartMapBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartMap build() => _build();

  _$DartMap _build() {
    _$DartMap _$result;
    try {
      _$result =
          _$v ??
          _$DartMap._(value: value.build(), staticType: staticType.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartMap',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartNull extends DartNull {
  @override
  final TypeReference staticType;

  factory _$DartNull([void Function(DartNullBuilder)? updates]) =>
      (DartNullBuilder()..update(updates))._build();

  _$DartNull._({required this.staticType}) : super._();
  @override
  DartNull rebuild(void Function(DartNullBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartNullBuilder toBuilder() => DartNullBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartNull && staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartNull')
      ..add('staticType', staticType)).toString();
  }
}

class DartNullBuilder implements Builder<DartNull, DartNullBuilder> {
  _$DartNull? _$v;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartNullBuilder();

  DartNullBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartNull other) {
    _$v = other as _$DartNull;
  }

  @override
  void update(void Function(DartNullBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartNull build() => _build();

  _$DartNull _build() {
    _$DartNull _$result;
    try {
      _$result = _$v ?? _$DartNull._(staticType: staticType.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartNull',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartRecord extends DartRecord {
  @override
  final BuiltList<DartValue> positionalFields;
  @override
  final BuiltMap<String, DartValue> namedFields;
  @override
  final TypeReference staticType;

  factory _$DartRecord([void Function(DartRecordBuilder)? updates]) =>
      (DartRecordBuilder()..update(updates))._build();

  _$DartRecord._({
    required this.positionalFields,
    required this.namedFields,
    required this.staticType,
  }) : super._();
  @override
  DartRecord rebuild(void Function(DartRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartRecordBuilder toBuilder() => DartRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartRecord &&
        positionalFields == other.positionalFields &&
        namedFields == other.namedFields &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFields.hashCode);
    _$hash = $jc(_$hash, namedFields.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartRecord')
          ..add('positionalFields', positionalFields)
          ..add('namedFields', namedFields)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartRecordBuilder implements Builder<DartRecord, DartRecordBuilder> {
  _$DartRecord? _$v;

  ListBuilder<DartValue>? _positionalFields;
  ListBuilder<DartValue> get positionalFields =>
      _$this._positionalFields ??= ListBuilder<DartValue>();
  set positionalFields(ListBuilder<DartValue>? positionalFields) =>
      _$this._positionalFields = positionalFields;

  MapBuilder<String, DartValue>? _namedFields;
  MapBuilder<String, DartValue> get namedFields =>
      _$this._namedFields ??= MapBuilder<String, DartValue>();
  set namedFields(MapBuilder<String, DartValue>? namedFields) =>
      _$this._namedFields = namedFields;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartRecordBuilder();

  DartRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _positionalFields = $v.positionalFields.toBuilder();
      _namedFields = $v.namedFields.toBuilder();
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartRecord other) {
    _$v = other as _$DartRecord;
  }

  @override
  void update(void Function(DartRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartRecord build() => _build();

  _$DartRecord _build() {
    _$DartRecord _$result;
    try {
      _$result =
          _$v ??
          _$DartRecord._(
            positionalFields: positionalFields.build(),
            namedFields: namedFields.build(),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFields';
        positionalFields.build();
        _$failedField = 'namedFields';
        namedFields.build();
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartRecord',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartEnum extends DartEnum {
  @override
  final TypeReference enumRef;
  @override
  final String value;
  @override
  final TypeReference staticType;

  factory _$DartEnum([void Function(DartEnumBuilder)? updates]) =>
      (DartEnumBuilder()..update(updates))._build();

  _$DartEnum._({
    required this.enumRef,
    required this.value,
    required this.staticType,
  }) : super._();
  @override
  DartEnum rebuild(void Function(DartEnumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartEnumBuilder toBuilder() => DartEnumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartEnum &&
        enumRef == other.enumRef &&
        value == other.value &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enumRef.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartEnum')
          ..add('enumRef', enumRef)
          ..add('value', value)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartEnumBuilder implements Builder<DartEnum, DartEnumBuilder> {
  _$DartEnum? _$v;

  TypeReferenceBuilder? _enumRef;
  TypeReferenceBuilder get enumRef =>
      _$this._enumRef ??= TypeReferenceBuilder();
  set enumRef(TypeReferenceBuilder? enumRef) => _$this._enumRef = enumRef;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartEnumBuilder();

  DartEnumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enumRef = $v.enumRef.toBuilder();
      _value = $v.value;
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartEnum other) {
    _$v = other as _$DartEnum;
  }

  @override
  void update(void Function(DartEnumBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartEnum build() => _build();

  _$DartEnum _build() {
    _$DartEnum _$result;
    try {
      _$result =
          _$v ??
          _$DartEnum._(
            enumRef: enumRef.build(),
            value: BuiltValueNullFieldError.checkNotNull(
              value,
              r'DartEnum',
              'value',
            ),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'enumRef';
        enumRef.build();

        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartEnum',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartInstance extends DartInstance {
  @override
  final TypeReference classRef;
  @override
  final String constructor;
  @override
  final BuiltMap<String, DartValue> positionalArguments;
  @override
  final BuiltMap<String, DartValue> namedArguments;
  @override
  final TypeReference staticType;

  factory _$DartInstance([void Function(DartInstanceBuilder)? updates]) =>
      (DartInstanceBuilder()..update(updates))._build();

  _$DartInstance._({
    required this.classRef,
    required this.constructor,
    required this.positionalArguments,
    required this.namedArguments,
    required this.staticType,
  }) : super._();
  @override
  DartInstance rebuild(void Function(DartInstanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartInstanceBuilder toBuilder() => DartInstanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartInstance &&
        classRef == other.classRef &&
        constructor == other.constructor &&
        positionalArguments == other.positionalArguments &&
        namedArguments == other.namedArguments &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, classRef.hashCode);
    _$hash = $jc(_$hash, constructor.hashCode);
    _$hash = $jc(_$hash, positionalArguments.hashCode);
    _$hash = $jc(_$hash, namedArguments.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartInstance')
          ..add('classRef', classRef)
          ..add('constructor', constructor)
          ..add('positionalArguments', positionalArguments)
          ..add('namedArguments', namedArguments)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartInstanceBuilder
    implements Builder<DartInstance, DartInstanceBuilder> {
  _$DartInstance? _$v;

  TypeReferenceBuilder? _classRef;
  TypeReferenceBuilder get classRef =>
      _$this._classRef ??= TypeReferenceBuilder();
  set classRef(TypeReferenceBuilder? classRef) => _$this._classRef = classRef;

  String? _constructor;
  String? get constructor => _$this._constructor;
  set constructor(String? constructor) => _$this._constructor = constructor;

  MapBuilder<String, DartValue>? _positionalArguments;
  MapBuilder<String, DartValue> get positionalArguments =>
      _$this._positionalArguments ??= MapBuilder<String, DartValue>();
  set positionalArguments(MapBuilder<String, DartValue>? positionalArguments) =>
      _$this._positionalArguments = positionalArguments;

  MapBuilder<String, DartValue>? _namedArguments;
  MapBuilder<String, DartValue> get namedArguments =>
      _$this._namedArguments ??= MapBuilder<String, DartValue>();
  set namedArguments(MapBuilder<String, DartValue>? namedArguments) =>
      _$this._namedArguments = namedArguments;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartInstanceBuilder();

  DartInstanceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _classRef = $v.classRef.toBuilder();
      _constructor = $v.constructor;
      _positionalArguments = $v.positionalArguments.toBuilder();
      _namedArguments = $v.namedArguments.toBuilder();
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartInstance other) {
    _$v = other as _$DartInstance;
  }

  @override
  void update(void Function(DartInstanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartInstance build() => _build();

  _$DartInstance _build() {
    _$DartInstance _$result;
    try {
      _$result =
          _$v ??
          _$DartInstance._(
            classRef: classRef.build(),
            constructor: BuiltValueNullFieldError.checkNotNull(
              constructor,
              r'DartInstance',
              'constructor',
            ),
            positionalArguments: positionalArguments.build(),
            namedArguments: namedArguments.build(),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'classRef';
        classRef.build();

        _$failedField = 'positionalArguments';
        positionalArguments.build();
        _$failedField = 'namedArguments';
        namedArguments.build();
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartInstance',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartTypeLiteral extends DartTypeLiteral {
  @override
  final TypeReference type;
  @override
  final TypeReference staticType;

  factory _$DartTypeLiteral([void Function(DartTypeLiteralBuilder)? updates]) =>
      (DartTypeLiteralBuilder()..update(updates))._build();

  _$DartTypeLiteral._({required this.type, required this.staticType})
    : super._();
  @override
  DartTypeLiteral rebuild(void Function(DartTypeLiteralBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartTypeLiteralBuilder toBuilder() => DartTypeLiteralBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartTypeLiteral &&
        type == other.type &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartTypeLiteral')
          ..add('type', type)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartTypeLiteralBuilder
    implements Builder<DartTypeLiteral, DartTypeLiteralBuilder> {
  _$DartTypeLiteral? _$v;

  TypeReferenceBuilder? _type;
  TypeReferenceBuilder get type => _$this._type ??= TypeReferenceBuilder();
  set type(TypeReferenceBuilder? type) => _$this._type = type;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartTypeLiteralBuilder();

  DartTypeLiteralBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type.toBuilder();
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartTypeLiteral other) {
    _$v = other as _$DartTypeLiteral;
  }

  @override
  void update(void Function(DartTypeLiteralBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartTypeLiteral build() => _build();

  _$DartTypeLiteral _build() {
    _$DartTypeLiteral _$result;
    try {
      _$result =
          _$v ??
          _$DartTypeLiteral._(
            type: type.build(),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        type.build();
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartTypeLiteral',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DartSymbolLiteral extends DartSymbolLiteral {
  @override
  final String value;
  @override
  final TypeReference staticType;

  factory _$DartSymbolLiteral([
    void Function(DartSymbolLiteralBuilder)? updates,
  ]) => (DartSymbolLiteralBuilder()..update(updates))._build();

  _$DartSymbolLiteral._({required this.value, required this.staticType})
    : super._();
  @override
  DartSymbolLiteral rebuild(void Function(DartSymbolLiteralBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DartSymbolLiteralBuilder toBuilder() =>
      DartSymbolLiteralBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DartSymbolLiteral &&
        value == other.value &&
        staticType == other.staticType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, staticType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DartSymbolLiteral')
          ..add('value', value)
          ..add('staticType', staticType))
        .toString();
  }
}

class DartSymbolLiteralBuilder
    implements Builder<DartSymbolLiteral, DartSymbolLiteralBuilder> {
  _$DartSymbolLiteral? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  TypeReferenceBuilder? _staticType;
  TypeReferenceBuilder get staticType =>
      _$this._staticType ??= TypeReferenceBuilder();
  set staticType(TypeReferenceBuilder? staticType) =>
      _$this._staticType = staticType;

  DartSymbolLiteralBuilder();

  DartSymbolLiteralBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _staticType = $v.staticType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DartSymbolLiteral other) {
    _$v = other as _$DartSymbolLiteral;
  }

  @override
  void update(void Function(DartSymbolLiteralBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DartSymbolLiteral build() => _build();

  _$DartSymbolLiteral _build() {
    _$DartSymbolLiteral _$result;
    try {
      _$result =
          _$v ??
          _$DartSymbolLiteral._(
            value: BuiltValueNullFieldError.checkNotNull(
              value,
              r'DartSymbolLiteral',
              'value',
            ),
            staticType: staticType.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'staticType';
        staticType.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DartSymbolLiteral',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
