import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class SerializerGenerator {
  SerializerGenerator(
    this.serializationSpec, {
    SerializationSpec? parent,
  }) : _parent = parent;

  final SerializationSpec serializationSpec;
  final SerializationSpec? _parent;

  bool get isSubtype => _parent != null;

  /// The `fromJson` method to use and whether it is inherited from a parent.
  (Expression fromJson, bool usesParent)? get fromJson {
    Reference? typeReference;
    var usesParent = false;
    if (serializationSpec.hasFromJson) {
      typeReference = this.typeReference;
    }
    var parent = serializationSpec.parent;
    while (typeReference == null && parent != null) {
      if (parent.hasFromJson) {
        typeReference = typeHelper.toReference(parent.type);
        usesParent = true;
      }
      parent = parent.parent;
    }
    if (typeReference == null) {
      return null;
    }
    return (typeReference.property('fromJson'), usesParent);
  }

  late final type = serializationSpec.type;
  late final typeReference = typeHelper.toReference(type).nonNullable;
  late final wireType = typeHelper.toReference(serializationSpec.wireType);
  late final castType = typeHelper.toReference(serializationSpec.castType);

  Class build() => Class((b) {
        b
          ..modifier = ClassModifier.final$
          ..name = '${type.classNamePrefix}Serializer'
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
                type.instantiatedUri.toString(),
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
                    serializationSpec.parameters.every((p) => p.isOptional) &&
                        serializationSpec.subtypes.isEmpty;
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
                      castType.withNullability(mayBeAbsent),
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
              ..lambda = true
              ..body = switch (type) {
                ast.InterfaceType() when type.isEnum =>
                  refer('value').property('name').code,
                _ => _serialize('value').code,
              },
          ),
        ]);
      });

  Expression _serialize(String from) {
    final Expression ref = _reference(from, isNullable: false);
    if (serializationSpec.hasToJson) {
      final genericSerializers = <Expression>[];
      if (type case ast.InterfaceType(:final typeArguments)) {
        for (final typeArgument in typeArguments) {
          genericSerializers.add(
            Method(
              (m) => m
                ..requiredParameters.add(Parameter((p) => p..name = 'value'))
                ..body = jsonGenerator
                    .toJson(
                      typeHelper.toReference(typeArgument),
                      refer('value'),
                    )
                    .code,
            ).closure,
          );
        }
      }
      final serialized = ref.property('toJson').call(genericSerializers);

      // If we're using a base class's custom toJson method, then we
      // always inject the type discriminator regardless if it also
      // has a custom fromJson. By always providing the discriminator,
      // devs can rely on its presence even when writing custom fromJson
      // constructors and just focus on the logic of serialization, not
      // discrimination.
      if (serializationSpec.subtypes.isNotEmpty) {
        return literalMap({
          literalSpread(): serialized,
          // TODO(dnys1): Ensure subclasses are not private
          literalString(r'$type', raw: true): CodeExpression(
            Block((b) {
              b.statements.addAll([
                const Code('switch ('),
                ref.code,
                const Code(') {'),
              ]);
              for (final subtype in serializationSpec.subtypes) {
                final subtypeRef = typeHelper.toReference(subtype.type);
                b.statements.addAll([
                  Code.scope((alloc) => '${alloc(subtypeRef)}() => '),
                  literalString(
                    subtype.type.element!.name!,
                    raw: true,
                  ).code,
                  const Code(','),
                ]);
              }
              b.statements.add(
                const Code('}'),
              );
            }),
          ),
        });
      }
      return serialized;
    }
    if (serializationSpec.subtypes.isNotEmpty) {
      final serialize =
          DartTypes.celest.serializers.property('scoped').property('serialize');
      return CodeExpression(
        Block((b) {
          b.statements.addAll([
            const Code('switch ('),
            ref.code,
            const Code(') {'),
          ]);
          for (final subtype in serializationSpec.subtypes) {
            final subtypeRef = typeHelper.toReference(subtype.type);
            final subtypeCase = serialize(
              [ref],
              {},
              [subtypeRef],
            ).asA(wireType);
            b.statements.addAll([
              Code.scope((alloc) => '${alloc(subtypeRef)}() => '),
              literalMap({
                literalSpread(): subtypeCase,
                literalString(r'$type', raw: true): literalString(
                  subtype.type.element!.name!,
                  raw: true,
                ),
              }).code,
              const Code(','),
            ]);
          }
          b.statements.add(
            const Code('}'),
          );
        }),
      );
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
    if (fromJson case (final fromJson, final usesParent)?) {
      Expression ref = _reference(from, isNullable: false);
      if (mayBeAbsent) {
        ref = ref.ifNullThen(literalConstMap({}));
      }
      final genericDeserializers = <Expression>[];
      if (type case ast.InterfaceType(:final typeArguments)) {
        for (final typeArgument in typeArguments) {
          genericDeserializers.add(
            Method(
              (m) => m
                ..requiredParameters.add(Parameter((p) => p..name = 'value'))
                ..body = jsonGenerator
                    .fromJson(
                      typeHelper.toReference(typeArgument),
                      refer('value'),
                    )
                    .code,
            ).closure,
          );
        }
      }
      final deserialized = fromJson([
        // If a subtype uses a parent's fromJson method, then the discriminator
        // key is needed so that the parent's fromJson method can distinguish the
        // map.
        if (usesParent)
          literalMap({
            literalString(r'$type', raw: true): literalString(
              typeReference.symbol,
              raw: true,
            ),
            literalSpread(): ref,
          })
        else
          ref,
        ...genericDeserializers,
      ]);
      if (usesParent) {
        return deserialized.asA(typeReference);
      }
      return deserialized;
    }
    if (serializationSpec.subtypes.isNotEmpty) {
      assert(!mayBeAbsent, 'Classes with subtypes must have a map');
      final ref = _reference(from, isNullable: false);
      final deserialize = DartTypes.celest.serializers
          .property('scoped')
          .property('deserialize');
      return CodeExpression(
        Block((b) {
          final type = ref.index(literalString(r'$type', raw: true));
          b.statements.addAll([
            const Code('switch ('),
            type.code,
            const Code(') {'),
          ]);
          for (final subtype in serializationSpec.subtypes) {
            final subtypeName = subtype.type.element!.name;
            final subtypeCase = deserialize(
              [ref],
              {},
              [typeHelper.toReference(subtype.type)],
            );
            b.statements.addAll([
              Code("r'$subtypeName' => "),
              subtypeCase.code,
              const Code(','),
            ]);
          }
          b.statements.addAll([
            const Code('final unknownType => '),
            DartTypes.celest.serializationException
                .newInstance([
                  DartTypes.core.stringBuffer
                      .newInstance([
                        literalString('Unknown subtype of '),
                      ])
                      .cascade('write')
                      .call(
                        [literalString(this.type.element!.name!, raw: true)],
                      )
                      .cascade('write')
                      .call([literalString(r': $unknownType')])
                      .parenthesized
                      .property('toString')
                      .call([]),
                ])
                .thrown
                .code,
            const Code(', }'),
          ]);
        }),
      );
    }
    final ref = _reference(from, isNullable: mayBeAbsent);
    final deserializedPositional = <Expression>[];
    final deserializedNamed = <String, Expression>{};
    for (final parameter in serializationSpec.parameters) {
      final reference = typeHelper.toReference(parameter.type);
      final deserialized = jsonGenerator.fromJson(
        reference,
        serializationSpec.wireType.isDartCoreMap
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

extension on ast.DartType {
  String? get classNamePrefix {
    return switch (this) {
      ast.InterfaceType(:final typeArguments) => () {
          final name = StringBuffer(element!.displayName);
          if (typeArguments.isNotEmpty) {
            name.writeAll(
              typeArguments.map((t) => t.classNamePrefix).nonNulls,
            );
          }
          return name.toString();
        }(),
      final ast.RecordType recordType => recordType.symbol,
      _ => null,
    };
  }
}
