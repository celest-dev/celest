import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class SerializerDefinition {
  SerializerDefinition({
    required this.serialize,
    required this.deserialize,
    required this.type,
    required this.wireType,
  });

  final Code serialize;
  final Code deserialize;
  final Reference type;
  final Reference wireType;

  Expression _init(Expression serializer, [Expression? typeToken]) {
    return DartTypes.celest.serializers
        .property('instance')
        .property('put')
        .call([
      serializer,
      if (typeToken != null) typeToken,
    ]);
  }

  Code get initAll => _init(define()).code;

  /// Constructs a `Serializer` instance using `Serializer.define`.
  Expression define() {
    return DartTypes.celest.serializer().newInstanceNamed(
      'define',
      [],
      {
        'serialize': Method(
          (b) => b
            ..requiredParameters.add(
              Parameter((b) => b..name = r'$value'),
            )
            ..body = serialize,
        ).closure,
        'deserialize': Method(
          (b) => b
            ..requiredParameters.add(
              Parameter((b) => b..name = r'$serialized'),
            )
            ..body = deserialize,
        ).closure,
      },
      [
        type,
        wireType,
      ],
    );
  }
}

final class SerializerGenerator {
  SerializerGenerator(
    this.serializationSpec, {
    required this.context,
    required this.type,
    this.additionalSerializationSpecs = const [],
    Expression? serializers,
  });

  final SerializationSpec serializationSpec;
  final Iterable<SerializationSpec> additionalSerializationSpecs;

  final OpenApiGeneratorContext context;
  final OpenApiType type;
  late final typeReference = type.typeReference.nonNullable.noBound;
  late final wireType = serializationSpec.wireType;
  late final castType = serializationSpec.castType;

  List<SerializerDefinition> build() {
    final serialize = _serialize(r'$value').code;

    final parameters = serializationSpec.parameters;
    final mayBeAbsent =
        (parameters.isEmpty || parameters.every((p) => p.isOptional)) &&
            serializationSpec.subtypes.isEmpty;
    final wireType = switch (type) {
      OpenApiEnumType() => this.wireType,
      _ => castType.withNullability(mayBeAbsent),
    };
    final deserialize = _deserialize(r'$serialized', mayBeAbsent: mayBeAbsent);

    final serializerDefinitions = <SerializerDefinition>[];

    serializerDefinitions.add(
      SerializerDefinition(
        serialize: serialize,
        deserialize: deserialize,
        type: typeReference,
        wireType: wireType,
      ),
    );

    return serializerDefinitions;
  }

  Expression _serialize(String from) {
    final Expression ref = _reference(from, isNullable: false);
    if (type is OpenApiEnumType) {
      return ref;
    }
    final serialized = <Expression, Expression>{};
    for (final field in serializationSpec.representationType.fields) {
      serialized[literalString(field.name, raw: true)] = jsonGenerator.toJson(
        typeHelper.toReference(field.type),
        ref.property(field.name),
      );
    }
    return literalMap(serialized);
  }

  Code _deserialize(
    String from, {
    required bool mayBeAbsent,
  }) {
    final ref = _reference(from, isNullable: mayBeAbsent);
    if (type is OpenApiEnumType) {
      return typeReference.nonNullable
          .property('values')
          .property('byName')
          .call([ref])
          .returned
          .statement;
    }
    final deserializedPositional = <Expression>[];
    final deserializedNamed = <String, Expression>{};
    for (final parameter in serializationSpec.parameters) {
      final reference = typeHelper.toReference(parameter.type);
      final deserialized = jsonGenerator.fromJson(
        reference,
        typeHelper.fromReference(serializationSpec.wireType).isDartCoreMap
            ? ref.index(literalString(parameter.name, raw: true))
            : ref,
        defaultValue: parameter.defaultValue,
      );
      if (parameter.isPositional) {
        deserializedPositional.add(deserialized);
      } else {
        deserializedNamed[parameter.name] = deserialized;
      }
    }
    return switch (type) {
      OpenApiInterfaceType() => typeReference.newInstance(
          deserializedPositional,
          deserializedNamed,
        ),
      // ast.RecordType() => literalRecord(
      //     deserializedPositional,
      //     deserializedNamed,
      //   ),
      _ => unreachable('Unsupported type: $type'),
    }
        .returned
        .statement;
  }

  Reference _reference(
    String variable, {
    required bool isNullable,
  }) {
    if (!TypeChecker.fromStatic(
      typeHelper.fromReference(serializationSpec.wireType),
    ).isExactlyType(jsonMapType)) {
      return refer(variable);
    }
    return switch (isNullable) {
      true => refer('$variable?'),
      false => refer(variable),
    };
  }
}
