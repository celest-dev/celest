// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../resources.dart';

/// Returns a list of available models.
Future<List<String>> availableModels() async => _availableModels;

/// The list of available models.
///
/// This is maintained on the server and can be updated without updating the
/// client or Flutter app.
const _availableModels = [
  'gemini-pro',
];

/// Prompts the Gemini [modelName] with the given [prompt] and [parameters].
///
/// Returns the generated text.
Future<String> generateContent({
  required String modelName,
  required String prompt,
  ModelParameters parameters = const ModelParameters(),
  @env.geminiApiKey required String apiKey,
}) async {
  if (!_availableModels.contains(modelName)) {
    throw BadRequestException('Invalid model: $modelName');
  }

  final model = GenerativeModel(model: modelName, apiKey: apiKey);
  final request = [
    Content.text(prompt),
  ];
  final response = await model.generateContent(
    request,
    generationConfig: GenerationConfig(
      maxOutputTokens: parameters.maxTokens,
      temperature: parameters.temperature,
    ),
  );

  switch (response.text) {
    case final text?:
      print('Gemini response: $text');
      return text;
    case _:
      throw InternalServerException('Failed to generate content');
  }
}
