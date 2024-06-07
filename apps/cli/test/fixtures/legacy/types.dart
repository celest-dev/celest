import 'dart:convert';

import 'package:test/test.dart';

/// A description of an e2e test.
class Test {
  const Test({
    this.apis,
  });

  final Map<String, ApiTest>? apis;
}

class ApiTest {
  const ApiTest({
    this.functionTests = const {},
    this.eventTests = const {},
  });

  final Map<String, List<HttpTest>> functionTests;
  final Map<String, List<EventTest>> eventTests;
}

sealed class FunctionTest {
  const FunctionTest({
    required this.name,
    this.input = const {},
    this.method = 'POST',
    this.headers = const {},
    this.queryParameters = const {},
    this.logs,
  });

  final String name;
  final String method;
  final Map<String, Object?> input;
  final Map<String, String> headers;
  final Map<String, List<String>> queryParameters;
  final List<String>? logs;
}

sealed class HttpTest extends FunctionTest {
  const HttpTest({
    required super.name,
    super.input,
    super.method,
    super.headers,
    super.queryParameters,
    super.logs,
  });
}

class FunctionTestSuccess extends HttpTest {
  FunctionTestSuccess({
    required super.name,
    super.method,
    super.input,
    super.headers,
    super.queryParameters,
    this.statusCode = 200,
    required Object? output,
    super.logs,
  }) : output = {
          'response': output,
        };

  final int statusCode;
  final Object? output;
}

class FunctionTestError extends HttpTest {
  const FunctionTestError({
    required super.name,
    super.method,
    required super.input,
    super.headers,
    super.queryParameters,
    required this.statusCode,
    required this.output,
    super.logs,
  });

  final int statusCode;
  final Object? output;
}

sealed class EventTest extends FunctionTest {
  const EventTest({
    required super.name,
    super.input,
    super.method,
    super.headers,
    super.queryParameters,
    super.logs,
  });
}

class EventTestSuccess extends EventTest {
  EventTestSuccess({
    required super.name,
    super.method,
    super.input,
    super.headers,
    super.queryParameters,
    required List<Object>? events,
    super.logs,
  }) : output = emitsInOrder([
          for (final event in events ?? const [])
            jsonEncode({
              'response': event,
            }),
          emitsDone,
        ]);

  final Object? output;
}

class EventTestError extends EventTest {
  const EventTestError({
    required super.name,
    super.method,
    required super.input,
    super.headers,
    super.queryParameters,
    required this.error,
    super.logs,
  });

  final Object? error;
}
