/// A description of an e2e test.
class Test {
  const Test({
    this.environmentNames = const ['prod'],
    this.apis,
  });

  final List<String> environmentNames;
  final Map<String, ApiTest>? apis;
}

class ApiTest {
  const ApiTest({
    required this.functionTests,
  });

  final Map<(String functionName, String environmentName), List<FunctionTest>>
      functionTests;
}

sealed class FunctionTest {
  const FunctionTest({
    required this.name,
    required this.input,
    this.logs,
  });

  final String name;
  final Map<String, Object?> input;
  final List<String>? logs;
}

class FunctionTestSuccess extends FunctionTest {
  const FunctionTestSuccess({
    required super.name,
    required super.input,
    required this.output,
    super.logs,
  });

  final Object? output;
}

class FunctionTestError extends FunctionTest {
  const FunctionTestError({
    required super.name,
    required super.input,
    required this.error,
    super.logs,
  });

  final String error;
}
