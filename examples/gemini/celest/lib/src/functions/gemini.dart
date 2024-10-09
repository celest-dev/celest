// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'dart:convert';

import 'package:celest/celest.dart';
import 'package:celest_backend/src/project.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// Returns a list of available models.
@cloud
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
@cloud
Stream<String> generateContent({
  required String modelName,
  required String prompt,
  @geminiApiKey required String apiKey,
}) async* {
  if (!_availableModels.contains(modelName)) {
    throw BadRequestException('Invalid model: $modelName');
  }

  final model = GenerativeModel(model: modelName, apiKey: apiKey);
  final request = [
    Content.text(prompt),
  ];
  print('Sending prompt: $prompt');

  await for (final response in model.generateContentStream(request)) {
    print('Got response: ${_prettyJson(response.toJson())}');

    switch (response.text) {
      case final text?:
        print(text);
        yield text;
      case _:
        throw InternalServerError('Failed to generate content');
    }
  }

  print('Finished generating content');
}

extension on GenerateContentResponse {
  Map<String, Object?> toJson() => {
        'promptFeedback': {
          'blockReason': promptFeedback?.blockReason?.name,
          'blockReasonMessage': promptFeedback?.blockReasonMessage,
          'safetyRatings': [
            for (final rating
                in promptFeedback?.safetyRatings ?? <SafetyRating>[])
              {
                'category': rating.category.name,
                'probability': rating.probability.name,
              },
          ],
        },
        'candidates': [
          for (final candidate in candidates)
            {
              'content': candidate.content.toJson(),
              'safetyRatings': [
                for (final rating
                    in candidate.safetyRatings ?? <SafetyRating>[])
                  {
                    'category': rating.category.name,
                    'probability': rating.probability.name,
                  },
              ],
              'finishReason': candidate.finishReason?.name,
              'finishMessage': candidate.finishMessage,
            },
        ],
      };
}

String _prettyJson(Object? json) =>
    const JsonEncoder.withIndent('  ').convert(json);
