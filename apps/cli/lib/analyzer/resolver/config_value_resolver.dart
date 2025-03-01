import 'dart:collection';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/analyzer/resolver/project_resolver.dart';
import 'package:celest_cli/database/project/project_database.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:source_span/source_span.dart';

typedef ConfigValue = (String name, FileSpan location);
typedef ConfigValueFactory<T extends ast.ConfigurationVariable> =
    T Function(
      String, {
      String? value,
      String? dartName,
      Iterable<String> docs,
      required FileSpan location,
    });

final class ConfigVarSet<T extends ast.ConfigurationVariable>
    extends DelegatingSet<T> {
  ConfigVarSet()
    : super(
        LinkedHashSet<T>(
          equals: (a, b) => a.name == b.name,
          hashCode: (a) => a.name.hashCode,
        ),
      );

  factory ConfigVarSet.of(Iterable<T> values) {
    return ConfigVarSet()..addAll(values);
  }
}

final class ConfigVarMap<T extends ast.ConfigurationVariable>
    extends DelegatingMap<T, String> {
  factory ConfigVarMap.from(Iterable<T> values) {
    return ConfigVarMap()
      ..addEntries(values.map((it) => MapEntry(it, it.name)));
  }
  ConfigVarMap()
    : super(
        LinkedHashMap<T, String>(
          equals: (a, b) => a.name == b.name,
          hashCode: (a) => a.name.hashCode,
        ),
      );

  @override
  ConfigVarSet<T> get keys => ConfigVarSet.of(super.keys);
}

final class ConfigValueResolver<T extends ast.ConfigurationVariable> {
  ConfigValueResolver({
    required this.context,
    required this.configValueElement,
    required this.errorReporter,
    required this.factory,
  });

  final AnalysisContext context;
  final InterfaceElement configValueElement;
  final CelestErrorReporter errorReporter;
  final ConfigValueFactory<T> factory;

  static final Logger _logger = Logger('ConfigValueResolver');

  Future<ConfigVarSet<T>> resolve() async {
    final variables = ConfigVarSet<T>();
    final references = await configValueElement.references().toList();
    for (final reference in references) {
      _logger.finest(
        'Reference: kind=${reference.kind}, '
        'elementKind=${reference.enclosingElement.kind}, '
        'location=${reference.enclosingElement.sourceLocation}',
      );
    }

    final topLevelDefinitions =
        references
            .map((ref) => ref.enclosingElement)
            .whereType<TopLevelVariableElement>();
    final topLevelResolutions =
        <
          (
            String dartName,
            Iterable<String> docs,
            Future<(String, String?, FileSpan)?> resolution,
          )
        >[];
    for (final variable in topLevelDefinitions) {
      topLevelResolutions.add((
        variable.name,
        variable.docLines,
        resolveVariable(
          variable: variable,
          value: variable.computeConstantValue(),
          location: variable.sourceLocation!,
        ),
      ));
    }
    final topLevelVariables = await Future.wait(
      topLevelResolutions.map((it) => it.$3),
      eagerError: true,
    );
    variables.addAll(
      topLevelVariables.nonNulls.mapIndexed((index, it) {
        final (name, value, location) = it;
        return factory(
          name,
          dartName: topLevelResolutions[index].$1,
          docs: topLevelResolutions[index].$2,
          value: value,
          location: location,
        );
      }),
    );

    final parameters =
        references
            .map((ref) => ref.enclosingElement)
            .whereType<ParameterElement>();
    final parameterResolutions = <Future<(String, String?, FileSpan)?>>[];
    for (final parameter in parameters) {
      for (final metadata in parameter.metadata) {
        _logger.finer(
          'Resolving parameter: name=${parameter.name}, '
          'type=${metadata.element?.runtimeType}',
        );
        final element = metadata.element;
        final location = parameter.sourceLocation!;
        switch (element) {
          case ConstructorElement(:final enclosingElement)
              when enclosingElement == configValueElement:
            parameterResolutions.add(
              resolveVariable(
                variable: element,
                value: metadata.computeConstantValue(),
                location: location,
              ),
            );
          case PropertyAccessorElement(:final returnType)
              when returnType == configValueElement.thisType:
            parameterResolutions.add(
              resolveVariable(
                variable: element,
                value: metadata.computeConstantValue(),
                location: location,
              ),
            );
        }
      }
    }
    final parameterVariables = await Future.wait(
      parameterResolutions,
      eagerError: true,
    );
    variables.addAll(
      parameterVariables.nonNulls.map((it) {
        final (name, value, location) = it;
        return factory(name, dartName: null, value: value, location: location);
      }),
    );

    return variables;
  }

  String? resolveConfigValueNode(VariableDeclaration node) {
    final initializer = node.initializer;
    final argumentList = switch (initializer) {
      MethodInvocation(:final argumentList) => argumentList,
      InstanceCreationExpression(:final argumentList) => argumentList,
      _ => null,
    };
    final argument = argumentList?.arguments.singleOrNull;
    if (argument == null) {
      _logger.fine('No argument found for $node');
      return null;
    }
    return switch (argument) {
      SimpleStringLiteral(:final value) => value,
      final unsupported => run(() {
        _logger.fine('Unsupported argument type: $unsupported');
        return null;
      }),
    };
  }

  Future<(String name, String? staticValue, FileSpan location)?>
  resolveVariable({
    required Element variable,
    required DartObject? value,
    required FileSpan location,
  }) async {
    String? name;
    String? staticValue;
    if (value != null) {
      _logger.finest('Resolved value: $value');
      name =
          (value.getField('name') ??
                  value.getField('(super)')?.getField('name'))
              ?.toStringValue();
      staticValue =
          (value.getField('value') ??
                  value.getField('(super)')?.getField('value'))
              ?.toStringValue();
      _logger.finest('Resolved name: $name ($staticValue)');
    } else if (variable.library case final libraryElement?) {
      // Only resolve variables in the project backend
      if (libraryElement.source.uri case Uri(
        scheme: 'package',
        pathSegments: [!= 'celest_backend', ...],
      )) {
        _logger.finest('Skipping: $variable');
        return null;
      }
      final library = await context.currentSession.getResolvedLibraryByElement(
        libraryElement,
      );
      ElementDeclarationResult? declaration;
      if (library is ResolvedLibraryResult) {
        declaration = library.getElementDeclaration(variable);
      } else {
        performance.captureError(
          StateError('Failed to resolve library'),
          extra: {
            'uri': libraryElement.source.uri,
            'variable': variable.toString(),
          },
        );
      }
      _logger.finest('Resolved declaration: ${declaration?.node.runtimeType}');
      if (declaration?.node case final VariableDeclaration declaration) {
        name = resolveConfigValueNode(declaration);
        _logger.finest('Resolved name: $name');
      }
    }
    if (name == null) {
      errorReporter.reportError(
        'Failed to resolve the environment variable\'s `name`',
        location: location,
      );
      return null;
    }
    return (name, staticValue, location);
  }
}

extension WithEnvironment on ProjectDatabase {
  Future<R> withEnvironment<R>(
    Future<R> Function(Environment environment) withEnv, {
    required String environmentId,
  }) {
    return transaction(() async {
      if (await lookupEnvironment(id: environmentId).get() case [
        final environment,
      ]) {
        return withEnv(environment);
      }
      final [environment] = await createEnvironment(id: environmentId);
      return withEnv(environment);
    });
  }
}

extension ResolveConfigurationVariable on ast.ConfigurationVariable {
  Future<String?> retrieveValue({required String environmentId}) async {
    final db = celestProject.projectDb;
    return db.withEnvironment(environmentId: environmentId, (
      environment,
    ) async {
      switch (this) {
        case ast.Variable(:final name):
          final value =
              await db
                  .getEnvironmentVariable(
                    environmentId: environment.id,
                    name: name,
                  )
                  .get();
          return value.singleOrNull;
        case ast.Secret(:final name):
          final value =
              await db
                  .getSecret(environmentId: environment.id, name: name)
                  .get();
          final ref = value.singleOrNull;
          if (ref == null) {
            return null;
          }
          final [...scope, key] = ref.split('/');
          return secureStorage.scoped(scope.join('/')).read(key);
      }
    });
  }
}

extension ResolveConfigurationVariables<T extends ast.ConfigurationVariable>
    on Iterable<T> {
  Future<Map<String, String>> retrieveValues({
    required String environmentId,
  }) async {
    if (isEmpty) {
      return const {};
    }
    final db = celestProject.projectDb;
    return db.withEnvironment(environmentId: environmentId, (
      environment,
    ) async {
      final variableNames = map((it) => it.name).toList();
      final values = <String, String>{};
      switch (first) {
        case ast.Variable():
          final dbValues =
              await db
                  .getEnvironmentVariables(
                    environmentId: environment.id,
                    names: variableNames,
                  )
                  .get();
          for (final value in dbValues) {
            values[value.name] = value.value;
          }
        case ast.Secret():
          final dbValues =
              await db
                  .getSecrets(
                    environmentId: environment.id,
                    names: variableNames,
                  )
                  .get();
          for (final secret in dbValues) {
            final [...scope, key] = secret.valueRef.split('/');
            final value = secureStorage.scoped(scope.join('/')).read(key);
            if (value != null) {
              values[secret.name] = value;
            }
          }
      }
      return values;
    });
  }
}
