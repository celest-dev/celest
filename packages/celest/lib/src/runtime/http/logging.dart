@internal
library;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:celest/src/core/context.dart';
import 'package:celest_core/_internal.dart';
import 'package:cloud_http/cloud_http.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:stack_trace/stack_trace.dart';

/// Configures logging depending on the environment in which
/// Celest is running.
void configureLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      return developer.log(
        record.message,
        time: record.time,
        sequenceNumber: record.sequenceNumber,
        level: record.level.value,
        name: record.loggerName,
        zone: record.zone,
        error: record.error?.toString(),
        stackTrace: record.stackTrace,
      );
    }
    final context = Context.of(record.zone ?? Zone.current);
    if (context.isRunningInCloud) {
      final Traceparent? trace = context.currentTrace;
      final String jsonRecord = record.logEntry(trace: trace);
      stdout.writeln(jsonRecord);
    } else {
      final message = StringBuffer(record.message);
      if (record.error case final error?) {
        message
          ..writeln()
          ..write(error);
        if (record.stackTrace case final stackTrace?) {
          message
            ..writeln()
            ..write(stackTrace);
        }
      }
      stdout.writeln('[${record.loggerName}] ${record.level.name}: $message');
    }
  });
}

extension on LogRecord {
  String get severity => switch (this) {
    Level.FINE || Level.FINER || Level.FINEST => 'DEBUG',
    Level.INFO => 'INFO',
    Level.CONFIG => 'NOTICE',
    Level.WARNING => 'WARNING',
    Level.SEVERE => 'ERROR',
    Level.SHOUT => 'CRITICAL',
    _ => 'DEFAULT',
  };

  String logEntry({Traceparent? trace}) {
    final message = StringBuffer(this.message);

    Chain? chain;
    if (error != null) {
      chain = switch (stackTrace) {
        final StackTrace stackTrace? when stackTrace != StackTrace.empty =>
          Chain.forTrace(stackTrace),
        _ => Chain.current(),
      };
      chain = chain.foldFrames(
        (f) => f.isCore || (f.package?.startsWith('celest') ?? false),
        terse: true,
      );
      message
        ..writeln()
        ..writeln(error)
        ..write(chain.toString());
    }

    // https://cloud.google.com/logging/docs/agent/logging/configuration#special-fields
    final Map<String, Object> logContent = {
      'message': message.toString().trim(),
      'severity': severity,
      'timestamp': time.toIso8601String(),
      if ((trace, Context.root.googleProjectId) case (
        final trace?,
        final googleProjectId?,
      )) ...{
        'logging.googleapis.com/trace':
            'projects/$googleProjectId/traces/${trace.parentId}',
        'logging.googleapis.com/spanId': trace.parentId,
        'logging.googleapis.com/trace_sampled': trace.traceFlagSampled != 0,
      },
      if (chain?.traces.firstOrNull?.frames.firstOrNull case final stackFrame?)
        'logging.googleapis.com/sourceLocation': stackFrame.sourceLocation,
    };
    return jsonEncode(logContent);
  }
}

extension on Frame {
  // https://cloud.google.com/logging/docs/reference/v2/rest/v2/LogEntry#LogEntrySourceLocation
  Map<String, Object?> get sourceLocation => {
    // TODO(dnys1): Will need to fix `package:` URIs to file paths when possible
    // GoogleCloudPlatform/functions-framework-dart#40
    'file': library,
    if (line != null) 'line': line.toString(),
    'function': member,
  };
}
