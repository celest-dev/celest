import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli/analyzer/analyzer.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:package_config/package_config.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

const _simpleProjectDart = '''
import 'package:celest/celest.dart';
import 'package:celest/project.dart' as project;

@project.environments(named: ['prod'])
void define(ProjectContext context) {}
''';

Future<ProjectPaths> newProject({
  required String name,
  String projectDart = _simpleProjectDart,
  Map<String, String> apis = const {},
}) async {
  final celestDir = p.fromUri(
    Directory.current.uri.resolve('../../packages/celest/'),
  );
  final packageConfig = PackageConfig([
    Package(
      'celest',
      p.toUri(celestDir),
      packageUriRoot: Uri.parse('lib/'),
      relativeRoot: false,
    ),
  ]);
  final packageConfigJson = StringBuffer();
  PackageConfig.writeString(packageConfig, packageConfigJson);
  final project = d.dir(name, [
    d.dir('.dart_tool', [
      d.file('package_config.json', packageConfigJson.toString()),
    ]),
    d.file('pubspec.yaml', '''
name: $name

environment:
  sdk: ^3.2.0

dependencies:
  celest: any
'''),
    d.file('project.dart', projectDart),
    if (apis.isNotEmpty)
      d.dir('apis', [
        for (final MapEntry(key: fileName, value: contents) in apis.entries)
          d.file(fileName, contents),
      ]),
  ]);
  await project.create();
  final projectRoot = d.path(name);
  return ProjectPaths(projectRoot);
}

void testNoErrors({
  required String name,
  String projectDart = _simpleProjectDart,
  Map<String, String> apis = const {},
}) {
  testErrors(
    name: name,
    errors: [],
    projectDart: projectDart,
    apis: apis,
  );
}

void testErrors({
  required String name,
  String projectDart = _simpleProjectDart,
  Map<String, String> apis = const {},
  required List<String> errors,
}) {
  test(name, () async {
    final projectPaths = await newProject(
      name: name,
      projectDart: projectDart,
      apis: apis,
    );
    final analyzer = CelestAnalyzer.start(projectPaths: projectPaths);
    final analysisResult = await Result.capture(analyzer.analyzeProject());
    final actual = switch (analysisResult) {
      ValueResult(:final value) => value.errors,
      ErrorResult(:final error) => [error as AnalysisException],
      _ => fail('Unexpected result: $analysisResult'),
    };
    expect(actual, hasLength(errors.length));
    if (errors.isNotEmpty) {
      expect(
        actual.map((e) => e.message),
        containsAll(errors.map(contains)),
      );
    }
  });
}

void main() {
  group('Analyzer Errors', () {
    group('project.dart', () {
      testNoErrors(
        name: 'simple_project',
        projectDart: _simpleProjectDart,
      );

      testErrors(
        name: 'no_project_context',
        projectDart: '''
void define() {}
''',
        errors: [
          'The `define` method must have a single parameter of type ProjectContext',
        ],
      );

      testErrors(
        name: 'multiple_project_parameters',
        projectDart: '''
import 'package:celest/celest.dart';

void define(ProjectContext context, String random) {}
''',
        errors: [
          'The `define` method must have a single parameter of type ProjectContext',
        ],
      );

      testErrors(
        name: 'no_environments',
        projectDart: '''
import 'package:celest/celest.dart';

void define(ProjectContext context) {}
''',
        errors: [
          'No environments have been defined for this project.',
        ],
      );
    });

    group('apis', () {
      testNoErrors(
        name: 'simple_api',
        apis: {
          'greeting.dart': '''
String sayHello() => 'Hello, World!';
''',
        },
      );

      testNoErrors(
        name: 'simple_api_with_environments',
        apis: {
          'greeting.dart': '''
String sayHello() => 'Hello, World!';
''',
          'greeting.prod.dart': '''
String sayHello() => 'Hello, Prod!';
''',
        },
      );

      testErrors(
        name: 'unknown_environment',
        apis: {
          'greeting.dev.dart': '''
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Unknown environment for file: "dev"',
        ],
      );

      testErrors(
        name: 'bad_file_name',
        apis: {
          'greeting.dev.what.dart': '''
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'API files must be named as follows: <api_name>.dart or <api_name>.<environment_name>.dart',
        ],
      );

      testErrors(
        name: 'bad_json_parameter',
        apis: {
          'greeting.dart': '''
class NotJson {}

String sayHello(NotJson _) => 'Hello, World!';
''',
        },
        errors: [
          'The type of a parameter must be serializable as JSON. No fromJson constructor found for type: NotJson',
        ],
      );

      testErrors(
        name: 'bad_json_return',
        apis: {
          'greeting.dart': '''
class NotJson {}

NotJson sayHello() => NotJson();
''',
        },
        errors: [
          'The return type of a function must be serializable as JSON. No toJson method found for type: NotJson',
        ],
      );

      testErrors(
        name: 'multiple_function_contexts',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

String sayHello(FunctionContext a, FunctionContext b) => 'Hello, World!';
''',
        },
        errors: [
          'A FunctionContext parameter may only be specified once',
        ],
      );

      testErrors(
        name: 'bad_middleware_class',
        apis: {
          'greeting.dart': '''
class NotMiddleware {
  const NotMiddleware();
}

@NotMiddleware()
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          // TODO: Make more specific
          'Invalid annotation value',
        ],
      );

      testErrors(
        name: 'bad_middleware_type',
        apis: {
          'greeting.dart': '''
class NotMiddleware {
  const NotMiddleware();
}

@NotMiddleware
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          // TODO: Make more specific
          'Could not resolve annotation',
        ],
      );
    });
  });
}
