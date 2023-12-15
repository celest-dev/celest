import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class SerializerGenerator {
  SerializerGenerator({
    required this.typeHelper,
    required this.serializationSpec,
  });

  final TypeHelper typeHelper;
  final SerializationSpec serializationSpec;

  late final type = serializationSpec.type;
  late final jsonGenerator = JsonGenerator(typeHelper: typeHelper);
  late final typeReference = typeHelper.toReference(type).nonNullable;
  late final uri = serializationSpec.uri.toString();
  late final wireType = typeHelper.toReference(serializationSpec.wireType);

  (Class, Set<ast.DartType>) build() {
    final clazz = Class((b) {
      final className = switch (type) {
        ast.InterfaceType() => type.element!.displayName,
        ast.RecordType() => (type as ast.RecordType).symbol,
        _ => unreachable('Unsupported type $type'),
      };
      b
        ..modifier = ClassModifier.final$
        ..name = '${className}Serializer'
        ..extend = DartTypes.celest.serializer(typeReference);

      // Create unnamed constant constructor
      b.constructors.add(
        Constructor((b) => b..constant = true),
      );

      // Create `dartType` and `wireType` overrides
      b.methods.addAll([
        Method(
          (b) => b
            ..name = 'dartType'
            ..returns = DartTypes.core.string
            ..type = MethodType.getter
            ..annotations.add(DartTypes.core.override)
            ..lambda = true
            ..body = literalString(
              uri.toString(),
              raw: true,
            ).code,
        ),
        Method(
          (b) => b
            ..name = 'wireType'
            ..returns = DartTypes.core.string
            ..type = MethodType.getter
            ..annotations.add(DartTypes.core.override)
            ..lambda = true
            ..body = literalString(
              'dart:core#Map',
              raw: true,
            ).code,
        ),
      ]);

      // Create `deserialize` and `serialize` overrides
      b.methods.addAll([
        Method(
          (b) => b
            ..name = 'deserialize'
            ..returns = typeReference
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'value'
                  ..type = DartTypes.core.object.nullable,
              ),
            )
            ..annotations.add(DartTypes.core.override)
            ..body = Block((b) {
              final mayBeAbsent =
                  serializationSpec.parameters.every((p) => p.isOptional);
              final (wireType, deserialized) = switch (type) {
                ast.InterfaceType() when type.isEnum => (
                    this.wireType,
                    typeReference.nonNullable
                        .property('values')
                        .property('byName')
                        .call([
                      refer('serialized'),
                    ]),
                  ),
                _ => (
                    this.wireType.withNullability(mayBeAbsent),
                    _deserialize('serialized', mayBeAbsent: mayBeAbsent),
                  ),
              };
              b.addExpression(
                declareFinal('serialized').assign(
                  refer('assertWireType').call([
                    refer('value'),
                  ], {}, [
                    wireType,
                  ]),
                ),
              );
              b.addExpression(deserialized.returned);
            }),
        ),
        Method(
          (b) => b
            ..name = 'serialize'
            ..returns = wireType
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'value'
                  ..type = typeReference,
              ),
            )
            ..annotations.add(DartTypes.core.override)
            ..body = switch (type) {
              ast.InterfaceType() when type.isEnum =>
                refer('value').property('name').code,
              _ => _serialize('value').code,
            },
        ),
      ]);
    });
    return (clazz, jsonGenerator.referencedTypes);
  }

  Expression _serialize(String from) {
    final ref = _reference(from, isNullable: false);
    if (serializationSpec.hasToJson) {
      return ref.property('toJson').call([]);
    }
    final serialized = <Expression, Expression>{};
    for (final field in serializationSpec.fields) {
      serialized[literalString(field.name, raw: true)] = jsonGenerator.toJson(
        typeHelper.toReference(field.type),
        ref.property(field.name),
      );
    }
    return literalMap(serialized);
  }

  Expression _deserialize(
    String from, {
    required bool mayBeAbsent,
  }) {
    if (serializationSpec.hasFromJson) {
      Expression ref = _reference(from, isNullable: false);
      if (mayBeAbsent) {
        ref = ref.ifNullThen(literalConstMap({}));
      }
      return typeReference.nonNullable.property('fromJson').call([
        ref,
      ]);
    }
    final ref = _reference(from, isNullable: mayBeAbsent);
    final deserializedPositional = <Expression>[];
    final deserializedNamed = <String, Expression>{};
    for (final parameter in serializationSpec.parameters) {
      final reference = typeHelper.toReference(parameter.type);
      final initializer = parameter.defaultValueCode;
      var deserialized = jsonGenerator.fromJson(
        reference.withNullability(
          reference.isNullableOrFalse || initializer != null,
        ),
        serializationSpec.wireType.isDartCoreMap
            ? ref.index(literalString(parameter.name, raw: true))
            : ref,
      );
      if (initializer != null) {
        deserialized = deserialized.parenthesized.ifNullThen(
          CodeExpression(Code(initializer)),
        );
      }
      if (parameter.isPositional) {
        deserializedPositional.add(deserialized);
      } else {
        deserializedNamed[parameter.name] = deserialized;
      }
    }
    return switch (serializationSpec.type) {
      ast.InterfaceType() => typeReference.nonNullable.newInstance(
          deserializedPositional,
          deserializedNamed,
        ),
      ast.RecordType() => literalRecord(
          deserializedPositional,
          deserializedNamed,
        ),
      _ => unreachable('Unsupported type ${serializationSpec.type}'),
    };
  }

  Reference _reference(
    String variable, {
    required bool isNullable,
  }) {
    if (!TypeChecker.fromStatic(serializationSpec.wireType)
        .isExactlyType(jsonMapType)) {
      return refer(variable);
    }
    return switch (isNullable) {
      true => refer('$variable?'),
      false => refer(variable),
    };
  }
}
