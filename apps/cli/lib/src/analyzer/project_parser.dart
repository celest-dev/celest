import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:celest_cli/src/codegen/client_code_generator.dart';

final class CelestProjectParser {
  CelestProjectParser({
    required String projectRoot,
    required this.projectDart,
    required DriverBasedAnalysisContext analysisContext,
  }) : _analysisContext = analysisContext,
       _dependencies = CodegenDependencies(rootDir: projectRoot);

  final String projectDart;
  final DriverBasedAnalysisContext _analysisContext;
  final CodegenDependencies _dependencies;

  CodegenDependencies parseDependencies() {
    final projectDartLibrary = _analysisContext.currentSession.getParsedLibrary(
      projectDart,
    );
    if (projectDartLibrary is! ParsedLibraryResult) {
      throw StateError('Could not parse $projectDart');
    }

    final topLevelVariables = projectDartLibrary.units
        .expand((unit) => unit.unit.declarations)
        .whereType<TopLevelVariableDeclaration>()
        .expand((declaration) => declaration.variables.variables)
        .toList();

    if (_findDatabases(topLevelVariables)) {
      _dependencies.add('drift_hrana');
    }
    if (_findAuth(topLevelVariables)) {
      _dependencies.add('celest_cloud_auth');
      _dependencies.add('drift_hrana');
    }

    return _dependencies;
  }

  bool _findAuth(List<VariableDeclaration> topLevelVariables) {
    for (final variable in topLevelVariables) {
      if (variable case VariableDeclaration(
        initializer: MethodInvocation(
          methodName: SimpleIdentifier(name: 'Auth'),
        ),
      )) {
        return true;
      }
    }
    return false;
  }

  bool _findDatabases(List<VariableDeclaration> topLevelVariables) {
    for (final variable in topLevelVariables) {
      if (variable case VariableDeclaration(
        initializer: MethodInvocation(
          methodName: SimpleIdentifier(name: 'Database'),
        ),
      )) {
        return true;
      }
    }
    return false;
  }
}
