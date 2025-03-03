import 'package:celest_cli/src/context.dart';
import 'package:mason_logger/mason_logger.dart';

/// Runs [callback] with a [Progress] instance.
Future<R> withProgress<R>(
  String message,
  Future<R> Function(Progress progress) callback, {
  String? onSuccess,
  String? onError,
}) async {
  final progress = cliLogger.progress(message);
  try {
    final result = await callback(progress);
    progress.complete(onSuccess);
    return result;
  } on Object {
    if (onError != null) {
      progress.fail(onError);
    } else {
      progress.cancel();
    }
    rethrow;
  }
}
