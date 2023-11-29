// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectAstImpl _$$ProjectAstImplFromJson(Map<String, dynamic> json) =>
    _$ProjectAstImpl(
      projectClass: json['projectClass'] as String,
      apis: (json['apis'] as List<dynamic>)
          .map((e) => ApiAst.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProjectAstImplToJson(_$ProjectAstImpl instance) =>
    <String, dynamic>{
      'projectClass': instance.projectClass,
      'apis': instance.apis.map((e) => e.toJson()).toList(),
    };

_$ApiAstImpl _$$ApiAstImplFromJson(Map<String, dynamic> json) => _$ApiAstImpl(
      name: json['name'] as String,
      metadata: (json['metadata'] as List<dynamic>)
          .map((e) => ApiMetdataAst.fromJson(e as Map<String, dynamic>))
          .toList(),
      functions: (json['functions'] as List<dynamic>)
          .map((e) => FunctionAst.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApiAstImplToJson(_$ApiAstImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'metadata': instance.metadata.map((e) => e.toJson()).toList(),
      'functions': instance.functions.map((e) => e.toJson()).toList(),
    };

_$FunctionAstImpl _$$FunctionAstImplFromJson(Map<String, dynamic> json) =>
    _$FunctionAstImpl(
      name: json['name'] as String,
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => ParameterAst.fromJson(e as Map<String, dynamic>))
          .toList(),
      returnType: TypeAst.fromJson(json['returnType'] as Map<String, dynamic>),
      location:
          SourceLocation.fromJson(json['location'] as Map<String, dynamic>),
      metadata: (json['metadata'] as List<dynamic>?)
              ?.map((e) => ApiMetdataAst.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FunctionAstImplToJson(_$FunctionAstImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'parameters': instance.parameters.map((e) => e.toJson()).toList(),
      'returnType': instance.returnType.toJson(),
      'location': instance.location.toJson(),
      'metadata': instance.metadata.map((e) => e.toJson()).toList(),
    };

_$ParameterAstImpl _$$ParameterAstImplFromJson(Map<String, dynamic> json) =>
    _$ParameterAstImpl(
      name: json['name'] as String,
      type: TypeAst.fromJson(json['type'] as Map<String, dynamic>),
      required: json['required'] as bool,
      named: json['named'] as bool,
      location:
          SourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ParameterAstImplToJson(_$ParameterAstImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type.toJson(),
      'required': instance.required,
      'named': instance.named,
      'location': instance.location.toJson(),
    };

_$ApiAuthenticatedImpl _$$ApiAuthenticatedImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiAuthenticatedImpl(
      location:
          SourceLocation.fromJson(json['location'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiAuthenticatedImplToJson(
        _$ApiAuthenticatedImpl instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'runtimeType': instance.$type,
    };

_$ApiMiddlewareImpl _$$ApiMiddlewareImplFromJson(Map<String, dynamic> json) =>
    _$ApiMiddlewareImpl(
      type: TypeAst.fromJson(json['type'] as Map<String, dynamic>),
      location:
          SourceLocation.fromJson(json['location'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiMiddlewareImplToJson(_$ApiMiddlewareImpl instance) =>
    <String, dynamic>{
      'type': instance.type.toJson(),
      'location': instance.location.toJson(),
      'runtimeType': instance.$type,
    };

_$TypeAstImpl _$$TypeAstImplFromJson(Map<String, dynamic> json) =>
    _$TypeAstImpl(
      libraryUri: Uri.parse(json['libraryUri'] as String),
      name: json['name'] as String,
      typeArguments: (json['typeArguments'] as List<dynamic>?)
              ?.map((e) => TypeAst.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TypeAstImplToJson(_$TypeAstImpl instance) =>
    <String, dynamic>{
      'libraryUri': instance.libraryUri.toString(),
      'name': instance.name,
      'typeArguments': instance.typeArguments.map((e) => e.toJson()).toList(),
    };

_$SourceLocationImpl _$$SourceLocationImplFromJson(Map<String, dynamic> json) =>
    _$SourceLocationImpl(
      path: json['path'] as String,
      line: json['line'] as int,
      column: json['column'] as int,
    );

Map<String, dynamic> _$$SourceLocationImplToJson(
        _$SourceLocationImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'line': instance.line,
      'column': instance.column,
    };
