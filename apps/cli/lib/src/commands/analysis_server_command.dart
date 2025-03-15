import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:analyzer_plugin/channel/channel.dart';
import 'package:analyzer_plugin/protocol/protocol.dart';
import 'package:celest_cli/src/analyzer/plugin/celest_analyzer_plugin.dart';
import 'package:celest_cli/src/commands/celest_command.dart';

final class AnalysisServerCommand extends CelestCommand {
  AnalysisServerCommand();

  @override
  String get description => 'Starts an analysis server for a Celest project.';

  @override
  String get name => 'analysis-server';

  @override
  bool get hidden => true;

  @override
  Future<int> run() async {
    await super.run();

    logger.fine('Starting analysis server...');
    io.stdout.writeln('{"event":"ready"}');

    final done = Completer<void>();
    final plugin = CelestAnalyzerPlugin(
      onError: done.completeError,
      onDone: done.complete,
    );
    plugin.start(_StdIoPluginChannel());

    await done.future;
    return 0;
  }
}

final class _StdIoPluginChannel implements PluginCommunicationChannel {
  _StdIoPluginChannel();

  StreamSubscription<Request>? _requestSubscription;

  @override
  void close() {
    _requestSubscription?.cancel();
    _requestSubscription = null;
  }

  @override
  void listen(
    void Function(Request request) onRequest, {
    Function? onError,
    void Function()? onDone,
  }) {
    final requestStream = io.stdin
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .map((requestJson) {
          return Request.fromJson(
            jsonDecode(requestJson) as Map<String, dynamic>,
          );
        });
    _requestSubscription = requestStream.listen(
      onRequest,
      onError: onError,
      onDone: onDone,
    );
  }

  @override
  void sendNotification(Notification notification) {
    io.stdout.writeln(jsonEncode(notification.toJson()));
  }

  @override
  void sendResponse(Response response) {
    io.stdout.writeln(jsonEncode(response.toJson()));
  }
}
