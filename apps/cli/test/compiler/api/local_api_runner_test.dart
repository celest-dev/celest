import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/compiler/api/local_api_runner.dart';
import 'package:celest_cli/src/compiler/frontend_server_client.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/project/project_paths.dart';
import 'package:file/memory.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';
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
        localApiProcess: _NoopProcess(),
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
        reloadHook: (_, _) async {},
        localApiProcess: _NoopProcess(),
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
        reloadHook: (_, _) async => throw StateError('reload failed'),
        localApiProcess: _NoopProcess(),
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

  group('configuration helpers', () {
    test('encodeResolvedProject produces equivalent JSON map', () {
      final project = ast.ResolvedProject(
        projectId: 'proj',
        environmentId: 'local',
        sdkConfig: ast.SdkConfiguration(
          celest: Version(1, 0, 0),
          dart: ast.Sdk(type: ast.SdkType.dart, version: Version(3, 5, 0)),
        ),
      );

      final json = LocalApiRunner.encodeResolvedProject(project);

      expect(jsonDecode(json), equals(project.toProto().toProto3Json()));
    });

    test('deleteLegacyConfigFile removes celest.json when present', () {
      final fs = MemoryFileSystem();
      final outputsDir = fs.directory('/outputs')..createSync(recursive: true);
      final configFile = outputsDir.childFile('celest.json')
        ..writeAsStringSync('secret');

      LocalApiRunner.deleteLegacyConfigFile(outputsDir);

      expect(configFile.existsSync(), isFalse);
    });

    test('deleteLegacyConfigFile is tolerant when file missing', () {
      final fs = MemoryFileSystem();
      final outputsDir = fs.directory('/outputs')..createSync(recursive: true);

      expect(
        () => LocalApiRunner.deleteLegacyConfigFile(outputsDir),
        returnsNormally,
      );
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

class _NoopIOSink extends NullStreamSink<List<int>> implements IOSink {
  @override
  Encoding encoding = SystemEncoding();

  @override
  Future<void> flush() async {
    // No-op
  }

  @override
  void write(Object? object) {
    // No-op
  }

  @override
  void writeAll(Iterable<dynamic> objects, [String separator = '']) {
    // No-op
  }

  @override
  void writeCharCode(int charCode) {
    // No-op
  }

  @override
  void writeln([Object? object = '']) {
    // No-op
  }
}

class _NoopProcess implements Process {
  _NoopProcess();

  @override
  IOSink get stdin => _NoopIOSink();

  @override
  Stream<List<int>> get stdout => const Stream<List<int>>.empty();

  @override
  Stream<List<int>> get stderr => const Stream<List<int>>.empty();

  @override
  Future<int> get exitCode => Future.value(0);

  @override
  int get pid => 0;

  @override
  bool kill([ProcessSignal signal = ProcessSignal.sigterm]) => true;
}
