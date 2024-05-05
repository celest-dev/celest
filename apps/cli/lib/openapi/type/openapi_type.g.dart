// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class DiscriminatorBuilder {
  void replace(Discriminator other);
  void update(void Function(DiscriminatorBuilder) updates);
}

class _$FieldDiscriminator extends FieldDiscriminator {
  @override
  final String wireName;
  @override
  final String dartName;
  @override
  final BuiltMap<String, OpenApiType> mapping;

  factory _$FieldDiscriminator(
          [void Function(FieldDiscriminatorBuilder)? updates]) =>
      (new FieldDiscriminatorBuilder()..update(updates))._build();

  _$FieldDiscriminator._(
      {required this.wireName, required this.dartName, required this.mapping})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        wireName, r'FieldDiscriminator', 'wireName');
    BuiltValueNullFieldError.checkNotNull(
        dartName, r'FieldDiscriminator', 'dartName');
    BuiltValueNullFieldError.checkNotNull(
        mapping, r'FieldDiscriminator', 'mapping');
  }

  @override
  FieldDiscriminator rebuild(
          void Function(FieldDiscriminatorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FieldDiscriminatorBuilder toBuilder() =>
      new FieldDiscriminatorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FieldDiscriminator &&
        wireName == other.wireName &&
        dartName == other.dartName &&
        mapping == other.mapping;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, wireName.hashCode);
    _$hash = $jc(_$hash, dartName.hashCode);
    _$hash = $jc(_$hash, mapping.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FieldDiscriminator')
          ..add('wireName', wireName)
          ..add('dartName', dartName)
          ..add('mapping', mapping))
        .toString();
  }
}

class FieldDiscriminatorBuilder
    implements
        Builder<FieldDiscriminator, FieldDiscriminatorBuilder>,
        DiscriminatorBuilder {
  _$FieldDiscriminator? _$v;

  String? _wireName;
  String? get wireName => _$this._wireName;
  set wireName(covariant String? wireName) => _$this._wireName = wireName;

  String? _dartName;
  String? get dartName => _$this._dartName;
  set dartName(covariant String? dartName) => _$this._dartName = dartName;

  MapBuilder<String, OpenApiType>? _mapping;
  MapBuilder<String, OpenApiType> get mapping =>
      _$this._mapping ??= new MapBuilder<String, OpenApiType>();
  set mapping(covariant MapBuilder<String, OpenApiType>? mapping) =>
      _$this._mapping = mapping;

  FieldDiscriminatorBuilder();

  FieldDiscriminatorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _wireName = $v.wireName;
      _dartName = $v.dartName;
      _mapping = $v.mapping.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FieldDiscriminator other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FieldDiscriminator;
  }

  @override
  void update(void Function(FieldDiscriminatorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FieldDiscriminator build() => _build();

  _$FieldDiscriminator _build() {
    _$FieldDiscriminator _$result;
    try {
      _$result = _$v ??
          new _$FieldDiscriminator._(
              wireName: BuiltValueNullFieldError.checkNotNull(
                  wireName, r'FieldDiscriminator', 'wireName'),
              dartName: BuiltValueNullFieldError.checkNotNull(
                  dartName, r'FieldDiscriminator', 'dartName'),
              mapping: mapping.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mapping';
        mapping.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FieldDiscriminator', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TypeDiscriminator extends TypeDiscriminator {
  @override
  final BuiltMap<Expression, OpenApiType> mapping;

  factory _$TypeDiscriminator(
          [void Function(TypeDiscriminatorBuilder)? updates]) =>
      (new TypeDiscriminatorBuilder()..update(updates))._build();

  _$TypeDiscriminator._({required this.mapping}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mapping, r'TypeDiscriminator', 'mapping');
  }

  @override
  TypeDiscriminator rebuild(void Function(TypeDiscriminatorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeDiscriminatorBuilder toBuilder() =>
      new TypeDiscriminatorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeDiscriminator && mapping == other.mapping;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mapping.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TypeDiscriminator')
          ..add('mapping', mapping))
        .toString();
  }
}

class TypeDiscriminatorBuilder
    implements
        Builder<TypeDiscriminator, TypeDiscriminatorBuilder>,
        DiscriminatorBuilder {
  _$TypeDiscriminator? _$v;

  MapBuilder<Expression, OpenApiType>? _mapping;
  MapBuilder<Expression, OpenApiType> get mapping =>
      _$this._mapping ??= new MapBuilder<Expression, OpenApiType>();
  set mapping(covariant MapBuilder<Expression, OpenApiType>? mapping) =>
      _$this._mapping = mapping;

  TypeDiscriminatorBuilder();

  TypeDiscriminatorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mapping = $v.mapping.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TypeDiscriminator other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeDiscriminator;
  }

  @override
  void update(void Function(TypeDiscriminatorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypeDiscriminator build() => _build();

  _$TypeDiscriminator _build() {
    _$TypeDiscriminator _$result;
    try {
      _$result = _$v ?? new _$TypeDiscriminator._(mapping: mapping.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mapping';
        mapping.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TypeDiscriminator', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiTypeReference extends OpenApiTypeReference {
  @override
  final bool isNullable;
  @override
  final OpenApiType? primitiveType;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiTypeReference(
          [void Function(OpenApiTypeReferenceBuilder)? updates]) =>
      (new OpenApiTypeReferenceBuilder()..update(updates))._build();

  _$OpenApiTypeReference._(
      {required this.isNullable,
      this.primitiveType,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiTypeReference', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiTypeReference', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiTypeReference', 'schema');
  }

  @override
  OpenApiTypeReference rebuild(
          void Function(OpenApiTypeReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiTypeReferenceBuilder toBuilder() =>
      new OpenApiTypeReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiTypeReference &&
        isNullable == other.isNullable &&
        primitiveType == other.primitiveType &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, primitiveType.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiTypeReference')
          ..add('isNullable', isNullable)
          ..add('primitiveType', primitiveType)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiTypeReferenceBuilder
    implements
        Builder<OpenApiTypeReference, OpenApiTypeReferenceBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiTypeReference? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiType? _primitiveType;
  OpenApiType? get primitiveType => _$this._primitiveType;
  set primitiveType(covariant OpenApiType? primitiveType) =>
      _$this._primitiveType = primitiveType;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiTypeReferenceBuilder();

  OpenApiTypeReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _primitiveType = $v.primitiveType;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiTypeReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiTypeReference;
  }

  @override
  void update(void Function(OpenApiTypeReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiTypeReference build() => _build();

  _$OpenApiTypeReference _build() {
    _$OpenApiTypeReference _$result;
    try {
      _$result = _$v ??
          new _$OpenApiTypeReference._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiTypeReference', 'isNullable'),
              primitiveType: primitiveType,
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiTypeReference', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiTypeReference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiIterableType extends OpenApiIterableType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;
  @override
  final OpenApiType itemType;

  factory _$OpenApiIterableType(
          [void Function(OpenApiIterableTypeBuilder)? updates]) =>
      (new OpenApiIterableTypeBuilder()..update(updates))._build();

  _$OpenApiIterableType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue,
      required this.itemType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiIterableType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiIterableType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiIterableType', 'schema');
    BuiltValueNullFieldError.checkNotNull(
        itemType, r'OpenApiIterableType', 'itemType');
  }

  @override
  OpenApiIterableType rebuild(
          void Function(OpenApiIterableTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiIterableTypeBuilder toBuilder() =>
      new OpenApiIterableTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiIterableType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue &&
        itemType == other.itemType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, itemType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiIterableType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue)
          ..add('itemType', itemType))
        .toString();
  }
}

class OpenApiIterableTypeBuilder
    implements
        Builder<OpenApiIterableType, OpenApiIterableTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiIterableType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiType? _itemType;
  OpenApiType? get itemType => _$this._itemType;
  set itemType(covariant OpenApiType? itemType) => _$this._itemType = itemType;

  OpenApiIterableTypeBuilder();

  OpenApiIterableTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _itemType = $v.itemType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiIterableType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiIterableType;
  }

  @override
  void update(void Function(OpenApiIterableTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiIterableType build() => _build();

  _$OpenApiIterableType _build() {
    _$OpenApiIterableType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiIterableType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiIterableType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiIterableType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue,
              itemType: BuiltValueNullFieldError.checkNotNull(
                  itemType, r'OpenApiIterableType', 'itemType'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiIterableType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiListType extends OpenApiListType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;
  @override
  final OpenApiType itemType;

  factory _$OpenApiListType([void Function(OpenApiListTypeBuilder)? updates]) =>
      (new OpenApiListTypeBuilder()..update(updates))._build();

  _$OpenApiListType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue,
      required this.itemType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiListType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiListType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(schema, r'OpenApiListType', 'schema');
    BuiltValueNullFieldError.checkNotNull(
        itemType, r'OpenApiListType', 'itemType');
  }

  @override
  OpenApiListType rebuild(void Function(OpenApiListTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiListTypeBuilder toBuilder() =>
      new OpenApiListTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiListType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue &&
        itemType == other.itemType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, itemType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiListType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue)
          ..add('itemType', itemType))
        .toString();
  }
}

class OpenApiListTypeBuilder
    implements
        Builder<OpenApiListType, OpenApiListTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiListType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiType? _itemType;
  OpenApiType? get itemType => _$this._itemType;
  set itemType(covariant OpenApiType? itemType) => _$this._itemType = itemType;

  OpenApiListTypeBuilder();

  OpenApiListTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _itemType = $v.itemType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiListType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiListType;
  }

  @override
  void update(void Function(OpenApiListTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiListType build() => _build();

  _$OpenApiListType _build() {
    _$OpenApiListType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiListType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiListType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiListType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue,
              itemType: BuiltValueNullFieldError.checkNotNull(
                  itemType, r'OpenApiListType', 'itemType'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiListType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSetType extends OpenApiSetType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;
  @override
  final OpenApiType itemType;

  factory _$OpenApiSetType([void Function(OpenApiSetTypeBuilder)? updates]) =>
      (new OpenApiSetTypeBuilder()..update(updates))._build();

  _$OpenApiSetType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue,
      required this.itemType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiSetType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiSetType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(schema, r'OpenApiSetType', 'schema');
    BuiltValueNullFieldError.checkNotNull(
        itemType, r'OpenApiSetType', 'itemType');
  }

  @override
  OpenApiSetType rebuild(void Function(OpenApiSetTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSetTypeBuilder toBuilder() =>
      new OpenApiSetTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSetType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue &&
        itemType == other.itemType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, itemType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSetType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue)
          ..add('itemType', itemType))
        .toString();
  }
}

class OpenApiSetTypeBuilder
    implements
        Builder<OpenApiSetType, OpenApiSetTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiSetType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiType? _itemType;
  OpenApiType? get itemType => _$this._itemType;
  set itemType(covariant OpenApiType? itemType) => _$this._itemType = itemType;

  OpenApiSetTypeBuilder();

  OpenApiSetTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _itemType = $v.itemType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiSetType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSetType;
  }

  @override
  void update(void Function(OpenApiSetTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSetType build() => _build();

  _$OpenApiSetType _build() {
    _$OpenApiSetType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSetType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiSetType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiSetType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue,
              itemType: BuiltValueNullFieldError.checkNotNull(
                  itemType, r'OpenApiSetType', 'itemType'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSetType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiBooleanType extends OpenApiBooleanType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiBooleanType(
          [void Function(OpenApiBooleanTypeBuilder)? updates]) =>
      (new OpenApiBooleanTypeBuilder()..update(updates))._build();

  _$OpenApiBooleanType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiBooleanType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiBooleanType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiBooleanType', 'schema');
  }

  @override
  OpenApiBooleanType rebuild(
          void Function(OpenApiBooleanTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiBooleanTypeBuilder toBuilder() =>
      new OpenApiBooleanTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiBooleanType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiBooleanType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiBooleanTypeBuilder
    implements
        Builder<OpenApiBooleanType, OpenApiBooleanTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiBooleanType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiBooleanTypeBuilder();

  OpenApiBooleanTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiBooleanType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiBooleanType;
  }

  @override
  void update(void Function(OpenApiBooleanTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiBooleanType build() => _build();

  _$OpenApiBooleanType _build() {
    _$OpenApiBooleanType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiBooleanType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiBooleanType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiBooleanType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiBooleanType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiNumberType extends OpenApiNumberType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiNumberType(
          [void Function(OpenApiNumberTypeBuilder)? updates]) =>
      (new OpenApiNumberTypeBuilder()..update(updates))._build();

  _$OpenApiNumberType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiNumberType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiNumberType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiNumberType', 'schema');
  }

  @override
  OpenApiNumberType rebuild(void Function(OpenApiNumberTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiNumberTypeBuilder toBuilder() =>
      new OpenApiNumberTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiNumberType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiNumberType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiNumberTypeBuilder
    implements
        Builder<OpenApiNumberType, OpenApiNumberTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiNumberType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiNumberTypeBuilder();

  OpenApiNumberTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiNumberType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiNumberType;
  }

  @override
  void update(void Function(OpenApiNumberTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiNumberType build() => _build();

  _$OpenApiNumberType _build() {
    _$OpenApiNumberType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiNumberType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiNumberType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiNumberType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiNumberType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiIntegerType extends OpenApiIntegerType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiIntegerType(
          [void Function(OpenApiIntegerTypeBuilder)? updates]) =>
      (new OpenApiIntegerTypeBuilder()..update(updates))._build();

  _$OpenApiIntegerType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiIntegerType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiIntegerType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiIntegerType', 'schema');
  }

  @override
  OpenApiIntegerType rebuild(
          void Function(OpenApiIntegerTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiIntegerTypeBuilder toBuilder() =>
      new OpenApiIntegerTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiIntegerType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiIntegerType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiIntegerTypeBuilder
    implements
        Builder<OpenApiIntegerType, OpenApiIntegerTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiIntegerType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiIntegerTypeBuilder();

  OpenApiIntegerTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiIntegerType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiIntegerType;
  }

  @override
  void update(void Function(OpenApiIntegerTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiIntegerType build() => _build();

  _$OpenApiIntegerType _build() {
    _$OpenApiIntegerType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiIntegerType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiIntegerType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiIntegerType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiIntegerType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiDoubleType extends OpenApiDoubleType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;
  @override
  final OpenApiInterfaceType? superType;

  factory _$OpenApiDoubleType(
          [void Function(OpenApiDoubleTypeBuilder)? updates]) =>
      (new OpenApiDoubleTypeBuilder()..update(updates))._build();

  _$OpenApiDoubleType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue,
      this.superType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiDoubleType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiDoubleType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiDoubleType', 'schema');
  }

  @override
  OpenApiDoubleType rebuild(void Function(OpenApiDoubleTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiDoubleTypeBuilder toBuilder() =>
      new OpenApiDoubleTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiDoubleType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue &&
        superType == other.superType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, superType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiDoubleType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue)
          ..add('superType', superType))
        .toString();
  }
}

class OpenApiDoubleTypeBuilder
    implements
        Builder<OpenApiDoubleType, OpenApiDoubleTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiDoubleType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiInterfaceType? _superType;
  OpenApiInterfaceType? get superType => _$this._superType;
  set superType(covariant OpenApiInterfaceType? superType) =>
      _$this._superType = superType;

  OpenApiDoubleTypeBuilder();

  OpenApiDoubleTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _superType = $v.superType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiDoubleType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiDoubleType;
  }

  @override
  void update(void Function(OpenApiDoubleTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiDoubleType build() => _build();

  _$OpenApiDoubleType _build() {
    _$OpenApiDoubleType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiDoubleType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiDoubleType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiDoubleType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue,
              superType: superType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiDoubleType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiStringType extends OpenApiStringType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiStringType(
          [void Function(OpenApiStringTypeBuilder)? updates]) =>
      (new OpenApiStringTypeBuilder()..update(updates))._build();

  _$OpenApiStringType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiStringType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiStringType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiStringType', 'schema');
  }

  @override
  OpenApiStringType rebuild(void Function(OpenApiStringTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiStringTypeBuilder toBuilder() =>
      new OpenApiStringTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiStringType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiStringType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiStringTypeBuilder
    implements
        Builder<OpenApiStringType, OpenApiStringTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiStringType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiStringTypeBuilder();

  OpenApiStringTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiStringType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiStringType;
  }

  @override
  void update(void Function(OpenApiStringTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiStringType build() => _build();

  _$OpenApiStringType _build() {
    _$OpenApiStringType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiStringType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiStringType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiStringType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiStringType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiEmptyType extends OpenApiEmptyType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiEmptyType(
          [void Function(OpenApiEmptyTypeBuilder)? updates]) =>
      (new OpenApiEmptyTypeBuilder()..update(updates))._build();

  _$OpenApiEmptyType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiEmptyType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiEmptyType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiEmptyType', 'schema');
  }

  @override
  OpenApiEmptyType rebuild(void Function(OpenApiEmptyTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiEmptyTypeBuilder toBuilder() =>
      new OpenApiEmptyTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiEmptyType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiEmptyType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiEmptyTypeBuilder
    implements
        Builder<OpenApiEmptyType, OpenApiEmptyTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiEmptyType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiEmptyTypeBuilder();

  OpenApiEmptyTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiEmptyType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiEmptyType;
  }

  @override
  void update(void Function(OpenApiEmptyTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiEmptyType build() => _build();

  _$OpenApiEmptyType _build() {
    _$OpenApiEmptyType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiEmptyType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiEmptyType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiEmptyType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiEmptyType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiRecordType extends OpenApiRecordType {
  @override
  final OpenApiType valueType;
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiRecordType(
          [void Function(OpenApiRecordTypeBuilder)? updates]) =>
      (new OpenApiRecordTypeBuilder()..update(updates))._build();

  _$OpenApiRecordType._(
      {required this.valueType,
      required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        valueType, r'OpenApiRecordType', 'valueType');
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiRecordType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiRecordType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiRecordType', 'schema');
  }

  @override
  OpenApiRecordType rebuild(void Function(OpenApiRecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiRecordTypeBuilder toBuilder() =>
      new OpenApiRecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiRecordType &&
        valueType == other.valueType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, valueType.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiRecordType')
          ..add('valueType', valueType)
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiRecordTypeBuilder
    implements
        Builder<OpenApiRecordType, OpenApiRecordTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiRecordType? _$v;

  OpenApiType? _valueType;
  OpenApiType? get valueType => _$this._valueType;
  set valueType(covariant OpenApiType? valueType) =>
      _$this._valueType = valueType;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiRecordTypeBuilder();

  OpenApiRecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _valueType = $v.valueType;
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiRecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiRecordType;
  }

  @override
  void update(void Function(OpenApiRecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiRecordType build() => _build();

  _$OpenApiRecordType _build() {
    _$OpenApiRecordType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiRecordType._(
              valueType: BuiltValueNullFieldError.checkNotNull(
                  valueType, r'OpenApiRecordType', 'valueType'),
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiRecordType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiRecordType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiRecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiField extends OpenApiField {
  @override
  final String name;
  @override
  final String dartName;
  @override
  final OpenApiType type;

  factory _$OpenApiField([void Function(OpenApiFieldBuilder)? updates]) =>
      (new OpenApiFieldBuilder()..update(updates))._build();

  _$OpenApiField._(
      {required this.name, required this.dartName, required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OpenApiField', 'name');
    BuiltValueNullFieldError.checkNotNull(
        dartName, r'OpenApiField', 'dartName');
    BuiltValueNullFieldError.checkNotNull(type, r'OpenApiField', 'type');
  }

  @override
  OpenApiField rebuild(void Function(OpenApiFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiFieldBuilder toBuilder() => new OpenApiFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiField &&
        name == other.name &&
        dartName == other.dartName &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, dartName.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiField')
          ..add('name', name)
          ..add('dartName', dartName)
          ..add('type', type))
        .toString();
  }
}

class OpenApiFieldBuilder
    implements Builder<OpenApiField, OpenApiFieldBuilder> {
  _$OpenApiField? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _dartName;
  String? get dartName => _$this._dartName;
  set dartName(String? dartName) => _$this._dartName = dartName;

  OpenApiType? _type;
  OpenApiType? get type => _$this._type;
  set type(OpenApiType? type) => _$this._type = type;

  OpenApiFieldBuilder();

  OpenApiFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _dartName = $v.dartName;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiField;
  }

  @override
  void update(void Function(OpenApiFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiField build() => _build();

  _$OpenApiField _build() {
    final _$result = _$v ??
        new _$OpenApiField._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiField', 'name'),
            dartName: BuiltValueNullFieldError.checkNotNull(
                dartName, r'OpenApiField', 'dartName'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'OpenApiField', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiStructType extends OpenApiStructType {
  @override
  final Discriminator? discriminator;
  @override
  final BuiltMap<String, OpenApiField> fields;
  @override
  final BuiltList<TypeReference> implements;
  @override
  final OpenApiInterfaceType superType;
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiStructType(
          [void Function(OpenApiStructTypeBuilder)? updates]) =>
      (new OpenApiStructTypeBuilder()..update(updates))._build();

  _$OpenApiStructType._(
      {this.discriminator,
      required this.fields,
      required this.implements,
      required this.superType,
      required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fields, r'OpenApiStructType', 'fields');
    BuiltValueNullFieldError.checkNotNull(
        implements, r'OpenApiStructType', 'implements');
    BuiltValueNullFieldError.checkNotNull(
        superType, r'OpenApiStructType', 'superType');
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiStructType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiStructType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiStructType', 'schema');
  }

  @override
  OpenApiStructType rebuild(void Function(OpenApiStructTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiStructTypeBuilder toBuilder() =>
      new OpenApiStructTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiStructType &&
        discriminator == other.discriminator &&
        fields == other.fields &&
        implements == other.implements &&
        superType == other.superType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, superType.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiStructType')
          ..add('discriminator', discriminator)
          ..add('fields', fields)
          ..add('implements', implements)
          ..add('superType', superType)
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiStructTypeBuilder
    implements
        Builder<OpenApiStructType, OpenApiStructTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiStructType? _$v;

  Discriminator? _discriminator;
  Discriminator? get discriminator => _$this._discriminator;
  set discriminator(covariant Discriminator? discriminator) =>
      _$this._discriminator = discriminator;

  MapBuilder<String, OpenApiField>? _fields;
  MapBuilder<String, OpenApiField> get fields =>
      _$this._fields ??= new MapBuilder<String, OpenApiField>();
  set fields(covariant MapBuilder<String, OpenApiField>? fields) =>
      _$this._fields = fields;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  OpenApiInterfaceType? _superType;
  OpenApiInterfaceType? get superType => _$this._superType;
  set superType(covariant OpenApiInterfaceType? superType) =>
      _$this._superType = superType;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiStructTypeBuilder();

  OpenApiStructTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _discriminator = $v.discriminator;
      _fields = $v.fields.toBuilder();
      _implements = $v.implements.toBuilder();
      _superType = $v.superType;
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiStructType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiStructType;
  }

  @override
  void update(void Function(OpenApiStructTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiStructType build() => _build();

  _$OpenApiStructType _build() {
    _$OpenApiStructType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiStructType._(
              discriminator: discriminator,
              fields: fields.build(),
              implements: implements.build(),
              superType: BuiltValueNullFieldError.checkNotNull(
                  superType, r'OpenApiStructType', 'superType'),
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiStructType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiStructType', 'schema'),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
        _$failedField = 'implements';
        implements.build();

        _$failedField = 'typeReference';
        typeReference.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiStructType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSealedBranch extends OpenApiSealedBranch {
  @override
  final String name;
  @override
  final OpenApiType type;

  factory _$OpenApiSealedBranch(
          [void Function(OpenApiSealedBranchBuilder)? updates]) =>
      (new OpenApiSealedBranchBuilder()..update(updates))._build();

  _$OpenApiSealedBranch._({required this.name, required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OpenApiSealedBranch', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'OpenApiSealedBranch', 'type');
  }

  @override
  OpenApiSealedBranch rebuild(
          void Function(OpenApiSealedBranchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSealedBranchBuilder toBuilder() =>
      new OpenApiSealedBranchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSealedBranch &&
        name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSealedBranch')
          ..add('name', name)
          ..add('type', type))
        .toString();
  }
}

class OpenApiSealedBranchBuilder
    implements Builder<OpenApiSealedBranch, OpenApiSealedBranchBuilder> {
  _$OpenApiSealedBranch? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  OpenApiType? _type;
  OpenApiType? get type => _$this._type;
  set type(OpenApiType? type) => _$this._type = type;

  OpenApiSealedBranchBuilder();

  OpenApiSealedBranchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiSealedBranch other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSealedBranch;
  }

  @override
  void update(void Function(OpenApiSealedBranchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSealedBranch build() => _build();

  _$OpenApiSealedBranch _build() {
    final _$result = _$v ??
        new _$OpenApiSealedBranch._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiSealedBranch', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'OpenApiSealedBranch', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSealedType extends OpenApiSealedType {
  @override
  final Discriminator discriminator;
  @override
  final BuiltList<OpenApiSealedBranch> branches;
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiSealedType(
          [void Function(OpenApiSealedTypeBuilder)? updates]) =>
      (new OpenApiSealedTypeBuilder()..update(updates))._build();

  _$OpenApiSealedType._(
      {required this.discriminator,
      required this.branches,
      required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        discriminator, r'OpenApiSealedType', 'discriminator');
    BuiltValueNullFieldError.checkNotNull(
        branches, r'OpenApiSealedType', 'branches');
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiSealedType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiSealedType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiSealedType', 'schema');
  }

  @override
  OpenApiSealedType rebuild(void Function(OpenApiSealedTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSealedTypeBuilder toBuilder() =>
      new OpenApiSealedTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSealedType &&
        discriminator == other.discriminator &&
        branches == other.branches &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, branches.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSealedType')
          ..add('discriminator', discriminator)
          ..add('branches', branches)
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiSealedTypeBuilder
    implements
        Builder<OpenApiSealedType, OpenApiSealedTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiSealedType? _$v;

  Discriminator? _discriminator;
  Discriminator? get discriminator => _$this._discriminator;
  set discriminator(covariant Discriminator? discriminator) =>
      _$this._discriminator = discriminator;

  ListBuilder<OpenApiSealedBranch>? _branches;
  ListBuilder<OpenApiSealedBranch> get branches =>
      _$this._branches ??= new ListBuilder<OpenApiSealedBranch>();
  set branches(covariant ListBuilder<OpenApiSealedBranch>? branches) =>
      _$this._branches = branches;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiSealedTypeBuilder();

  OpenApiSealedTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _discriminator = $v.discriminator;
      _branches = $v.branches.toBuilder();
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiSealedType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSealedType;
  }

  @override
  void update(void Function(OpenApiSealedTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSealedType build() => _build();

  _$OpenApiSealedType _build() {
    _$OpenApiSealedType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSealedType._(
              discriminator: BuiltValueNullFieldError.checkNotNull(
                  discriminator, r'OpenApiSealedType', 'discriminator'),
              branches: branches.build(),
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiSealedType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiSealedType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'branches';
        branches.build();

        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSealedType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiNullType extends OpenApiNullType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiNullType([void Function(OpenApiNullTypeBuilder)? updates]) =>
      (new OpenApiNullTypeBuilder()..update(updates))._build();

  _$OpenApiNullType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiNullType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiNullType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(schema, r'OpenApiNullType', 'schema');
  }

  @override
  OpenApiNullType rebuild(void Function(OpenApiNullTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiNullTypeBuilder toBuilder() =>
      new OpenApiNullTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiNullType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiNullType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiNullTypeBuilder
    implements
        Builder<OpenApiNullType, OpenApiNullTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiNullType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiNullTypeBuilder();

  OpenApiNullTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiNullType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiNullType;
  }

  @override
  void update(void Function(OpenApiNullTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiNullType build() => _build();

  _$OpenApiNullType _build() {
    _$OpenApiNullType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiNullType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiNullType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiNullType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiNullType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSingleValueType extends OpenApiSingleValueType {
  @override
  final OpenApiPrimitiveType baseType;
  @override
  final Object value;
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiSingleValueType(
          [void Function(OpenApiSingleValueTypeBuilder)? updates]) =>
      (new OpenApiSingleValueTypeBuilder()..update(updates))._build();

  _$OpenApiSingleValueType._(
      {required this.baseType,
      required this.value,
      required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        baseType, r'OpenApiSingleValueType', 'baseType');
    BuiltValueNullFieldError.checkNotNull(
        value, r'OpenApiSingleValueType', 'value');
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiSingleValueType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiSingleValueType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiSingleValueType', 'schema');
  }

  @override
  OpenApiSingleValueType rebuild(
          void Function(OpenApiSingleValueTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSingleValueTypeBuilder toBuilder() =>
      new OpenApiSingleValueTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSingleValueType &&
        baseType == other.baseType &&
        value == other.value &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, baseType.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSingleValueType')
          ..add('baseType', baseType)
          ..add('value', value)
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiSingleValueTypeBuilder
    implements
        Builder<OpenApiSingleValueType, OpenApiSingleValueTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiSingleValueType? _$v;

  OpenApiPrimitiveType? _baseType;
  OpenApiPrimitiveType? get baseType => _$this._baseType;
  set baseType(covariant OpenApiPrimitiveType? baseType) =>
      _$this._baseType = baseType;

  Object? _value;
  Object? get value => _$this._value;
  set value(covariant Object? value) => _$this._value = value;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiSingleValueTypeBuilder();

  OpenApiSingleValueTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _baseType = $v.baseType;
      _value = $v.value;
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiSingleValueType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSingleValueType;
  }

  @override
  void update(void Function(OpenApiSingleValueTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSingleValueType build() => _build();

  _$OpenApiSingleValueType _build() {
    _$OpenApiSingleValueType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSingleValueType._(
              baseType: BuiltValueNullFieldError.checkNotNull(
                  baseType, r'OpenApiSingleValueType', 'baseType'),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'OpenApiSingleValueType', 'value'),
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiSingleValueType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiSingleValueType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSingleValueType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiEnumType extends OpenApiEnumType {
  @override
  final OpenApiPrimitiveType baseType;
  @override
  final BuiltList<Object> values;
  @override
  final bool isNullable;
  @override
  final OpenApiType? primitiveType;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;
  @override
  final OpenApiInterfaceType? superType;

  factory _$OpenApiEnumType([void Function(OpenApiEnumTypeBuilder)? updates]) =>
      (new OpenApiEnumTypeBuilder()..update(updates))._build();

  _$OpenApiEnumType._(
      {required this.baseType,
      required this.values,
      required this.isNullable,
      this.primitiveType,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue,
      this.superType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        baseType, r'OpenApiEnumType', 'baseType');
    BuiltValueNullFieldError.checkNotNull(values, r'OpenApiEnumType', 'values');
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiEnumType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiEnumType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(schema, r'OpenApiEnumType', 'schema');
  }

  @override
  OpenApiEnumType rebuild(void Function(OpenApiEnumTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiEnumTypeBuilder toBuilder() =>
      new OpenApiEnumTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiEnumType &&
        baseType == other.baseType &&
        values == other.values &&
        isNullable == other.isNullable &&
        primitiveType == other.primitiveType &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue &&
        superType == other.superType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, baseType.hashCode);
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, primitiveType.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, superType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiEnumType')
          ..add('baseType', baseType)
          ..add('values', values)
          ..add('isNullable', isNullable)
          ..add('primitiveType', primitiveType)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue)
          ..add('superType', superType))
        .toString();
  }
}

class OpenApiEnumTypeBuilder
    implements
        Builder<OpenApiEnumType, OpenApiEnumTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiEnumType? _$v;

  OpenApiPrimitiveType? _baseType;
  OpenApiPrimitiveType? get baseType => _$this._baseType;
  set baseType(covariant OpenApiPrimitiveType? baseType) =>
      _$this._baseType = baseType;

  ListBuilder<Object>? _values;
  ListBuilder<Object> get values =>
      _$this._values ??= new ListBuilder<Object>();
  set values(covariant ListBuilder<Object>? values) => _$this._values = values;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiType? _primitiveType;
  OpenApiType? get primitiveType => _$this._primitiveType;
  set primitiveType(covariant OpenApiType? primitiveType) =>
      _$this._primitiveType = primitiveType;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiInterfaceType? _superType;
  OpenApiInterfaceType? get superType => _$this._superType;
  set superType(covariant OpenApiInterfaceType? superType) =>
      _$this._superType = superType;

  OpenApiEnumTypeBuilder();

  OpenApiEnumTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _baseType = $v.baseType;
      _values = $v.values.toBuilder();
      _isNullable = $v.isNullable;
      _primitiveType = $v.primitiveType;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _superType = $v.superType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiEnumType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiEnumType;
  }

  @override
  void update(void Function(OpenApiEnumTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiEnumType build() => _build();

  _$OpenApiEnumType _build() {
    _$OpenApiEnumType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiEnumType._(
              baseType: BuiltValueNullFieldError.checkNotNull(
                  baseType, r'OpenApiEnumType', 'baseType'),
              values: values.build(),
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiEnumType', 'isNullable'),
              primitiveType: primitiveType,
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiEnumType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue,
              superType: superType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        values.build();

        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiEnumType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiAnyType extends OpenApiAnyType {
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiAnyType([void Function(OpenApiAnyTypeBuilder)? updates]) =>
      (new OpenApiAnyTypeBuilder()..update(updates))._build();

  _$OpenApiAnyType._(
      {required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiAnyType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiAnyType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(schema, r'OpenApiAnyType', 'schema');
  }

  @override
  OpenApiAnyType rebuild(void Function(OpenApiAnyTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiAnyTypeBuilder toBuilder() =>
      new OpenApiAnyTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiAnyType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiAnyType')
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiAnyTypeBuilder
    implements
        Builder<OpenApiAnyType, OpenApiAnyTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiAnyType? _$v;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiAnyTypeBuilder();

  OpenApiAnyTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiAnyType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiAnyType;
  }

  @override
  void update(void Function(OpenApiAnyTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiAnyType build() => _build();

  _$OpenApiAnyType _build() {
    _$OpenApiAnyType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiAnyType._(
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiAnyType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiAnyType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiAnyType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiDateType extends OpenApiDateType {
  @override
  final OpenApiPrimitiveType primitiveType;
  @override
  final bool isNullable;
  @override
  final TypeReference typeReference;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltList<TypeReference>? implements;
  @override
  final String? docs;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;

  factory _$OpenApiDateType([void Function(OpenApiDateTypeBuilder)? updates]) =>
      (new OpenApiDateTypeBuilder()..update(updates))._build();

  _$OpenApiDateType._(
      {required this.primitiveType,
      required this.isNullable,
      required this.typeReference,
      required this.schema,
      this.implements,
      this.docs,
      this.deprecated,
      this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        primitiveType, r'OpenApiDateType', 'primitiveType');
    BuiltValueNullFieldError.checkNotNull(
        isNullable, r'OpenApiDateType', 'isNullable');
    BuiltValueNullFieldError.checkNotNull(
        typeReference, r'OpenApiDateType', 'typeReference');
    BuiltValueNullFieldError.checkNotNull(schema, r'OpenApiDateType', 'schema');
  }

  @override
  OpenApiDateType rebuild(void Function(OpenApiDateTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiDateTypeBuilder toBuilder() =>
      new OpenApiDateTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiDateType &&
        primitiveType == other.primitiveType &&
        isNullable == other.isNullable &&
        typeReference == other.typeReference &&
        schema == other.schema &&
        implements == other.implements &&
        docs == other.docs &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, primitiveType.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, typeReference.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, implements.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiDateType')
          ..add('primitiveType', primitiveType)
          ..add('isNullable', isNullable)
          ..add('typeReference', typeReference)
          ..add('schema', schema)
          ..add('implements', implements)
          ..add('docs', docs)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class OpenApiDateTypeBuilder
    implements
        Builder<OpenApiDateType, OpenApiDateTypeBuilder>,
        OpenApiTypeBuilder {
  _$OpenApiDateType? _$v;

  OpenApiPrimitiveType? _primitiveType;
  OpenApiPrimitiveType? get primitiveType => _$this._primitiveType;
  set primitiveType(covariant OpenApiPrimitiveType? primitiveType) =>
      _$this._primitiveType = primitiveType;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  TypeReferenceBuilder? _typeReference;
  TypeReferenceBuilder get typeReference =>
      _$this._typeReference ??= new TypeReferenceBuilder();
  set typeReference(covariant TypeReferenceBuilder? typeReference) =>
      _$this._typeReference = typeReference;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(covariant OpenApiTypeSchema? schema) => _$this._schema = schema;

  ListBuilder<TypeReference>? _implements;
  ListBuilder<TypeReference> get implements =>
      _$this._implements ??= new ListBuilder<TypeReference>();
  set implements(covariant ListBuilder<TypeReference>? implements) =>
      _$this._implements = implements;

  String? _docs;
  String? get docs => _$this._docs;
  set docs(covariant String? docs) => _$this._docs = docs;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  OpenApiDateTypeBuilder();

  OpenApiDateTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _primitiveType = $v.primitiveType;
      _isNullable = $v.isNullable;
      _typeReference = $v.typeReference.toBuilder();
      _schema = $v.schema;
      _implements = $v.implements?.toBuilder();
      _docs = $v.docs;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiDateType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiDateType;
  }

  @override
  void update(void Function(OpenApiDateTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiDateType build() => _build();

  _$OpenApiDateType _build() {
    _$OpenApiDateType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiDateType._(
              primitiveType: BuiltValueNullFieldError.checkNotNull(
                  primitiveType, r'OpenApiDateType', 'primitiveType'),
              isNullable: BuiltValueNullFieldError.checkNotNull(
                  isNullable, r'OpenApiDateType', 'isNullable'),
              typeReference: typeReference.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiDateType', 'schema'),
              implements: _implements?.build(),
              docs: docs,
              deprecated: deprecated,
              defaultValue: defaultValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeReference';
        typeReference.build();

        _$failedField = 'implements';
        _implements?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiDateType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
