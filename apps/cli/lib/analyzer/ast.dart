// ignore_for_file: invalid_annotation_target

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/analyzer/visitor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ast.freezed.dart';
part 'ast.g.dart';

const ignore = JsonKey(includeToJson: false, includeFromJson: false);

sealed class AstNode {}

@freezed
class ProjectAst with _$ProjectAst implements AstNode {
  const ProjectAst._();

  const factory ProjectAst({
    required String projectClass,
    required List<ApiAst> apis,
    @ignore ClassElement? element,
  }) = _ProjectAst;

  factory ProjectAst.fromJson(Map<String, dynamic> json) =>
      _$ProjectAstFromJson(json);

  T accept<T>(AstVisitor<T> visitor) => visitor.visitProject(this);
}

@freezed
class ApiAst with _$ApiAst implements AstNode {
  const ApiAst._();

  const factory ApiAst({
    required String name,
    required List<ApiMetdataAst> metadata,
    required List<FunctionAst> functions,
    @ignore LibraryElement? element,
  }) = _ApiAst;

  factory ApiAst.fromJson(Map<String, dynamic> json) => _$ApiAstFromJson(json);

  T accept<T>(AstVisitor<T> visitor) => visitor.visitApi(this);
}

@freezed
class FunctionAst with _$FunctionAst implements AstNode {
  const FunctionAst._();

  const factory FunctionAst({
    required String name,
    required List<ParameterAst> parameters,
    required TypeAst returnType,
    required SourceLocation location,
    @Default([]) List<ApiMetdataAst> metadata,
    @ignore FunctionElement? element,
  }) = _FunctionAst;

  factory FunctionAst.fromJson(Map<String, dynamic> json) =>
      _$FunctionAstFromJson(json);

  T accept<T>(AstVisitor<T> visitor) => visitor.visitFunction(this);
}

@freezed
class ParameterAst with _$ParameterAst implements AstNode {
  const ParameterAst._();

  const factory ParameterAst({
    required String name,
    required TypeAst type,
    required bool required,
    required bool named,
    required SourceLocation location,
    @ignore ParameterElement? element,
  }) = _ParameterAst;

  factory ParameterAst.fromJson(Map<String, dynamic> json) =>
      _$ParameterAstFromJson(json);

  T accept<T>(AstVisitor<T> visitor) => visitor.visitParameter(this);
}

@freezed
sealed class ApiMetdataAst with _$ApiMetdataAst implements AstNode {
  const ApiMetdataAst._();

  const factory ApiMetdataAst.apiAuthenticated({
    required SourceLocation location,
    @ignore ElementAnnotation? element,
  }) = ApiAuthenticated;
  const factory ApiMetdataAst.apiMiddleware({
    required TypeAst type,
    required SourceLocation location,
    @ignore ElementAnnotation? element,
  }) = ApiMiddleware;

  factory ApiMetdataAst.fromJson(Map<String, dynamic> json) =>
      _$ApiMetdataAstFromJson(json);

  T accept<T>(AstVisitor<T> visitor) => switch (this) {
        final ApiAuthenticated node => visitor.visitApiAuthenticated(node),
        final ApiMiddleware node => visitor.visitApiMiddleware(node),
      };
}

@freezed
class TypeAst with _$TypeAst {
  const TypeAst._();

  const factory TypeAst({
    required Uri libraryUri,
    required String name,
    @Default([]) List<TypeAst> typeArguments,
    @ignore DartType? dartType,
  }) = _TypeAst;

  factory TypeAst.fromJson(Map<String, dynamic> json) =>
      _$TypeAstFromJson(json);

  bool get isFunctionContext =>
      libraryUri == functionContext.libraryUri && name == functionContext.name;

  static final TypeAst functionContext = TypeAst(
    libraryUri: Uri.parse('package:celest/src/functions/context.dart'),
    name: 'FunctionContext',
  );
}

@freezed
class SourceLocation with _$SourceLocation {
  const factory SourceLocation({
    required String path,
    required int line,
    required int column,
  }) = _SourceLocation;

  factory SourceLocation.fromJson(Map<String, dynamic> json) =>
      _$SourceLocationFromJson(json);
}
