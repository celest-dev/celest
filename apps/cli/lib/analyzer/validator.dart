import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/analyzer/ast.dart';
import 'package:celest_cli/analyzer/serialization.dart';
import 'package:celest_cli/analyzer/visitor.dart';

final class ValidationException implements Exception {
  const ValidationException({
    required this.message,
    required this.location,
  });

  final String message;
  final SourceLocation location;

  @override
  String toString() {
    return '${location.path}:${location.line}:${location.column}: $message';
  }
}

final class AstValidator extends AstVisitor<void> {
  AstValidator();

  final List<ValidationException> errors = [];

  void reportError(String error, SourceLocation location) {
    errors.add(
      ValidationException(
        message: error,
        location: location,
      ),
    );
  }

  @override
  void visitProject(ProjectAst project) {
    project.apis.forEach(visitApi);
  }

  @override
  void visitApi(ApiAst api) {
    api.functions.forEach(visitFunction);
    for (final metadata in api.metadata) {
      metadata.accept(this);
    }
  }

  @override
  void visitApiAuthenticated(ApiAuthenticated annotation) {}

  @override
  void visitApiMiddleware(ApiMiddleware annotation) {}

  @override
  void visitFunction(FunctionAst function) {
    var hasContext = false;
    for (final param in function.parameters) {
      if (param.type.isFunctionContext) {
        if (hasContext) {
          reportError(
            'A FunctionContext parameter may only be specified once',
            param.location,
          );
        }
        hasContext = true;
      }
    }
    function.parameters.forEach(visitParameter);
    final returnType = function.returnType.dartType!;
    final returnTypeVerdict = returnType.isValidReturnType;
    if (!returnTypeVerdict.isJsonSerializable) {
      reportError(
        'The return type of a function must be serializable as JSON. ${returnTypeVerdict.reason}}',
        function.location,
      );
    }
  }

  @override
  void visitParameter(ParameterAst parameter) {
    if (parameter.type.isFunctionContext) {
      return;
    }
    final parameterTypeVerdict = parameter.type.dartType!.isValidParameterType;
    if (!parameterTypeVerdict.isJsonSerializable) {
      reportError(
        'The type of a parameter must be serializable as JSON. ${parameterTypeVerdict.reason}',
        parameter.location,
      );
    }
  }
}

extension DartTypeHelper on DartType {
  DartType get flattened {
    switch (this) {
      case final InterfaceType interface
          when interface.isDartAsyncFuture || interface.isDartAsyncFutureOr:
        return interface.typeArguments.first;
      default:
        return this;
    }
  }

  JsonVerdict get isValidReturnType =>
      flattened.accept(const IsJsonSerializable(TypePosition.return$));

  JsonVerdict get isValidParameterType =>
      flattened.accept(const IsJsonSerializable(TypePosition.parameter));
}
