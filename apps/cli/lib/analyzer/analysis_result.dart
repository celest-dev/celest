import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/ast/ast.dart' as ast;

sealed class CelestAnalysisResult {
  const CelestAnalysisResult();

  factory CelestAnalysisResult.from({
    ast.Project? project,
    List<AnalysisError> errors = const [],
  }) {
    if (project == null) {
      return AnalysisFailureResult(errors);
    }
    return AnalysisSuccessResult(
      project: project,
      errors: errors,
    );
  }

  factory CelestAnalysisResult.success({
    required ast.Project project,
    List<AnalysisError> errors,
  }) = AnalysisSuccessResult;

  factory CelestAnalysisResult.failure(List<AnalysisError> errors) =
      AnalysisFailureResult;

  ast.Project? get project;
  List<AnalysisError> get errors;
}

final class AnalysisSuccessResult implements CelestAnalysisResult {
  AnalysisSuccessResult({
    required this.project,
    this.errors = const [],
  });

  @override
  final ast.Project project;

  @override
  final List<AnalysisError> errors;
}

final class AnalysisFailureResult implements CelestAnalysisResult {
  AnalysisFailureResult(this.errors)
      : assert(
          errors.isNotEmpty,
          'Errors must not be empty for a failure result.',
        );

  @override
  ast.Project? get project => null;

  @override
  final List<AnalysisError> errors;
}
