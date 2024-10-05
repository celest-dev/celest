import 'dart:io';

import 'package:celest/http.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/pub/pub_environment.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
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
  Map<String, Object /* String | Map<String, Object?>*/ > lib = const {},
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
  PackageConfig.writeString(
    packageConfig,
    packageConfigJson,
    p.toUri(p.join(d.sandbox, name)),
  );
  print(packageConfigJson.toString());
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
    if (authDart != null) d.file('auth.dart', '''
import 'package:celest/celest.dart';

$authDart
'''),
    if (config.isNotEmpty)
      d.dir('config', [
        for (final MapEntry(key: fileName, value: contents) in config.entries)
          d.file(fileName, contents),
      ]),
    d.dir('lib', [
      d.file('models.dart', models ?? ''),
      d.file('exceptions.dart', exceptions ?? ''),
      ..._nestedDescriptor(
        _mergeMaps(lib, {
          'src': {
            'generated': {
              'resources.dart': resourcesDart ?? '',
            },
            if (apis.isNotEmpty)
              'functions': {
                for (final MapEntry(key: fileName, value: contents)
                    in apis.entries)
                  fileName: contents.startsWith('@')
                      ? contents
                      : '''
import 'package:celest/celest.dart';
import 'package:$name/exceptions.dart';
import 'package:$name/models.dart';

$contents
''',
              },
          },
        }),
      ),
    ]),
  ]);
  await project.create(parentDirectory);
  final projectRoot = p.join(parentDirectory ?? d.sandbox, name);
  await init(projectRoot: projectRoot);
  return celestProject;
}

Map<K, V> _mergeMaps<K, V>(Map<K, V> a, Map<K, V> b) {
  final result = <K, V>{};
  for (final entry in a.entries) {
    result[entry.key] = entry.value;
  }
  for (final entry in b.entries) {
    final key = entry.key;
    final value = entry.value;
    if (result.containsKey(key)) {
      final existing = result[key];
      if (existing is Map<K, V> && value is Map<K, V>) {
        result[key] = _mergeMaps(existing, value) as V;
      } else {
        result[key] = value;
      }
    } else {
      result[key] = value;
    }
  }
  return result;
}

Iterable<d.Descriptor> _nestedDescriptor(
  Map<String, Object> descriptors,
) sync* {
  for (final MapEntry(key: name, value: contents) in descriptors.entries) {
    yield switch (contents) {
      String() => d.file(name, contents),
      Map() => d.dir(
          name,
          _nestedDescriptor(contents.cast()),
        ),
      _ => unreachable(),
    };
  }
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
  Map<String, Object> lib = const {},
  void Function(Project)? expectProject,
  List<Object /* String | Matcher */ > warnings = const [],
}) {
  testErrors(
    name: name,
    analysisOptions: analysisOptions,
    skip: skip,
    errors: [],
    warnings: warnings,
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
  Map<String, Object> lib = const {},
  required List<Object /* String | Matcher */ > errors,
  List<Object /* String | Matcher */ > warnings = const [],
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
    final CelestAnalysisResult(
      :project,
      errors: actualErrors,
      warnings: actualWarnings
    ) = await analyzer.analyzeProject();
    for (final error in actualErrors) {
      print(error);
    }
    expect(
      actualErrors.map((e) => e.toString()),
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
    expect(
      actualWarnings.map((e) => e.toString()),
      unorderedEquals(
        warnings.map((warning) {
          return switch (warning) {
            Matcher _ => warning,
            String _ => contains(warning),
            _ => unreachable(),
          };
        }),
      ),
    );
    if (actualErrors.isEmpty) {
      expectProject?.call(project!);
    }
  });
}

void main() {
  group('CelestAnalyzer', () {
    setUpAll(initTests);

    group('part files', () {
      testNoErrors(
        name: 'can_resolve_part_files',
        lib: {
          'models': {
            'test.dart': '''
part 'test.g.dart';
''',
            'test.g.dart': '''
part of 'test.dart';

class Test {}
''',
          },
        },
        apis: {
          'test.dart': '''
import 'package:can_resolve_part_files/models/test.dart';

@cloud
Test test() => Test();
''',
        },
      );

      testNoErrors(
        name: 'can_define_to_json_in_part_files',
        lib: {
          'models': {
            'test.dart': '''
part 'test.g.dart';

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
''',
            'test.g.dart': '''
part of 'test.dart';

mixin _NotSerializable on NotSerializable {
  Map<String, dynamic> toJson() => {'value': 42};
}
''',
          },
        },
        apis: {
          'test.dart': '''
import 'package:can_define_to_json_in_part_files/models/test.dart';

@cloud
NotSerializable test() => NotSerializable();
''',
        },
      );
    });

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
import 'package:celest/celest.dart';

@cloud
String sayHello() => 'Hello, World!';
''',
        },
      );

      testErrors(
        name: 'bad_file_name',
        apis: {
          'greeting.dev.dart': '''
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
StringX string(StringX s) => s;

@cloud
StringXString stringString(StringXString s) => s;
''',
        },
        models: '''
extension type StringX(String s) {}
extension type StringXString(String s) implements String {}
''',
      );

      testNoErrors(
        name: 'extension_type_complex',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@cloud
Value value(Value v) => v;
@cloud
ValueX valueX(ValueX v) => v;
@cloud
ValueXImpl valueXImpl(ValueXImpl v) => v;
''',
        },
        models: '''
class Value {
  const Value(this.value);

  factory Value.fromJson(String value) => Value(value);

  final String value;

  String toJson() => value;
}

extension type const ValueX(Value v) {}
extension type const ValueXImpl(Value v) implements Value {}
''',
      );

      testNoErrors(
        name: 'extension_type_complex_to_from_json',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@cloud
ValueXToFromJson valueXToFromJson(ValueXToFromJson v) => v;
@cloud
ValueXToJson valueXToJson(ValueXToJson v) => v;
@cloud
ValueXToJsonImpl valueXToJsonImpl(ValueXToJsonImpl v) => v;
@cloud
ValueXFromJson valueXFromJson(ValueXFromJson v) => v;
@cloud
ValueXFromJsonImpl valueXFromJsonImpl(ValueXFromJsonImpl v) => v;
@cloud
ValueXFromJsonStatic valueXFromJsonStatic(ValueXFromJsonStatic v) => v;
''',
        },
        models: r'''
class Value {
  const Value(this.value);

  factory Value.fromJson(String value) => Value(value);

  final String value;

  String toJson() => value;
}

extension type const ValueXToFromJson(Value v) {
  ValueXToFromJson.fromJson(String value) : v = Value('${value}FromJson');

  String toJson() => '${v.value}ToJson';
}
extension type const ValueXToJson(Value v) {
  Map<String, Object?> toJson() => {'value': '${v.value}ToJson'};
}
extension type const ValueXToJsonImpl(Value v) implements Value {
  String toJson() => '${v.value}ToJson';
}
extension type const ValueXFromJson(Value v) {
  ValueXFromJson.fromJson(Map<String, Object?> json)
      : v = Value('${json['value']}FromJson');
}
extension type const ValueXFromJsonImpl(Value v) implements Value {
  ValueXFromJsonImpl.fromJson(String value) : v = Value('${value}FromJson');

  String toJson() => v.toJson();
}
extension type const ValueXFromJsonStatic(Value v) {
  static ValueXFromJsonStatic fromJson(Map<String, Object?> json) =>
      ValueXFromJsonStatic(Value('${json['value']}FromJson'));
}
''',
      );

      testNoErrors(
        name: 'allows_map_string_dynamic_object',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@cloud
Map<String, dynamic> mapStringDynamic(Map<String, dynamic> map) => map;

@cloud
Map<String, Object> mapStringObject(Map<String, Object> map) => map;

@cloud
Map<String, Object?> mapStringObjectNullable(Map<String, Object?> map) => map;
''',
        },
      );

      testErrors(
        name: 'disallows_list_dynamic_object',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@cloud
List<dynamic> listDynamic() => [];

@cloud
List<Object> listObject() => [];

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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

@cloud
NotSerializable test() => NotSerializable();
''',
        },
      );

      testNoErrors(
        name: 'valid_static_fromJson',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
import 'package:celest/celest.dart';

@cloud
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
        name: 'legacy_def_locations',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@cloud
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

      // In V1, it is valid to define models in the same file as the API which
      // uses them.
      testNoErrors(
        name: 'valid_def_locations',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

class ValidJsonable {}
class ValidException implements Exception {}

@cloud
ValidJsonable sayHello(ValidJsonable param) => throw ValidException();
''',
        },
      );

      testErrors(
        name: 'function_with_same_name',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@cloud
void sayHello() {}

@cloud
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

      // Valid types but invalid to target with `@httpHeader`
      testErrors(
        name: 'http_header_invalid',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
String sayHello({
  @httpHeader('x-custom-regexp') required RegExp customRegex,
  @httpHeader('x-custom-bigint') required BigInt customBigInt,
  @httpHeader('x-custom-uri') required Uri customUri,
  @httpHeader('x-custom-list-regexp') required List<RegExp> customListRegex,
  @httpHeader('x-custom-list-bigint') required List<BigInt> customListBigInt,
  @httpHeader('x-custom-list-uri') required List<Uri> customListUri,
  @httpHeader('x-custom-list-string') required List<String> customListString,
  @httpHeader('x-custom-list-bool') required List<bool> customListBool,
  @httpHeader('x-custom-list-int') required List<int> customListInt,
  @httpHeader('x-custom-list-num') required List<num> customListNum,
  @httpHeader('x-custom-list-double') required List<double> customListDouble,
  @httpHeader('x-custom-list-datetime') required List<DateTime> customListDateTime,
  @httpHeader('x-custom-nullable-list-string')  List<String>? customNullableListString,
  @httpHeader('x-custom-nullable-list-bool')  List<bool>? customNullableListBool,
  @httpHeader('x-custom-nullable-list-int')  List<int>? customNullableListInt,
  @httpHeader('x-custom-nullable-list-num')  List<num>? customNullableListNum,
  @httpHeader('x-custom-nullable-list-double')  List<double>? customNullableListDouble,
  @httpHeader('x-custom-nullable-list-datetime')  List<DateTime>? customNullableListDateTime,
  @httpHeader('x-custom-nullable-list-nullable-string')  List<String?>? customNullableListNullableString,
  @httpHeader('x-custom-nullable-list-nullable-bool')  List<bool?>? customNullableListNullableBool,
  @httpHeader('x-custom-nullable-list-nullable-int')  List<int?>? customNullableListNullableInt,
  @httpHeader('x-custom-nullable-list-nullable-num')  List<num?>? customNullableListNullableNum,
  @httpHeader('x-custom-nullable-list-nullable-double')  List<double?>? customNullableListNullableDouble,
  @httpHeader('x-custom-nullable-list-nullable-datetime')  List<DateTime?>? customNullableListNullableDateTime,
}) => 'Hello, World!';
''',
        },
        errors: [
          'Invalid HTTP header type', // RegExp
          'Invalid HTTP header type', // BigInt
          'Invalid HTTP header type', // Uri
          'Invalid HTTP header type', // List<RegExp>
          'Invalid HTTP header type', // List<BigInt>
          'Invalid HTTP header type', // List<Uri>
          'Invalid HTTP header type', // List<String>
          'Invalid HTTP header type', // List<bool>
          'Invalid HTTP header type', // List<int>
          'Invalid HTTP header type', // List<num>
          'Invalid HTTP header type', // List<double>
          'Invalid HTTP header type', // List<DateTime>
          'Invalid HTTP header type', // List<String?>
          'Invalid HTTP header type', // List<bool?>
          'Invalid HTTP header type', // List<int?>
          'Invalid HTTP header type', // List<num?>
          'Invalid HTTP header type', // List<double?>
          'Invalid HTTP header type', // List<DateTime?>
          'Invalid HTTP header type', // List<String?>?
          'Invalid HTTP header type', // List<bool?>?
          'Invalid HTTP header type', // List<int?>?
          'Invalid HTTP header type', // List<num?>?
          'Invalid HTTP header type', // List<double?>?
          'Invalid HTTP header type', // List<DateTime?>?
        ],
      );

      // Valid types but invalid to target with `@httpHeader`
      testErrors(
        name: 'http_query_invalid',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
String sayHello({
  @httpQuery('x-custom-regexp') required RegExp customRegex,
  @httpQuery('x-custom-bigint') required BigInt customBigInt,
  @httpQuery('x-custom-uri') required Uri customUri,
  @httpQuery('x-custom-list-regexp') required List<RegExp> customListRegex,
  @httpQuery('x-custom-list-bigint') required List<BigInt> customListBigInt,
  @httpQuery('x-custom-list-uri') required List<Uri> customListUri,
}) => 'Hello, World!';
''',
        },
        errors: [
          'Invalid HTTP query type', // RegExp
          'Invalid HTTP query type', // BigInt
          'Invalid HTTP query type', // Uri
          'Invalid HTTP query type', // List<RegExp>
          'Invalid HTTP query type', // List<BigInt>
          'Invalid HTTP query type', // List<Uri>
        ],
      );
    });

    group('auth', () {
      testNoErrors(
        name: 'api_authenticated',
        apis: {
          'greeting.dart': '''
@authenticated
library;

import 'package:celest/celest.dart';

@cloud
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

@cloud
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

@cloud
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

@cloud
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

@cloud
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

@cloud
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

@cloud
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

@cloud
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

@cloud
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

@cloud
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

@cloud
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

@cloud
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'The `@authenticated` annotation may only be used in '
              'projects with authentication enabled.',
        ],
      );

      testNoErrors(
        name: 'conflicting_auth',
        apis: {
          'greeting.dart': '''
@authenticated
library;

import 'package:celest/celest.dart';

@cloud
@public
String sayHello() => 'Hello, World!';
''',
        },
        authDart: '''
const auth = Auth(
  providers: [AuthProvider.email()],
);
''',
        warnings: [
          '`@public` has no effect when `@authenticated` is applied at the '
              'API level. It is recommended to move the `@public` method to '
              'another API.',
        ],
      );
    });

    group('http', () {
      testNoErrors(
        name: 'http_method',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
@http(method: HttpMethod.get)
String sayHello() => 'Hello, World!';
''',
        },
        expectProject: (project) {
          final function = project.apis.values.single.functions.values.single;
          check(function.metadata.single)
              .isA<ApiHttpConfig>()
              .has((it) => it.method, 'method')
              .equals(HttpMethod.get);
        },
      );

      testNoErrors(
        name: 'http_status_valid',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
@http(statusCode: HttpStatus.created)
String sayHello() => 'Hello, World!';
''',
        },
        expectProject: (project) {
          final function = project.apis.values.single.functions.values.single;
          check(function.metadata.single)
              .isA<ApiHttpConfig>()
              .has((it) => it.statusCode, 'statusCode')
              .equals(HttpStatus.created);
        },
      );

      testErrors(
        name: 'http_status_invalid',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
@http(statusCode: HttpStatus(600))
String sayHello() => 'Hello, World!';
''',
        },
        errors: [
          'Invalid HTTP status code',
        ],
      );

      testNoErrors(
        name: 'http_errors_valid',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';
import 'package:http_errors_valid/exceptions.dart';

@cloud
@httpError(HttpStatus.unauthorized, UnauthorizedException, ForbiddenException)
@httpError(HttpStatus.notFound, ItemNotFoundException)
String sayHello() => 'Hello, World!';
''',
        },
        exceptions: '''
class ForbiddenException implements Exception {}
class ItemNotFoundException implements Exception {}
''',
        expectProject: (project) {
          final function = project.apis.values.single.functions.values.single;

          hasErrorType(String type, int statusCode) =>
              (Subject<ApiMetadata> it) => it.isA<ApiHttpError>()
                ..has((it) => it.type.symbol, 'symbol').equals(type)
                ..has((it) => it.statusCode, 'statusCode').equals(statusCode);

          check(function.metadata).containsInOrder([
            hasErrorType('UnauthorizedException', HttpStatus.unauthorized),
            hasErrorType('ForbiddenException', HttpStatus.unauthorized),
            hasErrorType('ItemNotFoundException', HttpStatus.notFound),
          ]);
        },
      );

      testNoErrors(
        name: 'http_header_valid',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
String sayHello({
  @httpHeader() required String header,
  @httpHeader('x-custom-string') required String customString,
  @httpHeader('x-custom-bool') required bool customBool,
  @httpHeader('x-custom-int') required int customInt,
  @httpHeader('x-custom-num') required num customNum,
  @httpHeader('x-custom-double') required double customDouble,
  @httpHeader('x-custom-datetime') required DateTime customDateTime,
  @httpHeader('x-custom-nullable-string') String? customNullableString,
  @httpHeader('x-custom-nullable-bool') bool? customNullableBool,
  @httpHeader('x-custom-nullable-int') int? customNullableInt,
  @httpHeader('x-custom-nullable-num') num? customNullableNum,
  @httpHeader('x-custom-nullable-double') double? customNullableDouble,
  @httpHeader('x-custom-nullable-datetime') DateTime? customNullableDateTime,
}) => 'Hello, World!';
''',
        },
        expectProject: (project) {
          final parameters =
              project.apis.values.single.functions.values.single.parameters;
          hasHeader(String name) => (Subject<CloudFunctionParameter> it) =>
              it.has((it) => it.references, 'references').isA<NodeReference>()
                ..has((it) => it.type, 'type').equals(NodeType.httpHeader)
                ..has((it) => it.name, 'name').equals(name);
          check(parameters).containsInOrder([
            hasHeader('header'),
            hasHeader('x-custom-string'),
            hasHeader('x-custom-bool'),
            hasHeader('x-custom-int'),
            hasHeader('x-custom-num'),
            hasHeader('x-custom-double'),
            hasHeader('x-custom-datetime'),
            hasHeader('x-custom-nullable-string'),
            hasHeader('x-custom-nullable-bool'),
            hasHeader('x-custom-nullable-int'),
            hasHeader('x-custom-nullable-num'),
            hasHeader('x-custom-nullable-double'),
            hasHeader('x-custom-nullable-datetime'),
          ]);
        },
      );

      testNoErrors(
        name: 'http_query_valid',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
String sayHello({
  @httpQuery() required String query,
  @httpQuery('x-custom-string') required String customString,
  @httpQuery('x-custom-bool') required bool customBool,
  @httpQuery('x-custom-int') required int customInt,
  @httpQuery('x-custom-num') required num customNum,
  @httpQuery('x-custom-double') required double customDouble,
  @httpQuery('x-custom-datetime') required DateTime customDateTime,
  @httpQuery('x-custom-nullable-string') String? customNullableString,
  @httpQuery('x-custom-nullable-bool') bool? customNullableBool,
  @httpQuery('x-custom-nullable-int') int? customNullableInt,
  @httpQuery('x-custom-nullable-num') num? customNullableNum,
  @httpQuery('x-custom-nullable-double') double? customNullableDouble,
  @httpQuery('x-custom-nullable-datetime') DateTime? customNullableDateTime,
  @httpQuery('x-custom-list-string') required List<String> customListString,
  @httpQuery('x-custom-list-bool') required List<bool> customListBool,
  @httpQuery('x-custom-list-int') required List<int> customListInt,
  @httpQuery('x-custom-list-num') required List<num> customListNum,
  @httpQuery('x-custom-list-double') required List<double> customListDouble,
  @httpQuery('x-custom-list-datetime') required List<DateTime> customListDateTime,
  @httpQuery('x-custom-nullable-list-string')  List<String>? customNullableListString,
  @httpQuery('x-custom-nullable-list-bool')  List<bool>? customNullableListBool,
  @httpQuery('x-custom-nullable-list-int')  List<int>? customNullableListInt,
  @httpQuery('x-custom-nullable-list-num')  List<num>? customNullableListNum,
  @httpQuery('x-custom-nullable-list-double')  List<double>? customNullableListDouble,
  @httpQuery('x-custom-nullable-list-datetime')  List<DateTime>? customNullableListDateTime,
  @httpQuery('x-custom-nullable-list-nullable-string')  List<String?>? customNullableListNullableString,
  @httpQuery('x-custom-nullable-list-nullable-bool')  List<bool?>? customNullableListNullableBool,
  @httpQuery('x-custom-nullable-list-nullable-int')  List<int?>? customNullableListNullableInt,
  @httpQuery('x-custom-nullable-list-nullable-num')  List<num?>? customNullableListNullableNum,
  @httpQuery('x-custom-nullable-list-nullable-double')  List<double?>? customNullableListNullableDouble,
  @httpQuery('x-custom-nullable-list-nullable-datetime')  List<DateTime?>? customNullableListNullableDateTime,
}) => 'Hello, World!';
''',
        },
        expectProject: (project) {
          final parameters =
              project.apis.values.single.functions.values.single.parameters;
          hasQuery(String name) => (Subject<CloudFunctionParameter> it) =>
              it.has((it) => it.references, 'references').isA<NodeReference>()
                ..has((it) => it.type, 'type').equals(NodeType.httpQuery)
                ..has((it) => it.name, 'name').equals(name);
          check(parameters).containsInOrder([
            hasQuery('query'),
            hasQuery('x-custom-string'),
            hasQuery('x-custom-bool'),
            hasQuery('x-custom-int'),
            hasQuery('x-custom-num'),
            hasQuery('x-custom-double'),
            hasQuery('x-custom-datetime'),
            hasQuery('x-custom-nullable-string'),
            hasQuery('x-custom-nullable-bool'),
            hasQuery('x-custom-nullable-int'),
            hasQuery('x-custom-nullable-num'),
            hasQuery('x-custom-nullable-double'),
            hasQuery('x-custom-nullable-datetime'),
            hasQuery('x-custom-list-string'),
            hasQuery('x-custom-list-bool'),
            hasQuery('x-custom-list-int'),
            hasQuery('x-custom-list-num'),
            hasQuery('x-custom-list-double'),
            hasQuery('x-custom-list-datetime'),
            hasQuery('x-custom-nullable-list-string'),
            hasQuery('x-custom-nullable-list-bool'),
            hasQuery('x-custom-nullable-list-int'),
            hasQuery('x-custom-nullable-list-num'),
            hasQuery('x-custom-nullable-list-double'),
            hasQuery('x-custom-nullable-list-datetime'),
            hasQuery('x-custom-nullable-list-nullable-string'),
            hasQuery('x-custom-nullable-list-nullable-bool'),
            hasQuery('x-custom-nullable-list-nullable-int'),
            hasQuery('x-custom-nullable-list-nullable-num'),
            hasQuery('x-custom-nullable-list-nullable-double'),
            hasQuery('x-custom-nullable-list-nullable-datetime'),
          ]);
        },
      );
    });

    group('streaming', () {
      testNoErrors(
        name: 'streaming_return_type',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

@cloud
Stream<String> greetings(List<String> names) async* {
  for (final name in names) {
    yield 'Hello, $name!';
  }
}
''',
        },
      );

      testNoErrors(
        name: 'streaming_complex_type',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

@cloud
Stream<ComplexClass> greetings() async* {
  throw UnimplementedError();
}
''',
        },
        models: '''
class SimpleClass {
  const SimpleClass(this.value);

  final String value;
}

class ComplexClass {
  const ComplexClass(this.simple, this.list);

  final SimpleClass simple;
  final List<SimpleClass> list;
}
''',
      );

      testErrors(
        name: 'future_of_streaming_return_type',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

@cloud
Future<Stream<String>> greetings(List<String> names) async {
  return Stream.fromIterable([
    for (final name in names) 'Hello, $name!'
  ]);
}
''',
        },
        errors: [
          'Stream types are not supported',
        ],
      );

      testErrors(
        name: 'http_config_streaming_return_type',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
@http(method: HttpMethod.post)
Stream<String> greetings(List<String> names) async* {
  for (final name in names) {
    yield 'Hello, $name!';
  }
}
''',
        },
        errors: [
          'Functions that return a stream may not customize their HTTP '
              'configuration',
        ],
      );

      testErrors(
        name: 'http_error_config_streaming_return_type',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
@httpError(HttpStatus.unauthorized, Exception)
Stream<String> greetings(List<String> names) async* {
  for (final name in names) {
    yield 'Hello, $name!';
  }
}
''',
        },
        errors: [
          'Functions that return a stream may not customize their HTTP '
              'configuration',
        ],
      );

      testErrors(
        name: 'http_header',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
Stream<String> greetings({
  @httpHeader('x-custom-string') required String customString,
}) async* {
  throw UnimplementedError();
}
''',
        },
        errors: [
          'HTTP headers may not be used in functions that return a stream',
        ],
      );

      testNoErrors(
        name: 'http_query',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
Stream<String> greetings({
  @httpQuery('x-custom-string') required String customString,
}) async* {
  throw UnimplementedError();
}
''',
        },
      );

      testErrors(
        name: 'streaming_parameter_type',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

@cloud
Future<List<String>> greetings(Stream<String> names) async {
  final greetings = <String>[];
  await for (final name in names) {
    greetings.add('Hello, $name!');
  }
  return greetings;
}
''',
        },
        errors: [
          'Stream types are not supported',
        ],
      );
    });

    group('context', () {
      testNoErrors(
        name: 'function_authenticated_context',
        apis: {
          'greeting.dart': '''
import 'package:celest/celest.dart';

@cloud
@authenticated
String sayHello({
  @principal required User user,
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

@cloud
@public
String sayHello({
  @principal User? user,
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

@cloud
String sayHello({
  @principal required User user,
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

@cloud
String sayHello({
  @principal User? user,
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

abstract final class env {
  static const myName = EnvironmentVariable(name: r'MY_NAME');
  static const myAge = EnvironmentVariable(name: r'MY_AGE');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../generated/resources.dart';

@cloud
void sayHelloPositional(
  @env.myName String name,
  @env.myAge int age,
) => 'Hello, $name. I am $age years old.';

@cloud
void sayHelloNamed({
  @env.myName required String name,
  @env.myAge required int age,  
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

import '../generated/resources.dart';

@cloud
void sayHello(@env.myName List<String> name) => 'Hello, $name';
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

abstract final class env {
  static const port = EnvironmentVariable(name: r'PORT');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../generated/resources.dart';

@cloud
void sayHello(@env.port int port) => 'Hello, $port';
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

abstract final class env {
  static const port = EnvironmentVariable(name: r'PORT');
}
''',
        apis: {
          'greeting.dart': r'''
import 'package:celest/celest.dart';

import '../generated/resources.dart';

@cloud
void sayHello(
  @env.port
  @env.port
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
        name: 'valid_inline_providers',
        authDart: '''
const auth = Auth(
  providers: [
    AuthProvider.email(),
    AuthProvider.sms(),
  ],
);
''',
        expectProject: (project) {
          check(project.auth)
              .isNotNull()
              .has((it) => it.providers.map((it) => it.type), 'providers')
              .unorderedEquals([
            AuthProviderType.email,
            AuthProviderType.sms,
          ]);
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
