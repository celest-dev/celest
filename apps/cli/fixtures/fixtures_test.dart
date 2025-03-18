// ignore_for_file: invalid_use_of_visible_for_testing_member

@Tags(['goldens'])
library;

import 'dart:convert';
import 'dart:io' hide Directory;
import 'dart:isolate';
import 'dart:math';

import 'package:async/async.dart';
import 'package:celest/src/runtime/serve.dart';
import 'package:celest_cli/src/analyzer/analysis_result.dart';
import 'package:celest_cli/src/analyzer/celest_analyzer.dart';
import 'package:celest_cli/src/codegen/client_code_generator.dart';
import 'package:celest_cli/src/codegen/cloud_code_generator.dart';
import 'package:celest_cli/src/compiler/api/local_api_runner.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/database/project/project_database.dart';
import 'package:celest_cli/src/env/config_value_solver.dart';
import 'package:celest_cli/src/init/project_migrator.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/project/project_linker.dart';
import 'package:celest_cli/src/pub/pub_action.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/sdk/sdk_finder.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:file/file.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as p;
import 'package:stream_transform/stream_transform.dart';
import 'package:test/test.dart';

import '../test/common.dart';
import 'types.dart';

void main() {
  final updateGoldens = switch (Platform.environment['UPDATE_GOLDENS']) {
    'true' => true,
    _ => false,
  };
  final includeTests = Platform.environment['INCLUDE_TESTS']?.split(',');
  final skipTests = Platform.environment['SKIP_TESTS']?.split(',');
  final includeApis = Platform.environment['INCLUDE_APIS']?.split(',');
  final clearCache = Platform.environment['CLEAR_CACHE'] == 'true';

  if (updateGoldens && Platform.isWindows) {
    throw Exception(
      'Cannot update goldens on Windows due to path differences.',
    );
  }

  final testRunners = <TestRunner>[];
  final testDirs = [
    // TODO(dnys1): Need to ensure Firebase/Supabase pre-reqs are installed
    // p.join(fileSystem.currentDirectory.path, 'fixtures', 'apps'),
    p.join(fileSystem.currentDirectory.path, 'fixtures', 'standalone'),
  ]
      .map(fileSystem.directory)
      .expand((testDir) => testDir.listSync().whereType<Directory>());
  for (final testDir in testDirs) {
    final (projectDir, useCelestLayout) =
        testDir.childDirectory('celest').existsSync()
            ? (testDir.childDirectory('celest'), true)
            : (testDir, false);
    if (!projectDir.childFile('pubspec.yaml').existsSync()) {
      continue;
    }
    if (p.basename(projectDir.path).startsWith('_')) {
      continue;
    }
    if (includeTests != null &&
        !includeTests.contains(p.basename(testDir.path))) {
      continue;
    }
    if (skipTests != null && skipTests.contains(p.basename(testDir.path))) {
      continue;
    }
    final testRunner = TestRunner(
      testName: p.basename(testDir.path),
      projectRoot: projectDir.path,
      updateGoldens: updateGoldens,
      clearCache: clearCache,
      parentProject:
          useCelestLayout ? ParentProject.loadSync(testDir.path) : null,
      clientDir: projectDir.childDirectory('client'),
      goldensDir: fileSystem.directory(p.join(projectDir.path, 'goldens')),
      includeApis: includeApis,
    );
    testRunners.add(testRunner);
  }

  group('Fixture', () {
    setUpAll(initTests);

    for (final runner in testRunners) {
      runner.run();
    }
  });
}

class TestRunner {
  TestRunner({
    required this.testName,
    required this.projectRoot,
    required this.updateGoldens,
    required this.clearCache,
    this.parentProject,
    required this.clientDir,
    required this.goldensDir,
    this.includeApis,
  });

  final String testName;
  final String projectRoot;
  final bool updateGoldens;
  final bool clearCache;
  final Directory clientDir;
  final ParentProject? parentProject;
  final Directory goldensDir;
  final List<String>? includeApis;

  late final testCases = tests[testName];

  late Client client;
  late CelestAnalyzer analyzer;

  static Future<void> _warmUp(String projectRoot) {
    return Isolate.run(() async {
      final sdkResult = await const DartSdkFinder().findSdk();
      Sdk.current = sdkResult.sdk;
      return CelestAnalyzer.warmUp(projectRoot);
    });
  }

  void run() {
    group(testName, () {
      setUpAll(() async {
        final sdkResult = await const DartSdkFinder().findSdk();
        Sdk.current = sdkResult.sdk;
        await runPub(
          exe: Platform.resolvedExecutable,
          action: PubAction.upgrade,
          workingDirectory: projectRoot,
        ).timeout(const Duration(seconds: 10));
        if (updateGoldens) {
          if (goldensDir.existsSync()) {
            goldensDir.deleteSync(recursive: true);
          }
          if (clientDir.existsSync()) {
            clientDir.deleteSync(recursive: true);
          }
        }
        if (clearCache) {
          final cacheDir = fileSystem.directory(
            p.join(projectRoot, '.dart_tool', 'celest'),
          );
          if (cacheDir.existsSync()) {
            cacheDir.deleteSync(recursive: true);
          }
        }
        await init(
          projectRoot: projectRoot,
          parentProject: parentProject,
          clientDir: clientDir.path,
          outputsDir: goldensDir.path,
          projectDb: ProjectDatabase.memory(),
        );
        analyzer = CelestAnalyzer();
        goldensDir.createSync();
        client = Client();

        final migrator = ProjectMigrator(
          projectRoot: projectRoot,
          projectName: celestProject.projectName,
          parentProject: parentProject,
        );
        await (_warmUp(projectRoot), migrator.migrate()).wait;
      });

      tearDownAll(() async {
        client.close();
        analyzer.reset();
        await celestProject.close();
      });

      testAnalyzer();
      testResolve();
      testCodegen();
      testClient();

      final apisDir = fileSystem.directory(
        p.join(projectRoot, 'lib', 'src', 'functions'),
      );
      if (apisDir.existsSync()) {
        testApis(apisDir, includeApis);
      }
    });
  }

  void testAnalyzer() {
    // Analyzer needs a bit longer.
    // TODO(dnys1): Benchmark + improve performance of analysis.
    test('analyzer', timeout: const Timeout.factor(3), () async {
      final CelestAnalysisResult(:project, :errors, :warnings) =
          await analyzer.analyzeProject(
        migrateProject: false,
        updateResources: updateGoldens,
      );
      expect(errors, isEmpty);
      expect(warnings, isEmpty);
      expect(project, isNotNull);

      if (Platform.isWindows) {
        // Cannot check/update goldens on Windows due to path differences.
        return;
      }
      final goldenAst = fileSystem.file(
        p.join(projectPaths.outputsDir, 'ast.json'),
      );
      if (updateGoldens) {
        await goldenAst.writeAsString(
          const JsonEncoder.withIndent('  ').convert(project!.toJson()),
        );
      } else {
        final expectedAst = jsonDecode(await goldenAst.readAsString());
        expect(project!.toJson(), expectedAst);
      }
    });
  }

  void testCodegen() {
    test('codegen', () async {
      final CelestAnalysisResult(:project, :errors, :warnings) =
          await analyzer.analyzeProject(
        migrateProject: false,
        updateResources: updateGoldens,
      );
      expect(errors, isEmpty);
      expect(warnings, isEmpty);
      expect(project, isNotNull);

      final configValues = await ConfigValueSolver(
        project: project!,
        environmentId: 'local',
      ).solveAll();
      final projectResolver = ProjectLinker(
        configValues: configValues,
        environmentId: 'local',
      );
      project.acceptWithArg(projectResolver, project);

      final codegen = CloudCodeGenerator(
        project: project,
        resolvedProject: projectResolver.resolvedProject,
      );
      project.accept(codegen);

      // final openApiSpec = OpenApiRenderer(
      //   project: project,
      //   resolvedProject: projectResolver.resolvedProject,
      // ).renderToYaml();

      final fileOutputs = {
        ...codegen.fileOutputs,
        // p.join(goldensDir.path, 'openapi.yaml'): openApiSpec,
      };

      for (final MapEntry(key: path, value: content) in fileOutputs.entries) {
        final goldenFile = fileSystem.file(path);
        if (updateGoldens) {
          await goldenFile.create(recursive: true);
          await goldenFile.writeAsString(content);
        } else {
          final expected = await goldenFile.readAsString();
          expect(content, equalsIgnoringWhitespace(expected));
        }
      }
    });
  }

  void testResolve() {
    test('resolve', () async {
      final CelestAnalysisResult(:project, :errors, :warnings) =
          await analyzer.analyzeProject(
        migrateProject: false,
        updateResources: updateGoldens,
      );
      expect(errors, isEmpty);
      expect(warnings, isEmpty);
      expect(project, isNotNull);

      final configValues = await ConfigValueSolver(
        project: project!,
        environmentId: 'local',
      ).solveAll();
      final projectResolver = ProjectLinker(
        configValues: configValues,
        environmentId: 'local',
      );
      project.acceptWithArg(projectResolver, project);
      final resolvedAstFile = fileSystem.file(
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
          await analyzer.analyzeProject(
        migrateProject: false,
        updateResources: updateGoldens,
      );
      expect(errors, isEmpty);
      expect(project, isNotNull);

      final configValues = await ConfigValueSolver(
        project: project!,
        environmentId: 'local',
      ).solveAll();
      final projectResolver = ProjectLinker(
        configValues: configValues,
        environmentId: 'local',
      );
      project.acceptWithArg(projectResolver, project);

      final clientGen = ClientCodeGenerator(
        project: project,
        resolvedProject: projectResolver.resolvedProject,
        projectUris: (
          localUri: Uri.http('localhost:$defaultCelestPort'),
          productionUri: Uri.parse('https://example.celest.run'),
        ),
      );
      final outputs = clientGen.generate();
      if (updateGoldens) {
        await outputs.write();
      } else {
        outputs.forEach((path, library) {
          expect(
            library,
            equalsIgnoringWhitespace(fileSystem.file(path).readAsStringSync()),
          );
        });
      }

      // TODO(dnys1): Needed? Or can we just verify visually? This is very
      // flaky when the previous command adds new dependencies.

      // final analyzeResult = await processManager.run(
      //   <String>[Platform.resolvedExecutable, 'analyze', '.'],
      //   workingDirectory: projectRoot,
      // );
      // expect(
      //   analyzeResult.exitCode,
      //   0,
      //   reason: '${analyzeResult.stdout}\n${analyzeResult.stderr}',
      // );
    });
  }

  void testApis(Directory apisDir, List<String>? includeApis) {
    final apis = testCases?.apis ?? const {};
    if (apis.isEmpty) {
      return;
    }
    group('apis', () {
      for (final MapEntry(key: apiName, value: apiTest) in apis.entries) {
        if (includeApis != null &&
            (!includeApis.contains(apiName) || includeApis.contains('none'))) {
          continue;
        }
        testApi(apiName, apiTest);
      }
    });
  }

  void testApi(String apiName, ApiTest apiTest) {
    group(apiName, () {
      late Uri apiUri;
      final logs = <String>[];
      final logSink = LogSink(logs);
      late LocalApiRunner apiRunner;

      setUpAll(() async {
        final entrypoint = projectPaths.localApiEntrypoint;
        final CelestAnalysisResult(:project, :errors) =
            await analyzer.analyzeProject(
          migrateProject: false,
          updateResources: updateGoldens,
        );
        expect(errors, isEmpty);
        expect(project, isNotNull);

        final configValues = await ConfigValueSolver(
          project: project!,
          environmentId: 'local',
        ).solveAll();
        final projectResolver = ProjectLinker(
          configValues: configValues,
          environmentId: 'local',
        );
        project.acceptWithArg(projectResolver, project);
        apiRunner = await LocalApiRunner.start(
          resolvedProject: projectResolver.resolvedProject,
          path: entrypoint,
          configValues: configValues,
          environmentId: 'local',
          verbose: false,
          stdoutPipe: logSink,
          stderrPipe: logSink,
          vmServiceTimeout: const Duration(seconds: 30),
        );
        apiUri = Uri.parse('http://localhost:${apiRunner.port}');

        await expectLater(client.get(apiUri), completes);
      });

      setUp(logs.clear);

      tearDownAll(() async {
        await apiRunner.close();
      });

      final functions = {
        ...apiTest.functionTests.keys,
        ...apiTest.eventTests.keys,
      };
      for (final functionName in functions) {
        testFunction(
          apiName,
          functionName,
          apiTest.functionTests[functionName] ?? const [],
          apiTest.eventTests[functionName] ?? const [],
          logs,
          () => apiRunner,
          () => apiUri,
        );
      }
    });
  }

  void testFunction(
    String apiName,
    String functionName,
    List<HttpTest> httpTests,
    List<EventTest> eventTests,
    List<String> logs,
    LocalApiRunner Function() runner,
    Uri Function() apiUri,
  ) {
    group(functionName, () {
      for (final testCase in httpTests) {
        test(testCase.name, () async {
          final request = Request(
            testCase.method,
            apiUri()
                .resolve(
                  '/${apiName.paramCase}/${functionName.paramCase}',
                )
                .replace(queryParameters: testCase.queryParameters),
          )
            ..headers.addAll({
              'Content-Type': 'application/json',
              ...testCase.headers,
            })
            ..body = jsonEncode(testCase.input);
          if (testCase.setup case final setup?) {
            await setup(request);
          }
          print('${request.method} ${request.url}');
          final response = client.send(request);
          final result = await Result.capture(response);
          try {
            switch (testCase) {
              case FunctionTestError(:final output):
                switch (result) {
                  case ErrorResult(error: final e):
                    fail('Unexpected error: $e');
                  case ValueResult(value: final resp):
                    expect(resp.statusCode, testCase.statusCode);
                    final body = await resp.stream.bytesToString();
                    final respJson = jsonDecode(body);
                    expect(respJson, equals(output));
                }
              case FunctionTestSuccess(:final output):
                expect(result.isValue, isTrue);
                final resp = result.asValue!.value;
                final body = await resp.stream.bytesToString();
                expect(resp.statusCode, testCase.statusCode, reason: body);
                if (testCase.method == 'HEAD') {
                  expect(body, isEmpty);
                } else {
                  final respJson = jsonDecode(body);
                  expect(respJson, equals(output));
                }
            }
            if (testCase.logs case final expectedLogs?) {
              expect(logs, containsAllInOrder(expectedLogs.map(contains)));
            }
          } on Object {
            await runner().close();
            print(logs.join('\n'));
            rethrow;
          }
        });
      }

      for (final testCase in eventTests) {
        test(testCase.name, () async {
          final socket = await WebSocket.connect(
            apiUri()
                .resolve('/${apiName.paramCase}/${functionName.paramCase}')
                .replace(
                  scheme: 'ws',
                  queryParameters: testCase.queryParameters,
                )
                .toString(),
          );
          addTearDown(socket.close);
          socket.add(jsonEncode(testCase.input));
          try {
            switch (testCase) {
              case EventTestSuccess(:final output):
                await expectLater(
                  socket.tap((evt) => print('[${testCase.name}] $evt')),
                  output,
                );
              case EventTestError(:final error):
                await expectLater(
                  socket.tap((evt) => print('[${testCase.name}] $evt')),
                  emitsError(error),
                );
            }
            if (testCase.logs case final expectedLogs?) {
              expect(logs, containsAllInOrder(expectedLogs.map(contains)));
            }
          } on Object {
            await runner().close();
            print(logs.join('\n'));
            rethrow;
          }
        });
      }
    });
  }
}

final class LogSink implements StringSink {
  LogSink(this.logs);

  final List<String> logs;

  @override
  void write(Object? object) {
    logs.add('$object');
  }

  @override
  void writeAll(Iterable<Object?> objects, [String separator = '']) {
    logs.addAll(objects.join(separator).split('\n'));
  }

  @override
  void writeCharCode(int charCode) {
    logs.add(String.fromCharCode(charCode));
  }

  @override
  void writeln([Object? object = '']) {
    logs.add('$object');
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
  'aMapOfString': {'hello': 'world'},
  'aMapOfInt': {'one': 1, 'two': 2, 'three': 3},
  'aMapOfDouble': {'one': 1.0, 'two': 2.0, 'three': 3.0},
  'aMapOfBool': {'true': true, 'false': false},
  'aMapOfEnum': {'a': 'a', 'b': 'b', 'c': 'c'},
  'aMapOfNull': {'null': null},
  'aMapOfBigInt': {'one': '1', 'two': '2', 'three': '3'},
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
  'aMapOfRegExp': {'one': '.*', 'two': '.*', 'three': '.*'},
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
      'asserts': ApiTest(
        functionTests: {
          'assertsEnabled': [
            FunctionTestSuccess(
              name: 'assertsEnabled',
              input: {},
              output: true,
            ),
          ],
        },
      ),
      'collections': ApiTest(
        functionTests: {
          'simpleList': [
            FunctionTestSuccess(
              name: 'simpleList',
              input: {
                'list': ['hello', 'world'],
              },
              output: ['hello', 'world'],
            ),
          ],
          'complexList': [
            FunctionTestSuccess(
              name: 'complexList',
              input: {
                'list': [simpleStruct, simpleStruct],
              },
              output: [simpleStruct, simpleStruct],
            ),
          ],
          'simpleMap': [
            FunctionTestSuccess(
              name: 'simpleMap',
              input: {
                'map': {'hello': 'world'},
              },
              output: {'hello': 'world'},
            ),
          ],
          'dynamicMap': [
            FunctionTestSuccess(
              name: 'dynamicMap',
              input: {
                'map': {'hello': 'world'},
              },
              output: {'hello': 'world'},
            ),
          ],
          'objectMap': [
            FunctionTestSuccess(
              name: 'objectMap',
              input: {
                'map': {'hello': 'world'},
              },
              output: {'hello': 'world'},
            ),
          ],
          'objectNullableMap': [
            FunctionTestSuccess(
              name: 'objectNullableMap',
              input: {
                'map': {'hello': 'world'},
              },
              output: {'hello': 'world'},
            ),
          ],
          'complexMap': [
            FunctionTestSuccess(
              name: 'complexMap',
              input: {
                'map': {'hello': simpleStruct},
              },
              output: {'hello': simpleStruct},
            ),
          ],
        },
      ),
      'extension_types': ApiTest(
        functionTests: {
          'string': [
            FunctionTestSuccess(
              name: 'stringString',
              input: {'s': 'hello'},
              output: 'hello',
            ),
          ],
          'asyncOrString': [
            FunctionTestSuccess(
              name: 'asyncOrString',
              input: {'s': 'hello'},
              output: 'hello',
            ),
          ],
          'asyncString': [
            FunctionTestSuccess(
              name: 'asyncString',
              input: {'s': 'hello'},
              output: 'hello',
            ),
          ],
          'stringImpl': [
            FunctionTestSuccess(
              name: 'stringImpl',
              input: {'s': 'hello'},
              output: 'hello',
            ),
          ],
          'stringToFromJson': [
            FunctionTestSuccess(
              name: 'stringToFromJson',
              input: {'s': 'hello'},
              output: 'olleh',
            ),
          ],
          'stringToJson': [
            FunctionTestSuccess(
              name: 'stringToJson',
              input: {'s': 'hello'},
              output: 'olleh',
            ),
          ],
          'stringToJsonImpl': [
            FunctionTestSuccess(
              name: 'stringToJsonImpl',
              input: {'s': 'hello'},
              output: 'olleh',
            ),
          ],
          'stringFromJson': [
            FunctionTestSuccess(
              name: 'stringFromJson',
              input: {'s': 'hello'},
              output: 'olleh',
            ),
          ],
          'stringFromJsonImpl': [
            FunctionTestSuccess(
              name: 'stringFromJsonImpl',
              input: {'s': 'hello'},
              output: 'olleh',
            ),
          ],
          'stringFromJsonStatic': [
            FunctionTestSuccess(
              name: 'stringFromJsonStatic',
              input: {'s': 'hello'},
              output: 'olleh',
            ),
          ],
          'stringPrivateField': [
            FunctionTestSuccess(
              name: 'stringPrivateField',
              input: {'s': 'hello'},
              output: 'hello',
            ),
          ],
          'stringPrivateFieldImpl': [
            FunctionTestSuccess(
              name: 'stringPrivateFieldImpl',
              input: {'s': 'hello'},
              output: 'hello',
            ),
          ],
          'stringPrivateCtor': [
            FunctionTestSuccess(
              name: 'stringPrivateCtor',
              input: {'s': 'hello'},
              output: 'hello',
            ),
          ],
          'stringPrivateCtorImpl': [
            FunctionTestSuccess(
              name: 'stringPrivateCtorImpl',
              input: {'s': 'hello'},
              output: 'hello',
            ),
          ],
          'value': [
            FunctionTestSuccess(
              name: 'value',
              input: {'v': 'hello'},
              output: 'hello',
            ),
          ],
          'valueX': [
            FunctionTestSuccess(
              name: 'valueX',
              input: {
                'v': {'value': 'hello'},
              },
              output: {'value': 'hello'},
            ),
          ],
          'valueXImpl': [
            FunctionTestSuccess(
              name: 'valueXImpl',
              input: {
                'v': {'value': 'hello'},
              },
              output: {'value': 'hello'},
            ),
          ],
          'valueXToFromJson': [
            FunctionTestSuccess(
              name: 'valueXImpl',
              input: {'v': 'hello'},
              output: 'helloFromJsonToJson',
            ),
          ],
          'valueXToJson': [
            FunctionTestSuccess(
              name: 'valueXToJson',
              input: {
                'v': {'value': 'hello'},
              },
              output: {'value': 'helloToJson'},
            ),
          ],
          'valueXToJsonImpl': [
            FunctionTestSuccess(
              name: 'valueXToJson',
              input: {'v': 'hello'},
              output: 'helloToJson',
            ),
          ],
          'valueXFromJson': [
            FunctionTestSuccess(
              name: 'valueXFromJson',
              input: {
                'v': {'value': 'hello'},
              },
              output: {'value': 'helloFromJson'},
            ),
          ],
          'valueXFromJsonImpl': [
            FunctionTestSuccess(
              name: 'valueXFromJsonImpl',
              input: {'v': 'hello'},
              output: 'helloFromJson',
            ),
          ],
          'valueXFromJsonStatic': [
            FunctionTestSuccess(
              name: 'valueXFromJsonStatic',
              input: {
                'v': {'value': 'hello'},
              },
              output: {'value': 'helloFromJson'},
            ),
          ],
          'jsonValue': [
            FunctionTestSuccess(
              name: 'string',
              input: {'value': 'hello'},
              output: 'hello',
            ),
            FunctionTestSuccess(
              name: 'int',
              input: {'value': 123},
              output: 123,
            ),
            FunctionTestSuccess(
              name: 'double',
              input: {'value': 123.456},
              output: 123.456,
            ),
            FunctionTestSuccess(
              name: 'bool',
              input: {'value': true},
              output: true,
            ),
            FunctionTestSuccess(
              name: 'list',
              input: {
                'value': ['hello', 123, 123.456, true],
              },
              output: ['hello', 123, 123.456, true],
            ),
            FunctionTestSuccess(
              name: 'map',
              input: {
                'value': {
                  'hello': 'world',
                  'int': 123,
                  'double': 123.456,
                  'bool': true,
                },
              },
              output: {
                'hello': 'world',
                'int': 123,
                'double': 123.456,
                'bool': true,
              },
            ),
            FunctionTestSuccess(
              name: 'nested',
              input: {
                'value': {
                  'hello': 'world',
                  'int': 123,
                  'double': 123.456,
                  'bool': true,
                  'list': ['hello', 123, 123.456, true],
                  'map': {
                    'hello': 'world',
                    'int': 123,
                    'double': 123.456,
                    'bool': true,
                  },
                },
              },
              output: {
                'hello': 'world',
                'int': 123,
                'double': 123.456,
                'bool': true,
                'list': ['hello', 123, 123.456, true],
                'map': {
                  'hello': 'world',
                  'int': 123,
                  'double': 123.456,
                  'bool': true,
                },
              },
            ),
          ],
          'jsonString': [
            FunctionTestSuccess(
              name: 'jsonString',
              input: {'value': 'hello'},
              output: 'hello',
            ),
          ],
          'jsonNum': [
            FunctionTestSuccess(
              name: 'int',
              input: {'value': 123},
              output: 123,
            ),
            FunctionTestSuccess(
              name: 'double',
              input: {'value': 123.456},
              output: 123.456,
            ),
          ],
          'jsonInt': [
            FunctionTestSuccess(
              name: 'jsonInt',
              input: {'value': 123},
              output: 123,
            ),
          ],
          'jsonDouble': [
            FunctionTestSuccess(
              name: 'jsonDouble',
              input: {'value': 123.456},
              output: 123.456,
            ),
          ],
          'jsonBool': [
            FunctionTestSuccess(
              name: 'jsonBool',
              input: {'value': true},
              output: true,
            ),
          ],
          'jsonList': [
            FunctionTestSuccess(
              name: 'simple',
              input: {
                'value': ['hello', 123, 123.456, true],
              },
              output: ['hello', 123, 123.456, true],
            ),
            FunctionTestSuccess(
              name: 'complex',
              input: {
                'value': [complexStruct, complexStruct],
              },
              output: [complexStruct, complexStruct],
            ),
          ],
          'jsonMap': [
            FunctionTestSuccess(
              name: 'simple',
              input: {
                'value': {
                  'hello': 'world',
                  'int': 123,
                  'double': 123.456,
                  'bool': true,
                },
              },
              output: {
                'hello': 'world',
                'int': 123,
                'double': 123.456,
                'bool': true,
              },
            ),
            FunctionTestSuccess(
              name: 'complex',
              input: {
                'value': {'a': complexStruct, 'b': complexStruct},
              },
              output: {'a': complexStruct, 'b': complexStruct},
            ),
          ],
          'color': [
            FunctionTestSuccess(
              name: 'color',
              input: {'color': 'r'},
              output: 'r',
            ),
          ],
          'colorX': [
            FunctionTestSuccess(
              name: 'colorX',
              input: {'color': 'red'},
              output: 'red',
            ),
          ],
          'colorXImpl': [
            FunctionTestSuccess(
              name: 'colorX',
              input: {'color': 'red'},
              output: 'red',
            ),
          ],
          'colorXToFromJson': [
            FunctionTestSuccess(
              name: 'colorXToFromJson',
              input: {'color': 'RED'},
              output: 'RED',
            ),
          ],
          'colorXToJson': [
            FunctionTestSuccess(
              name: 'colorXToJson',
              input: {'color': 'red'},
              output: 'RED',
            ),
          ],
          'colorXToJsonImpl': [
            FunctionTestSuccess(
              name: 'colorXToJson',
              input: {'color': 'red'},
              output: 'RED',
            ),
          ],
          'colorXFromJson': [
            FunctionTestSuccess(
              name: 'colorXFromJson',
              input: {'color': 'RED'},
              output: 'red',
            ),
          ],
          'colorXFromJsonImpl': [
            FunctionTestSuccess(
              name: 'colorXFromJsonImpl',
              input: {'color': 'RED'},
              output: 'r',
            ),
          ],
          'colorXFromJsonStatic': [
            FunctionTestSuccess(
              name: 'colorXFromJsonStatic',
              input: {'color': 'RED'},
              output: 'red',
            ),
          ],
        },
      ),
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
            FunctionTestSuccess(name: 'all null', input: {}, output: null),
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
                'anIterableOfSimpleStruct': [simpleStruct, simpleStruct],
                'anIterableOfComplexStruct': [complexStruct, complexStruct],
                'anIterableOfSimpleClass': [simpleStruct, simpleStruct],
                'anIterableOfComplexClass': [complexStruct, complexStruct],
                'aNullableIterableOfSimpleStruct': [simpleStruct, simpleStruct],
                'aNullableIterableOfComplexStruct': [
                  complexStruct,
                  complexStruct,
                ],
                'aNullableIterableOfSimpleClass': [simpleStruct, simpleStruct],
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
                'aListOfSimpleStruct': [simpleStruct, simpleStruct],
                'aListOfComplexStruct': [complexStruct, complexStruct],
                'aListOfSimpleClass': [simpleStruct, simpleStruct],
                'aListOfComplexClass': [complexStruct, complexStruct],
                'aNullableListOfSimpleStruct': [simpleStruct, simpleStruct],
                'aNullableListOfComplexStruct': [complexStruct, complexStruct],
                'aNullableListOfSimpleClass': [simpleStruct, simpleStruct],
                'aNullableListOfComplexClass': [complexStruct, complexStruct],
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
                'anIterableOfSimpleStruct': [simpleStruct, simpleStruct],
                'anIterableOfComplexStruct': [complexStruct, complexStruct],
                'anIterableOfSimpleClass': [simpleStruct, simpleStruct],
                'anIterableOfComplexClass': [complexStruct, complexStruct],
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
                'aListOfSimpleStruct': [simpleStruct, simpleStruct],
                'aListOfComplexStruct': [complexStruct, complexStruct],
                'aListOfSimpleClass': [simpleStruct, simpleStruct],
                'aListOfComplexClass': [complexStruct, complexStruct],
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
      'overrides': ApiTest(
        functionTests: {
          'commonNestedParent': [
            FunctionTestSuccess(
              name: 'commonNestedParent',
              input: {
                'parent': {
                  'child': {'name': 'hello'},
                },
              },
              output: {
                'child': {'name': 'hello'},
              },
            ),
          ],
          'commonNestedChild': [
            FunctionTestSuccess(
              name: 'commonNestedChild',
              input: {
                'child': {'name': 'hello'},
              },
              output: {'name': 'hello'},
            ),
          ],
          'nestedGrandparent': [
            FunctionTestSuccess(
              name: 'nestedGrandparent',
              input: {
                'grandparent': {
                  'parent': {
                    'child': {'name': 'hello'},
                  },
                },
              },
              output: {
                'parent': {
                  'child': {'name': 'hello'},
                },
              },
            ),
          ],
          'nestedParent': [
            FunctionTestSuccess(
              name: 'nestedParent',
              input: {
                'parent': {
                  'child': {'name': 'hello'},
                },
              },
              output: {
                'child': {'name': 'hello'},
              },
            ),
          ],
          'nestedChild': [
            FunctionTestSuccess(
              name: 'nestedChild',
              input: {
                'child': {'name': 'hello'},
              },
              output: {'name': 'hello'},
            ),
          ],
          'callsThrowsCommonOverriddenException': [
            const FunctionTestError(
              name: 'callsThrowsCommonOverriddenException',
              input: {},
              statusCode: 400,
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'api.v1.OverriddenException',
                      'value': {'message': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsCommonOverriddenException': [
            const FunctionTestError(
              name: 'throwsCommonOverriddenException',
              input: {},
              statusCode: 400,
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'api.v1.OverriddenException',
                      'value': {'message': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsOverriddenException': [
            const FunctionTestError(
              name: 'throwsOverriddenException',
              input: {},
              statusCode: 400,
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'api.v1.OverriddenException',
                      'value': {'message': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'callsThrowsOverriddenException': [
            const FunctionTestError(
              name: 'callsThrowsOverriddenException',
              input: {},
              statusCode: 400,
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'api.v1.OverriddenException',
                      'value': {'message': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
        },
      ),
      'classes': ApiTest(
        functionTests: {
          'empty': [FunctionTestSuccess(name: 'empty', input: {}, output: {})],
          'asyncEmpty': [
            FunctionTestSuccess(name: 'asyncEmpty', input: {}, output: {}),
          ],
          'fields': [
            FunctionTestSuccess(
              name: 'fields',
              input: {
                'value': {'superField': 'superField', 'field': 'field'},
              },
              output: {'superField': 'superField', 'field': 'field'},
            ),
          ],
          'asyncFields': [
            FunctionTestSuccess(
              name: 'asyncFields',
              input: {
                'value': {'superField': 'superField', 'field': 'field'},
              },
              output: {'superField': 'superField', 'field': 'field'},
            ),
          ],
          'nullableFields': [
            FunctionTestSuccess(name: 'null', input: {}, output: null),
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {'superField': 'superField', 'field': 'field'},
              },
              output: {'superField': 'superField', 'field': 'field'},
            ),
          ],
          'asyncNullableFields': [
            FunctionTestSuccess(name: 'null', input: {}, output: null),
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {'superField': 'superField', 'field': 'field'},
              },
              output: {'superField': 'superField', 'field': 'field'},
            ),
          ],
          'namedFields': [
            FunctionTestSuccess(
              name: 'namedFields',
              input: {
                'value': {'superField': 'superField', 'field': 'field'},
              },
              output: {'superField': 'superField', 'field': 'field'},
            ),
          ],
          'asyncNamedFields': [
            FunctionTestSuccess(
              name: 'asyncNamedFields',
              input: {
                'value': {'superField': 'superField', 'field': 'field'},
              },
              output: {'superField': 'superField', 'field': 'field'},
            ),
          ],
          'mixedFields': [
            FunctionTestSuccess(
              name: 'mixedFields',
              input: {
                'value': {'superField': 'superField', 'field': 'field'},
              },
              output: {'superField': 'superField', 'field': 'field'},
            ),
          ],
          'asyncMixedFields': [
            FunctionTestSuccess(
              name: 'asyncMixedFields',
              input: {
                'value': {'superField': 'superField', 'field': 'field'},
              },
              output: {'superField': 'superField', 'field': 'field'},
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
              input: {'value': {}},
              output: {
                'field': 'default',
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
              input: {'value': {}},
              output: {
                'field': 'default',
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
                  'fields': {'superField': 'superField', 'field': 'field'},
                  'nullableFields': {
                    'superField': 'superField',
                    'field': 'field',
                  },
                },
              },
              output: {
                'fields': {'superField': 'superField', 'field': 'field'},
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
                  'fields': {'superField': 'superField', 'field': 'field'},
                },
              },
              output: {
                'fields': {'superField': 'superField', 'field': 'field'},
              },
            ),
          ],
          'asyncNestedClass': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {
                  'fields': {'superField': 'superField', 'field': 'field'},
                  'nullableFields': {
                    'superField': 'superField',
                    'field': 'field',
                  },
                },
              },
              output: {
                'fields': {'superField': 'superField', 'field': 'field'},
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
                  'fields': {'superField': 'superField', 'field': 'field'},
                },
              },
              output: {
                'fields': {'superField': 'superField', 'field': 'field'},
              },
            ),
          ],
          'onlyFromJson': [
            FunctionTestSuccess(
              name: 'onlyFromJson',
              input: {
                'value': {'field': 'field'},
              },
              output: {'field': 'field'},
            ),
          ],
          'asyncOnlyFromJson': [
            FunctionTestSuccess(
              name: 'asyncOnlyFromJson',
              input: {
                'value': {'field': 'field'},
              },
              output: {'field': 'field'},
            ),
          ],
          'onlyToJson': [
            FunctionTestSuccess(
              name: 'onlyToJson',
              input: {
                'value': {'field': 'field'},
              },
              output: {'field': 'field'},
            ),
          ],
          'asyncOnlyToJson': [
            FunctionTestSuccess(
              name: 'asyncOnlyToJson',
              input: {
                'value': {'field': 'field'},
              },
              output: {'field': 'field'},
            ),
          ],
          'onlyToJsonWithDefaults': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {'field': 'field'},
              },
              output: {'field': 'field'},
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: {'field': 'default'},
            ),
          ],
          'asyncOnlyToJsonWithDefaults': [
            FunctionTestSuccess(
              name: 'present',
              input: {
                'value': {'field': 'field'},
              },
              output: {'field': 'field'},
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {},
              output: {'field': 'default'},
            ),
          ],
          'fromAndToJson': [
            FunctionTestSuccess(
              name: 'fromAndToJson',
              input: {
                'value': {'field': 'field'},
              },
              output: {'field': 'field'},
            ),
          ],
          'asyncFromAndToJson': [
            FunctionTestSuccess(
              name: 'asyncFromAndToJson',
              input: {
                'value': {'field': 'field'},
              },
              output: {'field': 'field'},
            ),
          ],
          'nonMapToJson': [
            FunctionTestSuccess(
              name: 'nonMapToJson',
              input: {'value': 'field'},
              output: 'field',
            ),
          ],
          'asyncNonMapToJson': [
            FunctionTestSuccess(
              name: 'asyncNonMapToJson',
              input: {'value': 'field'},
              output: 'field',
            ),
          ],
          'nonMapToJsonWithDefaults': [
            FunctionTestSuccess(
              name: 'present',
              input: {'value': 'field'},
              output: 'field',
            ),
            FunctionTestSuccess(name: 'null', input: {}, output: 'default'),
          ],
          'asyncNonMapToJsonWithDefaults': [
            FunctionTestSuccess(
              name: 'present',
              input: {'value': 'field'},
              output: 'field',
            ),
            FunctionTestSuccess(name: 'null', input: {}, output: 'default'),
          ],
          'nonMapFromAndToJson': [
            FunctionTestSuccess(
              name: 'nonMapFromAndToJson',
              input: {'value': 'field'},
              output: 'field',
            ),
          ],
          'asyncNonMapFromAndToJson': [
            FunctionTestSuccess(
              name: 'asyncNonMapFromAndToJson',
              input: {'value': 'field'},
              output: 'field',
            ),
          ],
          'fromJsonStatic': [
            FunctionTestSuccess(
              name: 'fromJsonStatic',
              input: {'value': 'field'},
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
                'value': {'field': 'field', 'anotherField': 'anotherField'},
              },
              output: {'field': 'field', 'anotherField': 'anotherField'},
            ),
          ],
          'asyncNonAliasedNamedFields': [
            FunctionTestSuccess(
              name: 'asyncNonAliasedNamedFields',
              input: {
                'value': {'field': 'field', 'anotherField': 'anotherField'},
              },
              output: {'field': 'field', 'anotherField': 'anotherField'},
            ),
          ],
          'aliasedNamedFields': [
            FunctionTestSuccess(
              name: 'aliasedNamedFields',
              input: {
                'value': {'field': 'field', 'anotherField': 'anotherField'},
              },
              output: {'field': 'field', 'anotherField': 'anotherField'},
            ),
          ],
          'asyncAliasedNamedFields': [
            FunctionTestSuccess(
              name: 'asyncAliasedNamedFields',
              input: {
                'value': {'field': 'field', 'anotherField': 'anotherField'},
              },
              output: {'field': 'field', 'anotherField': 'anotherField'},
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
                'aliased': {'field': 'field', 'anotherField': 'anotherField'},
              },
              output: {
                'nonAliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
                'aliased': {'field': 'field', 'anotherField': 'anotherField'},
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
                'aliased': {'field': 'field', 'anotherField': 'anotherField'},
              },
              output: {
                'nonAliased': {
                  'field': 'field',
                  'anotherField': 'anotherField',
                },
                'aliased': {'field': 'field', 'anotherField': 'anotherField'},
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
            FunctionTestSuccess(name: 'null', input: {}, output: null),
            FunctionTestSuccess(
              name: 'no value',
              input: {
                'value': {'namedFields': null},
              },
              output: {},
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
            FunctionTestSuccess(name: 'null', input: {}, output: null),
            FunctionTestSuccess(
              name: 'no value',
              input: {
                'value': {'namedFields': null},
              },
              output: {},
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
              input: {'value': genericWrappers},
              output: genericWrappers,
            ),
          ],
          'genericWrappersAsync': [
            FunctionTestSuccess(
              name: 'genericWrappers',
              input: {'value': genericWrappers},
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
              input: {'type': 'Exception'},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {'@type': 'dart.core.Exception', 'value': anything},
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'deserializes format exception',
              statusCode: 400,
              input: {'type': 'FormatException'},
              output: {
                '@status': {
                  'code': 400,
                  'message': 'Bad format',
                  'details': [
                    {
                      '@type': 'dart.core.FormatException',
                      'value': {'message': 'Bad format', 'source': null},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsError': [
            FunctionTestError(
              name: 'deserializes std error',
              statusCode: 500,
              input: {'type': 'Error'},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {'@type': 'dart.core.Error', 'value': anything},
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'deserializes argument error',
              statusCode: 500,
              input: {'type': 'ArgumentError'},
              output: {
                '@status': {
                  'code': 500,
                  // TODO(dnys1): This should be the custom message.
                  'message': anything,
                  'details': [
                    {
                      '@type': 'dart.core.ArgumentError',
                      'value': {
                        'name': 'someArg',
                        'message': 'Bad argument',
                        'invalidValue': null,
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
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
                '@status': {
                  'code': 400,
                  // TODO(dnys1): This should be the custom message.
                  'message': anything,
                  'details': [
                    {
                      '@type': 'api.v1.CustomException',
                      'value': {
                        'message': 'This is a custom exception',
                        'additionalInfo': {'hello': 'world'},
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
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
                '@status': {
                  'code': 400,
                  // TODO(dnys1): This should be the custom message.
                  'message': anything,
                  'details': [
                    {
                      '@type': 'api.v1.CustomExceptionToFromJson',
                      'value': {
                        'message': 'This is a custom exception',
                        'hello': 'world',
                        'another': 'value',
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
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
                '@status': {
                  'code': 500,
                  // TODO(dnys1): This should be the custom message.
                  'message': anything,
                  'details': [
                    {
                      '@type': 'api.v1.CustomError',
                      'value': {
                        'message': 'This is a custom error',
                        'additionalInfo': {'hello': 'world'},
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
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
                '@status': {
                  'code': 500,
                  // TODO(dnys1): This should be the custom message.
                  'message': anything,
                  'details': [
                    {
                      '@type': 'api.v1.CustomErrorToFromJson',
                      'value': {
                        'message': 'This is a custom error',
                        'hello': 'world',
                        'another': 'value',
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
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
                '@status': {
                  'code': 500,
                  // TODO(dnys1): This should be the custom message.
                  'message': anything,
                  'details': [
                    {
                      '@type': 'api.v1.CustomErrorWithStackTrace',
                      'value': {
                        'message': 'This is a custom error',
                        'additionalInfo': {'hello': 'world'},
                        'stackTrace': '',
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
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
                  {r'$type': 'Circle', 'radius': 5},
                  {r'$type': 'Rectangle', 'width': 5, 'height': 5},
                ],
              },
              output: [
                {r'$type': 'Circle', 'radius': 5, 'area': pi * 5 * 5},
                {r'$type': 'Rectangle', 'width': 5, 'height': 5, 'area': 25.0},
              ],
            ),
          ],
          'area': [
            FunctionTestSuccess(
              name: 'circle',
              input: {
                'shape': {r'$type': 'Circle', 'radius': 5},
              },
              output: pi * 5 * 5,
            ),
            FunctionTestSuccess(
              name: 'rectangle',
              input: {
                'shape': {r'$type': 'Rectangle', 'width': 5, 'height': 5},
              },
              output: 25,
            ),
          ],
          'rectangle': [
            FunctionTestSuccess(
              name: 'rectangle',
              input: {
                'rectangle': {'width': 5, 'height': 5},
              },
              output: {'width': 5.0, 'height': 5.0, 'area': 25.0},
            ),
          ],
          'circle': [
            FunctionTestSuccess(
              name: 'circle',
              input: {
                'circle': {'radius': 5},
              },
              output: {'radius': 5.0, 'area': pi * 5 * 5},
            ),
          ],
          'sealedClassWithInheritedCustomJson': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {
                    r'$type': 'CircleWithInheritedCustomJson',
                    'size': {'radius': 5},
                  },
                  {
                    r'$type': 'RectangleWithInheritedCustomJson',
                    'size': {'width': 5, 'height': 5},
                  },
                ],
              },
              output: [
                {
                  r'$type': 'CircleWithInheritedCustomJson',
                  'size': {'radius': 5},
                },
                {
                  r'$type': 'RectangleWithInheritedCustomJson',
                  'size': {'width': 5, 'height': 5},
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
                    'size': {'radius': 5},
                  },
                  {
                    r'$type': 'RectangleWithCustomJson',
                    'size': {'width': 5, 'height': 5},
                  },
                ],
              },
              output: [
                {
                  r'$type': 'CircleWithCustomJson',
                  'size': {'radius': 5},
                },
                {
                  r'$type': 'RectangleWithCustomJson',
                  'size': {'width': 5, 'height': 5},
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
                  'size': {'radius': 5},
                },
                // discriminator is not needed since it should be routed directly
                // to the rectangle's fromJson ctor.
                'rectangle': {
                  'size': {'width': 5, 'height': 5},
                },
                // discriminator is needed when static type is the base class.
                'other': [
                  {
                    r'$type': 'CircleWithOverriddenCustomJson',
                    'size': {'radius': 5},
                  },
                  {
                    r'$type': 'RectangleWithOverriddenCustomJson',
                    'size': {'width': 5, 'height': 5},
                  },
                ],
              },
              output: [
                {
                  r'$type': 'CircleWithOverriddenCustomJson',
                  'size': {'radius': 5},
                },
                {
                  r'$type': 'RectangleWithOverriddenCustomJson',
                  'size': {'width': 5, 'height': 5},
                },
                {
                  r'$type': 'CircleWithOverriddenCustomJson',
                  'size': {'radius': 5},
                },
                {
                  r'$type': 'RectangleWithOverriddenCustomJson',
                  'size': {'width': 5, 'height': 5},
                },
              ],
            ),
          ],
          'rectangleWithOverriddenCustomJson': [
            FunctionTestSuccess(
              name: '',
              input: {
                'rectangle': {
                  'size': {'width': 5, 'height': 5},
                },
              },
              output: {
                r'$type': 'RectangleWithOverriddenCustomJson',
                'size': {'width': 5, 'height': 5},
              },
            ),
          ],
          'circleWithOverriddenCustomJson': [
            FunctionTestSuccess(
              name: '',
              input: {
                'circle': {
                  r'$type': 'CircleWithOverriddenCustomJson',
                  'size': {'radius': 5},
                },
              },
              output: {
                'size': {'radius': 5},
              },
            ),
          ],
          'shapeResults': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {r'$type': 'Circle', 'radius': 5.0},
                  {r'$type': 'Rectangle', 'width': 5.0, 'height': 5.0},
                ],
              },
              output: [
                {
                  r'$type': 'OkResult',
                  'data': {
                    r'$type': 'Circle',
                    'radius': 5.0,
                    'area': pi * 5.0 * 5.0,
                  },
                },
                {
                  r'$type': 'OkResult',
                  'data': {
                    r'$type': 'Rectangle',
                    'width': 5.0,
                    'height': 5.0,
                    'area': 25.0,
                  },
                },
                {r'$type': 'ErrResult', 'error': 'Bad shape: (Circle: 5.0)'},
                {
                  r'$type': 'ErrResult',
                  'error': 'Bad shape: (Rectangle: 5.0 x 5.0)',
                },
              ],
            ),
          ],
          'okShapeResults': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {r'$type': 'Circle', 'radius': 5.0},
                  {r'$type': 'Rectangle', 'width': 5.0, 'height': 5.0},
                ],
              },
              output: [
                {
                  'data': {
                    r'$type': 'Circle',
                    'radius': 5.0,
                    'area': pi * 5.0 * 5.0,
                  },
                },
                {
                  'data': {
                    r'$type': 'Rectangle',
                    'width': 5.0,
                    'height': 5.0,
                    'area': 25.0,
                  },
                },
              ],
            ),
          ],
          'errShapeResults': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {r'$type': 'Circle', 'radius': 5.0},
                  {r'$type': 'Rectangle', 'width': 5.0, 'height': 5.0},
                ],
              },
              output: [
                {'error': 'Bad shape: (Circle: 5.0)'},
                {'error': 'Bad shape: (Rectangle: 5.0 x 5.0)'},
              ],
            ),
          ],
          'aliasedShapeResults': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {r'$type': 'Circle', 'radius': 5.0},
                  {r'$type': 'Rectangle', 'width': 5.0, 'height': 5.0},
                ],
              },
              output: [
                {
                  r'$type': 'OkResult',
                  'data': {
                    r'$type': 'Circle',
                    'radius': 5.0,
                    'area': pi * 5.0 * 5.0,
                  },
                },
                {
                  r'$type': 'OkResult',
                  'data': {
                    r'$type': 'Rectangle',
                    'width': 5.0,
                    'height': 5.0,
                    'area': 25.0,
                  },
                },
                {r'$type': 'ErrResult', 'error': 'Bad shape: (Circle: 5.0)'},
                {
                  r'$type': 'ErrResult',
                  'error': 'Bad shape: (Rectangle: 5.0 x 5.0)',
                },
              ],
            ),
          ],
          'aliasedOkShapeResults': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {r'$type': 'Circle', 'radius': 5.0},
                  {r'$type': 'Rectangle', 'width': 5.0, 'height': 5.0},
                ],
              },
              output: [
                {
                  r'$type': 'OkResult',
                  'data': {
                    r'$type': 'Circle',
                    'radius': 5.0,
                    'area': pi * 5.0 * 5.0,
                  },
                },
                {
                  r'$type': 'OkResult',
                  'data': {
                    r'$type': 'Rectangle',
                    'width': 5.0,
                    'height': 5.0,
                    'area': 25.0,
                  },
                },
              ],
            ),
          ],
          'aliasedErrShapeResults': [
            FunctionTestSuccess(
              name: 'all shapes',
              input: {
                'shapes': [
                  {r'$type': 'Circle', 'radius': 5.0},
                  {r'$type': 'Rectangle', 'width': 5.0, 'height': 5.0},
                ],
              },
              output: [
                {r'$type': 'ErrResult', 'error': 'Bad shape: (Circle: 5.0)'},
                {
                  r'$type': 'ErrResult',
                  'error': 'Bad shape: (Rectangle: 5.0 x 5.0)',
                },
              ],
            ),
          ],
          'okShapeResult': [
            FunctionTestSuccess(
              name: 'circle',
              input: {
                'shape': {r'$type': 'Circle', 'radius': 5.0},
              },
              output: {
                'data': {
                  r'$type': 'Circle',
                  'radius': 5.0,
                  'area': pi * 5.0 * 5.0,
                },
              },
            ),
            FunctionTestSuccess(
              name: 'rectangle',
              input: {
                'shape': {r'$type': 'Rectangle', 'width': 5.0, 'height': 5.0},
              },
              output: {
                'data': {
                  r'$type': 'Rectangle',
                  'width': 5.0,
                  'height': 5.0,
                  'area': 25.0,
                },
              },
            ),
          ],
          'swappedResult': [
            FunctionTestSuccess(
              name: 'swappedResult',
              input: {
                'result': {
                  r'$type': 'OkResult',
                  'data': {r'$type': 'Circle', 'radius': 5.0},
                },
              },
              output: {
                'result': {
                  r'$type': 'OkResult',
                  'data': {
                    r'$type': 'Circle',
                    'radius': 5.0,
                    'area': pi * 5.0 * 5.0,
                  },
                },
              },
            ),
          ],
          'genericResult': [
            FunctionTestSuccess(
              name: 'with type',
              input: {
                r'$T': 'Circle',
                'data': {'radius': 5.0},
              },
              output: {
                'data': {'radius': 5.0, 'area': pi * 5.0 * 5.0},
              },
            ),
            FunctionTestSuccess(
              name: 'without type',
              input: {
                'data': {r'$type': 'Circle', 'radius': 5.0},
              },
              output: {
                'data': {
                  r'$type': 'Circle',
                  'radius': 5.0,
                  'area': pi * 5.0 * 5.0,
                },
              },
            ),
          ],
          'multipleGenericResult': [
            FunctionTestSuccess(
              name: 'with types',
              input: {
                r'$T': 'Circle',
                r'$E': 'BadShapeException',
                'data': {'radius': 5.0},
                'error': {
                  'shape': {r'$type': 'Circle', 'radius': 5.0},
                },
              },
              output: [
                {
                  r'$type': 'OkResult',
                  'data': {'radius': 5.0, 'area': pi * 5.0 * 5.0},
                },
                {
                  r'$type': 'ErrResult',
                  'error': {
                    'shape': {
                      r'$type': 'Circle',
                      'radius': 5.0,
                      'area': pi * 5.0 * 5.0,
                    },
                  },
                },
              ],
            ),
            FunctionTestSuccess(
              name: 'without types',
              input: {
                'data': {r'$type': 'Circle', 'radius': 5.0},
                'error': {
                  r'$type': 'BadShapeException',
                  'shape': {r'$type': 'Circle', 'radius': 5.0},
                },
              },
              output: [
                {
                  r'$type': 'OkResult',
                  'data': {
                    r'$type': 'Circle',
                    'radius': 5.0,
                    'area': pi * 5.0 * 5.0,
                  },
                },
                {
                  r'$type': 'ErrResult',
                  'error': {
                    r'$type': 'BadShapeException',
                    'shape': {
                      r'$type': 'Circle',
                      'radius': 5.0,
                      'area': pi * 5.0 * 5.0,
                    },
                  },
                },
              ],
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
                        'children': <Object?>[],
                      },
                      {
                        r'$type': 'Child',
                        'name': 'childB',
                        'children': <Object?>[],
                      },
                    ],
                  },
                  {
                    r'$type': 'Parent',
                    'name': 'parentB',
                    'children': [
                      {
                        r'$type': 'Child',
                        'name': 'childC',
                        'children': <Object?>[],
                      },
                      {
                        r'$type': 'Child',
                        'name': 'childD',
                        'children': <Object?>[],
                      },
                    ],
                  },
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
                        {r'$type': 'Child', 'name': 'childA'},
                        {r'$type': 'Child', 'name': 'childB'},
                      ],
                    },
                    {
                      r'$type': 'Parent',
                      'name': 'parentB',
                      'children': [
                        {r'$type': 'Child', 'name': 'childC'},
                        {r'$type': 'Child', 'name': 'childD'},
                      ],
                    },
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
                    {r'$type': 'Child', 'name': 'childA'},
                    {r'$type': 'Child', 'name': 'childB'},
                  ],
                },
                'tree2': {
                  'name': 'parentB',
                  'children': [
                    {r'$type': 'Child', 'name': 'childC'},
                    {r'$type': 'Child', 'name': 'childD'},
                  ],
                },
                'additionalChildren': [
                  null,
                  {r'$type': 'Child', 'name': 'childE'},
                  {r'$type': 'Child', 'name': 'childF'},
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
                        'children': <Object?>[],
                      },
                      {
                        r'$type': 'Child',
                        'name': 'childB',
                        'children': <Object?>[],
                      },
                    ],
                  },
                  {
                    r'$type': 'Parent',
                    'name': 'parentB',
                    'children': [
                      {
                        r'$type': 'Child',
                        'name': 'childC',
                        'children': <Object?>[],
                      },
                      {
                        r'$type': 'Child',
                        'name': 'childD',
                        'children': <Object?>[],
                      },
                    ],
                  },
                  {
                    r'$type': 'Child',
                    'name': 'childE',
                    'children': <Object?>[],
                  },
                  {
                    r'$type': 'Child',
                    'name': 'childF',
                    'children': <Object?>[],
                  },
                ],
              },
            ),
          ],
          'selfReferencing': [
            FunctionTestSuccess(
              name: '',
              input: {
                'selfReferencing': {
                  'value': {'list': <Map<String, Object?>>[]},
                  'wrapper': {
                    'value': {
                      'value': {'list': <Map<String, Object?>>[]},
                      'list': <Map<String, Object?>>[],
                    },
                  },
                  'list': [
                    {'list': <Map<String, Object?>>[]},
                  ],
                },
              },
              output: {
                'value': {'list': <Map<String, Object?>>[]},
                'wrapper': {
                  'value': {
                    'value': {'list': <Map<String, Object?>>[]},
                    'list': <Map<String, Object?>>[],
                  },
                },
                'list': [
                  {'list': <Map<String, Object?>>[]},
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
      'typedefs': ApiTest(
        functionTests: {
          'portfolio': [
            FunctionTestSuccess(
              name: 'portfolio',
              input: {'portfolio': {}},
              output: {},
            ),
          ],
          'json': [
            FunctionTestSuccess(
              name: 'json',
              input: {'json': complexStruct},
              output: complexStruct,
            ),
          ],
          'nullableJson': [
            FunctionTestSuccess(
              name: 'non-null',
              input: {'json': complexStruct},
              output: complexStruct,
            ),
            FunctionTestSuccess(
              name: 'null',
              input: {'json': null},
              output: null,
            ),
          ],
          'mixedJson': [
            FunctionTestSuccess(
              name: 'mixedJson',
              input: {'json': complexStruct},
              output: complexStruct,
            ),
          ],
        },
      ),
    },
  ),
  'auth': Test(
    apis: {
      'lib': ApiTest(
        functionTests: {
          'sayHello': [
            FunctionTestSuccess(
              name: 'sayHello',
              input: {},
              output: 'Hello, anonymous!',
            ),
          ],
          'sayHelloPublic': [
            FunctionTestSuccess(
              name: 'sayHelloPublic',
              input: {},
              output: 'Hello, anonymous!',
            ),
          ],
        },
        eventTests: {
          'streamHello': [
            EventTestSuccess(
              name: 'streamHello',
              input: {},
              events: ['Hello, anonymous!'],
            ),
          ],
          'streamHelloPublic': [
            EventTestSuccess(
              name: 'streamHelloPublic',
              input: {},
              events: ['Hello, anonymous!'],
            ),
          ],
        },
      ),
      'public_lib': ApiTest(
        functionTests: {
          'sayHello': [
            FunctionTestSuccess(
              name: 'sayHello',
              input: {},
              output: 'Hello, anonymous!',
            ),
          ],
        },
        eventTests: {
          'streamHello': [
            EventTestSuccess(
              name: 'streamHello',
              input: {},
              events: ['Hello, anonymous!'],
            ),
          ],
        },
      ),
    },
  ),
  'data': Test(
    apis: {
      'tasks': ApiTest(
        functionTests: {
          'create': [
            FunctionTestSuccess(
              name: 'creates a todo',
              input: {'title': 'Ship V1'},
              output: {
                'id': 1,
                'title': 'Ship V1',
                'priority': 'high',
                'completed': false,
              },
            ),
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
                '(local) Dillon is 28 years old, 5.83ft tall, 130 lbs, and is cool. '
                    'Find him at https://dillonnys.com.',
                'Super secret: Hi',
              ],
            ),
          ],
        },
      ),
    },
  ),
  'exceptions': const Test(
    apis: {
      'throwing': ApiTest(
        functionTests: {
          'throwsBaseError': [
            FunctionTestError(
              name: 'throwsBaseError',
              statusCode: 500,
              input: {},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {
                      '@type': 'exceptions.v1.BaseError',
                      'value': {'fault': 'base: message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsCustomError': [
            FunctionTestError(
              name: 'throwsCustomError',
              statusCode: 500,
              input: {},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {
                      '@type': 'exceptions.v1.CustomError',
                      'value': {'fault': 'base: custom: message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsBaseException': [
            FunctionTestError(
              name: 'throwsBaseException',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'exceptions.v1.BaseException',
                      'value': {'fault': 'base: message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsCustomException': [
            FunctionTestError(
              name: 'throwsCustomException',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'exceptions.v1.CustomException',
                      'value': {'fault': 'base: custom: message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
        },
      ),
      'nonthrowing': ApiTest(
        functionTests: {
          'callsThrowsBaseError': [
            FunctionTestError(
              name: 'throwsBaseError',
              statusCode: 500,
              input: {},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {
                      '@type': 'exceptions.v1.BaseError',
                      'value': {'fault': 'base: message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'callsThrowsCustomError': [
            FunctionTestError(
              name: 'throwsCustomError',
              statusCode: 500,
              input: {},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {
                      '@type': 'exceptions.v1.CustomError',
                      'value': {'fault': 'base: custom: message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'callsThrowsBaseException': [
            FunctionTestError(
              name: 'throwsBaseException',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'exceptions.v1.BaseException',
                      'value': {'fault': 'base: message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'callsThrowsCustomException': [
            FunctionTestError(
              name: 'throwsCustomException',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'exceptions.v1.CustomException',
                      'value': {'fault': 'base: custom: message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
        },
      ),
      'external': ApiTest(
        functionTests: {
          'callsThrowsCommonException': [
            FunctionTestError(
              name: 'throwsCommonException',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': 'message',
                  'details': [
                    {
                      '@type': '_common.CommonException',
                      'value': {'message': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'callsThrowsCustomException': [
            FunctionTestError(
              name: 'throwsCustomException',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': 'message',
                  'details': [
                    {
                      '@type': '_common.CustomException',
                      'value': {'message': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
        },
      ),
    },
  ),
  'flutter': Test(
    apis: {
      'dart_ui': ApiTest(
        functionTests: {
          'lerpColor': [
            FunctionTestSuccess(
              name: 'lerpColor',
              input: {
                'a': {'value': 0xFF000000},
                'b': {'value': 0xFFFFFFFF},
                't': 0.5,
              },
              output: {
                'a': 1.0,
                'r': 0.5,
                'g': 0.5,
                'b': 0.5,
                'colorSpace': 'sRGB',
                'value': 4286611584,
                'alpha': 255,
                'opacity': 1.0,
                'red': 128,
                'green': 128,
                'blue': 128,
              },
            ),
          ],
          'addCountryCode': [
            FunctionTestSuccess(
              name: 'addCountryCode',
              input: {
                'locale': {'languageCode': 'en'},
                'countryCode': 'US',
              },
              output: {'languageCode': 'en', 'countryCode': 'US'},
            ),
          ],
        },
      ),
      'flutter': ApiTest(
        functionTests: {
          'paintWidget': [
            FunctionTestSuccess(
              name: 'paintImage',
              input: {},
              output: startsWith('iVBORw0'),
            ),
          ],
          'helloWorld': [
            FunctionTestSuccess(
              name: 'helloWorld',
              method: 'GET',
              input: {},
              output: {},
            ),
          ],
        },
      ),
    },
  ),
  'http': Test(
    apis: {
      'http_errors': const ApiTest(
        functionTests: {
          'httpErrors': [
            FunctionTestError(
              name: 'badRequest',
              statusCode: 400,
              input: {'type': 'badRequest'},
              output: {
                '@status': {
                  'code': 400,
                  'message': '',
                  'details': [
                    {
                      '@type': 'celest.core.v1.BadRequestException',
                      'value': {'code': 400, 'message': ''},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'customBadRequest',
              statusCode: 412,
              input: {'type': 'customBadRequest'},
              output: {
                '@status': {
                  'code': 412,
                  'message': '',
                  'details': [
                    {
                      '@type': 'api.v1.CustomBadRequestException',
                      'value': {'code': 400, 'message': ''},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'unauthorized',
              statusCode: 401,
              input: {'type': 'unauthorized'},
              output: {
                '@status': {
                  'code': 401,
                  'message': '',
                  'details': [
                    {
                      '@type': 'celest.core.v1.UnauthorizedException',
                      'value': {'code': 401, 'message': ''},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'forbidden',
              statusCode: 403,
              input: {'type': 'forbidden'},
              output: {
                '@status': {
                  'code': 403,
                  'message': '',
                  'details': [
                    {
                      '@type': 'api.v1.ForbiddenException',
                      'value': {'code': 400, 'message': ''},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'notFound',
              statusCode: 404,
              input: {'type': 'notFound'},
              output: {
                '@status': {
                  'code': 404,
                  'message': null,
                  'details': [
                    {
                      '@type': 'api.v1.NotFoundException',
                      'value': <String, Object?>{},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'anotherNotFound',
              statusCode: 404,
              input: {'type': 'anotherNotFound'},
              output: {
                '@status': {
                  'code': 404,
                  'message': null,
                  'details': [
                    {
                      '@type': 'api.v1.AnotherNotFoundException',
                      'value': <String, Object?>{},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'internalServerError',
              statusCode: 404,
              input: {'type': 'internalServerError'},
              output: {
                '@status': {
                  'code': 404,
                  'message': '',
                  'details': [
                    {
                      '@type': 'celest.core.v1.InternalServerError',
                      'value': {'code': 500, 'message': ''},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'badGateway',
              statusCode: 404,
              input: {'type': 'badGateway'},
              output: {
                '@status': {
                  'code': 404,
                  'message': '',
                  'details': [
                    {
                      '@type': 'api.v1.BadGatewayError',
                      'value': {'code': 500, 'message': ''},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
        },
      ),
      'http_header': ApiTest(
        functionTests: {
          'headers': [
            FunctionTestSuccess(
              name: 'present',
              headers: {
                'aString': 'aString',
                'anInt': '42',
                'aDouble': '3.14',
                'aNum': '42',
                'aBool': 'true',
                'aDateTime': '2021-07-01T00:00:00.000Z',
                'aNullableString': 'aNullableString',
                'aNullableInt': '42',
                'aNullableDouble': '3.14',
                'aNullableNum': '42',
                'aNullableBool': 'true',
                'aNullableDateTime': '2021-07-01T00:00:00.000Z',
              },
              output: {
                'aString': 'aString',
                'anInt': 42,
                'aDouble': 3.14,
                'aNum': 42,
                'aBool': true,
                'aDateTime': '2021-07-01T00:00:00.000Z',
                'aNullableString': 'aNullableString',
                'aNullableInt': 42,
                'aNullableDouble': 3.14,
                'aNullableNum': 42,
                'aNullableBool': true,
                'aNullableDateTime': '2021-07-01T00:00:00.000Z',
              },
            ),
            FunctionTestSuccess(
              name: 'partial',
              headers: {
                'aString': 'aString',
                'anInt': '42',
                'aDouble': '3.14',
                'aNum': '42',
                'aBool': 'true',
                'aDateTime': '2021-07-01T00:00:00.000Z',
              },
              output: {
                'aString': 'aString',
                'anInt': 42,
                'aDouble': 3.14,
                'aNum': 42,
                'aBool': true,
                'aDateTime': '2021-07-01T00:00:00.000Z',
              },
            ),
          ],
        },
      ),
      'http_query': ApiTest(
        functionTests: {
          'query': [
            FunctionTestSuccess(
              name: 'present',
              queryParameters: {
                'aString': ['aString'],
                'anInt': ['42'],
                'aDouble': ['3.14'],
                'aNum': ['42'],
                'aBool': ['true'],
                'aDateTime': ['2021-07-01T00:00:00.000Z'],
                'aNullableString': ['aNullableString'],
                'aNullableInt': ['42'],
                'aNullableDouble': ['3.14'],
                'aNullableNum': ['42'],
                'aNullableBool': ['true'],
                'aNullableDateTime': ['2021-07-01T00:00:00.000Z'],
                'aListOfString': ['a', 'b', 'c'],
                'aListOfInt': ['1', '2', '3'],
                'aListOfDouble': ['1.1', '2.2', '3.3'],
                'aListOfNum': ['1', '2.2', '3'],
                'aListOfBool': ['true', 'false', 'true'],
                'aListOfDateTime': [
                  '2021-07-01T00:00:00.000Z',
                  '2021-07-01T00:00:00.000Z',
                ],
                'aNullableListOfString': ['a', 'b', 'c'],
                'aNullableListOfInt': ['1', '2', '3'],
                'aNullableListOfDouble': ['1.1', '2.2', '3.3'],
                'aNullableListOfNum': ['1', '2.2', '3'],
                'aNullableListOfBool': ['true', 'false', 'true'],
                'aNullableListOfDateTime': [
                  '2021-07-01T00:00:00.000Z',
                  '2021-07-01T00:00:00.000Z',
                ],
              },
              output: {
                'aString': 'aString',
                'anInt': 42,
                'aDouble': 3.14,
                'aNum': 42,
                'aBool': true,
                'aDateTime': '2021-07-01T00:00:00.000Z',
                'aNullableString': 'aNullableString',
                'aNullableInt': 42,
                'aNullableDouble': 3.14,
                'aNullableNum': 42,
                'aNullableBool': true,
                'aNullableDateTime': '2021-07-01T00:00:00.000Z',
                'aListOfString': ['a', 'b', 'c'],
                'aListOfInt': [1, 2, 3],
                'aListOfDouble': [1.1, 2.2, 3.3],
                'aListOfNum': [1, 2.2, 3],
                'aListOfBool': [true, false, true],
                'aListOfDateTime': [
                  '2021-07-01T00:00:00.000Z',
                  '2021-07-01T00:00:00.000Z',
                ],
                'aNullableListOfString': ['a', 'b', 'c'],
                'aNullableListOfInt': [1, 2, 3],
                'aNullableListOfDouble': [1.1, 2.2, 3.3],
                'aNullableListOfNum': [1, 2.2, 3],
                'aNullableListOfBool': [true, false, true],
                'aNullableListOfDateTime': [
                  '2021-07-01T00:00:00.000Z',
                  '2021-07-01T00:00:00.000Z',
                ],
              },
            ),
            FunctionTestSuccess(
              name: 'partial',
              queryParameters: {
                'aString': ['aString'],
                'anInt': ['42'],
                'aDouble': ['3.14'],
                'aNum': ['42'],
                'aBool': ['true'],
                'aDateTime': ['2021-07-01T00:00:00.000Z'],
                'aListOfString': ['a', 'b', 'c'],
                'aListOfInt': ['1', '2', '3'],
                'aListOfDouble': ['1.1', '2.2', '3.3'],
                'aListOfNum': ['1', '2.2', '3'],
                'aListOfBool': ['true', 'false', 'true'],
                'aListOfDateTime': [
                  '2021-07-01T00:00:00.000Z',
                  '2021-07-01T00:00:00.000Z',
                ],
              },
              output: {
                'aString': 'aString',
                'anInt': 42,
                'aDouble': 3.14,
                'aNum': 42,
                'aBool': true,
                'aDateTime': '2021-07-01T00:00:00.000Z',
                'aListOfString': ['a', 'b', 'c'],
                'aListOfInt': [1, 2, 3],
                'aListOfDouble': [1.1, 2.2, 3.3],
                'aListOfNum': [1, 2.2, 3],
                'aListOfBool': [true, false, true],
                'aListOfDateTime': [
                  '2021-07-01T00:00:00.000Z',
                  '2021-07-01T00:00:00.000Z',
                ],
              },
            ),
          ],
        },
      ),
      'http_method': ApiTest(
        functionTests: {
          'get': [
            FunctionTestSuccess(
              name: 'get',
              method: 'GET',
              input: {},
              output: null,
            ),
          ],
          'post': [
            FunctionTestSuccess(
              name: 'post',
              method: 'POST',
              input: {},
              output: null,
            ),
          ],
          'put': [
            FunctionTestSuccess(
              name: 'put',
              method: 'PUT',
              input: {},
              output: null,
            ),
          ],
          'delete': [
            FunctionTestSuccess(
              name: 'delete',
              method: 'DELETE',
              input: {},
              output: null,
            ),
          ],
          'patch': [
            FunctionTestSuccess(
              name: 'patch',
              method: 'PATCH',
              input: {},
              output: null,
            ),
          ],
          // TODO: Needed? Can only really implement when return types can
          // map to the http headers.
          // 'head': [
          //   FunctionTestSuccess(
          //     name: 'head',
          //     method: 'HEAD',
          //     input: {},
          //     output: null,
          //   ),
          // ],
          // 'trace': [
          //   FunctionTestSuccess(
          //     name: 'trace',
          //     method: 'TRACE',
          //     input: {},
          //     output: null,
          //   ),
          // ],
        },
      ),
      'http_status': ApiTest(
        functionTests: {
          'ok': [
            FunctionTestSuccess(
              name: 'ok',
              statusCode: 200,
              input: {},
              output: null,
            ),
          ],
          'created': [
            FunctionTestSuccess(
              name: 'created',
              statusCode: 201,
              input: {},
              output: null,
            ),
          ],
          'accepted': [
            FunctionTestSuccess(
              name: 'accepted',
              statusCode: 202,
              input: {},
              output: null,
            ),
          ],
          'badRequest': [
            FunctionTestSuccess(
              name: 'badRequest',
              statusCode: 400,
              input: {},
              output: null,
            ),
          ],
          'internalServerError': [
            FunctionTestSuccess(
              name: 'internalServerError',
              statusCode: 500,
              input: {},
              output: null,
            ),
          ],
        },
      ),
    },
  ),
  'marcelo': Test(
    apis: {
      'exceptions': const ApiTest(
        functionTests: {
          'throwsUserException': [
            FunctionTestError(
              name: 'no cause',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': '_common.UserException',
                      'value': {'msg': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'with cause (string)',
              statusCode: 400,
              input: {'cause': 'Bad thing happened'},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': '_common.UserException',
                      'value': {
                        'msg': 'message',
                        'cause': 'Bad thing happened',
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'with cause (map)',
              statusCode: 400,
              input: {
                'cause': {'reason': 'Bad thing happened'},
              },
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': '_common.UserException',
                      'value': {
                        'msg': 'message',
                        'cause':
                            '{reason: Bad thing happened}', // cause.toString()
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'callsThrowsUserException': [
            FunctionTestError(
              name: 'no cause',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': '_common.UserException',
                      'value': {'msg': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'with cause (string)',
              statusCode: 400,
              input: {'cause': 'Bad thing happened'},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': '_common.UserException',
                      'value': {
                        'msg': 'message',
                        'cause': 'Bad thing happened',
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'with cause (map)',
              statusCode: 400,
              input: {
                'cause': {'reason': 'Bad thing happened'},
              },
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': '_common.UserException',
                      'value': {
                        'msg': 'message',
                        'cause':
                            '{reason: Bad thing happened}', // cause.toString()
                      },
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsAppError': [
            FunctionTestError(
              name: 'throwsAppError',
              statusCode: 500,
              input: {},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {
                      '@type': 'marcelo.v1.AppError',
                      'value': {'msg': 'message', 'error': null},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'with params',
              statusCode: 500,
              input: {'message': 'test', 'error': 123},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {
                      '@type': 'marcelo.v1.AppError',
                      'value': {'msg': 'test', 'error': 123},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsAppException': [
            FunctionTestError(
              name: 'throwsAppException',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'marcelo.v1.AppException',
                      'value': {'msg': 'message', 'error': 'error'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsNotYetImplementedError': [
            FunctionTestError(
              name: 'throwsNotYetImplementedError',
              statusCode: 500,
              input: {},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {
                      '@type': 'marcelo.v1.NotYetImplementedError',
                      'value': {'msg': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsValidateError': [
            FunctionTestError(
              name: 'throwsValidateError',
              statusCode: 500,
              input: {},
              output: {
                '@status': {
                  'code': 500,
                  'message': null,
                  'details': [
                    {
                      '@type': '_common.ValidateError',
                      'value': {'msg': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
          'throwsUserException_ShowInConsole': [
            FunctionTestError(
              name: 'throwsUserException_ShowInConsole',
              statusCode: 400,
              input: {},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'marcelo.v1.UserException_ShowInConsole',
                      'value': {'msg': 'message'},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
            FunctionTestError(
              name: 'with params',
              statusCode: 400,
              input: {'message': 'test', 'cause': 123},
              output: {
                '@status': {
                  'code': 400,
                  'message': null,
                  'details': [
                    {
                      '@type': 'marcelo.v1.UserException_ShowInConsole',
                      'value': {'msg': 'test', 'cause': 123},
                    },
                    {'@type': 'dart.core.StackTrace', 'value': anything},
                  ],
                },
              },
            ),
          ],
        },
      ),
      'models': ApiTest(
        functionTests: {
          'availableStock': [
            FunctionTestSuccess(
              name: 'availableStock',
              input: {
                'availableStock': {
                  'ticker': 'ABC',
                  'name': 'Acme',
                  'currentPrice': 123.45,
                },
              },
              output: {
                'ticker': 'ABC',
                'name': 'Acme',
                'currentPrice': 123.45,
                'currentPriceStr': r'US$ 123.45',
              },
            ),
          ],
          'availableStocks': [
            FunctionTestSuccess(
              name: 'availableStocks',
              input: {
                'availableStocks': {
                  'list': [
                    {'ticker': 'ABC', 'name': 'Acme', 'currentPrice': 123.45},
                    {'ticker': 'ABC', 'name': 'Acme', 'currentPrice': 123.45},
                  ],
                },
              },
              output: {
                'list': [
                  {
                    'ticker': 'ABC',
                    'name': 'Acme',
                    'currentPrice': 123.45,
                    'currentPriceStr': r'US$ 123.45',
                  },
                  {
                    'ticker': 'ABC',
                    'name': 'Acme',
                    'currentPrice': 123.45,
                    'currentPriceStr': r'US$ 123.45',
                  },
                ],
              },
            ),
          ],
          'cashBalance': [
            FunctionTestSuccess(
              name: 'cashBalance',
              input: {
                'cashBalance': {'amount': 123.45},
              },
              output: {'amount': 123.45},
            ),
          ],
          'portfolio': [
            FunctionTestSuccess(
              name: 'portfolio',
              input: {
                'portfolio': {
                  'stocks': [
                    {
                      'ticker': 'ABC',
                      'howManyShares': 1000,
                      'averagePrice': 123.45,
                    },
                    {
                      'ticker': 'ABC',
                      'howManyShares': 1000,
                      'averagePrice': 123.45,
                    },
                  ],
                  'cashBalance': {'amount': 123.45},
                },
              },
              output: {
                'stocks': [
                  {
                    'ticker': 'ABC',
                    'howManyShares': 1000,
                    'averagePrice': 123.45,
                    'costBasis': 123450.0,
                    'averagePriceStr': r'US$ 123.45',
                  },
                  {
                    'ticker': 'ABC',
                    'howManyShares': 1000,
                    'averagePrice': 123.45,
                    'costBasis': 123450.0,
                    'averagePriceStr': r'US$ 123.45',
                  },
                ],
                'cashBalance': {'amount': 123.45},
                'isEmpty': false,
                'totalCostBasis': 247023.45,
              },
            ),
          ],
          'stock': [
            FunctionTestSuccess(
              name: 'stock',
              input: {
                'stock': {
                  'ticker': 'ABC',
                  'howManyShares': 1000,
                  'averagePrice': 123.45,
                },
              },
              output: {
                'ticker': 'ABC',
                'howManyShares': 1000,
                'averagePrice': 123.45,
                'costBasis': 123450.0,
                'averagePriceStr': r'US$ 123.45',
              },
            ),
          ],
          'ui': [
            FunctionTestSuccess(
              name: 'ui',
              input: {
                'ui': {'isDarkMode': true, 'screenChoice': 'signup'},
              },
              output: {'isDarkMode': true, 'screenChoice': 'signup'},
            ),
          ],
        },
      ),
    },
  ),
  'streaming': Test(
    apis: {
      'server_side': ApiTest(
        eventTests: {
          'hello': [
            EventTestSuccess(
              name: 'hello',
              input: {
                'names': ['Amy', 'Bob', 'Charlie'],
              },
              events: ['Hello, Amy!', 'Hello, Bob!', 'Hello, Charlie!'],
            ),
          ],
          'stockTicker': [
            EventTestSuccess(
              name: 'stockTicker',
              queryParameters: {
                'symbol': ['AAPL'],
              },
              events: [
                {
                  'ticker': 'AAPL',
                  'name': 'AAPL',
                  'currentPrice': 100.0,
                  'currentPriceStr': r'US$ 100.00',
                },
                {
                  'ticker': 'AAPL',
                  'name': 'AAPL',
                  'currentPrice': 101.0,
                  'currentPriceStr': r'US$ 101.00',
                },
                {
                  'ticker': 'AAPL',
                  'name': 'AAPL',
                  'currentPrice': 102.0,
                  'currentPriceStr': r'US$ 102.00',
                },
              ],
            ),
          ],
          'jsonValues': [
            EventTestSuccess(
              name: 'jsonValues',
              events: [
                true,
                42,
                'hello',
                [false, 42, 42.0],
                {'key': true},
              ],
            ),
          ],
        },
      ),
    },
  ),
  'supabase': Test(
    apis: {
      'auth': ApiTest(
        functionTests: {
          'currentUser': [
            FunctionTestSuccess(
              name: 'currentUser',
              method: 'GET',
              setup: (request) async {
                final jwt = JWT(
                  {
                    'aud': 'authenticated',
                    'exp': DateTime.now()
                            .add(const Duration(days: 1))
                            .millisecondsSinceEpoch ~/
                        1000,
                    'sub': '123',
                    'email': 'someone@email.com',
                    'app_metadata': {'provider': 'email'},
                    'user_metadata': null,
                    'role': 'authenticated',
                  },
                  header: {'alg': 'HS256', 'typ': 'JWT'},
                );
                final jwk = SecretKey(
                  'super-secret-jwt-token-with-at-least-32-characters-long',
                );
                final token = jwt.sign(jwk);
                request.headers['Authorization'] = 'Bearer $token';
              },
              input: {},
              output: {
                'userId': '123',
                'emails': [
                  {
                    'email': 'someone@email.com',
                    'isVerified': false,
                    'isPrimary': false,
                  },
                ],
                'roles': [
                  {'type': 'Celest::Role', 'id': 'authenticated'},
                ],
              },
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
  'mapOfString': {'one': 'one', 'two': 'two', 'three': 'three'},
  'mapOfUri': {'one': 'https://google.com', 'two': 'https://example.com'},
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
    'a': {'a': 'a', 'b': 'b', 'c': 'c'},
    'b': {'a': 'a', 'b': 'b', 'c': 'c'},
  },
  'mapOfMapOfUri': {
    'one': {'one': 'https://google.com', 'two': 'https://example.com'},
    'two': {'one': 'https://dart.dev', 'two': 'https://pub.dev'},
  },
  'mapOfMapOfSimpleClass': {
    'one': {'one': simpleStruct, 'two': simpleStruct, 'three': simpleStruct},
    'two': {'one': simpleStruct, 'two': simpleStruct, 'three': simpleStruct},
  },
};
