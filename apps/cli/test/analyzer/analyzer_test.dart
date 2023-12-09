import 'dart:io';

import 'package:celest_cli/analyzer/analyzer.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:celest_cli/src/context.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:package_config/package_config.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

String _simpleProjectDart(String name) => '''
import 'package:celest/celest.dart';

const project = Project(name: '$name');
''';

Future<ProjectPaths> newProject({
  required String name,
  String? projectDart,
  Map<String, String> apis = const {},
  Map<String, String> config = const {},
}) async {
  projectDart ??= _simpleProjectDart(name);
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
    if (config.isNotEmpty)
      d.dir('config', [
        for (final MapEntry(key: fileName, value: contents) in config.entries)
          d.file(fileName, contents),
      ]),
  ]);
  await project.create();
  final projectRoot = d.path(name);
  return init(projectRoot: projectRoot);
}

void testNoErrors({
  required String name,
  String? skip,
  String? projectDart,
  Map<String, String> apis = const {},
  Map<String, String> config = const {},
}) {
  testErrors(
    name: name,
    skip: skip,
    errors: [],
    projectDart: projectDart,
    apis: apis,
    config: config,
  );
}

void testErrors({
  required String name,
  String? skip,
  String? projectDart,
  Map<String, String> apis = const {},
  Map<String, String> config = const {},
  required List<String> errors,
}) {
  test(name, skip: skip, () async {
    final projectPaths = await newProject(
      name: name,
      projectDart: projectDart,
      apis: apis,
      config: config,
    );
    final analyzer = CelestAnalyzer(
      projectPaths: projectPaths,
      logger: Logger(level: Level.verbose),
    );
    final (project: _, errors: actual) = await analyzer.analyzeProject();
    expect(actual, hasLength(errors.length));
    if (errors.isNotEmpty) {
      expect(
        actual.map((e) => e.message),
        unorderedEquals(errors.map(contains)),
      );
    }
  });
}

void main() {
  group('Analyzer Errors', () {
    group('project.dart', () {
      testNoErrors(
        name: 'simple_project',
        projectDart: _simpleProjectDart('simple_project'),
      );

      testErrors(
        name: 'no_project',
        projectDart: '',
        errors: [
          'No `Project` type found',
        ],
      );

      testErrors(
        name: 'empty_project_name',
        projectDart: '''
import 'package:celest/celest.dart';

const project = Project(name: '');
''',
        errors: [
          'The project name cannot be empty.',
        ],
      );

      testErrors(
        name: 'no_environments',
        projectDart: '''
import 'package:celest/celest.dart';

const project = Project(name: 'my_project', environments: []);
''',
        errors: [
          'No environments have been defined for this project.',
        ],
      );

      testErrors(
        name: 'invalid_environment',
        projectDart: '''
import 'package:celest/celest.dart';

const project = Project(name: 'my_project', environments: ['']);
''',
        errors: [
          'Environment names cannot be empty.',
        ],
      );

      testErrors(
        name: 'duplicate_environment',
        projectDart: '''
import 'package:celest/celest.dart';

const project = Project(name: 'my_project', environments: ['prod', 'prod']);
''',
        errors: [
          'Duplicate environment name: "prod"',
        ],
      );

      testErrors(
        name: 'no_environments_and_bad_name',
        projectDart: '''
import 'package:celest/celest.dart';

const project = Project(name: '', environments: []);
''',
        errors: [
          'The project name cannot be empty.',
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
        name: 'bad_parameter_types',
        apis: {
          'greeting.dart': '''
void sayHello({
  required Enum enum,
  required List<Enum> listOfEnum,
  required Iterable<Enum> iterableOfEnum,
  required void Function() function,
  required List<void Function()> listOfFunction,
  required Iterable<void Function()> iterableOfFunction,
  required InvalidType invalidType,
  required List<InvalidType> listOfInvalidType,
  required Iterable<InvalidType> iterableOfInvalidType,
  required Never never,
  required List<Never> listOfNever,
  required Iterable<Never> iterableOfNever,
  required void void_,
  required List<void> listOfVoid,
  required Iterable<void> iterableOfVoid,
  required Set<String> set,
}) {}
''',
        },
        errors: [
          'Untyped enums are not supported', // Enum
          'Untyped enums are not supported', // List<Enum>
          'Untyped enums are not supported', // Iterable<Enum>
          'Function types are not supported', // void Function()
          'Function types are not supported', // List<void Function()>
          'Function types are not supported', // Iterable<void Function()>
          'Invalid type', // InvalidType
          'Invalid type', // List<InvalidType>
          'Invalid type', // Iterable<InvalidType>
          'Never types are not supported', // Never
          'Never types are not supported', // List<Never>
          'Never types are not supported', // Iterable<Never>
          'Void types are not supported in this position', // void
          'Void types are not supported in this position', // List<void>
          'Void types are not supported in this position', // Iterable<void>
          'Set types are not supported', // Set<String>
        ],
      );

      testErrors(
        name: 'bad_return_types',
        apis: {
          'greeting.dart': '''
typedef ReturnTypes = ({
  Enum enum,
  List<Enum> listOfEnum,
  Iterable<Enum> iterableOfEnum,
  void Function() function,
  List<void Function()> listOfFunction,
  Iterable<void Function()> iterableOfFunction,
  InvalidType invalidType,
  List<InvalidType> listOfInvalidType,
  Iterable<InvalidType> iterableOfInvalidType,
  Never never,
  List<Never> listOfNever,
  Iterable<Never> iterableOfNever,
  void void_,
  List<void> listOfVoid,
  Iterable<void> iterableOfVoid,
  Set<String> set,
});

ReturnTypes sayHello() {}
''',
        },
        errors: [
          'Untyped enums are not supported', // Enum
          'Untyped enums are not supported', // List<Enum>
          'Untyped enums are not supported', // Iterable<Enum>
          'Function types are not supported', // void Function()
          'Function types are not supported', // List<void Function()>
          'Function types are not supported', // Iterable<void Function()>
          'Invalid type', // InvalidType
          'Invalid type', // List<InvalidType>
          'Invalid type', // Iterable<InvalidType>
          'Never types are not supported', // Never
          'Never types are not supported', // List<Never>
          'Never types are not supported', // Iterable<Never>
          'Void types are not supported in this position', // void
          'Void types are not supported in this position', // List<void>
          'Void types are not supported in this position', // Iterable<void>
          'Set types are not supported', // Set<String>
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

      testNoErrors(
        name: 'valid_json',
        apis: {
          'greeting.dart': '''
class ValidJson {
  factory ValidJson.fromJson(Map<String, dynamic> _) => throw UnimplementedError();
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

ValidJson sayHello(ValidJson param) => param;
''',
        },
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
        name: 'toJson_in_extension',
        apis: {
          'greeting.dart': '''
class OnlyFromJson {
  factory OnlyFromJson.fromJson(Map<String, dynamic> _) => throw UnimplementedError();
}

extension on OnlyFromJson {
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

OnlyFromJson sayHello() => OnlyFromJson();
''',
        },
        errors: [
          'The return type of a function must be serializable as JSON. No toJson method found for type: OnlyFromJson',
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
          'Invalid API annotation',
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

      testNoErrors(
        name: 'api_authenticated',
        apis: {
          'greeting.dart': '''
@api.authenticated()
library;

import 'package:celest/api.dart' as api;

String sayHello() => 'Hello, World!';
''',
        },
      );

      testNoErrors(
        name: 'api_anonymous',
        apis: {
          'greeting.dart': '''
@api.anonymous()
library;

import 'package:celest/api.dart' as api;

String sayHello() => 'Hello, World!';
''',
        },
      );

      testNoErrors(
        name: 'const_variable_annotations',
        apis: {
          'greeting.dart': '''
@anonymous
@logRequests
library;

const anonymous = api.anonymous();
const logRequests = middleware.logRequests();
const logResponses = middleware.logResponses();

import 'package:celest/api.dart' as api;
import 'package:celest/api/middleware.dart' as middleware;

@logResponses
String sayHello() => 'Hello, World!';
''',
        },
      );

      testErrors(
        name: 'multiple_api_auth',
        apis: {
          'greeting.dart': '''
@api.anonymous()
@api.authenticated()
library;

import 'package:celest/api.dart' as api;

String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Only one `api.authenticated` or `api.anonymous` annotation may be '
              'specified on the same function or API library',
        ],
      );

      testErrors(
        name: 'multiple_api_auth_same_type',
        apis: {
          'greeting.dart': '''
@api.anonymous()
@api.anonymous()
library;

import 'package:celest/api.dart' as api;

String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Only one `api.authenticated` or `api.anonymous` annotation may be '
              'specified on the same function or API library',
        ],
      );

      testNoErrors(
        name: 'function_authenticated',
        apis: {
          'greeting.dart': '''
import 'package:celest/api.dart' as api;

@api.authenticated()
String sayHello() => 'Hello, World!';
''',
        },
      );

      testNoErrors(
        name: 'function_anonymous',
        apis: {
          'greeting.dart': '''
import 'package:celest/api.dart' as api;

@api.anonymous()
String sayHello() => 'Hello, World!';
''',
        },
      );

      testErrors(
        name: 'multiple_function_auth',
        apis: {
          'greeting.dart': '''
import 'package:celest/api.dart' as api;

@api.anonymous()
@api.authenticated()
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Only one `api.authenticated` or `api.anonymous` annotation may be '
              'specified on the same function or API library',
        ],
      );
    });

    group('env_vars', () {
      testNoErrors(
        name: 'good_envs',
        config: {
          'env.dart': '''
import 'package:celest/celest.dart';

const EnvironmentVariable myEnv = EnvironmentVariable(name: 'MY_ENV');
const EnvironmentVariable anotherEnv = EnvironmentVariable(name: 'ANOTHER_ENV');
''',
        },
      );

      testErrors(
        name: 'bad_envs',
        config: {
          'env.dart': '''
import 'package:celest/celest.dart';

const EnvironmentVariable myEnv = EnvironmentVariable(name: '');
''',
        },
        errors: [
          'The environment variable name cannot be empty.',
        ],
      );

      testErrors(
        name: 'duplicate_envs',
        config: {
          'env.dart': '''
import 'package:celest/celest.dart';

const EnvironmentVariable myEnv = EnvironmentVariable(name: 'MY_ENV');
const EnvironmentVariable anotherEnv = EnvironmentVariable(name: 'MY_ENV');
''',
        },
        errors: [
          'Duplicate environment variable name: "MY_ENV"',
        ],
      );

      testErrors(
        name: 'non_const_env',
        config: {
          'env.dart': '''
import 'package:celest/celest.dart';

final EnvironmentVariable myEnv = EnvironmentVariable(name: 'MY_ENV');
''',
        },
        errors: [
          'Environment variables must be declared as `const`',
        ],
      );

      testErrors(
        name: 'non_env_var_const',
        config: {
          'env.dart': '''
import 'package:celest/celest.dart';

const Project project = Project(
  name: 'my_project', 
  environments: ['prod', 'dev'],
);
''',
        },
        errors: [
          'Only environment variables can be declared in this file.',
        ],
      );
    });
  });
}
