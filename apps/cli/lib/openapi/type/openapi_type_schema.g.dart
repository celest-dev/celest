// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi_type_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OpenApiTypeSchemaReference extends OpenApiTypeSchemaReference {
  @override
  final String name;
  @override
  final String ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;
  @override
  final OpenApiPrimitive? primitiveType;

  factory _$OpenApiTypeSchemaReference(
          [void Function(OpenApiTypeSchemaReferenceBuilder)? updates]) =>
      (new OpenApiTypeSchemaReferenceBuilder()..update(updates))._build();

  _$OpenApiTypeSchemaReference._(
      {required this.name,
      required this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable,
      this.primitiveType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'OpenApiTypeSchemaReference', 'name');
    BuiltValueNullFieldError.checkNotNull(
        ref, r'OpenApiTypeSchemaReference', 'ref');
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiTypeSchemaReference', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiTypeSchemaReference', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiTypeSchemaReference', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiTypeSchemaReference', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiTypeSchemaReference', 'extensions');
  }

  @override
  OpenApiTypeSchemaReference rebuild(
          void Function(OpenApiTypeSchemaReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiTypeSchemaReferenceBuilder toBuilder() =>
      new OpenApiTypeSchemaReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiTypeSchemaReference &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable &&
        primitiveType == other.primitiveType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, primitiveType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiTypeSchemaReference')
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable)
          ..add('primitiveType', primitiveType))
        .toString();
  }
}

class OpenApiTypeSchemaReferenceBuilder
    implements
        Builder<OpenApiTypeSchemaReference, OpenApiTypeSchemaReferenceBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiTypeSchemaReference? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiPrimitive? _primitiveType;
  OpenApiPrimitive? get primitiveType => _$this._primitiveType;
  set primitiveType(covariant OpenApiPrimitive? primitiveType) =>
      _$this._primitiveType = primitiveType;

  OpenApiTypeSchemaReferenceBuilder();

  OpenApiTypeSchemaReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _primitiveType = $v.primitiveType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiTypeSchemaReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiTypeSchemaReference;
  }

  @override
  void update(void Function(OpenApiTypeSchemaReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiTypeSchemaReference build() => _build();

  _$OpenApiTypeSchemaReference _build() {
    OpenApiTypeSchemaReference._finalize(this);
    _$OpenApiTypeSchemaReference _$result;
    try {
      _$result = _$v ??
          new _$OpenApiTypeSchemaReference._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'OpenApiTypeSchemaReference', 'name'),
              ref: BuiltValueNullFieldError.checkNotNull(
                  ref, r'OpenApiTypeSchemaReference', 'ref'),
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiTypeSchemaReference', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiTypeSchemaReference', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiTypeSchemaReference', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable,
              primitiveType: primitiveType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiTypeSchemaReference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiArrayTypeSchema extends OpenApiArrayTypeSchema {
  @override
  final bool uniqueItems;
  @override
  final OpenApiTypeSchema itemType;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiArrayTypeSchema(
          [void Function(OpenApiArrayTypeSchemaBuilder)? updates]) =>
      (new OpenApiArrayTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiArrayTypeSchema._(
      {required this.uniqueItems,
      required this.itemType,
      this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        uniqueItems, r'OpenApiArrayTypeSchema', 'uniqueItems');
    BuiltValueNullFieldError.checkNotNull(
        itemType, r'OpenApiArrayTypeSchema', 'itemType');
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiArrayTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiArrayTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiArrayTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiArrayTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiArrayTypeSchema', 'extensions');
  }

  @override
  OpenApiArrayTypeSchema rebuild(
          void Function(OpenApiArrayTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiArrayTypeSchemaBuilder toBuilder() =>
      new OpenApiArrayTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiArrayTypeSchema &&
        uniqueItems == other.uniqueItems &&
        itemType == other.itemType &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, uniqueItems.hashCode);
    _$hash = $jc(_$hash, itemType.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiArrayTypeSchema')
          ..add('uniqueItems', uniqueItems)
          ..add('itemType', itemType)
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiArrayTypeSchemaBuilder
    implements
        Builder<OpenApiArrayTypeSchema, OpenApiArrayTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiArrayTypeSchema? _$v;

  bool? _uniqueItems;
  bool? get uniqueItems => _$this._uniqueItems;
  set uniqueItems(covariant bool? uniqueItems) =>
      _$this._uniqueItems = uniqueItems;

  OpenApiTypeSchema? _itemType;
  OpenApiTypeSchema? get itemType => _$this._itemType;
  set itemType(covariant OpenApiTypeSchema? itemType) =>
      _$this._itemType = itemType;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiArrayTypeSchemaBuilder();

  OpenApiArrayTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uniqueItems = $v.uniqueItems;
      _itemType = $v.itemType;
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiArrayTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiArrayTypeSchema;
  }

  @override
  void update(void Function(OpenApiArrayTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiArrayTypeSchema build() => _build();

  _$OpenApiArrayTypeSchema _build() {
    _$OpenApiArrayTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiArrayTypeSchema._(
              uniqueItems: BuiltValueNullFieldError.checkNotNull(
                  uniqueItems, r'OpenApiArrayTypeSchema', 'uniqueItems'),
              itemType: BuiltValueNullFieldError.checkNotNull(
                  itemType, r'OpenApiArrayTypeSchema', 'itemType'),
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiArrayTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiArrayTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiArrayTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiArrayTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiBooleanTypeSchema extends OpenApiBooleanTypeSchema {
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiBooleanTypeSchema(
          [void Function(OpenApiBooleanTypeSchemaBuilder)? updates]) =>
      (new OpenApiBooleanTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiBooleanTypeSchema._(
      {this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiBooleanTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiBooleanTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiBooleanTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiBooleanTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiBooleanTypeSchema', 'extensions');
  }

  @override
  OpenApiBooleanTypeSchema rebuild(
          void Function(OpenApiBooleanTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiBooleanTypeSchemaBuilder toBuilder() =>
      new OpenApiBooleanTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiBooleanTypeSchema &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiBooleanTypeSchema')
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiBooleanTypeSchemaBuilder
    implements
        Builder<OpenApiBooleanTypeSchema, OpenApiBooleanTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiBooleanTypeSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiBooleanTypeSchemaBuilder();

  OpenApiBooleanTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiBooleanTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiBooleanTypeSchema;
  }

  @override
  void update(void Function(OpenApiBooleanTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiBooleanTypeSchema build() => _build();

  _$OpenApiBooleanTypeSchema _build() {
    _$OpenApiBooleanTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiBooleanTypeSchema._(
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiBooleanTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiBooleanTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiBooleanTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiBooleanTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiIntegerTypeSchema extends OpenApiIntegerTypeSchema {
  @override
  final String? format;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiIntegerTypeSchema(
          [void Function(OpenApiIntegerTypeSchemaBuilder)? updates]) =>
      (new OpenApiIntegerTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiIntegerTypeSchema._(
      {this.format,
      this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiIntegerTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiIntegerTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiIntegerTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiIntegerTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiIntegerTypeSchema', 'extensions');
  }

  @override
  OpenApiIntegerTypeSchema rebuild(
          void Function(OpenApiIntegerTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiIntegerTypeSchemaBuilder toBuilder() =>
      new OpenApiIntegerTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiIntegerTypeSchema &&
        format == other.format &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiIntegerTypeSchema')
          ..add('format', format)
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiIntegerTypeSchemaBuilder
    implements
        Builder<OpenApiIntegerTypeSchema, OpenApiIntegerTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiIntegerTypeSchema? _$v;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiIntegerTypeSchemaBuilder();

  OpenApiIntegerTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _format = $v.format;
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiIntegerTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiIntegerTypeSchema;
  }

  @override
  void update(void Function(OpenApiIntegerTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiIntegerTypeSchema build() => _build();

  _$OpenApiIntegerTypeSchema _build() {
    _$OpenApiIntegerTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiIntegerTypeSchema._(
              format: format,
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiIntegerTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiIntegerTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiIntegerTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiIntegerTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiNumberTypeSchema extends OpenApiNumberTypeSchema {
  @override
  final String? format;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiNumberTypeSchema(
          [void Function(OpenApiNumberTypeSchemaBuilder)? updates]) =>
      (new OpenApiNumberTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiNumberTypeSchema._(
      {this.format,
      this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiNumberTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiNumberTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiNumberTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiNumberTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiNumberTypeSchema', 'extensions');
  }

  @override
  OpenApiNumberTypeSchema rebuild(
          void Function(OpenApiNumberTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiNumberTypeSchemaBuilder toBuilder() =>
      new OpenApiNumberTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiNumberTypeSchema &&
        format == other.format &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiNumberTypeSchema')
          ..add('format', format)
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiNumberTypeSchemaBuilder
    implements
        Builder<OpenApiNumberTypeSchema, OpenApiNumberTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiNumberTypeSchema? _$v;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiNumberTypeSchemaBuilder();

  OpenApiNumberTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _format = $v.format;
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiNumberTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiNumberTypeSchema;
  }

  @override
  void update(void Function(OpenApiNumberTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiNumberTypeSchema build() => _build();

  _$OpenApiNumberTypeSchema _build() {
    _$OpenApiNumberTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiNumberTypeSchema._(
              format: format,
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiNumberTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiNumberTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiNumberTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiNumberTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiStringTypeSchema extends OpenApiStringTypeSchema {
  @override
  final String? format;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiStringTypeSchema(
          [void Function(OpenApiStringTypeSchemaBuilder)? updates]) =>
      (new OpenApiStringTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiStringTypeSchema._(
      {this.format,
      this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiStringTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiStringTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiStringTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiStringTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiStringTypeSchema', 'extensions');
  }

  @override
  OpenApiStringTypeSchema rebuild(
          void Function(OpenApiStringTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiStringTypeSchemaBuilder toBuilder() =>
      new OpenApiStringTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiStringTypeSchema &&
        format == other.format &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiStringTypeSchema')
          ..add('format', format)
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiStringTypeSchemaBuilder
    implements
        Builder<OpenApiStringTypeSchema, OpenApiStringTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiStringTypeSchema? _$v;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiStringTypeSchemaBuilder();

  OpenApiStringTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _format = $v.format;
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiStringTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiStringTypeSchema;
  }

  @override
  void update(void Function(OpenApiStringTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiStringTypeSchema build() => _build();

  _$OpenApiStringTypeSchema _build() {
    _$OpenApiStringTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiStringTypeSchema._(
              format: format,
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiStringTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiStringTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiStringTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiStringTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiEmptyTypeSchema extends OpenApiEmptyTypeSchema {
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiEmptyTypeSchema(
          [void Function(OpenApiEmptyTypeSchemaBuilder)? updates]) =>
      (new OpenApiEmptyTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiEmptyTypeSchema._(
      {this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiEmptyTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiEmptyTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiEmptyTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiEmptyTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiEmptyTypeSchema', 'extensions');
  }

  @override
  OpenApiEmptyTypeSchema rebuild(
          void Function(OpenApiEmptyTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiEmptyTypeSchemaBuilder toBuilder() =>
      new OpenApiEmptyTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiEmptyTypeSchema &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiEmptyTypeSchema')
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiEmptyTypeSchemaBuilder
    implements
        Builder<OpenApiEmptyTypeSchema, OpenApiEmptyTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiEmptyTypeSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiEmptyTypeSchemaBuilder();

  OpenApiEmptyTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiEmptyTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiEmptyTypeSchema;
  }

  @override
  void update(void Function(OpenApiEmptyTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiEmptyTypeSchema build() => _build();

  _$OpenApiEmptyTypeSchema _build() {
    _$OpenApiEmptyTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiEmptyTypeSchema._(
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiEmptyTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiEmptyTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiEmptyTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiEmptyTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiRecordTypeSchema extends OpenApiRecordTypeSchema {
  @override
  final OpenApiTypeSchema valueType;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiRecordTypeSchema(
          [void Function(OpenApiRecordTypeSchemaBuilder)? updates]) =>
      (new OpenApiRecordTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiRecordTypeSchema._(
      {required this.valueType,
      this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        valueType, r'OpenApiRecordTypeSchema', 'valueType');
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiRecordTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiRecordTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiRecordTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiRecordTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiRecordTypeSchema', 'extensions');
  }

  @override
  OpenApiRecordTypeSchema rebuild(
          void Function(OpenApiRecordTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiRecordTypeSchemaBuilder toBuilder() =>
      new OpenApiRecordTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiRecordTypeSchema &&
        valueType == other.valueType &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, valueType.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiRecordTypeSchema')
          ..add('valueType', valueType)
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiRecordTypeSchemaBuilder
    implements
        Builder<OpenApiRecordTypeSchema, OpenApiRecordTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiRecordTypeSchema? _$v;

  OpenApiTypeSchema? _valueType;
  OpenApiTypeSchema? get valueType => _$this._valueType;
  set valueType(covariant OpenApiTypeSchema? valueType) =>
      _$this._valueType = valueType;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiRecordTypeSchemaBuilder();

  OpenApiRecordTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _valueType = $v.valueType;
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiRecordTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiRecordTypeSchema;
  }

  @override
  void update(void Function(OpenApiRecordTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiRecordTypeSchema build() => _build();

  _$OpenApiRecordTypeSchema _build() {
    _$OpenApiRecordTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiRecordTypeSchema._(
              valueType: BuiltValueNullFieldError.checkNotNull(
                  valueType, r'OpenApiRecordTypeSchema', 'valueType'),
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiRecordTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiRecordTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiRecordTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiRecordTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiFieldSchema extends OpenApiFieldSchema {
  @override
  final String name;
  @override
  final OpenApiTypeSchema schema;

  factory _$OpenApiFieldSchema(
          [void Function(OpenApiFieldSchemaBuilder)? updates]) =>
      (new OpenApiFieldSchemaBuilder()..update(updates))._build();

  _$OpenApiFieldSchema._({required this.name, required this.schema})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OpenApiFieldSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiFieldSchema', 'schema');
  }

  @override
  OpenApiFieldSchema rebuild(
          void Function(OpenApiFieldSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiFieldSchemaBuilder toBuilder() =>
      new OpenApiFieldSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiFieldSchema &&
        name == other.name &&
        schema == other.schema;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiFieldSchema')
          ..add('name', name)
          ..add('schema', schema))
        .toString();
  }
}

class OpenApiFieldSchemaBuilder
    implements Builder<OpenApiFieldSchema, OpenApiFieldSchemaBuilder> {
  _$OpenApiFieldSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(OpenApiTypeSchema? schema) => _$this._schema = schema;

  OpenApiFieldSchemaBuilder();

  OpenApiFieldSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _schema = $v.schema;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiFieldSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiFieldSchema;
  }

  @override
  void update(void Function(OpenApiFieldSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiFieldSchema build() => _build();

  _$OpenApiFieldSchema _build() {
    final _$result = _$v ??
        new _$OpenApiFieldSchema._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiFieldSchema', 'name'),
            schema: BuiltValueNullFieldError.checkNotNull(
                schema, r'OpenApiFieldSchema', 'schema'));
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiStructTypeSchema extends OpenApiStructTypeSchema {
  @override
  final String? name;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, OpenApiFieldSchema> fields;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? ref;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiStructTypeSchema(
          [void Function(OpenApiStructTypeSchemaBuilder)? updates]) =>
      (new OpenApiStructTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiStructTypeSchema._(
      {this.name,
      required this.required,
      required this.fields,
      this.discriminator,
      this.ref,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiStructTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        fields, r'OpenApiStructTypeSchema', 'fields');
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiStructTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiStructTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiStructTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiStructTypeSchema', 'extensions');
  }

  @override
  OpenApiStructTypeSchema rebuild(
          void Function(OpenApiStructTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiStructTypeSchemaBuilder toBuilder() =>
      new OpenApiStructTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiStructTypeSchema &&
        name == other.name &&
        required == other.required &&
        fields == other.fields &&
        discriminator == other.discriminator &&
        ref == other.ref &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiStructTypeSchema')
          ..add('name', name)
          ..add('required', required)
          ..add('fields', fields)
          ..add('discriminator', discriminator)
          ..add('ref', ref)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiStructTypeSchemaBuilder
    implements
        Builder<OpenApiStructTypeSchema, OpenApiStructTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiStructTypeSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, OpenApiFieldSchema>? _fields;
  MapBuilder<String, OpenApiFieldSchema> get fields =>
      _$this._fields ??= new MapBuilder<String, OpenApiFieldSchema>();
  set fields(covariant MapBuilder<String, OpenApiFieldSchema>? fields) =>
      _$this._fields = fields;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiStructTypeSchemaBuilder();

  OpenApiStructTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _required = $v.required.toBuilder();
      _fields = $v.fields.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _ref = $v.ref;
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiStructTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiStructTypeSchema;
  }

  @override
  void update(void Function(OpenApiStructTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiStructTypeSchema build() => _build();

  _$OpenApiStructTypeSchema _build() {
    _$OpenApiStructTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiStructTypeSchema._(
              name: name,
              required: required.build(),
              fields: fields.build(),
              discriminator: _discriminator?.build(),
              ref: ref,
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiStructTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiStructTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiStructTypeSchema', 'writeOnly'),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'required';
        required.build();
        _$failedField = 'fields';
        fields.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiStructTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiNullTypeSchema extends OpenApiNullTypeSchema {
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiNullTypeSchema(
          [void Function(OpenApiNullTypeSchemaBuilder)? updates]) =>
      (new OpenApiNullTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiNullTypeSchema._(
      {this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiNullTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiNullTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiNullTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiNullTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiNullTypeSchema', 'extensions');
  }

  @override
  OpenApiNullTypeSchema rebuild(
          void Function(OpenApiNullTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiNullTypeSchemaBuilder toBuilder() =>
      new OpenApiNullTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiNullTypeSchema &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiNullTypeSchema')
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiNullTypeSchemaBuilder
    implements
        Builder<OpenApiNullTypeSchema, OpenApiNullTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiNullTypeSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiNullTypeSchemaBuilder();

  OpenApiNullTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiNullTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiNullTypeSchema;
  }

  @override
  void update(void Function(OpenApiNullTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiNullTypeSchema build() => _build();

  _$OpenApiNullTypeSchema _build() {
    _$OpenApiNullTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiNullTypeSchema._(
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiNullTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiNullTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiNullTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiNullTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSingleValueTypeSchema extends OpenApiSingleValueTypeSchema {
  @override
  final OpenApiTypeSchema baseType;
  @override
  final JsonObject value;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiSingleValueTypeSchema(
          [void Function(OpenApiSingleValueTypeSchemaBuilder)? updates]) =>
      (new OpenApiSingleValueTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiSingleValueTypeSchema._(
      {required this.baseType,
      required this.value,
      this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        baseType, r'OpenApiSingleValueTypeSchema', 'baseType');
    BuiltValueNullFieldError.checkNotNull(
        value, r'OpenApiSingleValueTypeSchema', 'value');
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiSingleValueTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiSingleValueTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiSingleValueTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiSingleValueTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiSingleValueTypeSchema', 'extensions');
  }

  @override
  OpenApiSingleValueTypeSchema rebuild(
          void Function(OpenApiSingleValueTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSingleValueTypeSchemaBuilder toBuilder() =>
      new OpenApiSingleValueTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSingleValueTypeSchema &&
        baseType == other.baseType &&
        value == other.value &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, baseType.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSingleValueTypeSchema')
          ..add('baseType', baseType)
          ..add('value', value)
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiSingleValueTypeSchemaBuilder
    implements
        Builder<OpenApiSingleValueTypeSchema,
            OpenApiSingleValueTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiSingleValueTypeSchema? _$v;

  OpenApiTypeSchema? _baseType;
  OpenApiTypeSchema? get baseType => _$this._baseType;
  set baseType(covariant OpenApiTypeSchema? baseType) =>
      _$this._baseType = baseType;

  JsonObject? _value;
  JsonObject? get value => _$this._value;
  set value(covariant JsonObject? value) => _$this._value = value;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiSingleValueTypeSchemaBuilder();

  OpenApiSingleValueTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _baseType = $v.baseType;
      _value = $v.value;
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiSingleValueTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSingleValueTypeSchema;
  }

  @override
  void update(void Function(OpenApiSingleValueTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSingleValueTypeSchema build() => _build();

  _$OpenApiSingleValueTypeSchema _build() {
    _$OpenApiSingleValueTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSingleValueTypeSchema._(
              baseType: BuiltValueNullFieldError.checkNotNull(
                  baseType, r'OpenApiSingleValueTypeSchema', 'baseType'),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'OpenApiSingleValueTypeSchema', 'value'),
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(isDeprecated,
                  r'OpenApiSingleValueTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiSingleValueTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiSingleValueTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSingleValueTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiEnumTypeSchema extends OpenApiEnumTypeSchema {
  @override
  final OpenApiTypeSchema baseType;
  @override
  final BuiltList<JsonObject> values;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiEnumTypeSchema(
          [void Function(OpenApiEnumTypeSchemaBuilder)? updates]) =>
      (new OpenApiEnumTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiEnumTypeSchema._(
      {required this.baseType,
      required this.values,
      this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        baseType, r'OpenApiEnumTypeSchema', 'baseType');
    BuiltValueNullFieldError.checkNotNull(
        values, r'OpenApiEnumTypeSchema', 'values');
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiEnumTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiEnumTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiEnumTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiEnumTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiEnumTypeSchema', 'extensions');
  }

  @override
  OpenApiEnumTypeSchema rebuild(
          void Function(OpenApiEnumTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiEnumTypeSchemaBuilder toBuilder() =>
      new OpenApiEnumTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiEnumTypeSchema &&
        baseType == other.baseType &&
        values == other.values &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, baseType.hashCode);
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiEnumTypeSchema')
          ..add('baseType', baseType)
          ..add('values', values)
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiEnumTypeSchemaBuilder
    implements
        Builder<OpenApiEnumTypeSchema, OpenApiEnumTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiEnumTypeSchema? _$v;

  OpenApiTypeSchema? _baseType;
  OpenApiTypeSchema? get baseType => _$this._baseType;
  set baseType(covariant OpenApiTypeSchema? baseType) =>
      _$this._baseType = baseType;

  ListBuilder<JsonObject>? _values;
  ListBuilder<JsonObject> get values =>
      _$this._values ??= new ListBuilder<JsonObject>();
  set values(covariant ListBuilder<JsonObject>? values) =>
      _$this._values = values;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiEnumTypeSchemaBuilder();

  OpenApiEnumTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _baseType = $v.baseType;
      _values = $v.values.toBuilder();
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiEnumTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiEnumTypeSchema;
  }

  @override
  void update(void Function(OpenApiEnumTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiEnumTypeSchema build() => _build();

  _$OpenApiEnumTypeSchema _build() {
    _$OpenApiEnumTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiEnumTypeSchema._(
              baseType: BuiltValueNullFieldError.checkNotNull(
                  baseType, r'OpenApiEnumTypeSchema', 'baseType'),
              values: values.build(),
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiEnumTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiEnumTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiEnumTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        values.build();

        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiEnumTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSumTypeSchema extends OpenApiSumTypeSchema {
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final BuiltList<OpenApiTypeSchema> types;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;
  @override
  final OpenApiPrimitive? primitiveType;

  factory _$OpenApiSumTypeSchema(
          [void Function(OpenApiSumTypeSchemaBuilder)? updates]) =>
      (new OpenApiSumTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiSumTypeSchema._(
      {this.discriminator,
      required this.types,
      this.name,
      this.ref,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable,
      this.primitiveType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        types, r'OpenApiSumTypeSchema', 'types');
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiSumTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiSumTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiSumTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiSumTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiSumTypeSchema', 'extensions');
  }

  @override
  OpenApiSumTypeSchema rebuild(
          void Function(OpenApiSumTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSumTypeSchemaBuilder toBuilder() =>
      new OpenApiSumTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSumTypeSchema &&
        discriminator == other.discriminator &&
        types == other.types &&
        name == other.name &&
        ref == other.ref &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable &&
        primitiveType == other.primitiveType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, types.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, primitiveType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSumTypeSchema')
          ..add('discriminator', discriminator)
          ..add('types', types)
          ..add('name', name)
          ..add('ref', ref)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable)
          ..add('primitiveType', primitiveType))
        .toString();
  }
}

class OpenApiSumTypeSchemaBuilder
    implements
        Builder<OpenApiSumTypeSchema, OpenApiSumTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiSumTypeSchema? _$v;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  ListBuilder<OpenApiTypeSchema>? _types;
  ListBuilder<OpenApiTypeSchema> get types =>
      _$this._types ??= new ListBuilder<OpenApiTypeSchema>();
  set types(covariant ListBuilder<OpenApiTypeSchema>? types) =>
      _$this._types = types;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiPrimitive? _primitiveType;
  OpenApiPrimitive? get primitiveType => _$this._primitiveType;
  set primitiveType(covariant OpenApiPrimitive? primitiveType) =>
      _$this._primitiveType = primitiveType;

  OpenApiSumTypeSchemaBuilder();

  OpenApiSumTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _discriminator = $v.discriminator?.toBuilder();
      _types = $v.types.toBuilder();
      _name = $v.name;
      _ref = $v.ref;
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _primitiveType = $v.primitiveType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiSumTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSumTypeSchema;
  }

  @override
  void update(void Function(OpenApiSumTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSumTypeSchema build() => _build();

  _$OpenApiSumTypeSchema _build() {
    _$OpenApiSumTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSumTypeSchema._(
              discriminator: _discriminator?.build(),
              types: types.build(),
              name: name,
              ref: ref,
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiSumTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiSumTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiSumTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable,
              primitiveType: primitiveType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();
        _$failedField = 'types';
        types.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSumTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiDisjointUnionTypeSchema extends OpenApiDisjointUnionTypeSchema {
  @override
  final BuiltList<OpenApiTypeSchema> types;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;
  @override
  final OpenApiPrimitive? primitiveType;

  factory _$OpenApiDisjointUnionTypeSchema(
          [void Function(OpenApiDisjointUnionTypeSchemaBuilder)? updates]) =>
      (new OpenApiDisjointUnionTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiDisjointUnionTypeSchema._(
      {required this.types,
      this.discriminator,
      this.name,
      this.ref,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable,
      this.primitiveType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        types, r'OpenApiDisjointUnionTypeSchema', 'types');
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiDisjointUnionTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiDisjointUnionTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiDisjointUnionTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiDisjointUnionTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiDisjointUnionTypeSchema', 'extensions');
  }

  @override
  OpenApiDisjointUnionTypeSchema rebuild(
          void Function(OpenApiDisjointUnionTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiDisjointUnionTypeSchemaBuilder toBuilder() =>
      new OpenApiDisjointUnionTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiDisjointUnionTypeSchema &&
        types == other.types &&
        discriminator == other.discriminator &&
        name == other.name &&
        ref == other.ref &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable &&
        primitiveType == other.primitiveType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, types.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jc(_$hash, primitiveType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiDisjointUnionTypeSchema')
          ..add('types', types)
          ..add('discriminator', discriminator)
          ..add('name', name)
          ..add('ref', ref)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable)
          ..add('primitiveType', primitiveType))
        .toString();
  }
}

class OpenApiDisjointUnionTypeSchemaBuilder
    implements
        Builder<OpenApiDisjointUnionTypeSchema,
            OpenApiDisjointUnionTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiDisjointUnionTypeSchema? _$v;

  ListBuilder<OpenApiTypeSchema>? _types;
  ListBuilder<OpenApiTypeSchema> get types =>
      _$this._types ??= new ListBuilder<OpenApiTypeSchema>();
  set types(covariant ListBuilder<OpenApiTypeSchema>? types) =>
      _$this._types = types;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiPrimitive? _primitiveType;
  OpenApiPrimitive? get primitiveType => _$this._primitiveType;
  set primitiveType(covariant OpenApiPrimitive? primitiveType) =>
      _$this._primitiveType = primitiveType;

  OpenApiDisjointUnionTypeSchemaBuilder();

  OpenApiDisjointUnionTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _types = $v.types.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _name = $v.name;
      _ref = $v.ref;
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _primitiveType = $v.primitiveType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiDisjointUnionTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiDisjointUnionTypeSchema;
  }

  @override
  void update(void Function(OpenApiDisjointUnionTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiDisjointUnionTypeSchema build() => _build();

  _$OpenApiDisjointUnionTypeSchema _build() {
    _$OpenApiDisjointUnionTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiDisjointUnionTypeSchema._(
              types: types.build(),
              discriminator: _discriminator?.build(),
              name: name,
              ref: ref,
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(isDeprecated,
                  r'OpenApiDisjointUnionTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiDisjointUnionTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiDisjointUnionTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable,
              primitiveType: primitiveType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'types';
        types.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiDisjointUnionTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiAnyTypeSchema extends OpenApiAnyTypeSchema {
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool isDeprecated;
  @override
  final JsonObject? defaultValue;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<String> required;
  @override
  final BuiltMap<String, JsonObject> extensions;
  @override
  final bool? isNullable;

  factory _$OpenApiAnyTypeSchema(
          [void Function(OpenApiAnyTypeSchemaBuilder)? updates]) =>
      (new OpenApiAnyTypeSchemaBuilder()..update(updates))._build();

  _$OpenApiAnyTypeSchema._(
      {this.name,
      this.ref,
      this.discriminator,
      this.title,
      this.description,
      required this.isDeprecated,
      this.defaultValue,
      required this.readOnly,
      required this.writeOnly,
      required this.required,
      required this.extensions,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isDeprecated, r'OpenApiAnyTypeSchema', 'isDeprecated');
    BuiltValueNullFieldError.checkNotNull(
        readOnly, r'OpenApiAnyTypeSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(
        writeOnly, r'OpenApiAnyTypeSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiAnyTypeSchema', 'required');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'OpenApiAnyTypeSchema', 'extensions');
  }

  @override
  OpenApiAnyTypeSchema rebuild(
          void Function(OpenApiAnyTypeSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiAnyTypeSchemaBuilder toBuilder() =>
      new OpenApiAnyTypeSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiAnyTypeSchema &&
        name == other.name &&
        ref == other.ref &&
        discriminator == other.discriminator &&
        title == other.title &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        required == other.required &&
        extensions == other.extensions &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiAnyTypeSchema')
          ..add('name', name)
          ..add('ref', ref)
          ..add('discriminator', discriminator)
          ..add('title', title)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('required', required)
          ..add('extensions', extensions)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OpenApiAnyTypeSchemaBuilder
    implements
        Builder<OpenApiAnyTypeSchema, OpenApiAnyTypeSchemaBuilder>,
        OpenApiTypeSchemaBuilder {
  _$OpenApiAnyTypeSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _isDeprecated;
  bool? get isDeprecated => _$this._isDeprecated;
  set isDeprecated(covariant bool? isDeprecated) =>
      _$this._isDeprecated = isDeprecated;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<String>? _required;
  ListBuilder<String> get required =>
      _$this._required ??= new ListBuilder<String>();
  set required(covariant ListBuilder<String>? required) =>
      _$this._required = required;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(covariant bool? isNullable) => _$this._isNullable = isNullable;

  OpenApiAnyTypeSchemaBuilder();

  OpenApiAnyTypeSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ref = $v.ref;
      _discriminator = $v.discriminator?.toBuilder();
      _title = $v.title;
      _description = $v.description;
      _isDeprecated = $v.isDeprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _required = $v.required.toBuilder();
      _extensions = $v.extensions.toBuilder();
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiAnyTypeSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiAnyTypeSchema;
  }

  @override
  void update(void Function(OpenApiAnyTypeSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiAnyTypeSchema build() => _build();

  _$OpenApiAnyTypeSchema _build() {
    _$OpenApiAnyTypeSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiAnyTypeSchema._(
              name: name,
              ref: ref,
              discriminator: _discriminator?.build(),
              title: title,
              description: description,
              isDeprecated: BuiltValueNullFieldError.checkNotNull(
                  isDeprecated, r'OpenApiAnyTypeSchema', 'isDeprecated'),
              defaultValue: defaultValue,
              readOnly: BuiltValueNullFieldError.checkNotNull(
                  readOnly, r'OpenApiAnyTypeSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(
                  writeOnly, r'OpenApiAnyTypeSchema', 'writeOnly'),
              required: required.build(),
              extensions: extensions.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'required';
        required.build();
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiAnyTypeSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
