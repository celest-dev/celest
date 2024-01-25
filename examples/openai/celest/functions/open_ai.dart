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
    ['gpt-3.5-turbo-instruct', 'davinci-002'];

/// Says hello to a person called [name].
Future<String> openAIRequest({
  required String prompt,
  String model = 'gpt-3.5-turbo-instruct',
  ModelParameters parameters =
      const ModelParameters(temperature: 1, maxTokens: 100),
  @env.openApiKey required String openApiKey,
}) async {
  try {
    final openAI = _createOpenAI(openApiKey);

    final request = CompleteText(
        prompt: prompt,
        model: ModelFromValue(model: model),
        maxTokens: parameters.maxTokens,
        frequencyPenalty: parameters.frequencyPenalty,
        temperature: parameters.temperature);

    final response = await openAI.onCompletion(request: request);

    // Logging is handled automatically when you print to the console.
    print('Saying hello to $response');

    // placeholder to grab full response from openAI
    String promptResponse = '';

    for (var choice in response!.choices) {
      promptResponse = promptResponse + choice.text;
    }

    return promptResponse;
  } on Exception catch (e) {
    return e.toString();
  }
}

Future<String> sayHelloDelete(
  String name, {
  @env.openApiKey required String openApiKey,
}) async {
  return 'Hello, $name!';
}
