// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart';

final class ModelParametersSerializer extends Serializer<ModelParameters> {
  const ModelParametersSerializer();

  @override
  ModelParameters deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ModelParameters(
      temperature: ((serialized?[r'temperature'] as num?)?.toDouble()) ?? 0.3,
      maxTokens: ((serialized?[r'maxTokens'] as num?)?.toInt()) ?? 100,
      topP: ((serialized?[r'topP'] as num?)?.toDouble()) ?? 1.0,
      frequencyPenalty:
          ((serialized?[r'frequencyPenalty'] as num?)?.toDouble()) ?? 0.0,
      presencePenalty:
          ((serialized?[r'presencePenalty'] as num?)?.toDouble()) ?? 0.0,
    );
  }

  @override
  Map<String, Object?> serialize(ModelParameters value) => {
        r'temperature': value.temperature,
        r'maxTokens': value.maxTokens,
        r'topP': value.topP,
        r'frequencyPenalty': value.frequencyPenalty,
        r'presencePenalty': value.presencePenalty,
      };
}
