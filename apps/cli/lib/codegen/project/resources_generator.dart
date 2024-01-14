import 'dart:collection';

import 'package:aws_common/aws_common.dart';
import 'package:built_collection/built_collection.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

const _header = [
  'Generated by Celest. This file should not be modified manually, but',
  'it can be checked into version control.',
];

final class ResourcesGenerator {
  ResourcesGenerator({
    required this.project,
  });

  final Project project;
  final _library = LibraryBuilder()
    ..name = ''
    ..comments.addAll(_header);

  // SplayTree ensures consistent ordering in output file which helps with
  // diffs.
  /// All resources, sorted by API name, then definition order.
  final _allResources = SplayTreeMap<Node, String>((a, b) {
    return switch ((a, b)) {
      (final Api a, final Api b) => a.name.compareTo(b.name),
      (final CloudFunction a, final CloudFunction b) => a.compareTo(b),
      (final EnvironmentVariable a, final EnvironmentVariable b) =>
        a.envName.compareTo(b.envName),
      (Api(), _) => -1,
      (CloudFunction(), Api()) => 1,
      (CloudFunction(), EnvironmentVariable()) => -1,
      (EnvironmentVariable(), _) => 1,
      _ => unreachable(),
    };
  });

  final _classBuilders = <String, ClassBuilder>{};
  ClassBuilder _beginClass(String name) {
    final cached = _classBuilders[name];
    if (cached != null) {
      return cached;
    }
    final builder = ClassBuilder()
      ..name = name
      ..abstract = true
      ..modifier = ClassModifier.final$;
    _library.body.add(lazySpec(builder.build));
    return builder;
  }

  void _generateApi(
    Api api, {
    required Map<String, Field> apis,
    required Map<String, Field> functions,
  }) {
    final apiFieldName = api.name.camelCase;
    apis[apiFieldName] ??= Field(
      (f) => f
        ..static = true
        ..modifier = FieldModifier.constant
        ..name = api.name.camelCase
        ..assignment = DartTypes.celest.cloudApi.constInstance([], {
          'name': literalString(api.name, raw: true),
        }).code,
    );
    for (final function in api.functions.values) {
      final inputParameters =
          function.parameters.where((p) => !p.type.isFunctionContext).toList();
      final inputType = switch (inputParameters) {
        [] => refer('void'),
        [final single] => single.type,
        final multiple => RecordType(
            (r) => r
              // TODO(dnys1): Treat all parameters the same (named/optional)?
              // This is only a Dart concept and we can handle the mapping to/from.
              // i.e. it does not affect the actual HTTP API.
              ..positionalFieldTypes.addAll([
                for (final parameter in multiple.where((p) => !p.named))
                  parameter.type,
              ])
              ..namedFieldTypes.addAll({
                for (final parameter in multiple.where((p) => p.named))
                  parameter.name: parameter.type,
              }),
          ),
      };
      final functionFieldName = '${api.name}_${function.name}'.camelCase;
      functions[functionFieldName] ??= Field(
        (f) => f
          ..static = true
          ..name = functionFieldName
          ..modifier = FieldModifier.constant
          ..assignment = DartTypes.celest
              .cloudFunction(
            inputType,
            function.flattenedReturnType,
          )
              .constInstance([], {
            'api': literalString(api.name, raw: true),
            'functionName': literalString(function.name, raw: true),
          }).code,
      );
      _allResources[api] = 'apis.$apiFieldName';
      _allResources[function] = 'functions.$functionFieldName';
    }
  }

  void _generateEnv(Iterable<EnvironmentVariable> envVars) {
    final env = _beginClass('env');
    for (final envVar in envVars) {
      final fieldName = envVar.envName.camelCase;
      env.fields.add(
        Field(
          (f) => f
            ..static = true
            ..modifier = FieldModifier.constant
            ..name = fieldName
            ..assignment =
                DartTypes.celest.environmentVariable.constInstance([], {
              'name': literalString(envVar.envName, raw: true),
            }).code,
        ),
      );
      _allResources[envVar] = 'env.$fieldName';
    }
  }

  Library generate() {
    final allApis = project.apis.values;
    if (allApis.isNotEmpty) {
      // Ensures consistent ordering in output file which helps with diffs.
      final apis = SplayTreeMap<String, Field>();
      final functions = SplayTreeMap<String, Field>();
      for (final api in allApis) {
        _generateApi(
          api,
          apis: apis,
          functions: functions,
        );
      }
      _beginClass('apis').fields.addAll(apis.build().values);
      _beginClass('functions').fields.addAll(functions.build().values);
    }
    if (project.envVars.isNotEmpty) {
      _generateEnv(project.envVars);
    }
    _library.body.add(
      Field(
        (f) => f
          ..modifier = FieldModifier.constant
          ..type = DartTypes.core.list(DartTypes.celest.cloudWidget)
          ..name = 'all'
          ..assignment = literalConstList(
            _allResources.values.map(refer).toList(),
          ).code,
      ),
    );
    return _library.build();
  }
}
