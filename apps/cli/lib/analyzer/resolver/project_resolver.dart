import 'package:analyzer/dart/analysis/results.dart';
import 'package:api_celest/ast.dart' as ast;
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:source_span/source_span.dart';

abstract interface class CelestErrorReporter {
  void reportError(
    String message, {
    AnalysisErrorSeverity? severity,
    SourceSpan? location,
  });
}

abstract interface class CelestProjectResolver {
  /// Finds the project in the current workspace.
  Future<ast.Project?> resolveProject({
    required ResolvedLibraryResult projectLibrary,
  });

  /// Collects the environment variables of the project.
  Future<Iterable<ast.EnvironmentVariable>> resolveEnvironmentVariables();

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
  });
}

// final class CelestProjectResolverImpl extends CelestProjectResolver {
//   static final _logger = Logger('CelestProjectResolver');

//   @override
//   Future<ProjectBuilder?> findProject() {
//     throw UnimplementedError();
//   }

//   @override
//   Future<Iterable<EnvironmentVariable>> collectEnvironmentVariables(
//     ProjectBuilder project,
//   ) async {
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> collectAuth(ProjectBuilder project) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> collectApis(ProjectBuilder project, {required bool hasAuth}) {
//     throw UnimplementedError();
//   }
// }
