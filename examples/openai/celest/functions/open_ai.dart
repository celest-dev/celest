// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'dart:convert';

import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chat_gpt_sdk/src/model/chat_complete/response/chat_choice.dart';

import '../resources.dart';

/// Creates an instance of the OpenAI client.
OpenAI _createOpenAI(String token) => OpenAI.instance.build(
      token: token,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true,
    );

/// Returns a list of available models.
Future<List<String>> availableModels() async => _availableModels;

/// The list of available models.
///
/// This is maintained on the server and can be updated without updating the
/// client or Flutter app.
const _availableModels = [
  'gpt-4',
  'gpt-3.5-turbo',
];

/// Prompts the GPT [model] with the given [prompt] and [parameters].
///
/// Returns the generated text.
Future<String> openAIRequest({
  required String model,
  required String prompt,
  ModelParameters parameters = const ModelParameters(),
  @Env.openAiToken required String openAiToken,
}) async {
  final openAI = _createOpenAI(openAiToken);

  if (!_availableModels.contains(model)) {
    throw BadRequestException('Invalid model: $model');
  }
  final request = ChatCompleteText(
    messages: [Messages(role: Role.user, content: prompt)],
    model: ChatModelFromValue(model: model),
    maxToken: parameters.maxTokens,
    temperature: parameters.temperature,
    topP: null,
  );

  final requestJson = _prettyJson(request.toJson());
  print('OpenAI request: $requestJson');

  final response = await openAI.onChatCompletion(request: request);

  final responseJson = _prettyJson(response?.toJson());
  print('OpenAI response: $responseJson');

  switch (response) {
    case ChatCTResponse(choices: [ChatChoice(:final message?), ...]):
      return message.content.trim();
    default:
      throw InternalServerException(
        "Couldn't complete request. Please try again later.",
      );
  }
}

String _prettyJson(Object? json) =>
    const JsonEncoder.withIndent('  ').convert(json);
