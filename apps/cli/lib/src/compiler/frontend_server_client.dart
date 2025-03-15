// Copied from https://github.com/dart-lang/webdev/blob/master/frontend_server_client/lib/src/frontend_server_client.dart
// We need to copy it so we can support using the frontend_server_client
// from an AOT-compiled app. The published version only supports JIT.

// Copyright 2020 The Dart Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_core/_internal.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

/// Wrapper around the incremental frontend server compiler.
class FrontendServerClient {
  FrontendServerClient._(
    this._entrypoint,
    this._feServer,
    this._feServerStdoutLines, {
    bool? verbose,
  }) : _state = _ClientState.waitingForFirstCompile {
    _feServer.stderr
        .transform(utf8.decoder)
        .listen((err) => _logger.finest('Error in FE server: $err'));
    _feServer.exitCode.then((_) => closed = true);
  }

  static final _logger = Logger('FrontendServerClient');

  final String _entrypoint;
  final Process _feServer;
  final StreamQueue<String> _feServerStdoutLines;

  _ClientState _state;

  /// Whether the frontend server has been closed.
  var closed = false;

  /// Starts the frontend server.
  ///
  /// Most arguments directly mirror the command line arguments for the
  /// frontend_server (see `pkg/frontend_server/lib/frontend_server.dart` in
  /// the sdk). Options are exposed on an as-needed basis.
  ///
  /// The [entrypoint] and [packagesJson] may be a relative path or any uri
  /// supported by the frontend server.
  ///
  /// The [outputDillPath] determines where the primary output should be, and
  /// some targets may output additional files based on that file name (by
  /// adding file extensions for instance).
  static Future<FrontendServerClient> start({
    required String entrypoint,
    required String outputDillPath,
    required String platformKernel,
    required String workingDirectory,
    String? incrementalOutputDill,
    List<String>? enabledExperiments,
    List<String> fileSystemRoots = const [], // For `fileSystemScheme` uris,
    String fileSystemScheme =
        'org-dartlang-root', // Custom scheme for virtual `fileSystemRoots`.
    required String frontendServerPath,
    String packagesJson = '.dart_tool/package_config.json',
    required String sdkRoot,
    String target = 'vm', // The kernel target type.
    bool verbose = false, // Verbose logs, including server/client messages
    bool printIncrementalDependencies = true,
    List<String> additionalSources = const [],
    String? nativeAssets,
    List<String> additionalArgs = const [],
  }) async {
    final feServer = await processManager.start(<String>[
      Sdk.current.dartAotRuntime,
      frontendServerPath,
      '--sdk-root',
      sdkRoot,
      '--platform=$platformKernel',
      '--target=$target',
      for (final root in fileSystemRoots) '--filesystem-root=$root',
      '--filesystem-scheme',
      fileSystemScheme,
      '--output-dill',
      outputDillPath,
      if (incrementalOutputDill != null) ...[
        '--output-incremental-dill',
        incrementalOutputDill,
      ],
      '--packages=$packagesJson',
      '--incremental',
      if (verbose) '--verbose',
      if (!printIncrementalDependencies) '--no-print-incremental-dependencies',
      if (enabledExperiments != null)
        for (final experiment in enabledExperiments)
          '--enable-experiment=$experiment',
      for (final source in additionalSources) ...['--source', source],
      if (nativeAssets != null) ...['--native-assets', nativeAssets],
      ...additionalArgs,
    ], workingDirectory: workingDirectory);
    final feServerStdoutLines = StreamQueue(
      feServer.stdout.transform(utf8.decoder).transform(const LineSplitter()),
    );

    // The frontend_server doesn't appear to recursively create files, so we
    //  need to make sure the output dir already exists.
    final outputDir = Directory(p.dirname(outputDillPath));
    if (!outputDir.existsSync()) await outputDir.create();

    return FrontendServerClient._(
      entrypoint,
      feServer,
      feServerStdoutLines,
      verbose: verbose,
    );
  }

  /// Compiles [_entrypoint], using an incremental recompile if possible.
  ///
  /// [invalidatedUris] must not be null for all but the very first compile.
  ///
  /// The frontend server _does not_ do any of its own invalidation.
  Future<CompileResult> compile([List<Uri>? invalidatedUris]) async {
    String action;
    switch (_state) {
      case _ClientState.waitingForFirstCompile:
        action = 'compile';
      case _ClientState.waitingForRecompile:
        action = 'recompile';
      case _ClientState.waitingForAcceptOrReject:
        throw StateError(
          'Previous `CompileResult` must be accepted or rejected by '
          'calling `accept` or `reject`.',
        );
      case _ClientState.compiling:
        throw StateError(
          'App is already being compiled, you must wait for that to '
          'complete and `accept` or `reject` the result before compiling '
          'again.',
        );
      case _ClientState.rejecting:
        throw StateError(
          'Still waiting for previous `reject` call to finish. '
          'You must await that before compiling again.',
        );
    }
    _state = _ClientState.compiling;

    try {
      final command = StringBuffer('$action $_entrypoint');
      if (action == 'recompile') {
        if (invalidatedUris == null || invalidatedUris.isEmpty) {
          throw StateError(
            'Subsequent compile invocations must provide a non-empty list '
            'of invalidated uris.',
          );
        }
        final boundaryKey = Uuid.v7();
        command.writeln(' $boundaryKey');
        for (final uri in invalidatedUris) {
          command.writeln('$uri');
        }
        command.write(boundaryKey);
      }

      _sendCommand(command.toString());
      var state = _CompileState.started;
      late String feBoundaryKey;
      final newSources = <Uri>{};
      final removedSources = <Uri>{};
      final compilerOutputLines = <String>[];
      var errorCount = 0;
      String? outputDillPath;
      while (!closed &&
          state != _CompileState.done &&
          await _feServerStdoutLines.hasNext) {
        final line = await _nextInputLine();
        switch (state) {
          case _CompileState.started:
            assert(line.startsWith('result'));
            feBoundaryKey = line.substring(line.indexOf(' ') + 1);
            state = _CompileState.waitingForKey;
            continue;
          case _CompileState.waitingForKey:
            if (line == feBoundaryKey) {
              state = _CompileState.gettingSourceDiffs;
            } else {
              compilerOutputLines.add(line);
            }
            continue;
          case _CompileState.gettingSourceDiffs:
            if (line.startsWith(feBoundaryKey)) {
              state = _CompileState.done;
              final parts = line.split(' ');
              outputDillPath = parts.getRange(1, parts.length - 1).join(' ');
              errorCount = int.parse(parts.last);
              continue;
            }
            final diffUri = Uri.parse(line.substring(1));
            if (line.startsWith('+')) {
              newSources.add(diffUri);
            } else if (line.startsWith('-')) {
              removedSources.add(diffUri);
            } else {
              throw StateError(
                'unrecognized diff line, should start with a + or - but got: $line',
              );
            }
            continue;
          case _CompileState.done:
            throw StateError('Unreachable');
        }
      }

      return CompileResult._(
        dillOutput: outputDillPath,
        errorCount: errorCount,
        newSources: newSources,
        removedSources: removedSources,
        compilerOutputLines: compilerOutputLines,
      );
    } finally {
      _state = _ClientState.waitingForAcceptOrReject;
    }
  }

  Future<CompileResult> compileExpression({
    required String expression,
    required List<String> definitions,
    required bool isStatic,
    required String klass,
    required String libraryUri,
    required List<String> typeDefinitions,
  }) =>
      throw UnimplementedError();

  Future<CompileResult> compileExpressionToJs({
    required String expression,
    required int column,
    required Map<String, String> jsFrameValues,
    required Map<String, String> jsModules,
    required String libraryUri,
    required int line,
    required String moduleName,
  }) =>
      throw UnimplementedError();

  /// Should be invoked when results of compilation are accepted by the client.
  ///
  /// Either [accept] or [reject] should be called after every [compile] call.
  void accept() {
    if (_state != _ClientState.waitingForAcceptOrReject) {
      throw StateError(
        'Called `accept` but there was no previous compile to accept.',
      );
    }
    _sendCommand('accept');
    _state = _ClientState.waitingForRecompile;
  }

  /// Should be invoked when results of compilation are rejected by the client.
  ///
  /// Either [accept] or [reject] should be called after every [compile] call.
  ///
  /// The result of this call must be awaited before a new [compile] can be
  /// done.
  Future<void> reject() async {
    if (_state != _ClientState.waitingForAcceptOrReject) {
      throw StateError(
        'Called `reject` but there was no previous compile to reject.',
      );
    }
    _state = _ClientState.rejecting;
    _sendCommand('reject');
    late String boundaryKey;
    var rejectState = _RejectState.started;
    while (rejectState != _RejectState.done &&
        await _feServerStdoutLines.hasNext) {
      final line = await _nextInputLine();
      switch (rejectState) {
        case _RejectState.started:
          if (!line.startsWith('result')) {
            throw StateError(
              'Expected a line like `result <boundary-key>` after a `reject` '
              'command, but got:\n$line',
            );
          }
          boundaryKey = line.split(' ').last;
          rejectState = _RejectState.waitingForKey;
          continue;
        case _RejectState.waitingForKey:
          if (line != boundaryKey) {
            throw StateError('Expected exactly `$boundaryKey` but got:\n$line');
          }
          rejectState = _RejectState.done;
          continue;
        case _RejectState.done:
          throw StateError('Unreachable');
      }
    }
    _state = _ClientState.waitingForRecompile;
  }

  /// Should be invoked when frontend server compiler should forget what was
  /// accepted previously so that next call to [compile] produces complete
  /// kernel file.
  void reset() {
    if (_state == _ClientState.compiling) {
      throw StateError(
        'Called `reset` during an active compile, you must wait for that to '
        'complete first.',
      );
    }
    _sendCommand('reset');
    _state = _ClientState.waitingForRecompile;
  }

  /// Stop the service gracefully (using the shutdown command)
  Future<int> shutdown() async {
    _sendCommand('quit');
    final timer = Timer(const Duration(seconds: 1), _feServer.kill);
    final exitCode = await _feServer.exitCode;
    timer.cancel();
    await _feServerStdoutLines.cancel();
    return exitCode;
  }

  /// Kills the server forcefully by calling `kill` on the process, and
  /// returns the result.
  bool kill({ProcessSignal processSignal = ProcessSignal.sigterm}) {
    _feServerStdoutLines.cancel();
    return _feServer.kill(processSignal);
  }

  /// Sends [command] to the [_feServer] via stdin, and logs it if [_verbose].
  void _sendCommand(String command) {
    // if (_verbose) {
    //   final lines = const LineSplitter().convert(command);
    //   for (final line in lines) {
    //     _logger.finest('>> $line');
    //   }
    // }
    _feServer.stdin.writeln(command);
  }

  /// Reads a line from [_feServerStdoutLines] and logs it if [_verbose].
  Future<String> _nextInputLine() async {
    var line = await _feServerStdoutLines.next;
    if (line.startsWith('The Resident Frontend Compiler is listening at')) {
      // This is a message from the frontend server, not a response to a
      // command.
      line = await _nextInputLine();
    }
    // if (_verbose) _logger.finest('<< $line');
    return line;
  }
}

/// The result of a compile call.
class CompileResult {
  const CompileResult._({
    required this.dillOutput,
    required this.compilerOutputLines,
    required this.errorCount,
    required this.newSources,
    required this.removedSources,
  });

  /// The produced dill output file, this will either be a full dill file, an
  /// incremental dill file, or `null` if no file was produced.
  final String? dillOutput;

  /// All output from the compiler, typically this would contain errors or
  /// warnings.
  final Iterable<String> compilerOutputLines;

  /// The total count of errors, details should appear in
  /// [compilerOutputLines].
  final int errorCount;

  /// A single file containing all source maps for all JS outputs.
  ///
  /// Read [jsManifestOutput] for file offsets for each sourcemap.
  String? get jsSourceMapsOutput =>
      dillOutput == null ? null : '$dillOutput.map';

  /// A single file containing all JS outputs.
  ///
  /// Read [jsManifestOutput] for file offsets for each source.
  String? get jsSourcesOutput =>
      dillOutput == null ? null : '$dillOutput.sources';

  /// A JSON manifest containing offsets for the sources and source maps in
  /// the [jsSourcesOutput] and [jsSourceMapsOutput] files.
  String? get jsManifestOutput =>
      dillOutput == null ? null : '$dillOutput.json';

  /// All the transitive source dependencies that were added as a part of this
  /// compile.
  final Iterable<Uri> newSources;

  /// All the transitive source dependencies that were removed as a part of
  /// this compile.
  final Iterable<Uri> removedSources;
}

/// Internal states for the client.
enum _ClientState {
  compiling,
  rejecting,
  waitingForAcceptOrReject,
  waitingForFirstCompile,
  waitingForRecompile,
}

/// Frontend server interaction states for a `compile` call.
enum _CompileState { started, waitingForKey, gettingSourceDiffs, done }

/// Frontend server interaction states for a `reject` call.
enum _RejectState { started, waitingForKey, done }
