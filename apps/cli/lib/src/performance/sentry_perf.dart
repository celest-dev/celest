import 'package:celest_cli/src/performance/local_perf.dart';
import 'package:celest_core/src/util/let.dart';
import 'package:sentry/sentry.dart';

final class SentryConfig {
  const SentryConfig({required this.dsn, this.beforeSend});

  final String dsn;
  final SentryEvent Function(SentryEvent event, {Hint? hint})? beforeSend;
}

base class SentryPerformance extends CelestPerformance {
  const SentryPerformance();

  @override
  Future<String> innerCaptureError(
    Object error, {
    StackTrace? stackTrace,
    Map<String, Object>? extra,
  }) async {
    if (!Sentry.isEnabled) {
      return super.innerCaptureError(
        error,
        stackTrace: stackTrace,
        extra: extra,
      );
    }
    final result = await Sentry.captureException(
      error,
      stackTrace: stackTrace,
      hint: extra?.let((extra) => Hint()..addAll(extra)),
    );
    return result.toString();
  }

  @override
  Future<R> trace<R>(
    String name,
    String operation,
    Future<R> Function() fn, {
    String? description,
  }) async {
    if (!Sentry.isEnabled) {
      return super.trace(name, operation, fn, description: description);
    }
    final transaction = Sentry.startTransaction(
      name,
      operation,
      description: description,
    );
    try {
      return await super.trace(name, operation, fn, description: description);
    } finally {
      await transaction.finish();
    }
  }
}
