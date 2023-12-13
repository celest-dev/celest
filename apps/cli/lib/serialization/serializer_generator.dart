import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class SerializerGenerator {
  SerializerGenerator({
    required this.typeHelper,
    required this.serializationSpec,
  });

  final TypeHelper typeHelper;
  final SerializationSpec serializationSpec;

  late final element = serializationSpec.element;
  late final jsonGenerator = JsonGenerator(typeHelper: typeHelper);
  late final classType = typeHelper.toReference(element.thisType);
  late final uri = serializationSpec.uri.toString();

  (Class, Set<DartType>) build() {
    final clazz = Class((b) {
      final className = element.displayName;
      b
        ..modifier = ClassModifier.final$
        ..name = '${className}Serializer'
        ..extend = DartTypes.celest.serializer(classType);

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
            ..returns = classType
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'value'
                  ..type = DartTypes.core.object.nullable,
              ),
            )
            ..annotations.add(DartTypes.core.override)
            ..body = Block((b) {
              b.statements.add(
                // serialized may not be used, but we need to assert the type
                const Code('// ignore: unused_local_variable'),
              );
              final mayBeAbsent = serializationSpec.constructor.parameters
                  .every((p) => p.isOptional);
              b.addExpression(
                declareFinal('serialized').assign(
                  refer('assertWireType').call([
                    refer('value'),
                  ], {}, [
                    DartTypes.core
                        .map(
                          DartTypes.core.string,
                          DartTypes.core.object.nullable,
                        )
                        .withNullability(mayBeAbsent),
                  ]),
                ),
              );
              b.addExpression(
                _deserialize(
                  'serialized',
                  isNullable: mayBeAbsent,
                ).returned,
              );
            }),
        ),
        Method(
          (b) => b
            ..name = 'serialize'
            ..returns = DartTypes.core.map(
              DartTypes.core.string,
              DartTypes.core.object.nullable,
            )
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'value'
                  ..type = classType,
              ),
            )
            ..annotations.add(DartTypes.core.override)
            ..body = _serialize('value').code,
        ),
      ]);
    });
    return (clazz, jsonGenerator.referencedTypes);
  }

  Expression _serialize(String from) {
    final ref = _reference(from, isNullable: false);
    final serialized = <String, Expression>{};
    for (final field in serializationSpec.fields) {
      serialized[field.name] = jsonGenerator.toJson(
        typeHelper.toReference(field.type),
        ref.property(field.name),
      );
    }
    return literalMap(serialized);
  }

  Expression _deserialize(
    String from, {
    required bool isNullable,
  }) {
    final ref = _reference(from, isNullable: isNullable);
    final deserializedPositional = <Expression>[];
    final deserializedNamed = <String, Expression>{};
    for (final parameter in serializationSpec.constructor.parameters) {
      final reference = typeHelper.toReference(parameter.type);
      final initializer = parameter.defaultValueCode;
      var deserialized = jsonGenerator.fromJson(
        reference.withNullability(
          reference.isNullableOrFalse || initializer != null,
        ),
        ref.index(literalString(parameter.name, raw: true)),
        // TODO: hack
        nullChecked: false,
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
    return classType.newInstance(
      deserializedPositional,
      deserializedNamed,
    );
  }

  Reference _reference(
    String variable, {
    required bool isNullable,
  }) =>
      switch (isNullable) {
        true => refer('$variable?'),
        false => refer(variable),
      };
}
