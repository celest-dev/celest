import 'dart:io';

import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/init/pub/pub_environment.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_proto/ast.dart';
import 'package:checks/checks.dart';
import 'package:package_config/package_config.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

import '../common.dart';

String _simpleProjectDart(String name) => '''
import 'package:celest/celest.dart';

const project = Project(name: '$name');
''';

Future<CelestProject> newProject({
  required String name,
  String? pubspecYaml,
  String? analysisOptions,
  String? projectDart,
  String? authDart,
  String? resourcesDart,
  String? models,
  String? exceptions,
  Map<String, String> apis = const {},
  Map<String, String> config = const {},
  Map<String, String> lib = const {},
  String? parentDirectory,
}) async {
  projectDart ??= _simpleProjectDart(name);
  final celestDir = p.fromUri(
    Directory.current.uri.resolve('../../celest/packages/celest/'),
  );
  final celestCoreDir = p.fromUri(
    Directory.current.uri.resolve('../../celest/packages/celest_core/'),
  );
  final packageConfig = PackageConfig([
    Package(
      'celest',
      p.toUri(celestDir),
      packageUriRoot: Uri.parse('lib/'),
      relativeRoot: false,
    ),
    Package(
      'celest_core',
      p.toUri(celestCoreDir),
      packageUriRoot: Uri.parse('lib/'),
      relativeRoot: false,
    ),
    Package(
      name,
      p.toUri(d.path('$name/')),
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
    if (analysisOptions != null)
      d.file('analysis_options.yaml', analysisOptions),
    d.file(
      'pubspec.yaml',
      pubspecYaml ??
          '''
name: $name

environment:
  sdk: ${PubEnvironment.dartSdkConstraint}

dependencies:
  celest: any
''',
    ),
    d.file('project.dart', projectDart),
    if (resourcesDart != null) d.file('resources.dart', resourcesDart),
    d.dir('auth', [
      if (authDart != null) d.file('auth.dart', '''
import 'package:celest/celest.dart';

$authDart
'''),
    ]),
    if (apis.isNotEmpty)
      d.dir('functions', [
        for (final MapEntry(key: fileName, value: contents) in apis.entries)
          d.file(
            fileName,
            contents.startsWith('@')
                ? contents
                : '''
import 'package:$name/exceptions.dart';
import 'package:$name/models.dart';

$contents
''',
          ),
      ]),
    if (config.isNotEmpty)
      d.dir('config', [
        for (final MapEntry(key: fileName, value: contents) in config.entries)
          d.file(fileName, contents),
      ]),
    d.dir('lib', [
      d.file('models.dart', models ?? ''),
      d.file('exceptions.dart', exceptions ?? ''),
      for (final MapEntry(key: fileName, value: contents) in lib.entries)
        d.file(fileName, contents),
    ]),
  ]);
  await project.create(parentDirectory);
  final projectRoot = p.join(parentDirectory ?? d.sandbox, name);
  await init(projectRoot: projectRoot);
  return celestProject;
}

void testNoErrors({
  required String name,
  String? analysisOptions,
  String? skip,
  String? projectDart,
  String? authDart,
  String? resourcesDart,
  String? models,
  String? exceptions,
  Map<String, String> apis = const {},
  Map<String, String> config = const {},
  Map<String, String> lib = const {},
  void Function(Project)? expectProject,
}) {
  testErrors(
    name: name,
    analysisOptions: analysisOptions,
    skip: skip,
    errors: [],
    projectDart: projectDart,
    authDart: authDart,
    resourcesDart: resourcesDart,
    models: models,
    exceptions: exceptions,
    apis: apis,
    config: config,
    lib: lib,
    expectProject: expectProject,
  );
}

void testErrors({
  required String name,
  String? analysisOptions,
  String? skip,
  String? projectDart,
  String? authDart,
  String? resourcesDart,
  String? models,
  String? exceptions,
  Map<String, String> apis = const {},
  Map<String, String> config = const {},
  Map<String, String> lib = const {},
  required List<Object /* String | Matcher */ > errors,
  void Function(Project)? expectProject,
}) {
  test(name, skip: skip, () async {
    celestProject = await newProject(
      name: name,
      analysisOptions: analysisOptions,
      projectDart: projectDart,
      authDart: authDart,
      resourcesDart: resourcesDart,
      models: models,
      exceptions: exceptions,
      apis: apis,
      config: config,
      lib: lib,
    );
    final analyzer = CelestAnalyzer();
    final CelestAnalysisResult(:project, errors: actual) =
        await analyzer.analyzeProject();
    for (final error in actual) {
      print(error);
    }
    expect(
      actual.map((e) => e.toString()),
      unorderedEquals(
        errors.map((error) {
          return switch (error) {
            Matcher _ => error,
            String _ => contains(error),
            _ => unreachable(),
          };
        }),
      ),
    );
    if (actual.isEmpty) {
      expectProject?.call(project!);
    }
  });
}

void main() {
  group('Analyzer Errors', () {
    setUpAll(initTests);

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
        name: 'bad_file_name_underscore',
        apis: {
          '_greeting.dart': '''
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'API names may not start with an underscore',
        ],
      );

      testErrors(
        name: 'bad_parameter_types_core',
        apis: {
          'greeting.dart': '''
void sayHello({
  required Enum myEnum,
  required List<Enum> listOfEnum,
  required Iterable<Enum> iterableOfEnum,
  required void Function() function,
  required List<void Function()> listOfFunction,
  required Iterable<void Function()> iterableOfFunction,
  required Never never,
  required List<Never> listOfNever,
  required Iterable<Never> iterableOfNever,
  required void void_,
  required List<void> listOfVoid,
  required Iterable<void> iterableOfVoid,
  required Set<String> set,
  required Object obj,
  required Object? nullableObj,
  required dynamic dyn,
  required List<dynamic> listOfDyn,
  required Iterable<dynamic> iterableOfDyn,
  required Symbol symbol,
  required List<Symbol> listOfSymbol,
  required Iterable<Symbol> iterableOfSymbol,
  required Type type,
  required List<Type> listOfType,
  required Iterable<Type> iterableOfType,
  required Stream<String> streamOfStrings,
  required Stream streamOfDynamics,
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
          'Never types are not supported', // Never
          'Never types are not supported', // List<Never>
          'Never types are not supported', // Iterable<Never>
          'Void types are not supported', // void
          'Void types are not supported', // List<void>
          'Void types are not supported', // Iterable<void>
          'Set types are not supported', // Set<String>
          'Object types are not supported', // Object
          'Object types are not supported', // Object?
          'Dynamic values are not supported', // dynamic
          'Dynamic values are not supported', // List<dynamic>
          'Dynamic values are not supported', // Iterable<dynamic>
          'Symbol types are not supported', // Symbol
          'Symbol types are not supported', // List<Symbol>
          'Symbol types are not supported', // Iterable<Symbol>
          'Type literals are not supported', // Type
          'Type literals are not supported', // List<Type>
          'Type literals are not supported', // Iterable<Type>
          'Stream types are not supported', // Stream<String>
          'Stream types are not supported', // Stream
        ],
      );

      testErrors(
        name: 'bad_parameter_extension_types_core',
        apis: {
          'greeting.dart': '''
void sayHello({
  required EnumX myEnum,
  required ListOfEnumX listOfEnum,
  required IterableOfEnumX iterableOfEnum,
  required FunctionX function,
  required ListOfFunctionX listOfFunction,
  required IterableOfFunctionX iterableOfFunction,
  required VoidX void_,
  required ListOfVoidX listOfVoid,
  required IterableOfVoidX iterableOfVoid,
  required SetX set,
  required ObjectX obj,
  required NullableObjectX nullableObj,
  required DynamicX dyn,
  required ListOfDynamicX listOfDyn,
  required IterableOfDynamicX iterableOfDyn,
  required SymbolX symbol,
  required ListOfSymbolX listOfSymbol,
  required IterableOfSymbolX iterableOfSymbol,
  required TypeX type,
  required ListOfTypeX listOfType,
  required IterableOfTypeX iterableOfType,
  required StreamOfStringsX streamOfStrings,
  required StreamX streamOfDynamics,
}) {}
''',
        },
        models: '''
extension type EnumX(Enum _) {}
extension type ListOfEnumX(List<Enum> _) {}
extension type IterableOfEnumX(Iterable<Enum> _) {}
extension type FunctionX(void Function() _) {}
extension type ListOfFunctionX(List<void Function()> _) {}
extension type IterableOfFunctionX(Iterable<void Function()> _) {}
extension type VoidX(void _) {}
extension type ListOfVoidX(List<void> _) {}
extension type IterableOfVoidX(Iterable<void> _) {}
extension type SetX(Set<String> _) {}
extension type ObjectX(Object _) {}
extension type NullableObjectX(Object? _) {}
extension type DynamicX(dynamic _) {}
extension type ListOfDynamicX(List<dynamic> _) {}
extension type IterableOfDynamicX(Iterable<dynamic> _) {}
extension type SymbolX(Symbol _) {}
extension type ListOfSymbolX(List<Symbol> _) {}
extension type IterableOfSymbolX(Iterable<Symbol> _) {}
extension type TypeX(Type _) {}
extension type ListOfTypeX(List<Type> _) {}
extension type IterableOfTypeX(Iterable<Type> _) {}
extension type StreamOfStringsX(Stream<String> _) {}
extension type StreamX(Stream _) {}
''',
        errors: [
          'The representation type of EnumX is not serializable',
          'Untyped enums are not supported', // Enum
          'The representation type of ListOfEnumX is not serializable',
          'Untyped enums are not supported', // List<Enum>
          'The representation type of IterableOfEnumX is not serializable',
          'Untyped enums are not supported', // Iterable<Enum>
          'The representation type of FunctionX is not serializable',
          'Function types are not supported', // void Function()
          'The representation type of ListOfFunctionX is not serializable',
          'Function types are not supported', // List<void Function()>
          'The representation type of IterableOfFunctionX is not serializable',
          'Function types are not supported', // Iterable<void Function()>
          'The representation type of VoidX is not serializable',
          'Void types are not supported', // void
          'The representation type of ListOfVoidX is not serializable',
          'Void types are not supported', // List<void>
          'The representation type of IterableOfVoidX is not serializable',
          'Void types are not supported', // Iterable<void>
          'The representation type of SetX is not serializable',
          'Set types are not supported', // Set<String>
          'The representation type of ObjectX is not serializable',
          'Object types are not supported', // Object
          'The representation type of NullableObjectX is not serializable',
          'Object types are not supported', // Object?
          'The representation type of DynamicX is not serializable',
          'Dynamic values are not supported', // dynamic
          'The representation type of ListOfDynamicX is not serializable',
          'Dynamic values are not supported', // List<dynamic>
          'The representation type of IterableOfDynamicX is not serializable',
          'Dynamic values are not supported', // Iterable<dynamic>
          'The representation type of SymbolX is not serializable',
          'Symbol types are not supported', // Symbol
          'The representation type of ListOfSymbolX is not serializable',
          'Symbol types are not supported', // List<Symbol>
          'The representation type of IterableOfSymbolX is not serializable',
          'Symbol types are not supported', // Iterable<Symbol>
          'The representation type of TypeX is not serializable',
          'Type literals are not supported', // Type
          'The representation type of ListOfTypeX is not serializable',
          'Type literals are not supported', // List<Type>
          'The representation type of IterableOfTypeX is not serializable',
          'Type literals are not supported', // Iterable<Type>
          'The representation type of StreamOfStringsX is not serializable',
          'Stream types are not supported', // Stream<String>
          'The representation type of StreamX is not serializable',
          'Stream types are not supported', // Stream
        ],
      );

      testErrors(
        name: 'bad_return_types_core',
        apis: {
          'greeting.dart': '''
ReturnTypes sayHello() => throw UnimplementedError();
''',
        },
        models: '''
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
  Object obj,
  Object? nullableObj,
  dynamic dyn,
  List<dynamic> listOfDyn,
  Iterable<dynamic> iterableOfDyn,
  Symbol symbol,
  List<Symbol> listOfSymbol,
  Iterable<Symbol> iterableOfSymbol,
  Type type,
  List<Type> listOfType,
  Iterable<Type> iterableOfType,
  Stream<String> streamOfStrings,
  Stream streamOfDynamics,
});
''',
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
          'Object types are not supported', // Object
          'Object types are not supported', // Object?
          'Dynamic values are not supported', // dynamic
          'Dynamic values are not supported', // List<dynamic>
          'Dynamic values are not supported', // Iterable<dynamic>
          'Symbol types are not supported', // Symbol
          'Symbol types are not supported', // List<Symbol>
          'Symbol types are not supported', // Iterable<Symbol>
          'Type literals are not supported', // Type
          'Type literals are not supported', // List<Type>
          'Type literals are not supported', // Iterable<Type>
          'Stream types are not supported', // Stream<String>
          'Stream types are not supported', // Stream
        ],
      );

      testErrors(
        name: 'bad_return_extension_types_core',
        apis: {
          'greeting.dart': '''
ReturnTypes sayHello() => throw UnimplementedError();
''',
        },
        models: '''
extension type EnumX(Enum _) {}
extension type ListOfEnumX(List<Enum> _) {}
extension type IterableOfEnumX(Iterable<Enum> _) {}
extension type FunctionX(void Function() _) {}
extension type ListOfFunctionX(List<void Function()> _) {}
extension type IterableOfFunctionX(Iterable<void Function()> _) {}
extension type VoidX(void _) {}
extension type ListOfVoidX(List<void> _) {}
extension type IterableOfVoidX(Iterable<void> _) {}
extension type SetX(Set<String> _) {}
extension type ObjectX(Object _) {}
extension type NullableObjectX(Object? _) {}
extension type DynamicX(dynamic _) {}
extension type ListOfDynamicX(List<dynamic> _) {}
extension type IterableOfDynamicX(Iterable<dynamic> _) {}
extension type SymbolX(Symbol _) {}
extension type ListOfSymbolX(List<Symbol> _) {}
extension type IterableOfSymbolX(Iterable<Symbol> _) {}
extension type TypeX(Type _) {}
extension type ListOfTypeX(List<Type> _) {}
extension type IterableOfTypeX(Iterable<Type> _) {}
extension type StreamOfStringsX(Stream<String> _) {}
extension type StreamX(Stream _) {}

typedef ReturnTypes = ({
  EnumX enum,
  ListOfEnumX listOfEnum,
  IterableOfEnumX iterableOfEnum,
  FunctionX function,
  ListOfFunctionX listOfFunction,
  IterableOfFunctionX iterableOfFunction,
  VoidX void_,
  ListOfVoidX listOfVoid,
  IterableOfVoidX iterableOfVoid,
  SetX set,
  ObjectX obj,
  NullableObjectX nullableObj,
  DynamicX dyn,
  ListOfDynamicX listOfDyn,
  IterableOfDynamicX iterableOfDyn,
  SymbolX symbol,
  ListOfSymbolX listOfSymbol,
  IterableOfSymbolX iterableOfSymbol,
  TypeX type,
  ListOfTypeX listOfType,
  IterableOfTypeX iterableOfType,
  StreamOfStringsX streamOfStrings,
  StreamX streamOfDynamics,
});
''',
        errors: [
          'The representation type of EnumX is not serializable',
          'Untyped enums are not supported', // Enum
          'The representation type of ListOfEnumX is not serializable',
          'Untyped enums are not supported', // List<Enum>
          'The representation type of IterableOfEnumX is not serializable',
          'Untyped enums are not supported', // Iterable<Enum>
          'The representation type of FunctionX is not serializable',
          'Function types are not supported', // void Function()
          'The representation type of ListOfFunctionX is not serializable',
          'Function types are not supported', // List<void Function()>
          'The representation type of IterableOfFunctionX is not serializable',
          'Function types are not supported', // Iterable<void Function()>
          'The representation type of VoidX is not serializable',
          'Void types are not supported', // void
          'The representation type of ListOfVoidX is not serializable',
          'Void types are not supported', // List<void>
          'The representation type of IterableOfVoidX is not serializable',
          'Void types are not supported', // Iterable<void>
          'The representation type of SetX is not serializable',
          'Set types are not supported', // Set<String>
          'The representation type of ObjectX is not serializable',
          'Object types are not supported', // Object
          'The representation type of NullableObjectX is not serializable',
          'Object types are not supported', // Object?
          'The representation type of DynamicX is not serializable',
          'Dynamic values are not supported', // dynamic
          'The representation type of ListOfDynamicX is not serializable',
          'Dynamic values are not supported', // List<dynamic>
          'The representation type of IterableOfDynamicX is not serializable',
          'Dynamic values are not supported', // Iterable<dynamic>
          'The representation type of SymbolX is not serializable',
          'Symbol types are not supported', // Symbol
          'The representation type of ListOfSymbolX is not serializable',
          'Symbol types are not supported', // List<Symbol>
          'The representation type of IterableOfSymbolX is not serializable',
          'Symbol types are not supported', // Iterable<Symbol>
          'The representation type of TypeX is not serializable',
          'Type literals are not supported', // Type
          'The representation type of ListOfTypeX is not serializable',
          'Type literals are not supported', // List<Type>
          'The representation type of IterableOfTypeX is not serializable',
          'Type literals are not supported', // Iterable<Type>
          'The representation type of StreamOfStringsX is not serializable',
          'Stream types are not supported', // Stream<String>
          'The representation type of StreamX is not serializable',
          'Stream types are not supported', // Stream
        ],
      );

      testNoErrors(
        name: 'extension_type_primitives',
        apis: {
          'greeting.dart': '''
StringX string(StringX s) => s;
StringXString stringString(StringXString s) => s;
''',
        },
        models: '''
extension type StringX(String s) {}
extension type StringXString(String s) implements String {}
''',
      );

      testNoErrors(
        name: 'allows_map_string_dynamic_object',
        apis: {
          'greeting.dart': '''
Map<String, dynamic> mapStringDynamic(Map<String, dynamic> map) => map;
Map<String, Object> mapStringObject(Map<String, Object> map) => map;
Map<String, Object?> mapStringObjectNullable(Map<String, Object?> map) => map;
''',
        },
      );

      testErrors(
        name: 'disallows_list_dynamic_object',
        apis: {
          'greeting.dart': '''
List<dynamic> listDynamic() => [];
List<Object> listObject() => [];
List<Object?> listObjectNullable() => [];
''',
        },
        errors: [
          'Dynamic values are not supported',
          'Object types are not supported',
          'Object types are not supported',
        ],
      );

      testErrors(
        name: 'bad_json_parameter',
        apis: {
          'greeting.dart': '''
String sayHello(NotJsonable _) => 'Hello, World!';
''',
        },
        models: '''
abstract class NotJsonable {}
''',
        errors: [
          'The type of a parameter must be serializable as JSON. '
              'Class NotJsonable is abstract and must have an unnamed factory or '
              'fromJson factory constructor to be used.',
        ],
      );

      testErrors(
        name: 'positional_record_fields',
        apis: {
          'greeting.dart': '''
(String positionalField,) sayHello((String positionalField,) _) => ('Hello, World!',);
''',
        },
        errors: [
          'Positional fields are not supported in record types',
          'Positional fields are not supported in record types',
        ],
      );

      testErrors(
        name: 'positional_record_fields_aliased',
        apis: {
          'greeting.dart': '''
PositionalFields sayHello(PositionalFields _) => ('Hello, World!',);
''',
        },
        models: '''
typedef PositionalFields = (String positionalField);
''',
        errors: [
          'Positional fields are not supported in record types',
          'Positional fields are not supported in record types',
        ],
      );

      testErrors(
        name: 'parameter_with_subtypes',
        apis: {
          'greeting.dart': '''
String sayHello(Base _) => 'Hello, World!';
''',
        },
        models: '''
class Base {}
final class Actual extends Base {}
''',
        errors: [
          'Classes with subtypes (which are not sealed classes) are not currently supported as parameters',
        ],
      );

      testErrors(
        name: 'return_type_with_subtypes',
        apis: {
          'greeting.dart': '''
Base sayHello() => Base();
''',
        },
        models: '''
class Base {}
final class Actual extends Base {}
''',
        errors: [
          'Classes with subtypes (which are not sealed classes) are not currently supported as return types',
        ],
      );

      testNoErrors(
        name: 'valid_jsonable',
        apis: {
          'greeting.dart': '''
ValidJsonable sayHello(ValidJsonable param) => param;
''',
        },
        models: '''
class ValidJsonable {}
''',
      );

      testNoErrors(
        name: 'valid_custom_json',
        apis: {
          'greeting.dart': '''
ValidCustomJson sayHello(ValidCustomJson param) => param;
''',
        },
        models: '''
class ValidCustomJson {
  factory ValidCustomJson.fromJson(Map<String, dynamic> _) => throw UnimplementedError();
  Map<String, dynamic> toJson() => throw UnimplementedError();
}
''',
      );

      testNoErrors(
        name: 'custom_json_in_mixin',
        lib: {
          'models': {
            'test.dart': '''
class NotSerializable with _NotSerializable {
  NotSerializable({
    Future<int>? value,
  }): value = value ?? Future.value(42);

  factory NotSerializable.fromJson(Map<String, dynamic> json) {
    return NotSerializable(
      value: Future.value(json['value'] as int),
    );
  }

  final Future<int> value;
}

mixin _NotSerializable on NotSerializable {
  Map<String, dynamic> toJson() => {'value': 42};
}
''',
          },
        },
        apis: {
          'test.dart': '''
import 'package:custom_json_in_mixin/models/test.dart';

NotSerializable test() => NotSerializable();
''',
        },
      );

      testNoErrors(
        name: 'valid_static_fromJson',
        apis: {
          'greeting.dart': '''
ValidFromJsonStatic sayHello(ValidFromJsonStatic param) => param;
''',
        },
        models: '''
class ValidFromJsonStatic {
  static ValidFromJsonStatic fromJson(Map<String, dynamic> _) => throw UnimplementedError();
  Map<String, dynamic> toJson() => throw UnimplementedError();
}
''',
      );

      testErrors(
        name: 'invalid_static_fromJson',
        apis: {
          'greeting.dart': '''
void sayHello(ValidFromJsonStatic param) {}
''',
        },
        models: '''
class ValidFromJsonStatic {
  static ValidFromJsonStatic? fromJson(Map<String, dynamic> _) => throw UnimplementedError();
  Map<String, dynamic> toJson() => throw UnimplementedError();
}
''',
        errors: [
          'The return type of ValidFromJsonStatic\'s fromJson constructor must '
              'be ValidFromJsonStatic',
        ],
      );

      testErrors(
        name: 'direct_cycle',
        apis: {
          'greeting.dart': '''
void sayHello(ValidJsonable param) => param;
''',
        },
        models: '''
class ValidJsonable {
  const ValidJsonable(this.value);

  final ValidJsonable value;
}
''',
        errors: [
          'Classes are not allowed to have fields of their own type',
        ],
      );

      testNoErrors(
        name: 'indirect_cycle',
        apis: {
          'greeting.dart': '''
void sayHello(ValidJsonable param) => param;
''',
        },
        models: '''
class ValidJsonable {
  const ValidJsonable(this.value, this.values, this.wrapper);

  final ValidJsonable? value;
  final List<ValidJsonable> values;
  final ValidJsonableWrapper wrapper;
}

class ValidJsonableWrapper {
  const ValidJsonableWrapper(this.value);

  final ValidJsonable value;
}
''',
      );

      testErrors(
        name: 'bad_json_return',
        apis: {
          'greeting.dart': '''
NotJsonable sayHello() => throw UnimplementedError();
''',
        },
        models: '''
class NotJsonable {
  NotJson(this.value);

  final Enum value;
}
''',
        errors: [
          'Untyped enums are not supported',
        ],
      );

      testErrors(
        name: 'non_map_from_json',
        apis: {
          'greeting.dart': '''
NonMapFromJson nonMayFromJson(NonMapFromJson value) => value;
''',
        },
        models: '''
class NonMapFromJson {
  NonMapFromJson.fromJson(this.field);

  final String field;
}
''',
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
FromJson fromJson(FromJson value) => value;
''',
        },
        models: '''
class FromJson {
  FromJson.fromJson([Map<String, Object?>? json]): 
    field = json?['field'] as String? ?? 'default';

  final String field;
}
''',
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
        name: 'bad_parameter_names',
        apis: {
          'greeting.dart': r'''
String sayHello(String $param) => 'Hello, World!';
''',
        },
        errors: [
          'Parameter names may not start with a dollar sign',
        ],
      );

      testErrors(
        name: 'private_parameter_type',
        apis: {
          'greeting.dart': r'''
String sayHello(Private privateAliased) => 'Hello, World!';
''',
        },
        models: '''
class _Private {
  const _Private();
}

typedef Private = _Private;
''',
        errors: [
          'Private types are not supported',
        ],
      );

      testErrors(
        name: 'sealed_via_mixins',
        apis: {
          'greeting.dart': r'''
void sealedViaMixins(Base base) {}
''',
        },
        models: '''
sealed class Base {}

mixin class BaseMixin implements Base {}

final class Leaf with BaseMixin {}
''',
        errors: [
          // Base and BaseMixin are not allowed as parameter/return types
          // because they have unsealed classes in their hierarchy or are
          // unsealed themselves.
          allOf([
            contains(
              'Classes with subtypes (which are not sealed classes) are not '
              'currently supported',
            ),
            contains('BaseMixin'),
            contains('Base'),
            isNot(contains('Leaf')),
          ]),
        ],
      );

      testErrors(
        name: 'sealed_with_conflicting_wire_types',
        apis: {
          'greeting.dart': r'''
List<Base> takesLeaves(LeafA a, LeafB b) => [a, b];
''',
        },
        models: '''
sealed class Base {}

final class LeafA extends Base {}

final class LeafB extends Base {
  LeafB.fromJson(String json);

  String toJson() => '';
}
''',
        errors: [
          'All classes in a sealed class hierarchy must use Map<String, Object?>',
        ],
      );

      testNoErrors(
        name: 'valid_def_locations',
        apis: {
          'greeting.dart': '''
ValidJsonable sayHello(ValidJsonable param) => throw ValidException();
''',
        },
        models: '''
class ValidJsonable {}
''',
        exceptions: '''
class ValidException implements Exception {}
''',
      );

      testErrors(
        name: 'invalid_return_def_location',
        apis: {
          'greeting.dart': '''
class ValidJsonable {}
ValidJsonable sayHello() => throw UnimplementedError();
''',
        },
        errors: [
          'Custom model types referenced in APIs must be defined within the '
              '`celest/lib/models` folder',
        ],
      );

      testErrors(
        name: 'invalid_param_def_location',
        apis: {
          'greeting.dart': '''
class ValidJsonable {}
void sayHello(ValidJsonable param) => print(param);
''',
        },
        errors: [
          'Custom model types referenced in APIs must be defined within the '
              '`celest/lib/models` folder',
        ],
      );

      testErrors(
        name: 'invalid_model_def_location_in_lib',
        apis: {
          'greeting.dart': '''
import 'package:invalid_model_def_location_in_lib/valid_jsonable.dart';

void sayHello(ValidJsonable param) => print(param);
''',
        },
        lib: {
          'valid_jsonable.dart': '''
class ValidJsonable {}
''',
        },
        errors: [
          'Custom model types referenced in APIs must be defined within the '
              '`celest/lib/models` folder',
        ],
      );

      testErrors(
        name: 'invalid_exception_def_location',
        apis: {
          'greeting.dart': '''
class ValidException implements Exception {}

void sayHello() => throw ValidException();
''',
        },
        errors: [
          'Custom exception types referenced in APIs must be defined within the '
              '`celest/lib/exceptions` folder',
        ],
      );

      testErrors(
        name: 'invalid_exception_def_location_in_lib',
        apis: {
          'greeting.dart': '''
import 'package:invalid_exception_def_location_in_lib/valid_exception.dart';

void sayHello() => throw ValidException();
''',
        },
        lib: {
          'valid_exception.dart': '''
class ValidException implements Exception {}
''',
        },
        errors: [
          'Custom exception types referenced in APIs must be defined within the '
              '`celest/lib/exceptions` folder',
        ],
      );

      testErrors(
        name: 'function_with_same_name',
        apis: {
          'greeting.dart': '''
void sayHello() {}
void sayHello() {}
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        errors: [
          "The name 'sayHello' is already defined",
        ],
      );

      testNoErrors(
        name: 'api_authenticated',
        apis: {
          'greeting.dart': '''
@authenticated
library;

import 'package:celest/celest.dart';

String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
      );

      testNoErrors(
        name: 'api_public',
        apis: {
          'greeting.dart': '''
@public
library;

import 'package:celest/celest.dart';

String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
      );

      testErrors(
        name: 'multiple_api_auth',
        apis: {
          'greeting.dart': '''
@public
@authenticated
library;

import 'package:celest/celest.dart';

String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        errors: [
          'Only one `@authenticated` or `@public` annotation may be '
              'specified on the same function or API library',
        ],
      );

      testErrors(
        name: 'multiple_api_auth_same_type',
        apis: {
          'greeting.dart': '''
@authenticated
@authenticated
library;

import 'package:celest/celest.dart';

String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        errors: [
          'Only one `@authenticated` or `@public` annotation may be '
              'specified on the same function or API library',
        ],
      );

      testNoErrors(
        name: 'function_authenticated',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@authenticated
String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
      );

      testNoErrors(
        name: 'function_public',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@public
String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
      );

      testNoErrors(
        name: 'function_public_no_auth',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@public
String sayHello() => 'Hello, World!';
''',
        },
      );

      testErrors(
        name: 'function_authenticated_no_auth',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@authenticated
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'The `@authenticated` annotation may only be used in '
              'projects with authentication enabled.',
        ],
      );

      testErrors(
        name: 'multiple_function_auth',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@public
@authenticated
String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        errors: [
          'Only one `@authenticated` or `@public` annotation may be '
              'specified on the same function or API library',
        ],
      );

      testErrors(
        name: 'multiple_function_auth_same_type',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@authenticated
@authenticated
String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        errors: [
          'Only one `@authenticated` or `@public` annotation may be '
              'specified on the same function or API library',
        ],
      );

      testNoErrors(
        name: 'api_public_no_auth',
        apis: {
          'greeting.dart': '''
@public
library;

import 'package:celest/celest.dart';

String sayHello() => 'Hello, World!';
''',
        },
      );

      testErrors(
        name: 'api_authenticated_no_auth',
        apis: {
          'greeting.dart': '''
@authenticated
library;

import 'package:celest/celest.dart';

String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'The `@authenticated` annotation may only be used in '
              'projects with authentication enabled.',
        ],
      );

      testErrors(
        name: 'conflicting_auth',
        apis: {
          'greeting.dart': '''
@authenticated
library;

import 'package:celest/celest.dart';

@public
String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        errors: [
          '`@public` has no effect when `@authenticated` is applied at the '
              'API level. It is recommended to move the `@public` method to '
              'another API.',
        ],
      );
    });

    group('context', () {
      testNoErrors(
        name: 'function_authenticated_context',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@authenticated
String sayHello({
  @Context.user required User user,
}) => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        expectProject: (project) {
          check(project.apis['greeting'])
              .isNotNull()
              .has((it) => it.functions['sayHello'], 'function')
              .isNotNull()
              .has((it) => it.parameters.firstOrNull, 'parameter')
              .isNotNull()
              .has((it) => it.references, 'nodeReference')
              .isNotNull()
              .has((it) => it.type, 'type')
              .equals(NodeType.userContext);
        },
      );

      testNoErrors(
        name: 'function_public_context',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@public
String sayHello({
  @Context.user User? user,
}) => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        expectProject: (project) {
          check(project.apis['greeting'])
              .isNotNull()
              .has((it) => it.functions['sayHello'], 'function')
              .isNotNull()
              .has((it) => it.parameters.firstOrNull, 'parameter')
              .isNotNull()
              .has((it) => it.references, 'nodeReference')
              .isNotNull()
              .has((it) => it.type, 'type')
              .equals(NodeType.userContext);
        },
      );

      testNoErrors(
        name: 'api_authenticated_context',
        apis: {
          'greeting.dart': '''
@authenticated
library;

import 'package:celest/celest.dart';

String sayHello({
  @Context.user required User user,
}) => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        expectProject: (project) {
          check(project.apis['greeting'])
              .isNotNull()
              .has((it) => it.functions['sayHello'], 'function')
              .isNotNull()
              .has((it) => it.parameters.firstOrNull, 'parameter')
              .isNotNull()
              .has((it) => it.references, 'nodeReference')
              .isNotNull()
              .has((it) => it.type, 'type')
              .equals(NodeType.userContext);
        },
      );

      testNoErrors(
        name: 'api_public_context',
        apis: {
          'greeting.dart': '''
@public
library;

import 'package:celest/celest.dart';

String sayHello({
  @Context.user User? user,
}) => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        expectProject: (project) {
          check(project.apis['greeting'])
              .isNotNull()
              .has((it) => it.functions['sayHello'], 'function')
              .isNotNull()
              .has((it) => it.parameters.firstOrNull, 'parameter')
              .isNotNull()
              .has((it) => it.references, 'nodeReference')
              .isNotNull()
              .has((it) => it.type, 'type')
              .equals(NodeType.userContext);
        },
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

abstract final class Env {
  static const myName = EnvironmentVariable(name: r'MY_NAME');
  static const myAge = EnvironmentVariable(name: r'MY_AGE');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../resources.dart' as resources;

void sayHelloPositional(
  @resources.Env.myName String name,
  @resources.Env.myAge int age,
) => 'Hello, $name. I am $age years old.';

void sayHelloNamed({
  @resources.Env.myName required String name,
  @resources.Env.myAge required int age,  
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

abstract final class Env {
  static const myName = EnvironmentVariable(name: r'MY_NAME');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../resources.dart' as resources;

void sayHello(@resources.Env.myName List<String> name) => 'Hello, $name';
''',
        },
        errors: [
          'The type of an environment variable parameter must be one of: '
              '`String`, `Uri`, `int`, `double`, `num`, or `bool`',
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

abstract final class Env {
  static const port = EnvironmentVariable(name: r'PORT');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../resources.dart' as resources;

void sayHello(@resources.Env.port int port) => 'Hello, $port';
''',
        },
        errors: [
          'The environment variable name `PORT` is reserved by Celest',
        ],
      );

      testErrors(
        name: 'multiple_env_applications',
        config: {
          '.env': '''
PORT=8080
''',
        },
        resourcesDart: '''
import 'package:celest/celest.dart';

abstract final class Env {
  static const port = EnvironmentVariable(name: r'PORT');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../resources.dart' as resources;

void sayHello(
  @resources.Env.port
  @resources.Env.port
    int port,
) => 'Hello, $port';
''',
        },
        errors: [
          'Only one annotation may be specified on a parameter',
        ],
      );
    });

    group('auth', () {
      // TODO(dnys1): Report error?
      // testErrors(
      //   name: 'no_auth',
      //   authDart: '',
      //   errors: [
      //     'No `Auth` type found',
      //   ],
      // );

      testNoErrors(
        name: 'valid_inline_provider',
        authDart: '''
const auth = Auth(
  providers: [
    AuthProvider.email(),
  ],
);
''',
        expectProject: (project) {
          check(project.auth)
              .isNotNull()
              .has((it) => it.providers, 'providers')
              .single
              .has((it) => it.type, 'type')
              .equals(AuthProviderType.email);
        },
      );

      testNoErrors(
        name: 'valid_referenced_provider',
        authDart: '''
const email = AuthProvider.email();
const auth = Auth(
  providers: [email],
);
''',
        expectProject: (project) {
          check(project.auth)
              .isNotNull()
              .has((it) => it.providers, 'providers')
              .single
              .has((it) => it.type, 'type')
              .equals(AuthProviderType.email);
        },
      );

      testErrors(
        name: 'no_providers',
        authDart: '''
const auth = Auth(
  providers: [],
);
''',
        errors: [
          'At least one Auth provider must be specified',
        ],
      );

      testErrors(
        name: 'duplicate_provider',
        authDart: '''
const email = AuthProvider.email();
const auth = Auth(
  providers: [email, email],
);
''',
        errors: [
          'Duplicate auth provider',
        ],
      );
    });
  });
}
