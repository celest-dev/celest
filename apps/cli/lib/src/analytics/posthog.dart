import 'dart:async';
import 'dart:convert';

import 'package:celest_cli/src/analytics/interface.dart';
import 'package:celest_cli/src/context.dart' show kCliEnvironment;
import 'package:celest_cli/src/storage/storage.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:native_storage/native_storage.dart';

typedef PostHogConfig = ({String apiHost, String apiKey});

final class PostHog extends Analytics {
  PostHog({
    required NativeStorage storage,
    required PostHogConfig config,
    http.Client? client,
  }) : _storage = storage,
       _apiKey = config.apiKey,
       _apiHost = config.apiHost,
       _client = client ?? http.Client();

  final NativeStorage _storage;
  final String _apiKey;
  final String _apiHost;
  final http.Client _client;

  static final _logger = Logger('PostHog');

  @override
  Future<void> capture(
    String eventName, {
    Map<String, Object?> properties = const {},
  }) async {
    final uri = Uri.parse('$_apiHost/capture/');
    final result = CaptureResult(
      event: eventName,
      properties: {...properties, 'environment': kCliEnvironment},
    );
    final request = jsonEncode({
      'api_key': _apiKey,
      'distinct_id': await _storage.readDistinctId(),
      ...result.toJson(),
    });
    try {
      final response = await _client.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: request,
      );
      if (response.statusCode != 200) {
        _logger.fine(
          'Failed to capture event $eventName',
          response.body,
          StackTrace.current,
        );
      }
    } on Object catch (e, st) {
      _logger.fine('Failed to capture event $eventName', e, st);
    }
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
    if (distinctId != null) {
      await _storage.writeDistinctId(distinctId);
      return capture(
        r'$identify',
        properties: {
          'distinct_id': distinctId,
          // Previous distinct ID
          r'$anon_distinct_id': await _storage.readDeviceId(),
          if (set != null) r'$set': set,
          if (setOnce != null) r'$set_once': setOnce,
        },
      );
    } else {
      return capture(
        r'$set',
        properties: {
          if (set != null) r'$set': set,
          if (setOnce != null) r'$set_once': setOnce,
        },
      );
    }
  }
}

final class CaptureResult {
  CaptureResult({
    required this.event,
    required this.properties,
    this.$set,
    this.$setOnce,
  });

  final String event;
  final Map<String, Object?> properties;
  final Map<String, Object?>? $set;
  final Map<String, Object?>? $setOnce;

  Map<String, Object?> toJson() => {
    'event': event,
    'properties': properties,
    if ($set != null) r'$set': $set,
    if ($setOnce != null) r'$set_once': $setOnce,
  };
}
