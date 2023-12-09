import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:args/args.dart';
import 'package:async/async.dart';
import 'package:celest_cli/analyzer/analyzer.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/project/builder.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/cli.dart';
import 'package:http/http.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import 'test.dart';

int nextPort() => Random().nextInt(10000) + 30000;

Future<void> main(List<String> args) async {
  final argParser = ArgParser()
    ..addFlag(
      'update-goldens',
      abbr: 'u',
      defaultsTo: false,
      negatable: false,
    );

  final argResults = argParser.parse(args);
  final updateGoldens = argResults['update-goldens'] as bool;

  if (updateGoldens && Platform.isWindows) {
    throw Exception(
      'Cannot update goldens on Windows due to path differences.',
    );
  }

  final testDir = p.dirname(p.fromUri(Platform.script));
  final allTests = Directory(testDir)
      .listSync(recursive: true)
      .whereType<Directory>()
      .where((dir) {
    if (!File(p.join(dir.path, 'pubspec.yaml')).existsSync()) return false;
    if (argResults.rest.isEmpty) return true;
    return argResults.rest.contains(p.basename(dir.path));
  });
  for (final testDir in allTests) {
    final projectRoot = testDir.path;
    TestRunner(
      updateGoldens: updateGoldens,
      projectRoot: projectRoot,
    ).run();
  }
}

class TestRunner {
  TestRunner({
    required this.projectRoot,
    required this.updateGoldens,
  });

  final String projectRoot;
  final bool updateGoldens;

  late final testCases = tests[testName];
  late final testName = p.basename(projectRoot);
  late final goldensDir = Directory(p.join(projectRoot, 'goldens'));
  late final projectPaths = init(
    projectRoot: projectRoot,
    outputsDir: goldensDir.path,
  );
  late Client client;
  late final analyzer = CelestAnalyzer(
    projectPaths: projectPaths,
    logger: Logger(level: Level.verbose),
  );

  void run() {
    group(testName, () {
      setUpAll(() {
        final res = Process.runSync(
          Platform.executable,
          ['pub', 'get'],
          workingDirectory: projectRoot,
        );
        expect(res.exitCode, 0, reason: '${res.stderr}');
        if (updateGoldens && goldensDir.existsSync()) {
          goldensDir.deleteSync(recursive: true);
        }
        goldensDir.createSync();
        client = Client();
      });

      tearDownAll(() {
        client.close();
      });

      _testAnalyzer();
      _testCodegen();
      _testBuild();

      final apisDir = Directory(p.join(projectRoot, 'apis'));
      if (apisDir.existsSync()) {
        _testApis(apisDir);
      }
    });
  }

  void _testAnalyzer() {
    test('analyzer', () async {
      final (:project, :errors) = await analyzer.analyzeProject();
      expect(project, isNotNull);
      expect(errors, isEmpty);

      if (Platform.isWindows) {
        // Cannot check/update goldens on Windows due to path differences.
        return;
      }
      final goldenAst = File(p.join(projectPaths.outputsDir, 'ast.json'));
      if (updateGoldens) {
        goldenAst.writeAsStringSync(
          const JsonEncoder.withIndent('  ').convert(project!.toJson()),
        );
      } else {
        final expectedAst = jsonDecode(goldenAst.readAsStringSync());
        expect(project!.toJson(), expectedAst);
      }
    });
  }

  void _testCodegen() {
    test('codegen', () async {
      final (:project, :errors) = await analyzer.analyzeProject();
      expect(project, isNotNull);
      expect(errors, isEmpty);

      final codegen = CodeGenerator(
        projectPaths: projectPaths,
      );
      project!.accept(codegen);

      if (Platform.isWindows) {
        // Cannot check/update goldens on Windows due to path differences.
        return;
      }
      for (final MapEntry(key: path, value: content)
          in codegen.fileOutputs.entries) {
        final goldenFile = File(path);
        if (updateGoldens) {
          goldenFile
            ..createSync(recursive: true)
            ..writeAsStringSync(content);
        } else {
          final expected = goldenFile.readAsStringSync();
          expect(content, equalsIgnoringWhitespace(expected));
        }
      }
    });
  }

  void _testBuild() {
    test('build', () async {
      final (:project, :errors) = await analyzer.analyzeProject();
      expect(project, isNotNull);
      expect(errors, isEmpty);

      for (final environmentName in project!.environmentNames) {
        final projectBuilder = ProjectBuilder(
          project: project,
          projectPaths: projectPaths,
          environmentName: environmentName,
        );
        final cloudAst = await projectBuilder.build();
        final cloudAstFile = File(
          p.join(
            projectPaths.environment(environmentName).outputsDir,
            'ast.proto.json',
          ),
        );
        if (updateGoldens) {
          cloudAstFile
            ..createSync(recursive: true)
            ..writeAsStringSync(
              const JsonEncoder.withIndent('  ').convert(
                cloudAst.toProto3Json(),
              ),
            );
        } else {
          final expectedAst = jsonDecode(cloudAstFile.readAsStringSync());
          expect(cloudAst.toProto3Json(), expectedAst);
        }
      }
    });
  }

  void _testApis(Directory apisDir) {
    final apis = testCases?.apis ?? const {};
    if (apis.isEmpty) {
      return;
    }
    group('apis', () {
      for (final MapEntry(key: apiName, value: apiTest) in apis.entries) {
        _testApi(apiName, apiTest);
      }
    });
  }

  void _testApi(String apiName, ApiTest apiTest) {
    group(apiName, () {
      for (final MapEntry(key: (functionName, environmentName), value: tests)
          in apiTest.functionTests.entries) {
        _testFunction(
          apiName,
          functionName,
          environmentName,
          tests,
        );
      }
    });
  }

  void _testFunction(
    String apiName,
    String functionName,
    String environmentName,
    List<FunctionTest> tests,
  ) {
    final envPaths = projectPaths.environment(environmentName);
    final port = nextPort();
    group('$functionName $environmentName', () {
      late Process functionProc;
      late Uri apiUri;
      final logs = <String>[];

      setUpAll(() async {
        apiUri = Uri.parse('http://localhost:$port');
        final entrypoint = envPaths.functionEntrypoint(apiName, functionName);
        functionProc = await Process.start(
          Platform.executable,
          [entrypoint],
          environment: {
            'PORT': '$port',
          },
        );
        functionProc
          ..captureStdout()
          ..captureStdout(sink: logs.add)
          ..captureStderr()
          ..captureStderr(sink: logs.add);
        // Wait for failure or first "Listening on" message.
        await Future.any([
          ProcessUtil(functionProc).stdout.first,
          ProcessUtil(functionProc)
              .stderr
              .first
              .then((e) => fail('Failed to start function: ${utf8.decode(e)}')),
        ]);
      });

      tearDown(logs.clear);

      tearDownAll(() async {
        functionProc.kill();
        await functionProc.exitCode;
      });

      test('can serve', () {
        expect(
          client.get(apiUri),
          completes,
        );
      });

      for (final testCase in tests) {
        test(testCase.name, () async {
          for (final test in tests) {
            final result = await Result.capture(
              client.post(
                apiUri,
                headers: {
                  'Content-Type': 'application/json',
                },
                body: jsonEncode(test.input),
              ),
            );
            switch (test) {
              case FunctionTestSuccess(:final output):
                expect(result.isValue, isTrue);
                final resp = result.asValue!.value;
                expect(resp.statusCode, 200);
                final respJson = jsonDecode(resp.body);
                expect(respJson, output);
              case FunctionTestError(:final error):
                switch (result) {
                  case ErrorResult(error: final e):
                    expect(
                      e.toString(),
                      contains(error.toString()),
                    );
                  case ValueResult(value: final resp):
                    expect(resp.statusCode, greaterThanOrEqualTo(300));
                    expect(resp.body, contains(error));
                }
            }
            if (test.logs case final expectedLogs?) {
              expect(logs, containsAllInOrder(expectedLogs));
            }
          }
        });
      }
    });
  }
}

const simpleStruct = <String, dynamic>{};

const complexStruct = <String, dynamic>{
  'aString': 'hello',
  'anInt': 42,
  'aDouble': 3.14,
  'aBool': true,
  'anEnum': 'a',
  'aNull': null,
  'aSimpleStruct': simpleStruct,
  'aSimpleClass': simpleStruct,
  'anIterableOfString': ['hello', 'world'],
  'anIterableOfInt': [1, 2, 3],
  'anIterableOfDouble': [1.0, 2.0, 3.0],
  'anIterableOfBool': [true, false],
  'anIterableOfEnum': ['a', 'b', 'c'],
  'anIterableOfNull': [null, null],
  'anIterableOfSimpleStruct': [simpleStruct, simpleStruct],
  'anIterableOfSimpleClass': [simpleStruct, simpleStruct],
  'aListOfString': ['hello', 'world'],
  'aListOfInt': [1, 2, 3],
  'aListOfDouble': [1.0, 2.0, 3.0],
  'aListOfBool': [true, false],
  'aListOfEnum': ['a', 'b', 'c'],
  'aListOfNull': [null, null],
  'aListOfSimpleStruct': [simpleStruct, simpleStruct],
  'aListOfSimpleClass': [simpleStruct, simpleStruct],
  'aMapOfString': {
    'hello': 'world',
  },
  'aMapOfInt': {
    'one': 1,
    'two': 2,
    'three': 3,
  },
  'aMapOfDouble': {
    'one': 1.0,
    'two': 2.0,
    'three': 3.0,
  },
  'aMapOfBool': {
    'true': true,
    'false': false,
  },
  'aMapOfEnum': {
    'a': 'a',
    'b': 'b',
    'c': 'c',
  },
  'aMapOfNull': {
    'null': null,
  },
  'aMapOfSimpleStruct': {
    'one': simpleStruct,
    'two': simpleStruct,
    'three': simpleStruct,
  },
  'aMapOfSimpleClass': {
    'one': simpleStruct,
    'two': simpleStruct,
    'three': simpleStruct,
  },
};

const Map<String, Test> tests = {
  'api': Test(
    apis: {
      'middleware': ApiTest(
        functionTests: {
          ('sayHello', 'prod'): [
            FunctionTestSuccess(
              name: 'valid name',
              input: {
                'name': 'Dillon',
              },
              output: 'Hello, Dillon!',
              logs: [
                'first',
                'second',
                'third',
                'fourth',
              ],
            ),
          ],
        },
      ),
      'parameter_types': ApiTest(
        functionTests: {
          ('simple', 'prod'): [
            FunctionTestSuccess(
              name: 'valid input',
              input: complexStruct,
              // TODO(dnys1): Empty map/string for void outputs?
              output: null,
            ),
          ],
          ('simpleOptional', 'prod'): [
            FunctionTestSuccess(
              name: 'all present',
              input: complexStruct,
              output: null,
            ),
            FunctionTestSuccess(
              name: 'all null',
              input: {
                'aString': null,
                'anInt': null,
                'aDouble': null,
                'aBool': null,
                'anEnum': null,
                'aNull': null,
                'anIterableOfString': null,
                'anIterableOfInt': null,
                'anIterableOfDouble': null,
                'anIterableOfBool': null,
                'anIterableOfEnum': null,
                'anIterableOfNull': null,
                'aListOfString': null,
                'aListOfInt': null,
                'aListOfDouble': null,
                'aListOfBool': null,
                'aListOfEnum': null,
                'aListOfNull': null,
                'aMapOfString': null,
                'aMapOfInt': null,
                'aMapOfDouble': null,
                'aMapOfBool': null,
                'aMapOfEnum': null,
                'aMapOfNull': null,
              },
              output: null,
            ),
          ],
          ('complex', 'prod'): [
            FunctionTestSuccess(
              name: 'all present',
              input: {
                'aSimpleStruct': simpleStruct,
                'aComplexStruct': complexStruct,
                'aSimpleClass': simpleStruct,
                'aComplexClass': complexStruct,
                'aNullableSimpleStruct': simpleStruct,
                'aNullableComplexStruct': complexStruct,
                'aNullableSimpleClass': simpleStruct,
                'aNullableComplexClass': complexStruct,
                'anIterableOfSimpleStruct': [
                  simpleStruct,
                  simpleStruct,
                ],
                'anIterableOfComplexStruct': [
                  complexStruct,
                  complexStruct,
                ],
                'anIterableOfSimpleClass': [
                  simpleStruct,
                  simpleStruct,
                ],
                'anIterableOfComplexClass': [
                  complexStruct,
                  complexStruct,
                ],
                'aNullableIterableOfSimpleStruct': [
                  simpleStruct,
                  simpleStruct,
                ],
                'aNullableIterableOfComplexStruct': [
                  complexStruct,
                  complexStruct,
                ],
                'aNullableIterableOfSimpleClass': [
                  simpleStruct,
                  simpleStruct,
                ],
                'aNullableIterableOfComplexClass': [
                  complexStruct,
                  complexStruct,
                ],
                'anIterableOfNullableSimpleStruct': [
                  simpleStruct,
                  null,
                  simpleStruct,
                ],
                'anIterableOfNullableComplexStruct': [
                  complexStruct,
                  null,
                  complexStruct,
                ],
                'anIterableOfNullableSimpleClass': [
                  simpleStruct,
                  null,
                  simpleStruct,
                ],
                'anIterableOfNullableComplexClass': [
                  complexStruct,
                  null,
                  complexStruct,
                ],
                'aListOfSimpleStruct': [
                  simpleStruct,
                  simpleStruct,
                ],
                'aListOfComplexStruct': [
                  complexStruct,
                  complexStruct,
                ],
                'aListOfSimpleClass': [
                  simpleStruct,
                  simpleStruct,
                ],
                'aListOfComplexClass': [
                  complexStruct,
                  complexStruct,
                ],
                'aNullableListOfSimpleStruct': [
                  simpleStruct,
                  simpleStruct,
                ],
                'aNullableListOfComplexStruct': [
                  complexStruct,
                  complexStruct,
                ],
                'aNullableListOfSimpleClass': [
                  simpleStruct,
                  simpleStruct,
                ],
                'aNullableListOfComplexClass': [
                  complexStruct,
                  complexStruct,
                ],
                'aListOfNullableSimpleStruct': [
                  simpleStruct,
                  null,
                  simpleStruct,
                ],
                'aListOfNullableComplexStruct': [
                  complexStruct,
                  null,
                  complexStruct,
                ],
                'aListOfNullableSimpleClass': [
                  simpleStruct,
                  null,
                  simpleStruct,
                ],
                'aListOfNullableComplexClass': [
                  complexStruct,
                  null,
                  complexStruct,
                ],
                'aMapOfSimpleStruct': {
                  'one': simpleStruct,
                  'two': simpleStruct,
                  'three': simpleStruct,
                },
                'aMapOfComplexStruct': {
                  'one': complexStruct,
                  'two': complexStruct,
                  'three': complexStruct,
                },
                'aMapOfSimpleClass': {
                  'one': simpleStruct,
                  'two': simpleStruct,
                  'three': simpleStruct,
                },
                'aMapOfComplexClass': {
                  'one': complexStruct,
                  'two': complexStruct,
                  'three': complexStruct,
                },
                'aNullableMapOfSimpleStruct': {
                  'one': simpleStruct,
                  'two': simpleStruct,
                  'three': simpleStruct,
                },
                'aNullableMapOfComplexStruct': {
                  'one': complexStruct,
                  'two': complexStruct,
                  'three': complexStruct,
                },
                'aNullableMapOfSimpleClass': {
                  'one': simpleStruct,
                  'two': simpleStruct,
                  'three': simpleStruct,
                },
                'aNullableMapOfComplexClass': {
                  'one': complexStruct,
                  'two': complexStruct,
                  'three': complexStruct,
                },
                'aMapOfNullableSimpleStruct': {
                  'one': simpleStruct,
                  'two': null,
                  'three': simpleStruct,
                },
                'aMapOfNullableComplexStruct': {
                  'one': complexStruct,
                  'two': null,
                  'three': complexStruct,
                },
                'aMapOfNullableSimpleClass': {
                  'one': simpleStruct,
                  'two': null,
                  'three': simpleStruct,
                },
                'aMapOfNullableComplexClass': {
                  'one': complexStruct,
                  'two': null,
                  'three': complexStruct,
                },
                'aNullableMapOfNullableSimpleStruct': {
                  'one': simpleStruct,
                  'two': null,
                  'three': simpleStruct,
                },
                'aNullableMapOfNullableComplexStruct': {
                  'one': complexStruct,
                  'two': null,
                  'three': complexStruct,
                },
                'aNullableMapOfNullableSimpleClass': {
                  'one': simpleStruct,
                  'two': null,
                  'three': simpleStruct,
                },
                'aNullableMapOfNullableComplexClass': {
                  'one': complexStruct,
                  'two': null,
                  'three': complexStruct,
                },
              },
              output: null,
            ),
            FunctionTestSuccess(
              name: 'all required present',
              input: {
                'aSimpleStruct': simpleStruct,
                'aComplexStruct': complexStruct,
                'aSimpleClass': simpleStruct,
                'aComplexClass': complexStruct,
                'aNullableSimpleStruct': null,
                'aNullableComplexStruct': null,
                'aNullableSimpleClass': null,
                'aNullableComplexClass': null,
                'anIterableOfSimpleStruct': [
                  simpleStruct,
                  simpleStruct,
                ],
                'anIterableOfComplexStruct': [
                  complexStruct,
                  complexStruct,
                ],
                'anIterableOfSimpleClass': [
                  simpleStruct,
                  simpleStruct,
                ],
                'anIterableOfComplexClass': [
                  complexStruct,
                  complexStruct,
                ],
                'aNullableIterableOfSimpleStruct': null,
                'aNullableIterableOfComplexStruct': null,
                'aNullableIterableOfSimpleClass': null,
                'aNullableIterableOfComplexClass': null,
                'anIterableOfNullableSimpleStruct': [
                  simpleStruct,
                  null,
                  simpleStruct,
                ],
                'anIterableOfNullableComplexStruct': [
                  complexStruct,
                  null,
                  complexStruct,
                ],
                'anIterableOfNullableSimpleClass': [
                  simpleStruct,
                  null,
                  simpleStruct,
                ],
                'anIterableOfNullableComplexClass': [
                  complexStruct,
                  null,
                  complexStruct,
                ],
                'aListOfSimpleStruct': [
                  simpleStruct,
                  simpleStruct,
                ],
                'aListOfComplexStruct': [
                  complexStruct,
                  complexStruct,
                ],
                'aListOfSimpleClass': [
                  simpleStruct,
                  simpleStruct,
                ],
                'aListOfComplexClass': [
                  complexStruct,
                  complexStruct,
                ],
                'aNullableListOfSimpleStruct': null,
                'aNullableListOfComplexStruct': null,
                'aNullableListOfSimpleClass': null,
                'aNullableListOfComplexClass': null,
                'aListOfNullableSimpleStruct': [
                  simpleStruct,
                  null,
                  simpleStruct,
                ],
                'aListOfNullableComplexStruct': [
                  complexStruct,
                  null,
                  complexStruct,
                ],
                'aListOfNullableSimpleClass': [
                  simpleStruct,
                  null,
                  simpleStruct,
                ],
                'aListOfNullableComplexClass': [
                  complexStruct,
                  null,
                  complexStruct,
                ],
                'aMapOfSimpleStruct': {
                  'one': simpleStruct,
                  'two': simpleStruct,
                  'three': simpleStruct,
                },
                'aMapOfComplexStruct': {
                  'one': complexStruct,
                  'two': complexStruct,
                  'three': complexStruct,
                },
                'aMapOfSimpleClass': {
                  'one': simpleStruct,
                  'two': simpleStruct,
                  'three': simpleStruct,
                },
                'aMapOfComplexClass': {
                  'one': complexStruct,
                  'two': complexStruct,
                  'three': complexStruct,
                },
                'aNullableMapOfSimpleStruct': null,
                'aNullableMapOfComplexStruct': null,
                'aNullableMapOfSimpleClass': null,
                'aNullableMapOfComplexClass': null,
                'aMapOfNullableSimpleStruct': {
                  'one': simpleStruct,
                  'two': null,
                  'three': simpleStruct,
                },
                'aMapOfNullableComplexStruct': {
                  'one': complexStruct,
                  'two': null,
                  'three': complexStruct,
                },
                'aMapOfNullableSimpleClass': {
                  'one': simpleStruct,
                  'two': null,
                  'three': simpleStruct,
                },
                'aMapOfNullableComplexClass': {
                  'one': complexStruct,
                  'two': null,
                  'three': complexStruct,
                },
                'aNullableMapOfNullableSimpleStruct': null,
                'aNullableMapOfNullableComplexStruct': null,
                'aNullableMapOfNullableSimpleClass': null,
                'aNullableMapOfNullableComplexClass': null,
              },
              output: null,
            ),
          ],
        },
      ),
    },
  ),
  'environments': Test(
    apis: {
      'override': ApiTest(
        functionTests: {
          ('sayHello', 'prod'): [
            FunctionTestSuccess(
              name: 'dev',
              input: {},
              output: 'Hello, World!',
            ),
          ],
          ('sayHello', 'staging'): [
            FunctionTestSuccess(
              name: 'dev',
              input: {},
              output: 'Hello, Staging!',
            ),
          ],
          ('sayHello', 'dev'): [
            FunctionTestSuccess(
              name: 'dev',
              input: {},
              output: 'Hello, Dev!',
            ),
          ],
        },
      ),
    },
  ),
};
