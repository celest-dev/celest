// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectAst _$ProjectAstFromJson(Map<String, dynamic> json) {
  return _ProjectAst.fromJson(json);
}

/// @nodoc
mixin _$ProjectAst {
  String get projectClass => throw _privateConstructorUsedError;
  List<ApiAst> get apis => throw _privateConstructorUsedError;
  @ignore
  ClassElement? get element => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectAstCopyWith<ProjectAst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectAstCopyWith<$Res> {
  factory $ProjectAstCopyWith(
          ProjectAst value, $Res Function(ProjectAst) then) =
      _$ProjectAstCopyWithImpl<$Res, ProjectAst>;
  @useResult
  $Res call(
      {String projectClass, List<ApiAst> apis, @ignore ClassElement? element});
}

/// @nodoc
class _$ProjectAstCopyWithImpl<$Res, $Val extends ProjectAst>
    implements $ProjectAstCopyWith<$Res> {
  _$ProjectAstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectClass = null,
    Object? apis = null,
    Object? element = freezed,
  }) {
    return _then(_value.copyWith(
      projectClass: null == projectClass
          ? _value.projectClass
          : projectClass // ignore: cast_nullable_to_non_nullable
              as String,
      apis: null == apis
          ? _value.apis
          : apis // ignore: cast_nullable_to_non_nullable
              as List<ApiAst>,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ClassElement?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectAstImplCopyWith<$Res>
    implements $ProjectAstCopyWith<$Res> {
  factory _$$ProjectAstImplCopyWith(
          _$ProjectAstImpl value, $Res Function(_$ProjectAstImpl) then) =
      __$$ProjectAstImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectClass, List<ApiAst> apis, @ignore ClassElement? element});
}

/// @nodoc
class __$$ProjectAstImplCopyWithImpl<$Res>
    extends _$ProjectAstCopyWithImpl<$Res, _$ProjectAstImpl>
    implements _$$ProjectAstImplCopyWith<$Res> {
  __$$ProjectAstImplCopyWithImpl(
      _$ProjectAstImpl _value, $Res Function(_$ProjectAstImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectClass = null,
    Object? apis = null,
    Object? element = freezed,
  }) {
    return _then(_$ProjectAstImpl(
      projectClass: null == projectClass
          ? _value.projectClass
          : projectClass // ignore: cast_nullable_to_non_nullable
              as String,
      apis: null == apis
          ? _value._apis
          : apis // ignore: cast_nullable_to_non_nullable
              as List<ApiAst>,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ClassElement?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectAstImpl extends _ProjectAst {
  const _$ProjectAstImpl(
      {required this.projectClass,
      required final List<ApiAst> apis,
      @ignore this.element})
      : _apis = apis,
        super._();

  factory _$ProjectAstImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectAstImplFromJson(json);

  @override
  final String projectClass;
  final List<ApiAst> _apis;
  @override
  List<ApiAst> get apis {
    if (_apis is EqualUnmodifiableListView) return _apis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apis);
  }

  @override
  @ignore
  final ClassElement? element;

  @override
  String toString() {
    return 'ProjectAst(projectClass: $projectClass, apis: $apis, element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectAstImpl &&
            (identical(other.projectClass, projectClass) ||
                other.projectClass == projectClass) &&
            const DeepCollectionEquality().equals(other._apis, _apis) &&
            (identical(other.element, element) || other.element == element));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectClass,
      const DeepCollectionEquality().hash(_apis), element);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectAstImplCopyWith<_$ProjectAstImpl> get copyWith =>
      __$$ProjectAstImplCopyWithImpl<_$ProjectAstImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectAstImplToJson(
      this,
    );
  }
}

abstract class _ProjectAst extends ProjectAst {
  const factory _ProjectAst(
      {required final String projectClass,
      required final List<ApiAst> apis,
      @ignore final ClassElement? element}) = _$ProjectAstImpl;
  const _ProjectAst._() : super._();

  factory _ProjectAst.fromJson(Map<String, dynamic> json) =
      _$ProjectAstImpl.fromJson;

  @override
  String get projectClass;
  @override
  List<ApiAst> get apis;
  @override
  @ignore
  ClassElement? get element;
  @override
  @JsonKey(ignore: true)
  _$$ProjectAstImplCopyWith<_$ProjectAstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiAst _$ApiAstFromJson(Map<String, dynamic> json) {
  return _ApiAst.fromJson(json);
}

/// @nodoc
mixin _$ApiAst {
  String get name => throw _privateConstructorUsedError;
  List<ApiMetdataAst> get metadata => throw _privateConstructorUsedError;
  List<FunctionAst> get functions => throw _privateConstructorUsedError;
  @ignore
  LibraryElement? get element => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiAstCopyWith<ApiAst> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiAstCopyWith<$Res> {
  factory $ApiAstCopyWith(ApiAst value, $Res Function(ApiAst) then) =
      _$ApiAstCopyWithImpl<$Res, ApiAst>;
  @useResult
  $Res call(
      {String name,
      List<ApiMetdataAst> metadata,
      List<FunctionAst> functions,
      @ignore LibraryElement? element});
}

/// @nodoc
class _$ApiAstCopyWithImpl<$Res, $Val extends ApiAst>
    implements $ApiAstCopyWith<$Res> {
  _$ApiAstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? metadata = null,
    Object? functions = null,
    Object? element = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<ApiMetdataAst>,
      functions: null == functions
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as List<FunctionAst>,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as LibraryElement?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiAstImplCopyWith<$Res> implements $ApiAstCopyWith<$Res> {
  factory _$$ApiAstImplCopyWith(
          _$ApiAstImpl value, $Res Function(_$ApiAstImpl) then) =
      __$$ApiAstImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<ApiMetdataAst> metadata,
      List<FunctionAst> functions,
      @ignore LibraryElement? element});
}

/// @nodoc
class __$$ApiAstImplCopyWithImpl<$Res>
    extends _$ApiAstCopyWithImpl<$Res, _$ApiAstImpl>
    implements _$$ApiAstImplCopyWith<$Res> {
  __$$ApiAstImplCopyWithImpl(
      _$ApiAstImpl _value, $Res Function(_$ApiAstImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? metadata = null,
    Object? functions = null,
    Object? element = freezed,
  }) {
    return _then(_$ApiAstImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<ApiMetdataAst>,
      functions: null == functions
          ? _value._functions
          : functions // ignore: cast_nullable_to_non_nullable
              as List<FunctionAst>,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as LibraryElement?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiAstImpl extends _ApiAst {
  const _$ApiAstImpl(
      {required this.name,
      required final List<ApiMetdataAst> metadata,
      required final List<FunctionAst> functions,
      @ignore this.element})
      : _metadata = metadata,
        _functions = functions,
        super._();

  factory _$ApiAstImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiAstImplFromJson(json);

  @override
  final String name;
  final List<ApiMetdataAst> _metadata;
  @override
  List<ApiMetdataAst> get metadata {
    if (_metadata is EqualUnmodifiableListView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metadata);
  }

  final List<FunctionAst> _functions;
  @override
  List<FunctionAst> get functions {
    if (_functions is EqualUnmodifiableListView) return _functions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_functions);
  }

  @override
  @ignore
  final LibraryElement? element;

  @override
  String toString() {
    return 'ApiAst(name: $name, metadata: $metadata, functions: $functions, element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiAstImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality()
                .equals(other._functions, _functions) &&
            (identical(other.element, element) || other.element == element));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_metadata),
      const DeepCollectionEquality().hash(_functions),
      element);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiAstImplCopyWith<_$ApiAstImpl> get copyWith =>
      __$$ApiAstImplCopyWithImpl<_$ApiAstImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiAstImplToJson(
      this,
    );
  }
}

abstract class _ApiAst extends ApiAst {
  const factory _ApiAst(
      {required final String name,
      required final List<ApiMetdataAst> metadata,
      required final List<FunctionAst> functions,
      @ignore final LibraryElement? element}) = _$ApiAstImpl;
  const _ApiAst._() : super._();

  factory _ApiAst.fromJson(Map<String, dynamic> json) = _$ApiAstImpl.fromJson;

  @override
  String get name;
  @override
  List<ApiMetdataAst> get metadata;
  @override
  List<FunctionAst> get functions;
  @override
  @ignore
  LibraryElement? get element;
  @override
  @JsonKey(ignore: true)
  _$$ApiAstImplCopyWith<_$ApiAstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FunctionAst _$FunctionAstFromJson(Map<String, dynamic> json) {
  return _FunctionAst.fromJson(json);
}

/// @nodoc
mixin _$FunctionAst {
  String get name => throw _privateConstructorUsedError;
  List<ParameterAst> get parameters => throw _privateConstructorUsedError;
  TypeAst get returnType => throw _privateConstructorUsedError;
  SourceLocation get location => throw _privateConstructorUsedError;
  List<ApiMetdataAst> get metadata => throw _privateConstructorUsedError;
  @ignore
  FunctionElement? get element => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FunctionAstCopyWith<FunctionAst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunctionAstCopyWith<$Res> {
  factory $FunctionAstCopyWith(
          FunctionAst value, $Res Function(FunctionAst) then) =
      _$FunctionAstCopyWithImpl<$Res, FunctionAst>;
  @useResult
  $Res call(
      {String name,
      List<ParameterAst> parameters,
      TypeAst returnType,
      SourceLocation location,
      List<ApiMetdataAst> metadata,
      @ignore FunctionElement? element});

  $TypeAstCopyWith<$Res> get returnType;
  $SourceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$FunctionAstCopyWithImpl<$Res, $Val extends FunctionAst>
    implements $FunctionAstCopyWith<$Res> {
  _$FunctionAstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? parameters = null,
    Object? returnType = null,
    Object? location = null,
    Object? metadata = null,
    Object? element = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parameters: null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<ParameterAst>,
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as TypeAst,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceLocation,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<ApiMetdataAst>,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as FunctionElement?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeAstCopyWith<$Res> get returnType {
    return $TypeAstCopyWith<$Res>(_value.returnType, (value) {
      return _then(_value.copyWith(returnType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceLocationCopyWith<$Res> get location {
    return $SourceLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FunctionAstImplCopyWith<$Res>
    implements $FunctionAstCopyWith<$Res> {
  factory _$$FunctionAstImplCopyWith(
          _$FunctionAstImpl value, $Res Function(_$FunctionAstImpl) then) =
      __$$FunctionAstImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<ParameterAst> parameters,
      TypeAst returnType,
      SourceLocation location,
      List<ApiMetdataAst> metadata,
      @ignore FunctionElement? element});

  @override
  $TypeAstCopyWith<$Res> get returnType;
  @override
  $SourceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$FunctionAstImplCopyWithImpl<$Res>
    extends _$FunctionAstCopyWithImpl<$Res, _$FunctionAstImpl>
    implements _$$FunctionAstImplCopyWith<$Res> {
  __$$FunctionAstImplCopyWithImpl(
      _$FunctionAstImpl _value, $Res Function(_$FunctionAstImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? parameters = null,
    Object? returnType = null,
    Object? location = null,
    Object? metadata = null,
    Object? element = freezed,
  }) {
    return _then(_$FunctionAstImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parameters: null == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<ParameterAst>,
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as TypeAst,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceLocation,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<ApiMetdataAst>,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as FunctionElement?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FunctionAstImpl extends _FunctionAst {
  const _$FunctionAstImpl(
      {required this.name,
      required final List<ParameterAst> parameters,
      required this.returnType,
      required this.location,
      final List<ApiMetdataAst> metadata = const [],
      @ignore this.element})
      : _parameters = parameters,
        _metadata = metadata,
        super._();

  factory _$FunctionAstImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunctionAstImplFromJson(json);

  @override
  final String name;
  final List<ParameterAst> _parameters;
  @override
  List<ParameterAst> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  @override
  final TypeAst returnType;
  @override
  final SourceLocation location;
  final List<ApiMetdataAst> _metadata;
  @override
  @JsonKey()
  List<ApiMetdataAst> get metadata {
    if (_metadata is EqualUnmodifiableListView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metadata);
  }

  @override
  @ignore
  final FunctionElement? element;

  @override
  String toString() {
    return 'FunctionAst(name: $name, parameters: $parameters, returnType: $returnType, location: $location, metadata: $metadata, element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunctionAstImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters) &&
            (identical(other.returnType, returnType) ||
                other.returnType == returnType) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.element, element) || other.element == element));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_parameters),
      returnType,
      location,
      const DeepCollectionEquality().hash(_metadata),
      element);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FunctionAstImplCopyWith<_$FunctionAstImpl> get copyWith =>
      __$$FunctionAstImplCopyWithImpl<_$FunctionAstImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunctionAstImplToJson(
      this,
    );
  }
}

abstract class _FunctionAst extends FunctionAst {
  const factory _FunctionAst(
      {required final String name,
      required final List<ParameterAst> parameters,
      required final TypeAst returnType,
      required final SourceLocation location,
      final List<ApiMetdataAst> metadata,
      @ignore final FunctionElement? element}) = _$FunctionAstImpl;
  const _FunctionAst._() : super._();

  factory _FunctionAst.fromJson(Map<String, dynamic> json) =
      _$FunctionAstImpl.fromJson;

  @override
  String get name;
  @override
  List<ParameterAst> get parameters;
  @override
  TypeAst get returnType;
  @override
  SourceLocation get location;
  @override
  List<ApiMetdataAst> get metadata;
  @override
  @ignore
  FunctionElement? get element;
  @override
  @JsonKey(ignore: true)
  _$$FunctionAstImplCopyWith<_$FunctionAstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParameterAst _$ParameterAstFromJson(Map<String, dynamic> json) {
  return _ParameterAst.fromJson(json);
}

/// @nodoc
mixin _$ParameterAst {
  String get name => throw _privateConstructorUsedError;
  TypeAst get type => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  bool get named => throw _privateConstructorUsedError;
  SourceLocation get location => throw _privateConstructorUsedError;
  @ignore
  ParameterElement? get element => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParameterAstCopyWith<ParameterAst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParameterAstCopyWith<$Res> {
  factory $ParameterAstCopyWith(
          ParameterAst value, $Res Function(ParameterAst) then) =
      _$ParameterAstCopyWithImpl<$Res, ParameterAst>;
  @useResult
  $Res call(
      {String name,
      TypeAst type,
      bool required,
      bool named,
      SourceLocation location,
      @ignore ParameterElement? element});

  $TypeAstCopyWith<$Res> get type;
  $SourceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$ParameterAstCopyWithImpl<$Res, $Val extends ParameterAst>
    implements $ParameterAstCopyWith<$Res> {
  _$ParameterAstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? required = null,
    Object? named = null,
    Object? location = null,
    Object? element = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAst,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      named: null == named
          ? _value.named
          : named // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceLocation,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ParameterElement?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeAstCopyWith<$Res> get type {
    return $TypeAstCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceLocationCopyWith<$Res> get location {
    return $SourceLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParameterAstImplCopyWith<$Res>
    implements $ParameterAstCopyWith<$Res> {
  factory _$$ParameterAstImplCopyWith(
          _$ParameterAstImpl value, $Res Function(_$ParameterAstImpl) then) =
      __$$ParameterAstImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      TypeAst type,
      bool required,
      bool named,
      SourceLocation location,
      @ignore ParameterElement? element});

  @override
  $TypeAstCopyWith<$Res> get type;
  @override
  $SourceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$ParameterAstImplCopyWithImpl<$Res>
    extends _$ParameterAstCopyWithImpl<$Res, _$ParameterAstImpl>
    implements _$$ParameterAstImplCopyWith<$Res> {
  __$$ParameterAstImplCopyWithImpl(
      _$ParameterAstImpl _value, $Res Function(_$ParameterAstImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? required = null,
    Object? named = null,
    Object? location = null,
    Object? element = freezed,
  }) {
    return _then(_$ParameterAstImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAst,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      named: null == named
          ? _value.named
          : named // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceLocation,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ParameterElement?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParameterAstImpl extends _ParameterAst {
  const _$ParameterAstImpl(
      {required this.name,
      required this.type,
      required this.required,
      required this.named,
      required this.location,
      @ignore this.element})
      : super._();

  factory _$ParameterAstImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParameterAstImplFromJson(json);

  @override
  final String name;
  @override
  final TypeAst type;
  @override
  final bool required;
  @override
  final bool named;
  @override
  final SourceLocation location;
  @override
  @ignore
  final ParameterElement? element;

  @override
  String toString() {
    return 'ParameterAst(name: $name, type: $type, required: $required, named: $named, location: $location, element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParameterAstImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.named, named) || other.named == named) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.element, element) || other.element == element));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, type, required, named, location, element);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParameterAstImplCopyWith<_$ParameterAstImpl> get copyWith =>
      __$$ParameterAstImplCopyWithImpl<_$ParameterAstImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParameterAstImplToJson(
      this,
    );
  }
}

abstract class _ParameterAst extends ParameterAst {
  const factory _ParameterAst(
      {required final String name,
      required final TypeAst type,
      required final bool required,
      required final bool named,
      required final SourceLocation location,
      @ignore final ParameterElement? element}) = _$ParameterAstImpl;
  const _ParameterAst._() : super._();

  factory _ParameterAst.fromJson(Map<String, dynamic> json) =
      _$ParameterAstImpl.fromJson;

  @override
  String get name;
  @override
  TypeAst get type;
  @override
  bool get required;
  @override
  bool get named;
  @override
  SourceLocation get location;
  @override
  @ignore
  ParameterElement? get element;
  @override
  @JsonKey(ignore: true)
  _$$ParameterAstImplCopyWith<_$ParameterAstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiMetdataAst _$ApiMetdataAstFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'apiAuthenticated':
      return ApiAuthenticated.fromJson(json);
    case 'apiMiddleware':
      return ApiMiddleware.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ApiMetdataAst',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ApiMetdataAst {
  SourceLocation get location => throw _privateConstructorUsedError;
  @ignore
  ElementAnnotation? get element => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SourceLocation location, @ignore ElementAnnotation? element)
        apiAuthenticated,
    required TResult Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)
        apiMiddleware,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SourceLocation location, @ignore ElementAnnotation? element)?
        apiAuthenticated,
    TResult? Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)?
        apiMiddleware,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SourceLocation location, @ignore ElementAnnotation? element)?
        apiAuthenticated,
    TResult Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)?
        apiMiddleware,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiAuthenticated value) apiAuthenticated,
    required TResult Function(ApiMiddleware value) apiMiddleware,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiAuthenticated value)? apiAuthenticated,
    TResult? Function(ApiMiddleware value)? apiMiddleware,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiAuthenticated value)? apiAuthenticated,
    TResult Function(ApiMiddleware value)? apiMiddleware,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiMetdataAstCopyWith<ApiMetdataAst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiMetdataAstCopyWith<$Res> {
  factory $ApiMetdataAstCopyWith(
          ApiMetdataAst value, $Res Function(ApiMetdataAst) then) =
      _$ApiMetdataAstCopyWithImpl<$Res, ApiMetdataAst>;
  @useResult
  $Res call({SourceLocation location, @ignore ElementAnnotation? element});

  $SourceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$ApiMetdataAstCopyWithImpl<$Res, $Val extends ApiMetdataAst>
    implements $ApiMetdataAstCopyWith<$Res> {
  _$ApiMetdataAstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? element = freezed,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceLocation,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ElementAnnotation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceLocationCopyWith<$Res> get location {
    return $SourceLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiAuthenticatedImplCopyWith<$Res>
    implements $ApiMetdataAstCopyWith<$Res> {
  factory _$$ApiAuthenticatedImplCopyWith(_$ApiAuthenticatedImpl value,
          $Res Function(_$ApiAuthenticatedImpl) then) =
      __$$ApiAuthenticatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SourceLocation location, @ignore ElementAnnotation? element});

  @override
  $SourceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$ApiAuthenticatedImplCopyWithImpl<$Res>
    extends _$ApiMetdataAstCopyWithImpl<$Res, _$ApiAuthenticatedImpl>
    implements _$$ApiAuthenticatedImplCopyWith<$Res> {
  __$$ApiAuthenticatedImplCopyWithImpl(_$ApiAuthenticatedImpl _value,
      $Res Function(_$ApiAuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? element = freezed,
  }) {
    return _then(_$ApiAuthenticatedImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceLocation,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ElementAnnotation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiAuthenticatedImpl extends ApiAuthenticated {
  const _$ApiAuthenticatedImpl(
      {required this.location, @ignore this.element, final String? $type})
      : $type = $type ?? 'apiAuthenticated',
        super._();

  factory _$ApiAuthenticatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiAuthenticatedImplFromJson(json);

  @override
  final SourceLocation location;
  @override
  @ignore
  final ElementAnnotation? element;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiMetdataAst.apiAuthenticated(location: $location, element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiAuthenticatedImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.element, element) || other.element == element));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, location, element);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiAuthenticatedImplCopyWith<_$ApiAuthenticatedImpl> get copyWith =>
      __$$ApiAuthenticatedImplCopyWithImpl<_$ApiAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SourceLocation location, @ignore ElementAnnotation? element)
        apiAuthenticated,
    required TResult Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)
        apiMiddleware,
  }) {
    return apiAuthenticated(location, element);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SourceLocation location, @ignore ElementAnnotation? element)?
        apiAuthenticated,
    TResult? Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)?
        apiMiddleware,
  }) {
    return apiAuthenticated?.call(location, element);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SourceLocation location, @ignore ElementAnnotation? element)?
        apiAuthenticated,
    TResult Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)?
        apiMiddleware,
    required TResult orElse(),
  }) {
    if (apiAuthenticated != null) {
      return apiAuthenticated(location, element);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiAuthenticated value) apiAuthenticated,
    required TResult Function(ApiMiddleware value) apiMiddleware,
  }) {
    return apiAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiAuthenticated value)? apiAuthenticated,
    TResult? Function(ApiMiddleware value)? apiMiddleware,
  }) {
    return apiAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiAuthenticated value)? apiAuthenticated,
    TResult Function(ApiMiddleware value)? apiMiddleware,
    required TResult orElse(),
  }) {
    if (apiAuthenticated != null) {
      return apiAuthenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiAuthenticatedImplToJson(
      this,
    );
  }
}

abstract class ApiAuthenticated extends ApiMetdataAst {
  const factory ApiAuthenticated(
      {required final SourceLocation location,
      @ignore final ElementAnnotation? element}) = _$ApiAuthenticatedImpl;
  const ApiAuthenticated._() : super._();

  factory ApiAuthenticated.fromJson(Map<String, dynamic> json) =
      _$ApiAuthenticatedImpl.fromJson;

  @override
  SourceLocation get location;
  @override
  @ignore
  ElementAnnotation? get element;
  @override
  @JsonKey(ignore: true)
  _$$ApiAuthenticatedImplCopyWith<_$ApiAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiMiddlewareImplCopyWith<$Res>
    implements $ApiMetdataAstCopyWith<$Res> {
  factory _$$ApiMiddlewareImplCopyWith(
          _$ApiMiddlewareImpl value, $Res Function(_$ApiMiddlewareImpl) then) =
      __$$ApiMiddlewareImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TypeAst type,
      SourceLocation location,
      @ignore ElementAnnotation? element});

  $TypeAstCopyWith<$Res> get type;
  @override
  $SourceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$ApiMiddlewareImplCopyWithImpl<$Res>
    extends _$ApiMetdataAstCopyWithImpl<$Res, _$ApiMiddlewareImpl>
    implements _$$ApiMiddlewareImplCopyWith<$Res> {
  __$$ApiMiddlewareImplCopyWithImpl(
      _$ApiMiddlewareImpl _value, $Res Function(_$ApiMiddlewareImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? location = null,
    Object? element = freezed,
  }) {
    return _then(_$ApiMiddlewareImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAst,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceLocation,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as ElementAnnotation?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeAstCopyWith<$Res> get type {
    return $TypeAstCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiMiddlewareImpl extends ApiMiddleware {
  const _$ApiMiddlewareImpl(
      {required this.type,
      required this.location,
      @ignore this.element,
      final String? $type})
      : $type = $type ?? 'apiMiddleware',
        super._();

  factory _$ApiMiddlewareImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMiddlewareImplFromJson(json);

  @override
  final TypeAst type;
  @override
  final SourceLocation location;
  @override
  @ignore
  final ElementAnnotation? element;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiMetdataAst.apiMiddleware(type: $type, location: $location, element: $element)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMiddlewareImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.element, element) || other.element == element));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, location, element);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMiddlewareImplCopyWith<_$ApiMiddlewareImpl> get copyWith =>
      __$$ApiMiddlewareImplCopyWithImpl<_$ApiMiddlewareImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SourceLocation location, @ignore ElementAnnotation? element)
        apiAuthenticated,
    required TResult Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)
        apiMiddleware,
  }) {
    return apiMiddleware(type, location, element);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SourceLocation location, @ignore ElementAnnotation? element)?
        apiAuthenticated,
    TResult? Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)?
        apiMiddleware,
  }) {
    return apiMiddleware?.call(type, location, element);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SourceLocation location, @ignore ElementAnnotation? element)?
        apiAuthenticated,
    TResult Function(TypeAst type, SourceLocation location,
            @ignore ElementAnnotation? element)?
        apiMiddleware,
    required TResult orElse(),
  }) {
    if (apiMiddleware != null) {
      return apiMiddleware(type, location, element);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiAuthenticated value) apiAuthenticated,
    required TResult Function(ApiMiddleware value) apiMiddleware,
  }) {
    return apiMiddleware(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiAuthenticated value)? apiAuthenticated,
    TResult? Function(ApiMiddleware value)? apiMiddleware,
  }) {
    return apiMiddleware?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiAuthenticated value)? apiAuthenticated,
    TResult Function(ApiMiddleware value)? apiMiddleware,
    required TResult orElse(),
  }) {
    if (apiMiddleware != null) {
      return apiMiddleware(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMiddlewareImplToJson(
      this,
    );
  }
}

abstract class ApiMiddleware extends ApiMetdataAst {
  const factory ApiMiddleware(
      {required final TypeAst type,
      required final SourceLocation location,
      @ignore final ElementAnnotation? element}) = _$ApiMiddlewareImpl;
  const ApiMiddleware._() : super._();

  factory ApiMiddleware.fromJson(Map<String, dynamic> json) =
      _$ApiMiddlewareImpl.fromJson;

  TypeAst get type;
  @override
  SourceLocation get location;
  @override
  @ignore
  ElementAnnotation? get element;
  @override
  @JsonKey(ignore: true)
  _$$ApiMiddlewareImplCopyWith<_$ApiMiddlewareImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypeAst _$TypeAstFromJson(Map<String, dynamic> json) {
  return _TypeAst.fromJson(json);
}

/// @nodoc
mixin _$TypeAst {
  Uri get libraryUri => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<TypeAst> get typeArguments => throw _privateConstructorUsedError;
  @ignore
  DartType? get dartType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeAstCopyWith<TypeAst> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeAstCopyWith<$Res> {
  factory $TypeAstCopyWith(TypeAst value, $Res Function(TypeAst) then) =
      _$TypeAstCopyWithImpl<$Res, TypeAst>;
  @useResult
  $Res call(
      {Uri libraryUri,
      String name,
      List<TypeAst> typeArguments,
      @ignore DartType? dartType});
}

/// @nodoc
class _$TypeAstCopyWithImpl<$Res, $Val extends TypeAst>
    implements $TypeAstCopyWith<$Res> {
  _$TypeAstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryUri = null,
    Object? name = null,
    Object? typeArguments = null,
    Object? dartType = freezed,
  }) {
    return _then(_value.copyWith(
      libraryUri: null == libraryUri
          ? _value.libraryUri
          : libraryUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeArguments: null == typeArguments
          ? _value.typeArguments
          : typeArguments // ignore: cast_nullable_to_non_nullable
              as List<TypeAst>,
      dartType: freezed == dartType
          ? _value.dartType
          : dartType // ignore: cast_nullable_to_non_nullable
              as DartType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeAstImplCopyWith<$Res> implements $TypeAstCopyWith<$Res> {
  factory _$$TypeAstImplCopyWith(
          _$TypeAstImpl value, $Res Function(_$TypeAstImpl) then) =
      __$$TypeAstImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Uri libraryUri,
      String name,
      List<TypeAst> typeArguments,
      @ignore DartType? dartType});
}

/// @nodoc
class __$$TypeAstImplCopyWithImpl<$Res>
    extends _$TypeAstCopyWithImpl<$Res, _$TypeAstImpl>
    implements _$$TypeAstImplCopyWith<$Res> {
  __$$TypeAstImplCopyWithImpl(
      _$TypeAstImpl _value, $Res Function(_$TypeAstImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryUri = null,
    Object? name = null,
    Object? typeArguments = null,
    Object? dartType = freezed,
  }) {
    return _then(_$TypeAstImpl(
      libraryUri: null == libraryUri
          ? _value.libraryUri
          : libraryUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeArguments: null == typeArguments
          ? _value._typeArguments
          : typeArguments // ignore: cast_nullable_to_non_nullable
              as List<TypeAst>,
      dartType: freezed == dartType
          ? _value.dartType
          : dartType // ignore: cast_nullable_to_non_nullable
              as DartType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeAstImpl extends _TypeAst {
  const _$TypeAstImpl(
      {required this.libraryUri,
      required this.name,
      final List<TypeAst> typeArguments = const [],
      @ignore this.dartType})
      : _typeArguments = typeArguments,
        super._();

  factory _$TypeAstImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeAstImplFromJson(json);

  @override
  final Uri libraryUri;
  @override
  final String name;
  final List<TypeAst> _typeArguments;
  @override
  @JsonKey()
  List<TypeAst> get typeArguments {
    if (_typeArguments is EqualUnmodifiableListView) return _typeArguments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeArguments);
  }

  @override
  @ignore
  final DartType? dartType;

  @override
  String toString() {
    return 'TypeAst(libraryUri: $libraryUri, name: $name, typeArguments: $typeArguments, dartType: $dartType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeAstImpl &&
            (identical(other.libraryUri, libraryUri) ||
                other.libraryUri == libraryUri) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._typeArguments, _typeArguments) &&
            (identical(other.dartType, dartType) ||
                other.dartType == dartType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, libraryUri, name,
      const DeepCollectionEquality().hash(_typeArguments), dartType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeAstImplCopyWith<_$TypeAstImpl> get copyWith =>
      __$$TypeAstImplCopyWithImpl<_$TypeAstImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeAstImplToJson(
      this,
    );
  }
}

abstract class _TypeAst extends TypeAst {
  const factory _TypeAst(
      {required final Uri libraryUri,
      required final String name,
      final List<TypeAst> typeArguments,
      @ignore final DartType? dartType}) = _$TypeAstImpl;
  const _TypeAst._() : super._();

  factory _TypeAst.fromJson(Map<String, dynamic> json) = _$TypeAstImpl.fromJson;

  @override
  Uri get libraryUri;
  @override
  String get name;
  @override
  List<TypeAst> get typeArguments;
  @override
  @ignore
  DartType? get dartType;
  @override
  @JsonKey(ignore: true)
  _$$TypeAstImplCopyWith<_$TypeAstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceLocation _$SourceLocationFromJson(Map<String, dynamic> json) {
  return _SourceLocation.fromJson(json);
}

/// @nodoc
mixin _$SourceLocation {
  String get path => throw _privateConstructorUsedError;
  int get line => throw _privateConstructorUsedError;
  int get column => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceLocationCopyWith<SourceLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceLocationCopyWith<$Res> {
  factory $SourceLocationCopyWith(
          SourceLocation value, $Res Function(SourceLocation) then) =
      _$SourceLocationCopyWithImpl<$Res, SourceLocation>;
  @useResult
  $Res call({String path, int line, int column});
}

/// @nodoc
class _$SourceLocationCopyWithImpl<$Res, $Val extends SourceLocation>
    implements $SourceLocationCopyWith<$Res> {
  _$SourceLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? line = null,
    Object? column = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceLocationImplCopyWith<$Res>
    implements $SourceLocationCopyWith<$Res> {
  factory _$$SourceLocationImplCopyWith(_$SourceLocationImpl value,
          $Res Function(_$SourceLocationImpl) then) =
      __$$SourceLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, int line, int column});
}

/// @nodoc
class __$$SourceLocationImplCopyWithImpl<$Res>
    extends _$SourceLocationCopyWithImpl<$Res, _$SourceLocationImpl>
    implements _$$SourceLocationImplCopyWith<$Res> {
  __$$SourceLocationImplCopyWithImpl(
      _$SourceLocationImpl _value, $Res Function(_$SourceLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? line = null,
    Object? column = null,
  }) {
    return _then(_$SourceLocationImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceLocationImpl implements _SourceLocation {
  const _$SourceLocationImpl(
      {required this.path, required this.line, required this.column});

  factory _$SourceLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceLocationImplFromJson(json);

  @override
  final String path;
  @override
  final int line;
  @override
  final int column;

  @override
  String toString() {
    return 'SourceLocation(path: $path, line: $line, column: $column)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceLocationImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.column, column) || other.column == column));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path, line, column);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceLocationImplCopyWith<_$SourceLocationImpl> get copyWith =>
      __$$SourceLocationImplCopyWithImpl<_$SourceLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceLocationImplToJson(
      this,
    );
  }
}

abstract class _SourceLocation implements SourceLocation {
  const factory _SourceLocation(
      {required final String path,
      required final int line,
      required final int column}) = _$SourceLocationImpl;

  factory _SourceLocation.fromJson(Map<String, dynamic> json) =
      _$SourceLocationImpl.fromJson;

  @override
  String get path;
  @override
  int get line;
  @override
  int get column;
  @override
  @JsonKey(ignore: true)
  _$$SourceLocationImplCopyWith<_$SourceLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
