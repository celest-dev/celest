/// A description of an e2e test.
class Test {
  const Test({
    this.apis,
  });

  final Map<String, ApiTest>? apis;
}

class ApiTest {
  const ApiTest({
    required this.functionTests,
  });

  final Map<String, List<FunctionTest>> functionTests;
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

class FunctionTestSuccess extends FunctionTest {
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

class FunctionTestError extends FunctionTest {
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
