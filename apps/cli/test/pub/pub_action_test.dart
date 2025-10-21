@OnPlatform({
  // Windows needs extra time in CI to run `pub get` and `pub upgrade`.
  'windows': Timeout.factor(4),
})
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io'
    show
        IOSink,
        Platform,
        Process,
        ProcessResult,
        ProcessSignal,
        ProcessStartMode;

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/pub/pub_action.dart';
import 'package:celest_cli/src/sdk/versions.dart';
import 'package:file/file.dart';
import 'package:process/process.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('runPub', () {
    setUpAll(() async {
      await initTests();
      // Ensure flutter tool is built in CI
      final res = await processManager.run(['flutter', '--help']);
      expect(res.exitCode, 0);
    });

    final List<(PubAction, String)> matrix = [
      (PubAction.get, 'flutter'),
      (PubAction.get, Platform.resolvedExecutable),
      (PubAction.upgrade, 'flutter'),
      (PubAction.upgrade, Platform.resolvedExecutable),
    ];
    for (final (action, exe) in matrix) {
      group('${exe.split('/').last} pub ${action.name}', () {
        late Directory tempDir;
        File packageConfig() => tempDir
            .childDirectory('.dart_tool')
            .childFile('package_config.json');

        setUp(() {
          tempDir = fileSystem.systemTempDirectory.createTempSync(
            'celest_cli_test',
          );
        });

        tearDown(() {
          try {
            tempDir.deleteSync(recursive: true);
          } catch (_) {}
        });

        test('resolves successfully', () async {
          tempDir.childFile('pubspec.yaml').writeAsStringSync('''
name: test_1234

environment:
  sdk: ^$minSupportedDartSdk

dependencies:
  path: any
''');
          await expectLater(
            runPub(exe: exe, action: action, workingDirectory: tempDir.path),
            completes,
          );
          expect(packageConfig().existsSync(), true);
        });

        test('proxies failures gracefully', () async {
          tempDir.childFile('pubspec.yaml').writeAsStringSync('''
name: test_1234

environment:
  sdk: ^$minSupportedDartSdk

dependencies:
  # A non-existent version of Celest
  celest: 0.0.1
''');
          await expectLater(
            runPub(exe: exe, action: action, workingDirectory: tempDir.path),
            throwsA(
              isA<CliException>().having(
                (e) => e.toString(),
                'message',
                contains(
                  'Because test_1234 depends on celest 0.0.1 which doesn\'t match '
                  'any versions, version solving failed.',
                ),
              ),
            ),
          );
        });

        // TODO(dnys1): Should we allow direct dependencies on Flutter?
        test('works when depending on flutter', () async {
          tempDir.childFile('pubspec.yaml').writeAsStringSync('''
name: test_1234

environment:
  sdk: ^$minSupportedDartSdk

dependencies:
  flutter:
    sdk: flutter
''');
          await expectLater(
            runPub(exe: exe, action: action, workingDirectory: tempDir.path),
            completes,
          );
          expect(packageConfig().existsSync(), true);
        });

        test('works with flutter environment constraint', () async {
          tempDir.childFile('pubspec.yaml').writeAsStringSync('''
name: test_1234

environment:
  sdk: ^$minSupportedDartSdk
  flutter: ">=3.19.0"

dependencies:
  path: any
''');
          await expectLater(
            runPub(exe: exe, action: action, workingDirectory: tempDir.path),
            completes,
          );
          expect(packageConfig().existsSync(), true);
        });
      });
    }

    group('timeouts', () {
      late ProcessManager originalProcessManager;

      setUp(() {
        originalProcessManager = processManager;
      });

      tearDown(() {
        processManager = originalProcessManager;
      });

      test('exits when command does not complete in time', () async {
        final fakeProcess = _FakeProcess();
        final fakeManager = _FakeProcessManager(() => fakeProcess);
        processManager = fakeManager;

        final tempDir = fileSystem.systemTempDirectory.createTempSync(
          'celest_cli_timeout_test',
        );
        addTearDown(() {
          try {
            tempDir.deleteSync(recursive: true);
          } catch (_) {}
        });
        tempDir
            .childFile('pubspec.yaml')
            .writeAsStringSync('name: timeout_test');

        await expectLater(
          runPub(
            exe: Platform.resolvedExecutable,
            action: PubAction.get,
            workingDirectory: tempDir.path,
            timeout: const Duration(milliseconds: 100),
          ),
          throwsA(
            isA<CliException>().having(
              (error) => error.toString(),
              'message',
              contains('Timed out waiting for `pub get`.'),
            ),
          ),
        );

        expect(fakeProcess.wasKilled, isTrue);
        expect(
          fakeManager.recordedCommands.single,
          equals([Platform.resolvedExecutable, 'pub', 'get']),
        );
      });
    });
  });
}

class _FakeProcessManager implements ProcessManager {
  _FakeProcessManager(this._processFactory);

  final Process Function() _processFactory;
  final List<List<String>> recordedCommands = [];

  @override
  Future<Process> start(
    List<Object> command, {
    String? workingDirectory,
    Map<String, String>? environment,
    bool runInShell = false,
    bool includeParentEnvironment = true,
    ProcessStartMode mode = ProcessStartMode.normal,
  }) async {
    recordedCommands.add(command.map((value) => value.toString()).toList());
    return _processFactory();
  }

  @override
  bool canRun(dynamic executable, {String? workingDirectory}) => true;

  @override
  Future<ProcessResult> run(
    List<Object> command, {
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool runInShell = false,
    Encoding? stdoutEncoding,
    Encoding? stderrEncoding,
  }) => throw UnimplementedError();

  @override
  ProcessResult runSync(
    List<Object> command, {
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool runInShell = false,
    Encoding? stdoutEncoding,
    Encoding? stderrEncoding,
  }) => throw UnimplementedError();

  @override
  bool killPid(int pid, [ProcessSignal signal = ProcessSignal.sigterm]) =>
      false;
}

class _FakeProcess implements Process {
  _FakeProcess();

  final _stdoutController = StreamController<List<int>>.broadcast();
  final _stderrController = StreamController<List<int>>.broadcast();
  final _stdinController = StreamController<List<int>>();
  late final IOSink _stdinSink = IOSink(_stdinController.sink);
  final _exitCodeCompleter = Completer<int>();
  bool _wasKilled = false;

  bool get wasKilled => _wasKilled;

  @override
  IOSink get stdin => _stdinSink;

  @override
  Stream<List<int>> get stdout => _stdoutController.stream;

  @override
  Stream<List<int>> get stderr => _stderrController.stream;

  @override
  int get pid => 1;

  @override
  Future<int> get exitCode => _exitCodeCompleter.future;

  @override
  bool kill([ProcessSignal signal = ProcessSignal.sigterm]) {
    if (_exitCodeCompleter.isCompleted) {
      return false;
    }
    _wasKilled = true;
    _stdinSink.close();
    _stdoutController.close();
    _stderrController.close();
    _stdinController.close();
    _exitCodeCompleter.complete(255);
    return true;
  }
}
