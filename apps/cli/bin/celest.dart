import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:async/async.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest/celest.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_static/shelf_static.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';

final logger = Logger(
  theme: LogTheme(info: (message) => lightCyan.wrap(message)),
);

void printUsage(ArgParser argParser) {
  print('Usage: dart celest_cli.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> args) async {
  final commandRunner = CommandRunner<int>('celest', 'Celest cloud services')
    ..addCommand(InitCommand())
    ..addCommand(DeployCommand());
  try {
    await commandRunner.run(args);
  } on FormatException catch (e) {
    print(e.message);
  }
}

final class InitCommand extends Command<int> {
  InitCommand();

  @override
  String get description => 'Initializes a new Celest project';

  @override
  String get name => 'init';

  @override
  Future<int> run() async {
    final currentDir = Directory.current;
    final pubspecFile = File('${currentDir.path}/pubspec.yaml');
    if (!pubspecFile.existsSync()) {
      print('Error: No pubspec.yaml file found in the current directory.');
      return 1;
    }
    final pubspecYaml = pubspecFile.readAsStringSync();
    final pubspec = Pubspec.parse(pubspecYaml);
    final appName = pubspec.name;

    final projectName = logger.prompt(
      'Enter a name for your project',
      defaultValue: appName,
    );

    final celestDir = Directory('${currentDir.path}/celest');
    if (celestDir.existsSync()) {
      print(
        'Error: A celest directory already exists in the current directory.',
      );
      return 1;
    }
    celestDir.createSync();

    final celestPubspecFile = File('${celestDir.path}/pubspec.yaml');
    celestPubspecFile.writeAsStringSync('''
name: ${appName}_celest

environment:
  sdk: ^3.0.0

dependencies:
  aws_lambda_dart_runtime: ^1.1.0
  celest:
    path: ../../celest
''');

    final projectFile = File('${celestDir.path}/project.dart');
    projectFile.createSync(recursive: true);

    final projectClassName = '${appName.pascalCase}Project';
    projectFile.writeAsStringSync('''
import 'package:celest/celest.dart';

void main() {
  celest.deploy($projectClassName());
}

class $projectClassName extends Project {
  @override
  String get projectName => '$projectName';

  @override
  void build(BuildContext context) {
    // Our main Flutter application.
    final app = FlutterApp();

    // A simple function which says "Hello" and runs in the cloud.
    // The code can be found in `functions/say_hello.dart`.
    final sayHello = CloudFunction(name: 'say_hello');

    // A bucket to store our content.
    // The bucket can store static and dynamic content.
    final bucket = ContentBucket();

    // Some static assets we'd like to upload to our bucket.
    final content = Content.local(path: 'content/');
    bucket.put(content);

    // Adds our resources to the app, which will be included
    // in the generated client.
    app.use(
      sayHello,
      bucket,
      bucket.events.onCreate,
    );
  }
}
''');

    final lambdaFile = File('${celestDir.path}/functions/say_hello.dart');
    lambdaFile.createSync(recursive: true);
    lambdaFile.writeAsStringSync(r'''
import 'package:celest/celest.dart';

class SayHello extends Handler<String, String> {
  @override
  String handle(Context context, String input) {
    return 'Hello, $input!';
  }
}
''');

    final contentFolder = Directory('${celestDir.path}/content');
    contentFolder.createSync(recursive: true);

    final home = Platform.environment['HOME']!;
    final wavePng = File('$home/Downloads/wave.png');
    wavePng.copySync('${contentFolder.path}/wave.png');

    final pubGet = Process.runSync(
      'dart',
      ['pub', 'get'],
      workingDirectory: celestDir.path,
    );
    return pubGet.exitCode;
  }
}

final class DeployCommand extends Command<int> {
  DeployCommand() {
    argParser
      ..addFlag(
        'watch',
        defaultsTo: false,
        negatable: false,
        help: 'Watch for changes',
      )
      ..addFlag(
        'local',
        defaultsTo: false,
        negatable: false,
        help: 'Run locally',
      );
  }

  @override
  String get description => 'Deploys a Celest project';

  @override
  String get name => 'deploy';

  late final bool watch = argResults!['watch'] as bool;
  late final bool local = argResults!['local'] as bool;

  final exitSignal = Completer<void>();

  final appDir = Directory.current;
  late final clientDir = Directory('${appDir.path}/lib/celest');
  final lambdaServer = LambdaServer();

  @override
  Future<int> run() async {
    ProcessSignal.sigint.watch().listen(exitSignal.complete);

    final currentDir = Directory.current;
    final rootDir = Directory('${currentDir.path}/celest');
    if (!rootDir.existsSync()) {
      print('Error: No celest directory found in the current directory.');
      return 1;
    }

    // Ensure dependencies are available for `project.dart` entrypoint
    Process.runSync(
      'dart',
      ['pub', 'get'],
      workingDirectory: rootDir.path,
    );

    final buildDir = Directory('${rootDir.path}/.dart_tool/celest');
    if (!buildDir.existsSync()) {
      buildDir.createSync(recursive: true);
    }

    if (!local) {
      final buildProc = await Process.start(
        Platform.executable,
        ['project.dart'],
        workingDirectory: rootDir.path,
        environment: {
          'AWS_REGION': 'us-west-2',
          'CELEST_ROOT_DIR': rootDir.path,
          'CELEST_BUILD_DIR': buildDir.path,
        },
        mode: ProcessStartMode.inheritStdio,
      );
      final buildExit = await buildProc.exitCode;
      if (buildExit != 0) {
        print('Failed to build Lambda');
        return buildExit;
      }

      Process.runSync(
        'dart',
        ['pub', 'get'],
        workingDirectory: rootDir.path,
      );
    }

    // Generate client
    final clientProg = logger.progress('Generating client');
    if (!clientDir.existsSync()) {
      clientDir.createSync(recursive: true);
    }

    final (cloudfrontDistro, functionUrl, eventsUrl) = local
        ? await _startLocal(rootDir, buildDir)
        : _parseRemoteOutputs(buildDir);

    await _generateClient(cloudfrontDistro, functionUrl, eventsUrl);

    clientProg.complete('Generated client');

    if (watch) {
      await _watch(rootDir, cloudfrontDistro, lambdaServer);
      await exitSignal.future;
    }

    logger
      ..info('')
      ..info('Outputs', style: (msg) => styleBold.wrap(lightCyan.wrap(msg)))
      ..info('')
      ..info('Invoke "say_hello": $functionUrl')
      ..info(
        'Content bucket: https://s3.console.aws.amazon.com/s3/buckets/celest-demo-yc',
      )
      ..info('');

    logger.success('All resources deployed! 🚀');

    exit(0);
  }

  Future<void> _watch(
    Directory rootDir,
    String cloudfrontDistro,
    LambdaServer server,
  ) async {
    final watcher = _ProjectWatcher(
      rootDir,
      onChange: () async {
        final (lambda, ws) = server.restart();
        await _generateClient(
          cloudfrontDistro,
          'http://localhost:${lambda.port}',
          'http://localhost:${ws.port}',
        );
      },
    );
    await exitSignal.future.then((_) => watcher.close());
  }

  Future<void> _generateClient(
    String cloudfrontDistro,
    String functionUrl,
    String eventsUrl,
  ) async {
    final clientSrc = '''
// Generated by `celest deploy`. Do not modify by hand.

import 'dart:convert';

import 'package:aws_common/aws_common.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_client/web_socket_client.dart';

final CelestClient celest = CelestClient();

class CelestClient {
  final CelestContent content = CelestContent();
  final CelestFunctions functions = CelestFunctions();
}

final class CelestContent {
  static const _baseUrl = '$cloudfrontDistro';

  CelestFile file(String key) => CelestFile('\$_baseUrl/\$key');

  final CelestContentEvents events = const CelestContentEvents();
}

final class CelestContentEvents {
  const CelestContentEvents();

  static final _eventsUrl = Uri.parse('$eventsUrl');

  Stream<CelestFile> get onCreate {
    final websocket = WebSocket(_eventsUrl);
    return websocket.messages
        .cast<String>()
        .map(celest.content.file)
        .asBroadcastStream(
      onCancel: (sub) {
        sub.cancel();
        websocket.close();
      },
    );
  }
}

final class CelestFile {
  const CelestFile(this.url);

  final String url;

  Image asImage({
    double? width,
    double? height,
  }) =>
      Image.network(url, width: width, height: height);
}

final class CelestFunctions {
  static final _jsonUtf8 = JsonUtf8Encoder();
  static final _http = AWSHttpClient();
  static final _sayHelloUrl = Uri.parse('$functionUrl');

  Future<String> sayHello(String input) async {
    final response = await _http
        .send(
          AWSHttpRequest.post(
            _sayHelloUrl,
            headers: const {
              AWSHeaders.contentType: 'application/json',
            },
            body: _jsonUtf8.convert({
              'input': input,
            }),
          ),
        )
        .response;
    return response.decodeBody();
  }
}

extension When<T> on AsyncSnapshot<T> {
  Widget when({
    Widget Function(T data)? data,
    Widget Function()? loading,
    Widget Function(Object error, StackTrace? stackTrace)? error,
  }) {
    const fallback = SizedBox.shrink();
    if (hasError) {
      return error?.call(this.error!, stackTrace) ?? fallback;
    } else if (hasData) {
      return data?.call(this.data as T) ?? fallback;
    } else {
      return loading?.call() ?? fallback;
    }
  }
}
''';
    final clientFile = File('${clientDir.path}/client.dart');
    clientFile.writeAsStringSync(clientSrc);
  }

  Future<(String, String, String)> _startLocal(
    Directory rootDir,
    Directory buildDir,
  ) async {
    final cloudFrontServer = await shelf_io.serve(
      createStaticHandler('${rootDir.path}/content'),
      'localhost',
      0,
    );
    final (server, wsServer) = await lambdaServer.start();
    await exitSignal.future.then((_) {
      cloudFrontServer.close(force: true);
      lambdaServer.shutdown();
    });
    return (
      'http://localhost:${cloudFrontServer.port}',
      'http://localhost:${server.port}',
      'ws://localhost:${wsServer.port}',
    );
  }

  (String, String, String) _parseRemoteOutputs(Directory buildDir) {
    final outputsFile = File('${buildDir.path}/outputs.json');
    final outputsJson = outputsFile.readAsStringSync();
    final outputs = BuildOutputs.fromJson(
      jsonDecode(outputsJson) as Map<String, Object?>,
    );

    const cloudfrontDistro = 'https://d1lsmfviaqs7y3.cloudfront.net';
    final functionUrl = outputs.get('Celest::CloudFunction');
    const eventsUrl =
        'wss://hh8jei1or5.execute-api.us-west-2.amazonaws.com/prod/';

    return (cloudfrontDistro, functionUrl, eventsUrl);
  }
}

final class LambdaServer {
  HttpServer? _server;
  HttpServer? _wsServer;
  var _isRestart = false;

  Future<Response> _urlHandler(Request req) async {
    final body = await req.readAsString();
    final request = await jsonDecode(body) as Map<String, dynamic>;
    final name = request['input'] as String;
    final response = _isRestart ? 'Hello from local, $name!' : 'Hello, $name!';
    return Response.ok(response);
  }

  final _wsHandler = webSocketHandler((webSocket) {});

  Future<(HttpServer, HttpServer)> start() async {
    _server = await shelf_io.serve(_urlHandler, 'localhost', 0);
    _wsServer = await shelf_io.serve(_wsHandler, 'localhost', 0);
    return (_server!, _wsServer!);
  }

  (HttpServer, HttpServer) restart() {
    _isRestart = true;
    return (_server!, _wsServer!);
  }

  Future<void> shutdown() async {
    await _server?.close(force: true);
    _server = null;
    await _wsServer?.close(force: true);
    _wsServer = null;
  }
}

// final class LambdaServer {
//   static const version = '2018-06-01';

//   HttpServer? _server;
//   HttpServer? _urlServer;
//   StreamController<(String id, String input)>? _pendingRequestsController =
//       StreamController.broadcast();
//   late StreamQueue<(String id, String input)>? _pendingRequests =
//       StreamQueue(_pendingRequestsController!.stream);
//   StreamController<(String id, String output)>? _pendingResponses =
//       StreamController.broadcast();

//   late final _router = Router()
//     ..get('/$version/runtime/invocation/next', _nextHandler)
//     ..get('/$version/runtime/invocation/<requestId>/response',
//         _invokeResponseHandler);
//   late final _handler =
//       Pipeline().addMiddleware(logRequests()).addHandler(_router);
//   late final _urlRouter = Router()..post('/', _urlHandler);

//   Future<Response> _urlHandler(Request req) async {
//     final body = await req.readAsString();
//     final requestId = uuid();
//     _pendingRequestsController!.add((requestId, body));
//     final response =
//         await _pendingResponses!.stream.firstWhere((el) => el.$1 == requestId);
//     return Response.ok(response.$2);
//   }

//   Future<Response> _nextHandler(Request req) async {
//     final nextRequest = await _pendingRequests!.next;
//     return Response.ok('Hello, World!\n');
//   }

//   Response _invokeResponseHandler(Request request, String requestId) {
//     final message = request.params['message'];
//     return Response.ok('$message\n');
//   }

//   Future<void> start() async {
//     _server = await shelf_io.serve(_handler, 'localhost', 0);
//     _urlServer = await shelf_io.serve(_urlRouter, 'localhost', 0);
//   }

//   Future<void> restart() async {
//     await _server?.close(force: true);
//     _server = await shelf_io.serve(_handler, 'localhost', 0);
//   }

//   Future<void> shutdown() async {
//     await _pendingRequests?.cancel(immediate: true);
//     _pendingRequests = null;
//     await _pendingRequestsController?.close();
//     _pendingRequestsController = null;
//     await _pendingResponses?.close();
//     _pendingResponses = null;
//     await _server?.close(force: true);
//     _server = null;
//     await _urlServer?.close(force: true);
//     _urlServer = null;
//   }
// }

class _ProjectWatcher implements Closeable {
  _ProjectWatcher(this.rootDir, {required this.onChange}) {
    _listenForEvents();
  }

  final Directory rootDir;
  final Future<void> Function() onChange;
  late final StreamSubscription<FileSystemEvent> _subscription;

  void _listenForEvents() {
    final entitiesToWatch = [
      File(p.join(rootDir.path, 'project.dart')),
      Directory(p.join(rootDir.path, 'functions')),
      Directory(p.join(rootDir.path, 'content')),
    ];
    final eventStream = StreamGroup.merge([
      for (final entity in entitiesToWatch)
        entity.watch(events: FileSystemEvent.all, recursive: true),
    ]);

    Future<void>? currentOperation;
    CancelableOperation<void>? nextOperation;
    _subscription = eventStream.listen((_) {
      if (currentOperation == null) {
        currentOperation = onChange();
        return;
      }

      var canceled = false;
      nextOperation?.cancel();
      nextOperation = CancelableOperation.fromFuture(
        currentOperation!.whenComplete(() {
          if (canceled) return;
          currentOperation = onChange();
          nextOperation = null;
        }),
        onCancel: () => canceled = true,
      );
    });
  }

  @override
  Future<void> close() => _subscription.cancel();
}
