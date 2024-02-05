// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions.dart';
import 'package:celest_backend/models.dart';

final class ImportanceSerializer extends Serializer<Importance> {
  const ImportanceSerializer();

  @override
  Importance deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return Importance.values.byName(serialized);
  }

  @override
  String serialize(Importance value) => value.name;
}

final class TaskSerializer extends Serializer<Task> {
  const TaskSerializer();

  @override
  Task deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return Task(
      id: (serialized[r'id'] as String),
      title: (serialized[r'title'] as String),
      importance: Serializers.instance
          .deserialize<Importance>(serialized[r'importance']),
      isCompleted: ((serialized[r'isCompleted'] as bool?)) ?? false,
    );
  }

  @override
  Map<String, Object?> serialize(Task value) => {
        r'id': value.id,
        r'title': value.title,
        r'importance':
            Serializers.instance.serialize<Importance>(value.importance),
        r'isCompleted': value.isCompleted,
      };
}

final class ServerExceptionSerializer extends Serializer<ServerException> {
  const ServerExceptionSerializer();

  @override
  ServerException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ServerException((serialized[r'message'] as String));
  }

  @override
  Map<String, Object?> serialize(ServerException value) =>
      {r'message': value.message};
}
