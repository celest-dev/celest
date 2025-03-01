import 'dart:convert';

import 'package:http/http.dart';
import 'package:test/test.dart';

/// A description of an e2e test.
class Test {
  const Test({
    this.apis,
    this.environmentVariables = const {},
    this.secrets = const {},
  });

  final Map<String, ApiTest>? apis;
  final Map<String, String> environmentVariables;
  final Map<String, String> secrets;
}

class ApiTest {
  const ApiTest({this.functionTests = const {}, this.eventTests = const {}});

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
    this.setup,
  });

  final String name;
  final String method;
  final Map<String, Object?> input;
  final Map<String, String> headers;
  final Map<String, List<String>> queryParameters;
  final List<String>? logs;
  final Future<void> Function(Request request)? setup;
}

sealed class HttpTest extends FunctionTest {
  const HttpTest({
    required super.name,
    super.input,
    super.method,
    super.headers,
    super.queryParameters,
    super.logs,
    super.setup,
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
    required this.output,
    super.logs,
    super.setup,
  });

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
    super.setup,
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
    super.setup,
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
    super.setup,
  }) : output = emitsInOrder([
         for (final event in events ?? const []) jsonEncode(event),
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
    super.setup,
  });

  final Object? error;
}
