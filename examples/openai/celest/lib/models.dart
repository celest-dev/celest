// By convention, any custom types used within an API request/response must be
// defined in this file or exported from this file.

final class ModelParameters {
  const ModelParameters({
    double? temperature,
    int? maxTokens,
  })  : maxTokens = maxTokens ?? 100,
        temperature = temperature ?? 1.0;

  final double temperature;
  final int maxTokens;
}
