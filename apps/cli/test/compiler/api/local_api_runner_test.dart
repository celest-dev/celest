import 'dart:collection';
import 'dart:io';

import 'package:celest_cli/src/compiler/api/local_api_runner.dart';
import 'package:celest_cli/src/compiler/frontend_server_client.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/project/project_paths.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  late Directory tempDir;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('local_api_runner_test');
    final projectRoot = p.join(tempDir.path, 'project');
    Directory(projectRoot).createSync(recursive: true);
    projectPaths = ProjectPaths(
      projectRoot,
      outputsDir: p.join(projectRoot, '.dart_tool', 'celest', 'outputs'),
    );
  });

  tearDown(() {
    projectPaths = null;
    tempDir.deleteSync(recursive: true);
  });

  group('hotReload', () {
    test('accepts compile result when reload succeeds', () async {
      final client = FakeFrontendServerClient([
        CompileResult.testing(dillOutput: 'file:///tmp/out.dill'),
      ]);
      final reloads = <String>[];
      final runner = LocalApiRunner.testing(
        client: client,
        isolateIds: const ['isolate-1', 'isolate-2'],
        reloadHook: (isolateId, rootLibUri) async {
          reloads.add('$isolateId::$rootLibUri');
        },
      );

      await runner.hotReload([
        p.join(projectPaths.projectRoot, 'lib', 'a.dart'),
      ]);

      expect(client.acceptCount, 1);
      expect(client.rejectCount, 0);
      expect(reloads, [
        'isolate-1::file:///tmp/out.dill',
        'isolate-2::file:///tmp/out.dill',
      ]);
    });

    test('rejects compile errors', () async {
      final client = FakeFrontendServerClient([
        CompileResult.testing(
          errorCount: 2,
          compilerOutputLines: const ['ERROR'],
        ),
      ]);
      final runner = LocalApiRunner.testing(
        client: client,
        isolateIds: const ['isolate-1'],
        reloadHook: (_, __) async {},
      );

      await expectLater(
        () => runner.hotReload([
          p.join(projectPaths.projectRoot, 'lib', 'b.dart'),
        ]),
        throwsA(isA<CompilationException>()),
      );
      expect(client.acceptCount, 0);
      expect(client.rejectCount, 1);
    });

    test('rejects when reload throws', () async {
      final client = FakeFrontendServerClient([
        CompileResult.testing(dillOutput: 'file:///tmp/out.dill'),
      ]);
      final runner = LocalApiRunner.testing(
        client: client,
        isolateIds: const ['isolate-1'],
        reloadHook: (_, __) async => throw StateError('reload failed'),
      );

      await expectLater(
        () => runner.hotReload([
          p.join(projectPaths.projectRoot, 'lib', 'c.dart'),
        ]),
        throwsA(isA<StateError>()),
      );
      expect(client.acceptCount, 0);
      expect(client.rejectCount, 1);
    });
  });
}

class FakeFrontendServerClient implements FrontendServerClient {
  FakeFrontendServerClient(List<CompileResult> compileResults)
    : _compileResults = Queue.of(compileResults);

  final Queue<CompileResult> _compileResults;

  int acceptCount = 0;
  int rejectCount = 0;

  @override
  bool closed = false;

  @override
  Future<CompileResult> compile([List<Uri>? _]) async {
    if (_compileResults.isEmpty) {
      throw StateError('No compile result queued');
    }
    return _compileResults.removeFirst();
  }

  @override
  void accept() {
    acceptCount++;
  }

  @override
  Future<void> reject() async {
    rejectCount++;
  }

  @override
  void reset() {}

  @override
  Future<int> shutdown() => Future.value(0);

  @override
  bool kill({ProcessSignal processSignal = ProcessSignal.sigterm}) => true;

  @override
  Future<CompileResult> compileExpression({
    required String expression,
    required List<String> definitions,
    required bool isStatic,
    required String klass,
    required String libraryUri,
    required List<String> typeDefinitions,
  }) => throw UnimplementedError();

  @override
  Future<CompileResult> compileExpressionToJs({
    required String expression,
    required int column,
    required Map<String, String> jsFrameValues,
    required Map<String, String> jsModules,
    required String libraryUri,
    required int line,
    required String moduleName,
  }) => throw UnimplementedError();
}
