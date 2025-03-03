import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:timing/timing.dart';
import 'package:uuid/uuid.dart';

base class CelestPerformance {
  const CelestPerformance();

  static final _logger = Logger('CelestPerformance');

  void captureError(
    Object error, {
    StackTrace? stackTrace,
    Map<String, Object>? extra,
  }) =>
      innerCaptureError(error, stackTrace: stackTrace, extra: extra).ignore();

  @internal
  Future<String> innerCaptureError(
    Object error, {
    StackTrace? stackTrace,
    Map<String, Object>? extra,
  }) async {
    // Matches Sentry error id format
    return const Uuid().v4().replaceAll('-', '');
  }

  Future<R> trace<R>(
    String name,
    String operation,
    Future<R> Function() fn, {
    String? description,
  }) async {
    // TODO(dnys1): Sync time tracker support as well?
    final tracker = AsyncTimeTracker();
    final result = await tracker.track(fn);
    _logger.finest(
      '$name.$operation: duration=${tracker.duration.inMilliseconds}ms',
    );
    return result;
  }
}
