import 'dart:io';

import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/testing/init_tests.dart';
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
  String? resourcesDart,
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
    if (resourcesDart != null) d.file('resources.dart', resourcesDart),
    if (apis.isNotEmpty)
      d.dir('functions', [
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
  String? resourcesDart,
  Map<String, String> apis = const {},
  Map<String, String> config = const {},
  void Function(Project)? expectProject,
}) {
  testErrors(
    name: name,
    skip: skip,
    errors: [],
    projectDart: projectDart,
    resourcesDart: resourcesDart,
    apis: apis,
    config: config,
    expectProject: expectProject,
  );
}

void testErrors({
  required String name,
  String? skip,
  String? projectDart,
  String? resourcesDart,
  Map<String, String> apis = const {},
  Map<String, String> config = const {},
  required List<String> errors,
  void Function(Project)? expectProject,
}) {
  test(name, skip: skip, () async {
    projectPaths = await newProject(
      name: name,
      projectDart: projectDart,
      resourcesDart: resourcesDart,
      apis: apis,
      config: config,
    );
    final analyzer = CelestAnalyzer();
    final (:project, errors: actual) = await analyzer.analyzeProject();
    expect(
      actual.map((e) => e.message),
      unorderedEquals(errors.map(contains)),
    );
    if (actual.isEmpty) {
      expectProject?.call(project!);
    }
  });
}

void main() {
  initTests();

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

      testErrors(
        name: 'bad_file_name',
        apis: {
          'greeting.dev.dart': '''
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'API files must be named as follows: <api_name>.dart',
        ],
      );

      testErrors(
        name: 'bad_parameter_types_core',
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
  required dynamic dyn,
  required List<dynamic> listOfDyn,
  required Iterable<dynamic> iterableOfDyn,
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
          'Void types are not supported', // void
          'Void types are not supported', // List<void>
          'Void types are not supported', // Iterable<void>
          'Set types are not supported', // Set<String>
          'Dynamic values are not supported', // dynamic
          'Dynamic values are not supported', // List<dynamic>
          'Dynamic values are not supported', // Iterable<dynamic>
        ],
      );

      testErrors(
        name: 'bad_return_types_core',
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
  dynamic dyn,
  List<dynamic> listOfDyn,
  Iterable<dynamic> iterableOfDyn,
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
          'Void types are not supported', // void
          'Void types are not supported', // List<void>
          'Void types are not supported', // Iterable<void>
          'Set types are not supported', // Set<String>
          'Dynamic values are not supported', // dynamic
          'Dynamic values are not supported', // List<dynamic>
          'Dynamic values are not supported', // Iterable<dynamic>
        ],
      );

      testErrors(
        name: 'bad_json_parameter',
        apis: {
          'greeting.dart': '''
abstract class NotJsonable {}

String sayHello(NotJsonable _) => 'Hello, World!';
''',
        },
        errors: [
          'The type of a parameter must be serializable as JSON. '
              'Class NotJsonable is abstract and must have an unnamed factory or '
              'fromJson factory constructor to be used.',
        ],
      );

      testErrors(
        name: 'parameter_with_subtypes',
        apis: {
          'greeting.dart': '''
class Base {}
final class Actual extends Base {}

String sayHello(Base _) => 'Hello, World!';
''',
        },
        errors: [
          'Classes with subtypes (which are not sealed classes) are not currently supported as parameters',
        ],
      );

      testErrors(
        name: 'return_type_with_subtypes',
        apis: {
          'greeting.dart': '''
class Base {}
final class Actual extends Base {}

Base sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Classes with subtypes (which are not sealed classes) are not currently supported as return types',
        ],
      );

      testNoErrors(
        name: 'valid_jsonable',
        apis: {
          'greeting.dart': '''
class ValidJsonable {}

ValidJsonable sayHello(ValidJsonable param) => param;
''',
        },
      );

      testNoErrors(
        name: 'valid_custom_json',
        apis: {
          'greeting.dart': '''
class ValidCustomJson {
  factory ValidCustomJson.fromJson(Map<String, dynamic> _) => throw UnimplementedError();
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

ValidCustomJson sayHello(ValidCustomJson param) => param;
''',
        },
      );

      testErrors(
        name: 'bad_json_return',
        apis: {
          'greeting.dart': '''
class NotJsonable {
  NotJson(this.value);

  final Enum value;
}

NotJsonable sayHello() => throw UnimplementedError();
''',
        },
        errors: [
          'The return type of a function must be serializable as JSON. '
              'Field "value" of type "NotJsonable" is not serializable: '
              'Untyped enums are not supported',
        ],
      );

      testErrors(
        name: 'toJson_in_extension',
        apis: {
          'greeting.dart': '''
class OnlyFromJson {
  factory OnlyFromJson.fromJson(Map<String, dynamic> _) => throw UnimplementedError();

  late String _field;
}

extension on OnlyFromJson {
  Map<String, dynamic> toJson() => {'field': _field};
}

OnlyFromJson sayHello() => OnlyFromJson();
''',
        },
        errors: [
          'The return type of a function must be serializable as JSON. '
              'Private field "_field" is not supported in a class used as a '
              'return type. Consider defining custom fromJson/toJson methods '
              'or making the field public.',
        ],
      );

      testErrors(
        name: 'non_map_from_json',
        apis: {
          'greeting.dart': '''
class NonMapFromJson {
  NonMapFromJson.fromJson(this.field);

  final String field;
}

NonMapFromJson nonMayFromJson(NonMapFromJson value) => value;
''',
        },
        errors: [
          'The type of a parameter must be serializable as JSON. The parameter '
              'type of NonMapFromJson\'s fromJson constructor must be '
              'assignable to Map<String, Object?>.',
          'The return type of a function must be serializable as JSON. The '
              'parameter type of NonMapFromJson\'s fromJson constructor must '
              'be assignable to Map<String, Object?>.',
        ],
      );

      testErrors(
        name: 'from_json_optional_parameter',
        apis: {
          'greeting.dart': '''
class FromJson {
  FromJson.fromJson([Map<String, Object?>? json]): 
    field = json?['field'] as String? ?? 'default';

  final String field;
}

FromJson fromJson(FromJson value) => value;
''',
        },
        errors: [
          'The type of a parameter must be serializable as JSON. The fromJson '
              'constructor of type FromJson must have one required, '
              'positional parameter.',
          'The return type of a function must be serializable as JSON. The '
              'fromJson constructor of type FromJson must have one '
              'required, positional parameter.',
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
@functions.authenticated()
library;

import 'package:celest/functions.dart' as functions;

String sayHello() => 'Hello, World!';
''',
        },
      );

      testNoErrors(
        name: 'api_public',
        apis: {
          'greeting.dart': '''
@functions.public()
library;

import 'package:celest/functions.dart' as functions;

String sayHello() => 'Hello, World!';
''',
        },
      );

      testNoErrors(
        name: 'const_variable_annotations',
        apis: {
          'greeting.dart': '''
@public
@logRequests
library;

const public = functions.public();
const logRequests = middleware.logRequests();
const logResponses = middleware.logResponses();

import 'package:celest/functions.dart' as functions;
import 'package:celest/functions/middleware.dart' as middleware;

@logResponses
String sayHello() => 'Hello, World!';
''',
        },
      );

      testErrors(
        name: 'multiple_api_auth',
        apis: {
          'greeting.dart': '''
@functions.public()
@functions.authenticated()
library;

import 'package:celest/functions.dart' as functions;

String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Only one `api.authenticated` or `api.public` annotation may be '
              'specified on the same function or API library',
        ],
      );

      testErrors(
        name: 'multiple_api_auth_same_type',
        apis: {
          'greeting.dart': '''
@functions.public()
@functions.public()
library;

import 'package:celest/functions.dart' as functions;

String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Only one `api.authenticated` or `api.public` annotation may be '
              'specified on the same function or API library',
        ],
      );

      testNoErrors(
        name: 'function_authenticated',
        apis: {
          'greeting.dart': '''
import 'package:celest/functions.dart' as functions;

@functions.authenticated()
String sayHello() => 'Hello, World!';
''',
        },
      );

      testNoErrors(
        name: 'function_public',
        apis: {
          'greeting.dart': '''
import 'package:celest/functions.dart' as functions;

@functions.public()
String sayHello() => 'Hello, World!';
''',
        },
      );

      testErrors(
        name: 'multiple_function_auth',
        apis: {
          'greeting.dart': '''
import 'package:celest/functions.dart' as functions;

@functions.public()
@functions.authenticated()
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Only one `api.authenticated` or `api.public` annotation may be '
              'specified on the same function or API library',
        ],
      );
    });

    group('env_vars', () {
      testNoErrors(
        name: 'good_envs',
        config: {
          '.env': '''
MY_NAME=Celest
MY_AGE=28
''',
        },
        resourcesDart: '''
import 'package:celest/celest.dart';

abstract final class env {
  static const myName = EnvironmentVariable(name: r'MY_NAME');
  static const myAge = EnvironmentVariable(name: r'MY_AGE');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../resources.dart' as resources;

void sayHelloPositional(
  @resources.env.myName String name,
  @resources.env.myAge int age,
) => 'Hello, $name. I am $age years old.';

void sayHelloNamed({
  @resources.env.myName required String name,
  @resources.env.myAge required int age,  
}) => 'Hello, $name. I am $age years old.';
''',
        },
        expectProject: (project) {
          expect(
            project.envVars.map((env) => env.envName),
            unorderedEquals(['MY_NAME', 'MY_AGE']),
          );
          expect(
            project
                .apis['greeting']!.functions['sayHelloPositional']!.parameters
                .map((param) => param.references),
            unorderedEquals([
              NodeReference(
                name: 'MY_NAME',
                type: NodeType.environmentVariable,
              ),
              NodeReference(
                name: 'MY_AGE',
                type: NodeType.environmentVariable,
              ),
            ]),
          );
          expect(
            project.apis['greeting']!.functions['sayHelloNamed']!.parameters
                .map((param) => param.references),
            unorderedEquals([
              NodeReference(
                name: 'MY_NAME',
                type: NodeType.environmentVariable,
              ),
              NodeReference(
                name: 'MY_AGE',
                type: NodeType.environmentVariable,
              ),
            ]),
          );
        },
      );

      testErrors(
        name: 'bad_parameter_type',
        config: {
          '.env': '''
MY_NAME=Celest
''',
        },
        resourcesDart: '''
import 'package:celest/celest.dart';

abstract final class env {
  static const myName = EnvironmentVariable(name: r'MY_NAME');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../resources.dart' as resources;

void sayHello(@resources.env.myName List<String> name) => 'Hello, $name';
''',
        },
        errors: [
          'The type of an environment variable parameter must be one of: '
              '`String`, `int`, `double`, `num`, or `bool`',
        ],
      );

      testErrors(
        name: 'reserved_name',
        config: {
          '.env': '''
PORT=8080
''',
        },
        resourcesDart: '''
import 'package:celest/celest.dart';

abstract final class env {
  static const port = EnvironmentVariable(name: r'PORT');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../resources.dart' as resources;

void sayHello(@resources.env.port int port) => 'Hello, $port';
''',
        },
        errors: [
          'The environment variable name `PORT` is reserved by Celest',
        ],
      );
    });
  });
}
