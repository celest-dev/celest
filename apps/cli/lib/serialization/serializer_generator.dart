import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:analyzer/dart/element/type_visitor.dart' as ast;
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart';

final class SerializerDefinition {
  SerializerDefinition({
    required this.serialize,
    required this.deserialize,
    required this.type,
    required this.dartType,
    required this.generics,
    required this.wireType,
  });

  final Code serialize;
  final Code deserialize;
  final Reference type;
  final ast.DartType dartType;
  Expression? get typeToken => dartType.typeToken;
  final Set<Reference> generics;
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

  Code get initAll {
    return Block((b) {
      if (generics.isEmpty) {
        b.addExpression(_init(define(), typeToken));
        return;
      }

      // Instantiate to bounds first
      b.addExpression(
        _init(refer(_genericClassName).constInstance([])),
      );

      // Monomorphize for all combinations of bound subclasses.
      final subtypeCombos = _combinations(generics.map(_subtypes)).toList();
      for (final subtypes in subtypeCombos) {
        final instance = refer(_genericClassName).constInstance(
          [],
          {},
          subtypes.references,
        );
        b.addExpression(_init(instance));
      }
    });
  }

  late final _genericClassName = '${dartType.classNamePrefix}Serializer';
  Class? get genericClass {
    if (generics.isEmpty) {
      return null;
    }
    return Class((b) {
      b
        ..modifier = ClassModifier.final$
        ..name = _genericClassName
        ..extend = DartTypes.celest.serializer(type)
        ..types.addAll(generics);

      // Create unnamed constant constructor
      b.constructors.add(
        Constructor((b) => b..constant = true),
      );

      // Create `deserialize` and `serialize` overrides
      b.methods.addAll([
        Method(
          (b) => b
            ..name = 'deserialize'
            ..returns = type
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = r'$value'
                  ..type = DartTypes.core.object.nullable,
              ),
            )
            ..annotations.add(DartTypes.core.override)
            ..body = Block((b) {
              b.addExpression(
                declareFinal(r'$serialized').assign(
                  refer('assertWireType').call([
                    refer(r'$value'),
                  ], {}, [
                    wireType,
                  ]),
                ),
              );
              b.statements.add(deserialize);
            }),
        ),
        Method(
          (b) => b
            ..name = 'serialize'
            ..returns = DartTypes.core.object.nullable
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = r'$value'
                  ..type = type,
              ),
            )
            ..annotations.add(DartTypes.core.override)
            ..body = serialize,
        ),
      ]);
    });
  }

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
  SerializerGenerator(SerializationSpec serializationSpec)
      : _isExtensionType = serializationSpec.isExtensionType,
        serializationSpec = serializationSpec.isExtensionType
            ? serializationSpec.extensionType!
            : serializationSpec;

  final SerializationSpec serializationSpec;
  final bool _isExtensionType;
  late final SerializationSpec? _parent = serializationSpec.parent;
  late final Set<Reference> _generics = _collectGenerics();

  Set<Reference> _collectGenerics() {
    final collector = _GenericsCollector();
    serializationSpec.type.accept(collector);
    return collector.generics;
  }

  bool get isSubtype => _parent != null;

  /// The `fromJson` method to use and whether it is inherited from a parent.
  (Expression fromJson, bool usesParent)? get fromJson {
    Reference? typeReference;
    var usesParent = false;
    if (serializationSpec.fromJsonType case final fromJsonType?) {
      typeReference = typeHelper.toReference(fromJsonType);
      usesParent = !const DartTypeEquality(ignoreNullability: true)
          .equals(fromJsonType, type);
    }
    var parent = (!_isExtensionType || type.implementsRepresentationType)
        ? _parent
        : null;
    while (typeReference == null && parent != null) {
      if (parent.fromJsonType case final fromJsonType?) {
        typeReference = typeHelper.toReference(fromJsonType);
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
  late final typeReference = typeHelper.toReference(type).nonNullable.noBound;
  late final wireType = serializationSpec.wireType;
  late final castType = serializationSpec.castType;

  SerializerDefinition build() {
    final serialize = _serialize(r'$value').code;

    final parameters = serializationSpec.parameters;
    final mayBeAbsent =
        (parameters.isEmpty || parameters.every((p) => p.isOptional)) &&
            serializationSpec.subtypes.isEmpty;
    final wireType = switch (type) {
      ast.InterfaceType(isEnum: true) => this.wireType,
      _ => castType.withNullability(mayBeAbsent),
    };
    final deserialize = _deserialize(r'$serialized', mayBeAbsent: mayBeAbsent);

    return SerializerDefinition(
      serialize: serialize,
      deserialize: deserialize,
      type: typeReference,
      dartType: type,
      generics: _generics,
      wireType: wireType,
    );
  }

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
      final serialize = DartTypes.celest.serializers
          .property('instance')
          .property('serialize');
      return CodeExpression(
        Block((b) {
          for (final subtype in serializationSpec.subtypes) {
            final subtypeRef = typeHelper.toReference(subtype.type).noBound;
            final subtypeCase = serialize(
              [ref],
              {},
              [subtypeRef],
            ).asA(wireType);
            final serialized = literalMap({
              literalSpread(): subtypeCase,
              literalString(r'$type', raw: true): literalString(
                subtype.type.element!.name!,
                raw: true,
              ),
            });
            b.statements.add(
              serialized.returned.wrapWithBlockIf(ref.isA(subtypeRef)),
            );
          }
          b.addExpression(
            DartTypes.celest.serializationException.newInstance([
              DartTypes.core.stringBuffer
                  .newInstance([
                    literalString('Unknown subtype of '),
                  ])
                  .cascade('write')
                  .call([
                    literalString(type.element!.name!, raw: true),
                  ])
                  .cascade('write')
                  .call([literalString(r': ')])
                  .cascade('write')
                  .call([ref.property('runtimeType')])
                  .parenthesized
                  .property('toString')
                  .call([]),
            ]).thrown,
          );
        }),
      );
    }
    if (type.isEnum) {
      return ref.property('name');
    }
    if (_isExtensionType) {
      return jsonGenerator.toJson(
        typeHelper.toReference(_parent!.type),
        type.implementsRepresentationType
            ? ref
            : switch (serializationSpec.fields) {
                [final field] => ref.property(field.name),
                // No public field to reference. Just cast into representation.
                _ => ref.asA(typeHelper.toReference(_parent.type)),
              },
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

  Code _deserialize(
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
        if (usesParent && !_isExtensionType)
          literalMap({
            literalString(r'$type', raw: true): literalString(
              typeReference.symbol!,
              raw: true,
            ),
            literalSpread(): ref,
          })
        else
          ref,
        ...genericDeserializers,
      ]);
      if (usesParent) {
        return deserialized.asA(typeReference).returned.statement;
      }
      return deserialized.returned.statement;
    }
    if (serializationSpec.subtypes.isNotEmpty) {
      assert(!mayBeAbsent, 'Classes with subtypes must have a map');
      final ref = _reference(from, isNullable: false);
      final deserialize = DartTypes.celest.serializers
          .property('instance')
          .property('deserialize');
      return Block((b) {
        final type = ref.index(literalString(r'$type', raw: true));
        for (final subtype in serializationSpec.subtypes) {
          final subtypeName = subtype.type.element!.name;
          final subtypeRef = typeHelper.toReference(subtype.type).noBound;
          final subtypeCase = deserialize(
            [ref],
            {},
            [subtypeRef],
          );
          b.statements.add(
            subtypeCase.returned.wrapWithBlockIf(
              type.equalTo(literalString(subtypeName!, raw: true)),
            ),
          );
        }
        b.addExpression(
          DartTypes.celest.serializationException.newInstance([
            DartTypes.core.stringBuffer
                .newInstance([
                  literalString('Unknown subtype of '),
                ])
                .cascade('write')
                .call([
                  literalString(this.type.element!.name!, raw: true),
                ])
                .cascade('write')
                .call([literalString(r': ')])
                .cascade('write')
                .call([type])
                .parenthesized
                .property('toString')
                .call([]),
          ]).thrown,
        );
      });
    }
    final ref = _reference(from, isNullable: mayBeAbsent);
    if (type.isEnum) {
      return typeReference.nonNullable
          .property('values')
          .property('byName')
          .call([ref])
          .returned
          .statement;
    }
    if (_isExtensionType) {
      final deserialized = jsonGenerator.fromJson(
        typeHelper.toReference(_parent!.type),
        ref,
      );
      // No params means no constructor. Just cast into the extension type.
      if (serializationSpec.parameters.isEmpty) {
        return deserialized.asA(typeReference).returned.statement;
      }
      return typeReference.nonNullable
          .newInstance([deserialized])
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

final class _GenericsCollector extends ast.TypeVisitor<void> {
  _GenericsCollector();

  final Set<Reference> generics = {};
  final Set<ast.DartType> _seen = {};

  @override
  void visitInterfaceType(ast.InterfaceType type) {
    if (!_seen.add(type)) {
      return;
    }
    for (final typeArgument in type.typeArguments) {
      typeArgument.accept(this);
    }
  }

  @override
  void visitTypeParameterType(ast.TypeParameterType type) {
    if (!_seen.add(type)) {
      return;
    }
    generics.add(typeHelper.toReference(type));
  }

  @override
  void visitDynamicType(ast.DynamicType type) {}

  @override
  void visitFunctionType(ast.FunctionType type) {}

  @override
  void visitInvalidType(ast.InvalidType type) {}

  @override
  void visitNeverType(ast.NeverType type) {}

  @override
  void visitRecordType(ast.RecordType type) {
    // TODO(dnys1): Generic records
  }

  @override
  void visitVoidType(ast.VoidType type) {}
}

extension on ast.DartType {
  String get classNamePrefix {
    return switch (this) {
      ast.InterfaceType(:final typeArguments, :final element) => () {
          final name = StringBuffer(element.name);
          if (typeArguments.isNotEmpty) {
            name
              ..write('_')
              ..write(
                typeArguments.map((t) => t.classNamePrefix).join('_'),
              );
          }
          return name.toString();
        }(),
      final ast.RecordType recordType => recordType.symbol,
      ast.TypeParameterType(:final element, :final bound) =>
        StringBuffer().let((buf) {
          buf.write(element.name);
          if (bound.classNamePrefix case final boundPrefix
              when boundPrefix.isNotEmpty) {
            buf
              ..write('_')
              ..write(boundPrefix);
          }
          return buf.toString();
        }),
      _ => '',
    };
  }
}

List<_Reference> _subtypes(Reference typeParameter) {
  final typeParameterType =
      typeHelper.fromReference(typeParameter) as ast.TypeParameterType;
  final typeParameterBound =
      typeParameterType.bound.element as InterfaceElement;
  final subtypes = <_Reference>{
    _BoundReference(typeHelper.toReference(typeParameterType.bound)),
  };
  for (final subtype in typeHelper.subtypes[typeParameterBound]!) {
    subtypes.add(
      _SubtypeReference(typeHelper.toReference(subtype)),
    );
  }
  return subtypes.toList();
}

Iterable<List<_Reference>> _combinations(
  Iterable<Iterable<_Reference>> types,
) sync* {
  if (types.isEmpty) {
    return;
  }
  if (types.length == 1) {
    yield* types.first.map((t) => [t]);
    return;
  }
  final type = types.first;
  final rest = types.skip(1);
  for (final t in type) {
    for (final r in _combinations(rest)) {
      yield [t, ...r];
    }
  }
}

sealed class _Reference {
  const _Reference(this.reference);

  final Reference reference;
}

final class _SubtypeReference extends _Reference {
  _SubtypeReference(super.reference);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SubtypeReference && reference == other.reference;

  @override
  int get hashCode => reference.hashCode;
}

final class _BoundReference extends _Reference {
  _BoundReference(super.reference);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _BoundReference && reference == other.reference;

  @override
  int get hashCode => reference.hashCode;
}

extension on Iterable<_Reference> {
  List<Reference> get references => map((r) => r.reference).toList();
}
