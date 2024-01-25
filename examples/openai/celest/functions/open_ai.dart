// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'package:celest_backend/models.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

import '../resources.dart';

/// Creates an instance of the OpenAI client.
OpenAI _createOpenAI(String key) => OpenAI.instance.build(
      token: key,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true,
    );

/// Returns a list of available models.
Future<List<String>> availableModels() async =>
    ['gpt-3.5-turbo-instruct', 'gpt-4', 'another', 'for d-dog'];

/// Says hello to a person called [name].
Future<String> openAIRequest({
  required String prompt,
  String? model = 'gpt-3.5-turbo-instruct',
  ModelParameters parameters = const ModelParameters(),
  @env.openApiKey required String openApiKey,
}) async {
  final openAI = _createOpenAI(openApiKey);

  final request = CompleteText(
      prompt: prompt, model: ModelFromValue(model: model), maxTokens: 300);

  final response = await openAI.onCompletion(request: request);

  // Logging is handled automatically when you print to the console.
  print('Saying hello to $response');

  String promptResponse = '';

  for (var choice in response!.choices) {
    promptResponse = promptResponse + choice.text;
  }

  return 'Hello, $promptResponse!';
}

Future<String> sayHelloDelete(
  String name, {
  @env.openApiKey required String openApiKey,
}) async {
  return 'Hello, $name!';
}
