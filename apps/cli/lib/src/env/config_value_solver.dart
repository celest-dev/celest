import 'package:built_collection/built_collection.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/analyzer/resolver/config_value_resolver.dart';
import 'package:celest_cli/src/ast/ast.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/database/project/project_database.dart';
import 'package:celest_cli/src/env/firebase_config_value_solver.dart';
import 'package:celest_cli/src/env/supabase_config_value_solver.dart';
import 'package:meta/meta.dart';

enum ConfigValueType {
  environmentVariable,
  secret;

  String get displayName => switch (this) {
        environmentVariable => 'environment variable',
        secret => 'secret',
      };
}

final class ConfigValueSolver {
  const ConfigValueSolver({required this.project, required this.environmentId});

  final ast.Project project;
  final String environmentId;

  Map<String, String> get defaultValues {
    return {'CELEST_ENVIRONMENT': environmentId};
  }

  Future<Map<String, String>> solveAll() async {
    final [envValues, secretValues] = await Future.wait([
      project.variables.retrieveValues(environmentId: environmentId),
      project.secrets.retrieveValues(environmentId: environmentId),
    ]);
    final envManager = await celestProject.envManager.environment(
      environmentId,
    );
    final allConfigValues = ConfigVarSet()
      ..addAll(project.variables)
      ..addAll(project.secrets);
    final allConfigEntries = {
      ...envValues,
      ...secretValues,
      ...await envManager.readAll(),

      // Static values
      for (final envVar in project.variables)
        if (envVar.value case final value?) envVar.name: value,

      // Default values
      ...defaultValues,
    };

    // First, resolve Auth environment variables which may require special
    // resolution logic.
    final authVariables = project.auth?.variables;
    final authSecrets = project.auth?.secrets;
    final authConfigValues = BuiltListMultimap<ast.AuthProviderType,
        ast.ConfigurationVariable>.build((b) {
      authVariables?.forEach(b.add);
      authSecrets?.forEach(b.add);
    });
    for (final MapEntry(key: provider, value: configValues)
        in authConfigValues.toMap().entries) {
      for (final configValue in configValues) {
        if (allConfigEntries.containsKey(configValue.name)) {
          continue;
        }
        switch (provider) {
          case ast.AuthProviderType.firebase:
            final solver = FirebaseConfigValueSolver(
              projectName: project.name,
              environmentId: environmentId,
            );
            final value = await solver.solve(configValue);
            allConfigEntries[configValue.name] = value;
          case ast.AuthProviderType.supabase:
            final solver = SupabaseConfigValueSolver(
              projectName: project.name,
              environmentId: environmentId,
            );
            final value = await solver.solve(configValue);
            allConfigEntries[configValue.name] = value;
          default:
            break;
        }
      }
    }

    final promptSolver = PromptConfigValueSolver(
      projectName: project.name,
      environmentId: environmentId,
    );
    for (final configValue in allConfigValues) {
      if (allConfigEntries.containsKey(configValue.name)) {
        continue;
      }
      final value = await promptSolver.solve(configValue);
      allConfigEntries[configValue.name] = value;
    }

    return allConfigEntries;
  }
}

abstract base class BaseConfigValueSolver {
  const BaseConfigValueSolver({
    required this.projectName,
    required this.environmentId,
    @visibleForTesting ProjectDatabase? projectDb,
  }) : _projectDb = projectDb;

  final String projectName;
  final String environmentId;
  final ProjectDatabase? _projectDb;

  Future<String> solve(ast.ConfigurationVariable configVar);

  Future<String> storeVariable(String name, String value) async {
    final projectDb = _projectDb ?? celestProject.projectDb;
    await projectDb.withEnvironment(environmentId: environmentId, (
      environment,
    ) async {
      await projectDb.upsertEnvironmentVariable(
        environmentId: environment.id,
        name: name,
        value: value,
      );
    });
    return value;
  }

  Future<String> storeSecret(String name, String value) async {
    final projectDb = _projectDb ?? celestProject.projectDb;
    await projectDb.withEnvironment(environmentId: environmentId, (
      environment,
    ) async {
      final (scope, key) = (
        'projects/$projectName/environments/${environment.id}',
        name,
      );
      secureStorage.scoped(scope).write(key, value);
      await projectDb.upsertSecret(
        environmentId: environment.id,
        name: name,
        valueRef: '$scope/$key',
      );
    });
    return value;
  }
}

base class PromptConfigValueSolver extends BaseConfigValueSolver {
  const PromptConfigValueSolver({
    required super.projectName,
    required super.environmentId,
    @visibleForTesting super.projectDb,
  });

  String prompt(String name, ConfigValueType type) {
    cliLogger.info('Missing value for ${type.displayName} "$name"');

    String? value;
    while (value == null) {
      value = cliLogger.prompt(
        'Enter the value for $name',
        hidden: type == ConfigValueType.secret,
      );
    }
    return value;
  }

  @override
  Future<String> solve(ast.ConfigurationVariable configVar) async {
    switch (configVar) {
      case ast.Variable(:final name):
        final value = prompt(name, ConfigValueType.environmentVariable);
        return storeVariable(name, value);
      case ast.Secret(:final name):
        final value = prompt(name, ConfigValueType.secret);
        return storeSecret(name, value);
    }
  }
}
