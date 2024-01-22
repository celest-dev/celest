import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:async/async.dart';
import 'package:celest/src/runtime/serve.dart';
import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/codegen/client_code_generator.dart';
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/frontend/resident_compiler.dart';
import 'package:celest_cli/project/project_resolver.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/cli.dart';
import 'package:celest_cli/src/utils/port.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import '../common.dart';
import 'types.dart';

void main() {
  final updateGoldens = switch (Platform.environment['UPDATE_GOLDENS']) {
    'true' => true,
    _ => false,
  };

  if (updateGoldens && Platform.isWindows) {
    throw Exception(
      'Cannot update goldens on Windows due to path differences.',
    );
  }

  final testDir = p.join(Directory.current.path, 'test', 'fixtures');
  final allTests = Directory(testDir)
      .listSync()
      .whereType<Directory>()
      .where((dir) => File(p.join(dir.path, 'pubspec.yaml')).existsSync());
  group('Fixture', () {
    setUpAll(initTests);

    for (final testDir in allTests) {
      final projectRoot = testDir.path;
      final goldensDir = Directory(p.join(projectRoot, 'goldens'));
      TestRunner(
        updateGoldens: updateGoldens,
        projectRoot: projectRoot,
        goldensDir: goldensDir,
      ).run();
    }
  });
}

class TestRunner {
  TestRunner({
    required this.projectRoot,
    required this.updateGoldens,
    required this.goldensDir,
  });

  final String projectRoot;
  final bool updateGoldens;
  final Directory goldensDir;

  late final testCases = tests[testName];
  late final testName = p.basename(projectRoot);

  late Client client;
  late final analyzer = CelestAnalyzer();
  ResidentCompiler? residentCompiler;

  void run() {
    group(testName, () {
      setUpAll(() async {
        await init(
          projectRoot: projectRoot,
          outputsDir: goldensDir.path,
        );
        final res = await Process.start(
          Platform.executable,
          ['pub', 'get'],
          mode: ProcessStartMode.inheritStdio,
          workingDirectory: projectRoot,
        ).timeout(const Duration(seconds: 10));
        await expectLater(res.exitCode, completion(0));
        if (updateGoldens && goldensDir.existsSync()) {
          goldensDir.deleteSync(recursive: true);
        }
        goldensDir.createSync();
        client = Client();
        residentCompiler ??= (await ResidentCompiler.ensureRunning())!;
      });

      setUp(() {
        testOverrideErrorData = {};
      });

      tearDown(() {
        testOverrideErrorData = null;
      });

      tearDownAll(() {
        client.close();
      });

      testAnalyzer();
      testCodegen();
      testResolve();
      testClient();

      final apisDir = Directory(p.join(projectRoot, 'functions'));
      if (apisDir.existsSync()) {
        testApis(apisDir);
      }
    });
  }

  void testAnalyzer() {
    // Analyzer needs a bit longer.
    // TODO(dnys1): Benchmark + improve performance of analysis.
    test('analyzer', timeout: const Timeout.factor(3), () async {
      final CelestAnalysisResult(:project, :errors) =
          await analyzer.analyzeProject();
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

  void testCodegen() {
    test('codegen', () async {
      final CelestAnalysisResult(:project, :errors) =
          await analyzer.analyzeProject();
      expect(project, isNotNull);
      expect(errors, isEmpty);

      final codegen = CloudCodeGenerator();
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

  void testResolve() {
    test('resolve', () async {
      final CelestAnalysisResult(:project, :errors) =
          await analyzer.analyzeProject();
      expect(project, isNotNull);
      expect(errors, isEmpty);

      final projectResolver = ProjectResolver();
      project!.accept(projectResolver);
      final resolvedAstFile = File(
        p.join(projectPaths.outputsDir, 'ast.resolved.json'),
      );
      final resolvedAst = projectResolver.resolvedProject.toJson();
      if (updateGoldens) {
        resolvedAstFile
          ..createSync(recursive: true)
          ..writeAsStringSync(
            const JsonEncoder.withIndent('  ').convert(resolvedAst),
          );
      } else {
        final expectedAst = jsonDecode(resolvedAstFile.readAsStringSync());
        expect(resolvedAst, expectedAst);
      }
    });
  }

  void testClient() {
    test('client', () async {
      final CelestAnalysisResult(:project, :errors) =
          await analyzer.analyzeProject();
      expect(project, isNotNull);
      expect(errors, isEmpty);

      final projectResolver = ProjectResolver();
      project!.accept(projectResolver);
      final resolvedProject = projectResolver.resolvedProject;

      final clientGen = ClientCodeGenerator(
        project: project,
        projectOutputs: LocalDeployedProject.from(
          projectAst: resolvedProject,
          port: defaultCelestPort,
        ),
      );
      final outputs = clientGen.generate();
      if (updateGoldens) {
        await outputs.write();
      } else {
        outputs.forEach((path, library) {
          expect(
            library,
            equalsIgnoringWhitespace(File(path).readAsStringSync()),
          );
        });
      }
    });
  }

  void testApis(Directory apisDir) {
    final apis = testCases?.apis ?? const {};
    if (apis.isEmpty) {
      return;
    }
    group('apis', () {
      for (final MapEntry(key: apiName, value: apiTest) in apis.entries) {
        testApi(apiName, apiTest);
      }
    });
  }

  void testApi(String apiName, ApiTest apiTest) {
    group(apiName, () {
      for (final MapEntry(key: functionName, value: tests)
          in apiTest.functionTests.entries) {
        testFunction(
          apiName,
          functionName,
          tests,
        );
      }
    });
  }

  void testFunction(
    String apiName,
    String functionName,
    List<FunctionTest> tests,
  ) {
    group(functionName, () {
      late Process functionProc;
      late Uri apiUri;
      final logs = <String>[];

      setUpAll(() async {
        final port = await findOpenPort();
        apiUri = Uri.parse('http://localhost:$port');
        final entrypoint = projectPaths.functionEntrypoint(
          apiName,
          functionName,
        );
        functionProc = await Process.start(
          Platform.executable,
          [
            'run',
            '--packages',
            projectPaths.packagesConfig,
            entrypoint,
          ],
          workingDirectory: projectPaths.projectRoot,
          environment: {
            'PORT': '$port',
            'CELEST_ENV': 'local',
            ...projectPaths.envManager.env,
          },
        );
        functionProc
          ..captureStdout()
          ..captureStdout(sink: logs.add)
          ..captureStderr()
          ..captureStderr(sink: logs.add);
        // Wait for failure or first "Listening on" message.
        await Future.any([
          functionProc.exitCode.then((exitCode) => expect(exitCode, 0)),
          ProcessUtil(functionProc).stdout.first,
          ProcessUtil(functionProc)
              .stderr
              .first
              .then((e) => fail('Failed to start function: ${utf8.decode(e)}')),
        ]).timeout(const Duration(seconds: 15));

        await expectLater(
          client.get(apiUri),
          completes,
        );
      });

      setUp(logs.clear);

      tearDownAll(() async {
        functionProc.kill();
        await functionProc.exitCode;
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
              case FunctionTestError(:final output):
                switch (result) {
                  case ErrorResult(error: final e):
                    fail('Unexpected error: $e');
                  case ValueResult(value: final resp):
                    expect(resp.statusCode, test.statusCode);
                    final respJson = jsonDecode(resp.body);
                    expect(respJson, output);
                }
              case FunctionTestSuccess(:final output):
                expect(result.isValue, isTrue);
                final resp = result.asValue!.value;
                expect(resp.statusCode, 200);
                final respJson = jsonDecode(resp.body);
                expect(respJson, output);
            }
            if (test.logs case final expectedLogs?) {
              expect(logs, containsAllInOrder(expectedLogs.map(contains)));
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
  'aBigInt': '42',
  'aDateTime': '2021-01-01T00:00:00.000Z',
  'aDuration': {
    'days': 1,
    'hours': 2,
    'minutes': 3,
    'seconds': 4,
    'milliseconds': 5,
    'microseconds': 6,
  },
  'aRegExp': '.*',
  'aStackTrace': '''
#0      main (file:///Users/test/projects/hello/lib/src/main.dart:10:3)
''',
  'aUri': 'https://google.com',
  'aUriData': 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==',
  'aUint8List': 'SGVsbG8sIFdvcmxkIQ==',
  'aSimpleStruct': simpleStruct,
  'aSimpleClass': simpleStruct,
  'anIterableOfString': ['hello', 'world'],
  'anIterableOfUint8List': ['SGVsbG8sIFdvcmxkIQ==', 'SGVsbG8sIFdvcmxkIQ=='],
  'anIterableOfSimpleClass': [simpleStruct, simpleStruct],
  'aListOfString': ['hello', 'world'],
  'aListOfInt': [1, 2, 3],
  'aListOfDouble': [1.0, 2.0, 3.0],
  'aListOfBool': [true, false],
  'aListOfEnum': ['a', 'b', 'c'],
  'aListOfNull': [null, null],
  'aListOfBigInt': ['42', '43'],
  'aListOfDateTime': ['2021-01-01T00:00:00.000Z', '2021-01-02T00:00:00.000Z'],
  'aListOfDuration': [
    {
      'days': 1,
      'hours': 2,
      'minutes': 3,
      'seconds': 4,
      'milliseconds': 5,
      'microseconds': 6,
    },
    {
      'days': 1,
      'hours': 2,
      'minutes': 3,
      'seconds': 4,
      'milliseconds': 5,
      'microseconds': 6,
    },
  ],
  'aListOfRegExp': ['.*', '.*'],
  'aListOfStackTrace': [
    '''
#0      main (file:///Users/test/projects/hello/lib/src/main.dart:10:3)
''',
    '''
#0      main (file:///Users/test/projects/hello/lib/src/main.dart:10:3)
''',
  ],
  'aListOfUri': ['https://google.com', 'https://google.com'],
  'aListOfUriData': [
    'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==',
    'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==',
  ],
  'aListOfUint8List': ['SGVsbG8sIFdvcmxkIQ==', 'SGVsbG8sIFdvcmxkIQ=='],
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
  'aMapOfBigInt': {
    'one': '1',
    'two': '2',
    'three': '3',
  },
  'aMapOfDateTime': {
    'one': '2021-01-01T00:00:00.000Z',
    'two': '2021-01-02T00:00:00.000Z',
    'three': '2021-01-03T00:00:00.000Z',
  },
  'aMapOfDuration': {
    'one': {
      'days': 1,
      'hours': 2,
      'minutes': 3,
      'seconds': 4,
      'milliseconds': 5,
      'microseconds': 6,
    },
    'two': {
      'days': 1,
      'hours': 2,
      'minutes': 3,
      'seconds': 4,
      'milliseconds': 5,
      'microseconds': 6,
    },
    'three': {
      'days': 1,
      'hours': 2,
      'minutes': 3,
      'seconds': 4,
      'milliseconds': 5,
      'microseconds': 6,
    },
  },
  'aMapOfRegExp': {
    'one': '.*',
    'two': '.*',
    'three': '.*',
  },
  'aMapOfStackTrace': {
    'one': '''
#0      main (file:///Users/test/projects/hello/lib/src/main.dart:10:3)
''',
    'two': '''
#0      main (file:///Users/test/projects/hello/lib/src/main.dart:10:3)
''',
    'three': '''
#0      main (file:///Users/test/projects/hello/lib/src/main.dart:10:3)
''',
  },
  'aMapOfUri': {
    'one': 'https://google.com',
    'two': 'https://google.com',
    'three': 'https://google.com',
  },
  'aMapOfUriData': {
    'one': 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==',
    'two': 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==',
    'three': 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==',
  },
  'aMapOfUint8List': {
    'one': 'SGVsbG8sIFdvcmxkIQ==',
    'two': 'SGVsbG8sIFdvcmxkIQ==',
    'three': 'SGVsbG8sIFdvcmxkIQ==',
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

final tests = <String, Test>{
  'api': Test(
    apis: {
      'parameter_types': ApiTest(
        functionTests: {
          'simple': [
            FunctionTestSuccess(
              name: 'valid input',
              input: complexStruct,
              output: null,
            ),
          ],
          'simpleOptional': [
            FunctionTestSuccess(
              name: 'all present',
              input: complexStruct,
              output: null,
            ),
            FunctionTestSuccess(
              name: 'all null',
              input: {},
              output: null,
            ),
          ],
          'complex': [
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
      'classes': ApiTest(
        functionTests: {
          'empty': [
            FunctionTestSuccess(
              name: 'empty',
              input: {},
              output: {},
            ),
          ],
          'asyncEmpty': [
            FunctionTestSuccess(
              name: 'asyncEmpty',
              input: {},
              output: {},
            ),
          ],
          'fields': [
            FunctionTestSuccess(
              name: 'fields',
              input: {
                'value': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
              output: {
                'superField': 'superField',
                'field': 'field',
              },
            ),
          ],
          'asyncFields': [
            FunctionTestSuccess(
              name: 'asyncFields',
              input: {
                'value': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
              output: {
                'superField': 'superField',
                'field': 'field',
              },
            ),
          ],
          'nullableFields': [
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: null,
            ),
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
              output: {
                'superField': 'superField',
                'field': 'field',
              },
            ),
          ],
          'asyncNullableFields': [
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: null,
            ),
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
              output: {
                'superField': 'superField',
                'field': 'field',
              },
            ),
          ],
          'namedFields': [
            FunctionTestSuccess(
              name: 'namedFields',
              input: {
                'value': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
              output: {
                'superField': 'superField',
                'field': 'field',
              },
            ),
          ],
          'asyncNamedFields': [
            FunctionTestSuccess(
              name: 'asyncNamedFields',
              input: {
                'value': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
              output: {
                'superField': 'superField',
                'field': 'field',
              },
            ),
          ],
          'mixedFields': [
            FunctionTestSuccess(
              name: 'mixedFields',
              input: {
                'value': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
              output: {
                'superField': 'superField',
                'field': 'field',
              },
            ),
          ],
          'asyncMixedFields': [
            FunctionTestSuccess(
              name: 'asyncMixedFields',
              input: {
                'value': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
              output: {
                'superField': 'superField',
                'field': 'field',
              },
            ),
          ],
          'defaultValues': [
            FunctionTestSuccess(
              name: 'all fields set',
              input: {
                'value': {
                  'field': 'field',
                  'nullableField': 'nullableField',
                  'nullableFieldWithDefault': 'nullableFieldWithDefault',
                },
              },
              output: {
                'field': 'field',
                'nullableField': 'nullableField',
                'nullableFieldWithDefault': 'nullableFieldWithDefault',
                'fieldWithoutInitializer': 'default',
              },
            ),
            FunctionTestSuccess(
              name: 'all defaults',
              input: {
                'value': {},
              },
              output: {
                'field': 'default',
                'nullableField': null,
                'nullableFieldWithDefault': 'default',
                'fieldWithoutInitializer': 'default',
              },
            ),
          ],
          'asyncDefaultValues': [
            FunctionTestSuccess(
              name: 'all fields set',
              input: {
                'value': {
                  'field': 'field',
                  'nullableField': 'nullableField',
                  'nullableFieldWithDefault': 'nullableFieldWithDefault',
                },
              },
              output: {
                'field': 'field',
                'nullableField': 'nullableField',
                'nullableFieldWithDefault': 'nullableFieldWithDefault',
                'fieldWithoutInitializer': 'default',
              },
            ),
            FunctionTestSuccess(
              name: 'all defaults',
              input: {
                'value': {},
              },
              output: {
                'field': 'default',
                'nullableField': null,
                'nullableFieldWithDefault': 'default',
                'fieldWithoutInitializer': 'default',
              },
            ),
          ],
          'nestedClass': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'fields': {
                    'superField': 'superField',
                    'field': 'field',
                  },
                  'nullableFields': {
                    'superField': 'superField',
                    'field': 'field',
                  },
                },
              },
              output: {
                'fields': {
                  'superField': 'superField',
                  'field': 'field',
                },
                'nullableFields': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {
                'value': {
                  'fields': {
                    'superField': 'superField',
                    'field': 'field',
                  },
                },
              },
              output: {
                'fields': {
                  'superField': 'superField',
                  'field': 'field',
                },
                'nullableFields': null,
              },
            ),
          ],
          'asyncNestedClass': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'fields': {
                    'superField': 'superField',
                    'field': 'field',
                  },
                  'nullableFields': {
                    'superField': 'superField',
                    'field': 'field',
                  },
                },
              },
              output: {
                'fields': {
                  'superField': 'superField',
                  'field': 'field',
                },
                'nullableFields': {
                  'superField': 'superField',
                  'field': 'field',
                },
              },
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {
                'value': {
                  'fields': {
                    'superField': 'superField',
                    'field': 'field',
                  },
                },
              },
              output: {
                'fields': {
                  'superField': 'superField',
                  'field': 'field',
                },
                'nullableFields': null,
              },
            ),
          ],
          'onlyFromJson': [
            FunctionTestSuccess(
              name: 'onlyFromJson',
              input: {
                'value': {
                  'field': 'field',
                },
              },
              output: {
                'field': 'field',
              },
            ),
          ],
          'asyncOnlyFromJson': [
            FunctionTestSuccess(
              name: 'asyncOnlyFromJson',
              input: {
                'value': {
                  'field': 'field',
                },
              },
              output: {
                'field': 'field',
              },
            ),
          ],
          'onlyToJson': [
            FunctionTestSuccess(
              name: 'onlyToJson',
              input: {
                'value': {
                  'field': 'field',
                },
              },
              output: {
                'field': 'field',
              },
            ),
          ],
          'asyncOnlyToJson': [
            FunctionTestSuccess(
              name: 'asyncOnlyToJson',
              input: {
                'value': {
                  'field': 'field',
                },
              },
              output: {
                'field': 'field',
              },
            ),
          ],
          'onlyToJsonWithDefaults': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'field': 'field',
                },
              },
              output: {
                'field': 'field',
              },
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: {
                'field': 'default',
              },
            ),
          ],
          'asyncOnlyToJsonWithDefaults': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'field': 'field',
                },
              },
              output: {
                'field': 'field',
              },
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: {
                'field': 'default',
              },
            ),
          ],
          'fromAndToJson': [
            FunctionTestSuccess(
              name: 'fromAndToJson',
              input: {
                'value': {
                  'field': 'field',
                },
              },
              output: {
                'field': 'field',
              },
            ),
          ],
          'asyncFromAndToJson': [
            FunctionTestSuccess(
              name: 'asyncFromAndToJson',
              input: {
                'value': {
                  'field': 'field',
                },
              },
              output: {
                'field': 'field',
              },
            ),
          ],
          'nonMapToJson': [
            FunctionTestSuccess(
              name: 'nonMapToJson',
              input: {
                'value': 'field',
              },
              output: 'field',
            ),
          ],
          'asyncNonMapToJson': [
            FunctionTestSuccess(
              name: 'asyncNonMapToJson',
              input: {
                'value': 'field',
              },
              output: 'field',
            ),
          ],
          'nonMapToJsonWithDefaults': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': 'field',
              },
              output: 'field',
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: 'default',
            ),
          ],
          'asyncNonMapToJsonWithDefaults': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': 'field',
              },
              output: 'field',
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: 'default',
            ),
          ],
          'nonMapFromAndToJson': [
            FunctionTestSuccess(
              name: 'nonMapFromAndToJson',
              input: {
                'value': 'field',
              },
              output: 'field',
            ),
          ],
          'asyncNonMapFromAndToJson': [
            FunctionTestSuccess(
              name: 'asyncNonMapFromAndToJson',
              input: {
                'value': 'field',
              },
              output: 'field',
            ),
          ],
        },
      ),
      'records': ApiTest(
        functionTests: {
          'nonAliasedNamedFields': [
            FunctionTestSuccess(
              name: 'nonAliasedNamedFields',
              input: {
                'value': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
              output: {
                'field': 'field',
                'anotherField': 'anotherField',
              },
            ),
          ],
          'asyncNonAliasedNamedFields': [
            FunctionTestSuccess(
              name: 'asyncNonAliasedNamedFields',
              input: {
                'value': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
              output: {
                'field': 'field',
                'anotherField': 'anotherField',
              },
            ),
          ],
          'aliasedNamedFields': [
            FunctionTestSuccess(
              name: 'aliasedNamedFields',
              input: {
                'value': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
              output: {
                'field': 'field',
                'anotherField': 'anotherField',
              },
            ),
          ],
          'asyncAliasedNamedFields': [
            FunctionTestSuccess(
              name: 'asyncAliasedNamedFields',
              input: {
                'value': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
              output: {
                'field': 'field',
                'anotherField': 'anotherField',
              },
            ),
          ],
          'namedFields': [
            FunctionTestSuccess(
              name: 'namedFields',
              input: {
                'nonAliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
                'aliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
              output: {
                'nonAliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
                'aliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
            ),
          ],
          'asyncNamedFields': [
            FunctionTestSuccess(
              name: 'namedFields',
              input: {
                'nonAliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
                'aliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
              output: {
                'nonAliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
                'aliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
            ),
          ],
          'nested': [
            FunctionTestSuccess(
              name: 'nested',
              input: {
                'value': {
                  'namedFields': {
                    'field': 'field',
                    'anotherField': 'anotherField',
                  },
                },
              },
              output: {
                'namedFields': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
            ),
          ],
          'asyncNested': [
            FunctionTestSuccess(
              name: 'asyncNested',
              input: {
                'value': {
                  'namedFields': {
                    'field': 'field',
                    'anotherField': 'anotherField',
                  },
                },
              },
              output: {
                'namedFields': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
            ),
          ],
          'nullableNested': [
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: null,
            ),
            FunctionTestSuccess(
              name: 'no value',
              input: {
                'value': {
                  'namedFields': null,
                },
              },
              output: {
                'namedFields': null,
              },
            ),
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'namedFields': {
                    'field': 'field',
                    'anotherField': 'anotherField',
                  },
                },
              },
              output: {
                'namedFields': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
            ),
          ],
          'asyncNullableNested': [
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: null,
            ),
            FunctionTestSuccess(
              name: 'no value',
              input: {
                'value': {
                  'namedFields': null,
                },
              },
              output: {
                'namedFields': null,
              },
            ),
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'namedFields': {
                    'field': 'field',
                    'anotherField': 'anotherField',
                  },
                },
              },
              output: {
                'namedFields': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
              },
            ),
          ],
        },
      ),
      'generic_wrappers': ApiTest(
        functionTests: {
          'genericWrappers': [
            FunctionTestSuccess(
              name: 'genericWrappers',
              input: {
                'value': genericWrappers,
              },
              output: genericWrappers,
            ),
          ],
          'genericWrappersAsync': [
            FunctionTestSuccess(
              name: 'genericWrappers',
              input: {
                'value': genericWrappers,
              },
              output: genericWrappers,
            ),
          ],
          'genericWrapperParameters': [
            FunctionTestSuccess(
              name: 'genericWrappers',
              input: genericWrappers,
              output: genericWrappers,
            ),
          ],
        },
      ),
      'exceptions': const ApiTest(
        functionTests: {
          'throwsException': [
            FunctionTestError(
              name: 'deserializes std exception',
              statusCode: 400,
              input: {
                'type': 'Exception',
              },
              output: {
                'error': {
                  'code': '_Exception',
                },
              },
            ),
            FunctionTestError(
              name: 'deserializes format exception',
              statusCode: 400,
              input: {
                'type': 'FormatException',
              },
              output: {
                'error': {
                  'code': 'FormatException',
                },
              },
            ),
          ],
          'throwsError': [
            FunctionTestError(
              name: 'deserializes std error',
              statusCode: 500,
              input: {
                'type': 'Error',
              },
              output: {
                'error': {
                  'code': 'Error',
                },
              },
            ),
            FunctionTestError(
              name: 'deserializes argument error',
              statusCode: 500,
              input: {
                'type': 'ArgumentError',
              },
              output: {
                'error': {
                  'code': 'ArgumentError',
                },
              },
            ),
          ],
          'throwsCustomException': [
            FunctionTestError(
              name: 'deserializes custom exception',
              statusCode: 400,
              input: {},
              output: {
                'error': {
                  'code': 'CustomException',
                  'details': {
                    'message': 'This is a custom exception',
                    'additionalInfo': {
                      'hello': 'world',
                    },
                  },
                },
              },
            ),
          ],
          'throwsCustomExceptionToFromJson': [
            FunctionTestError(
              name: 'deserializes custom exception w/ custom serializer',
              statusCode: 400,
              input: {},
              output: {
                'error': {
                  'code': 'CustomExceptionToFromJson',
                  'details': {
                    'message': 'This is a custom exception',
                    'hello': 'world',
                    'another': 'value',
                  },
                },
              },
            ),
          ],
          'throwsCustomError': [
            FunctionTestError(
              name: 'deserializes custom error',
              statusCode: 500,
              input: {},
              output: {
                'error': {
                  'code': 'CustomError',
                  'details': {
                    'message': 'This is a custom error',
                    'additionalInfo': {
                      'hello': 'world',
                    },
                  },
                },
              },
            ),
          ],
          'throwsCustomErrorToFromJson': [
            FunctionTestError(
              name: 'deserializes custom error w/ custom serializer',
              statusCode: 500,
              input: {},
              output: {
                'error': {
                  'code': 'CustomErrorToFromJson',
                  'details': {
                    'message': 'This is a custom error',
                    'hello': 'world',
                    'another': 'value',
                  },
                },
              },
            ),
          ],
          'throwsCustomErrorWithStackTrace': [
            FunctionTestError(
              name: 'deserializes custom error w/ stack traace',
              statusCode: 500,
              input: {},
              output: {
                'error': {
                  'code': 'CustomErrorWithStackTrace',
                  'details': {
                    'message': 'This is a custom error',
                    'additionalInfo': {
                      'hello': 'world',
                    },
                    'stackTrace': '',
                  },
                },
              },
            ),
          ],
        },
      ),
      'sealed_classes': ApiTest(
        functionTests: {
          'sealedClass': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {
                    r'$type': 'Circle',
                    'radius': 5,
                  },
                  {
                    r'$type': 'Rectangle',
                    'width': 5,
                    'height': 5,
                  },
                ],
              },
              output: [
                {
                  r'$type': 'Circle',
                  'radius': 5,
                },
                {
                  r'$type': 'Rectangle',
                  'width': 5,
                  'height': 5,
                },
              ],
            ),
          ],
          'area': [
            FunctionTestSuccess(
              name: 'circle',
              input: {
                'shape': {
                  r'$type': 'Circle',
                  'radius': 5,
                },
              },
              output: pi * 5 * 5,
            ),
            FunctionTestSuccess(
              name: 'rectangle',
              input: {
                'shape': {
                  r'$type': 'Rectangle',
                  'width': 5,
                  'height': 5,
                },
              },
              output: 25,
            ),
          ],
          'rectangle': [
            FunctionTestSuccess(
              name: 'rectangle',
              input: {
                'rectangle': {
                  'width': 5,
                  'height': 5,
                },
              },
              output: {
                'width': 5.0,
                'height': 5.0,
              },
            ),
          ],
          'circle': [
            FunctionTestSuccess(
              name: 'circle',
              input: {
                'circle': {
                  'radius': 5,
                },
              },
              output: {
                'radius': 5.0,
              },
            ),
          ],
          'sealedClassWithInheritedCustomJson': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {
                    r'$type': 'CircleWithInheritedCustomJson',
                    'size': {
                      'radius': 5,
                    },
                  },
                  {
                    r'$type': 'RectangleWithInheritedCustomJson',
                    'size': {
                      'width': 5,
                      'height': 5,
                    },
                  },
                ],
              },
              output: [
                {
                  r'$type': 'CircleWithInheritedCustomJson',
                  'size': {
                    'radius': 5,
                  },
                },
                {
                  r'$type': 'RectangleWithInheritedCustomJson',
                  'size': {
                    'width': 5,
                    'height': 5,
                  },
                },
              ],
            ),
          ],
          'sealedClassWithCustomJson': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {
                    r'$type': 'CircleWithCustomJson',
                    'size': {
                      'radius': 5,
                    },
                  },
                  {
                    r'$type': 'RectangleWithCustomJson',
                    'size': {
                      'width': 5,
                      'height': 5,
                    },
                  },
                ],
              },
              output: [
                {
                  r'$type': 'CircleWithCustomJson',
                  'size': {
                    'radius': 5,
                  },
                },
                {
                  r'$type': 'RectangleWithCustomJson',
                  'size': {
                    'width': 5,
                    'height': 5,
                  },
                },
              ],
            ),
          ],
          'sealedClassWithOverriddenCustomJson': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                // discriminator is not needed since it should be routed directly
                // to the circle's fromJson ctor.
                'circle': {
                  'size': {
                    'radius': 5,
                  },
                },
                // discriminator is not needed since it should be routed directly
                // to the rectangle's fromJson ctor.
                'rectangle': {
                  'size': {
                    'width': 5,
                    'height': 5,
                  },
                },
                // discriminator is needed when static type is the base class.
                'other': [
                  {
                    r'$type': 'CircleWithOverriddenCustomJson',
                    'size': {
                      'radius': 5,
                    },
                  },
                  {
                    r'$type': 'RectangleWithOverriddenCustomJson',
                    'size': {
                      'width': 5,
                      'height': 5,
                    },
                  },
                ],
              },
              output: [
                {
                  r'$type': 'CircleWithOverriddenCustomJson',
                  'size': {
                    'radius': 5,
                  },
                },
                {
                  r'$type': 'RectangleWithOverriddenCustomJson',
                  'size': {
                    'width': 5,
                    'height': 5,
                  },
                },
                {
                  r'$type': 'CircleWithOverriddenCustomJson',
                  'size': {
                    'radius': 5,
                  },
                },
                {
                  r'$type': 'RectangleWithOverriddenCustomJson',
                  'size': {
                    'width': 5,
                    'height': 5,
                  },
                },
              ],
            ),
          ],
          'rectangleWithOverriddenCustomJson': [
            FunctionTestSuccess(
              name: '',
              input: {
                'rectangle': {
                  'size': {
                    'width': 5,
                    'height': 5,
                  },
                },
              },
              output: {
                r'$type': 'RectangleWithOverriddenCustomJson',
                'size': {
                  'width': 5,
                  'height': 5,
                },
              },
            ),
          ],
          'circleWithOverriddenCustomJson': [
            FunctionTestSuccess(
              name: '',
              input: {
                'circle': {
                  r'$type': 'CircleWithOverriddenCustomJson',
                  'size': {
                    'radius': 5,
                  },
                },
              },
              output: {
                'size': {
                  'radius': 5,
                },
              },
            ),
          ],
        },
      ),
      'cycles': ApiTest(
        functionTests: {
          'createTree': [
            FunctionTestSuccess(
              name: '',
              input: {},
              output: {
                r'$type': 'Parent',
                'name': 'root',
                'children': [
                  {
                    r'$type': 'Parent',
                    'name': 'parentA',
                    'children': [
                      {
                        r'$type': 'Child',
                        'name': 'childA',
                      },
                      {
                        r'$type': 'Child',
                        'name': 'childB',
                      }
                    ],
                  },
                  {
                    r'$type': 'Parent',
                    'name': 'parentB',
                    'children': [
                      {
                        r'$type': 'Child',
                        'name': 'childC',
                      },
                      {
                        r'$type': 'Child',
                        'name': 'childD',
                      }
                    ],
                  }
                ],
              },
            ),
          ],
          'printTree': [
            FunctionTestSuccess(
              name: '',
              input: {
                'node': {
                  r'$type': 'Parent',
                  'name': 'root',
                  'children': [
                    {
                      r'$type': 'Parent',
                      'name': 'parentA',
                      'children': [
                        {
                          r'$type': 'Child',
                          'name': 'childA',
                        },
                        {
                          r'$type': 'Child',
                          'name': 'childB',
                        }
                      ],
                    },
                    {
                      r'$type': 'Parent',
                      'name': 'parentB',
                      'children': [
                        {
                          r'$type': 'Child',
                          'name': 'childC',
                        },
                        {
                          r'$type': 'Child',
                          'name': 'childD',
                        }
                      ],
                    }
                  ],
                },
              },
              output: null,
              logs: [
                'root',
                '  parentA',
                '    childA',
                '    childB',
                '  parentB',
                '    childC',
                '    childD',
              ],
            ),
          ],
          'combineTrees': [
            FunctionTestSuccess(
              name: '',
              input: {
                'tree1': {
                  r'$type': 'Parent',
                  'name': 'parentA',
                  'children': [
                    {
                      r'$type': 'Child',
                      'name': 'childA',
                    },
                    {
                      r'$type': 'Child',
                      'name': 'childB',
                    }
                  ],
                },
                'tree2': {
                  'name': 'parentB',
                  'children': [
                    {
                      r'$type': 'Child',
                      'name': 'childC',
                    },
                    {
                      r'$type': 'Child',
                      'name': 'childD',
                    }
                  ],
                },
                'additionalChildren': [
                  null,
                  {
                    r'$type': 'Child',
                    'name': 'childE',
                  },
                  {
                    r'$type': 'Child',
                    'name': 'childF',
                  }
                ],
              },
              output: {
                r'$type': 'Parent',
                'name': 'root',
                'children': [
                  {
                    r'$type': 'Parent',
                    'name': 'parentA',
                    'children': [
                      {
                        r'$type': 'Child',
                        'name': 'childA',
                      },
                      {
                        r'$type': 'Child',
                        'name': 'childB',
                      }
                    ],
                  },
                  {
                    r'$type': 'Parent',
                    'name': 'parentB',
                    'children': [
                      {
                        r'$type': 'Child',
                        'name': 'childC',
                      },
                      {
                        r'$type': 'Child',
                        'name': 'childD',
                      }
                    ],
                  },
                  {
                    r'$type': 'Child',
                    'name': 'childE',
                  },
                  {
                    r'$type': 'Child',
                    'name': 'childF',
                  }
                ],
              },
            ),
          ],
          'selfReferencing': [
            FunctionTestSuccess(
              name: '',
              input: {
                'selfReferencing': {
                  'value': {
                    'value': null,
                    'wrapper': null,
                    'list': <Map<String, Object?>>[],
                  },
                  'wrapper': {
                    'value': {
                      'value': {
                        'value': null,
                        'wrapper': null,
                        'list': <Map<String, Object?>>[],
                      },
                      'wrapper': null,
                      'list': <Map<String, Object?>>[],
                    },
                  },
                  'list': [
                    {
                      'value': null,
                      'wrapper': null,
                      'list': <Map<String, Object?>>[],
                    },
                  ],
                },
              },
              output: {
                'value': {
                  'value': null,
                  'wrapper': null,
                  'list': <Map<String, Object?>>[],
                },
                'wrapper': {
                  'value': {
                    'value': {
                      'value': null,
                      'wrapper': null,
                      'list': <Map<String, Object?>>[],
                    },
                    'wrapper': null,
                    'list': <Map<String, Object?>>[],
                  },
                },
                'list': [
                  {
                    'value': null,
                    'wrapper': null,
                    'list': <Map<String, Object?>>[],
                  },
                ],
              },
            ),
          ],
        },
      ),
      'metadata': ApiTest(
        functionTests: {
          // Tests that invoking methods with all default values
          // should not result in any serialization errors.
          'positionalDefaultValues': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'nullablePositionalDefaultValues': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'namedDefaultValues': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'nullableNamedDefaultValues': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'positionalDefaultValueVars': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'nullablePositionalDefaultValueVars': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'namedDefaultValueVars': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'nullableNamedDefaultValueVars': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'positionalDefaultValueVarsPrivate': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'nullablePositionalDefaultValueVarsPrivate': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'namedDefaultValueVarsPrivate': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
          'nullableNamedDefaultValueVarsPrivate': [
            FunctionTestSuccess(name: '', input: {}, output: null),
          ],
        },
      ),
    },
  ),
  'env_vars': Test(
    apis: {
      'injected': ApiTest(
        functionTests: {
          'sayHello': [
            FunctionTestSuccess(
              name: 'sayHello',
              input: {},
              output: 'Hello, Dillon! I am 28 years old.',
            ),
          ],
          'sayHelloPerson': [
            FunctionTestSuccess(
              name: 'sayHelloPerson',
              input: {},
              output: {
                'name': 'Dillon',
                'age': 28,
                'height': 5.83,
                'weight': 130,
                'isCool': true,
                'website': 'https://dillonnys.com',
              },
              logs: [
                'Dillon is 28 years old, 5.83ft tall, 130 lbs, and is cool. '
                    'Find him at https://dillonnys.com.',
              ],
            ),
          ],
        },
      ),
    },
  ),
};

const genericWrappers = {
  'listOfString': ['one', 'two', 'three'],
  'listOfUri': ['https://google.com', 'https://example.com'],
  'listOfSimpleClass': [simpleStruct, simpleStruct],
  'listOfListOfString': [
    ['one', 'two', 'three'],
    ['four', 'five', 'six'],
  ],
  'listOfListOfUri': [
    ['https://google.com', 'https://example.com'],
    ['https://dart.dev', 'https://pub.dev'],
  ],
  'listOfListOfSimpleClass': [
    [simpleStruct, simpleStruct],
    [simpleStruct, simpleStruct],
  ],
  'mapOfString': {
    'one': 'one',
    'two': 'two',
    'three': 'three',
  },
  'mapOfUri': {
    'one': 'https://google.com',
    'two': 'https://example.com',
  },
  'mapOfSimpleClass': {
    'one': simpleStruct,
    'two': simpleStruct,
    'three': simpleStruct,
  },
  'mapOfListOfString': {
    'one': ['one', 'two', 'three'],
    'two': ['four', 'five', 'six'],
  },
  'mapOfListOfUri': {
    'one': ['https://google.com', 'https://example.com'],
    'two': ['https://dart.dev', 'https://pub.dev'],
  },
  'mapOfListOfSimpleClass': {
    'one': [simpleStruct, simpleStruct],
    'two': [simpleStruct, simpleStruct],
  },
  'mapOfMapOfString': {
    'a': {
      'a': 'a',
      'b': 'b',
      'c': 'c',
    },
    'b': {
      'a': 'a',
      'b': 'b',
      'c': 'c',
    },
  },
  'mapOfMapOfUri': {
    'one': {
      'one': 'https://google.com',
      'two': 'https://example.com',
    },
    'two': {
      'one': 'https://dart.dev',
      'two': 'https://pub.dev',
    },
  },
  'mapOfMapOfSimpleClass': {
    'one': {
      'one': simpleStruct,
      'two': simpleStruct,
      'three': simpleStruct,
    },
    'two': {
      'one': simpleStruct,
      'two': simpleStruct,
      'three': simpleStruct,
    },
  },
};
