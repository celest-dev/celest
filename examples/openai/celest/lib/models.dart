// By convention, any custom types used within an API request/response must be
// defined in this file or exported from this file.

enum GptModel {
  gpt35Turbo('gpt-3.5-turbo-instruct'),
  gpt4('TODO');

  const GptModel(this.name);

  final String name;
}

final class ModelParameters {
  const ModelParameters({
    double? temperature,
    int? maxTokens,
    this.topP = 1.0,
    this.frequencyPenalty = 0.0,
    this.presencePenalty = 0.0,
  })  : maxTokens = maxTokens ?? 100,
        temperature = temperature ?? 1.0;

  final double temperature;
  final int maxTokens;
  final double topP;
  final double frequencyPenalty;
  final double presencePenalty;
}
