import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:isolate';

import 'package:analyzer_plugin/starter.dart';
import 'package:celest_analyzer_plugin/celest_analyzer_plugin.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:stack_trace/stack_trace.dart';

const withDebugging = true;

Future<void> main(List<String> args, SendPort sendPort) async {
  final packageConfigUri = await Isolate.packageConfig;

  StringSink? logSink;
  if (packageConfigUri != null) {
    final dartTool = Directory.fromUri(packageConfigUri).parent;
    final logFile = File(
      p.join(dartTool.path, 'celest', 'analyzer_plugin.log'),
    );
    await logFile.create(recursive: true);
    logSink = logFile.openWrite();
  }

  Logger.root.level = withDebugging ? Level.ALL : Level.INFO;
  Logger.root.onRecord.listen((record) {
    final loggerName = record.loggerName.split('.').lastOrNull ?? '<root>';
    final message =
        StringBuffer('${record.time}: [$loggerName] ${record.message}');
    if (record.error != null) {
      message
        ..writeln()
        ..write(record.error);
    }
    if (record.stackTrace != null) {
      message
        ..writeln()
        ..write(record.stackTrace);
    }
    logSink?.writeln(message.toString());
  });

  Chain.capture(
    () async {
      if (withDebugging) {
        await dev.Service.controlWebServer(enable: true, silenceOutput: true);
        final info = await dev.Service.getInfo();
        logSink?.writeln('Server URI: ${info.serverWebSocketUri}');
      }

      final plugin = CelestAnalyzerPlugin(withDebugging: withDebugging);
      runZoned(
        () => ServerPluginStarter(plugin).start(sendPort),
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, message) {
            logSink?.writeln(message);
          },
        ),
      );
    },
    onError: (error, stackTrace) {
      logSink?.writeln('Unhandled error: $error');
      logSink?.writeln(stackTrace.toString());
    },
  );
}
