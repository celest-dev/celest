import 'package:analyzer/dart/analysis/results.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/celest_analysis_helpers.dart';
import 'package:source_span/source_span.dart';

abstract interface class CelestErrorReporter {
  void reportError(
    String message, {
    AnalysisErrorSeverity? severity,
    SourceSpan? location,
  });
}

abstract base class CelestProjectResolver with CelestAnalysisHelpers {
  CelestProjectResolver({
    required this.migrateProject,
  });

  final bool migrateProject;

  Future<void> resolveCustomTypes();

  /// Finds the project in the current workspace.
  Future<ast.Project?> resolveProject({
    required ParsedLibraryResult projectLibrary,
  });

  /// Collects the environment variables of the project.
  Future<Iterable<ast.EnvironmentVariable>> resolveEnvironmentVariables();

  /// Collects the secrets of the project.
  Future<Iterable<ast.Secret>> resolveSecrets();

  /// Collects the Celest Auth component of the project.
  ///
  /// Returns `true` if the project uses Celest Auth.
  Future<ast.Auth?> resolveAuth({
    required String authFilepath,
    required ResolvedLibraryResult authLibrary,
  });

  /// Collects the Celest Functions component of the project.
  Future<ast.Api?> resolveApi({
    required String apiFilepath,
    required String apiName,
    required ResolvedLibraryResult apiLibrary,
    required bool hasAuth,
    required Iterable<ast.EnvironmentVariable> environmentVariables,
    required Iterable<ast.Secret> secrets,
  });
}
