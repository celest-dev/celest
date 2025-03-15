import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/analyzer/analysis_error.dart';

sealed class CelestAnalysisResult {
  const CelestAnalysisResult();

  factory CelestAnalysisResult.from({
    ast.Project? project,
    List<CelestAnalysisError> errors = const [],
    List<CelestAnalysisError> warnings = const [],
    List<CelestAnalysisError> infos = const [],
  }) {
    if (project == null) {
      return AnalysisFailureResult(errors, warnings: warnings, infos: infos);
    }
    return AnalysisSuccessResult(
      project: project,
      errors: errors,
      warnings: warnings,
      infos: infos,
    );
  }

  factory CelestAnalysisResult.success({
    required ast.Project project,
    List<CelestAnalysisError> errors,
    List<CelestAnalysisError> warnings,
    List<CelestAnalysisError> infos,
  }) = AnalysisSuccessResult;

  factory CelestAnalysisResult.failure(
    List<CelestAnalysisError> errors, {
    List<CelestAnalysisError> warnings,
    List<CelestAnalysisError> infos,
  }) = AnalysisFailureResult;

  ast.Project? get project;
  List<CelestAnalysisError> get errors;
  List<CelestAnalysisError> get warnings;
  List<CelestAnalysisError> get infos;
}

final class AnalysisSuccessResult implements CelestAnalysisResult {
  AnalysisSuccessResult({
    required this.project,
    this.errors = const [],
    this.warnings = const [],
    this.infos = const [],
  });

  @override
  final ast.Project project;

  @override
  final List<CelestAnalysisError> errors;

  @override
  final List<CelestAnalysisError> warnings;

  @override
  final List<CelestAnalysisError> infos;
}

final class AnalysisFailureResult implements CelestAnalysisResult {
  AnalysisFailureResult(
    this.errors, {
    this.warnings = const [],
    this.infos = const [],
  }) : assert(
         errors.isNotEmpty,
         'Errors must not be empty for a failure result.',
       );

  @override
  ast.Project? get project => null;

  @override
  final List<CelestAnalysisError> errors;

  @override
  final List<CelestAnalysisError> warnings;

  @override
  final List<CelestAnalysisError> infos;
}
