import 'package:celest_cli/src/analytics/interface.dart';
import 'package:celest_cli/src/utils/json.dart';
import 'package:logging/logging.dart';

final class NoopAnalytics extends Analytics {
  const NoopAnalytics();

  static final _logger = Logger('NoopAnalytics');

  @override
  Future<void> capture(
    String eventName, {
    Map<String, Object?> properties = const {},
  }) async {
    _logger.finer('$eventName: ${prettyPrintJson(properties)}');
  }

  @override
  Future<void> identifyUser({
    String? distinctId,
    Map<String, Object?>? set,
    Map<String, Object?>? setOnce,
  }) async {
    assert(
      distinctId != null || set != null || setOnce != null,
      'Must provide at least one of: distinctId, set, setOnce',
    );
    final event = {
      if (distinctId != null) 'distinct_id': distinctId,
      if (set != null) r'$set': set,
      if (setOnce != null) r'$set_once': setOnce,
    };
    _logger.finer('identifyUser: ${prettyPrintJson(event)}');
  }
}
