import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:analyzer/dart/element/type_visitor.dart' as ast;
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/serialization/common.dart';
import 'package:celest_cli/src/serialization/json_generator.dart';
import 'package:celest_cli/src/serialization/serialization_spec.dart';
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
    required this.customSerializers,
  });

  final Code serialize;
  final Code deserialize;
  final Reference type;
  final ast.DartType dartType;
  Expression? get typeToken => dartType.typeToken;
  final Set<Reference> generics;
  final Reference wireType;
  final Code? customSerializers;

  bool get isConst => customSerializers == null;
  bool get hasClass => generics.isNotEmpty || customSerializers != null;

  Expression _init(Expression serializer, [Expression? typeToken]) {
    return DartTypes.celest.serializers
        .property('instance')
        .property('put')
        .call([serializer, if (typeToken != null) typeToken]);
  }

  Code get initAll {
    return Block((b) {
      if (!hasClass) {
        b.addExpression(_init(define(), typeToken));
        return;
      }

      final serializerClass = refer(_serializerClassName);
      final constructor =
          isConst ? serializerClass.constInstance : serializerClass.newInstance;

      // Instantiate to bounds first
      b.addExpression(_init(constructor([]), typeToken));

      // Monomorphize for all combinations of bound subclasses.
      final subtypeCombos = _combinations(generics.map(_subtypes)).toList();
      for (final subtypes in subtypeCombos) {
        final instance = constructor([], {}, subtypes.references);
        b.addExpression(_init(instance));
      }
    });
  }

  late final _serializerClassName = '${dartType.classNamePrefix}Serializer';
  Class? get serializerClass {
    if (!hasClass) {
      return null;
    }
    return Class((b) {
      b
        ..modifier = ClassModifier.final$
        ..name = _serializerClassName
        ..extend = DartTypes.celest.serializer(type)
        ..types.addAll(generics);

      // Create unnamed constant constructor when we can.

      b.constructors.add(
        Constructor(
          (c) =>
              c
                ..constant = isConst
                ..body = customSerializers,
        ),
      );

      if (customSerializers != null) {
        b.fields.add(
          Field(
            (f) =>
                f
                  ..name = r'$serializers'
                  ..modifier = FieldModifier.final$
                  ..type = DartTypes.celest.serializers
                  ..assignment =
                      DartTypes.celest.serializers.newInstance([]).code,
          ),
        );
      }

      // Create `deserialize` and `serialize` overrides
      b.methods.addAll([
        Method(
          (b) =>
              b
                ..name = 'deserialize'
                ..returns = type
                ..requiredParameters.add(
                  Parameter(
                    (b) =>
                        b
                          ..name = r'$value'
                          ..type = DartTypes.core.object.nullable,
                  ),
                )
                ..annotations.add(DartTypes.core.override)
                ..body = Block((b) {
                  b.addExpression(
                    declareFinal(r'$serialized').assign(
                      refer(
                        'assertWireType',
                      ).call([refer(r'$value')], {}, [wireType]),
                    ),
                  );
                  b.statements.add(deserialize);
                }),
        ),
        Method(
          (b) =>
              b
                ..name = 'serialize'
                ..returns = DartTypes.core.object.nullable
                ..requiredParameters.add(
                  Parameter(
                    (b) =>
                        b
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
        'serialize':
            Method(
              (b) =>
                  b
                    ..requiredParameters.add(
                      Parameter((b) => b..name = r'$value'),
                    )
                    ..body = serialize,
            ).closure,
        'deserialize':
            Method(
              (b) =>
                  b
                    ..requiredParameters.add(
                      Parameter((b) => b..name = r'$serialized'),
                    )
                    ..body = deserialize,
            ).closure,
      },
      [type, wireType],
    );
  }
}

final class SerializerGenerator {
  SerializerGenerator(
    this.serializationSpec, {
    this.additionalSerializationSpecs = const [],
    Expression? serializers,
  }) {
    _serializers =
        serializers ??
        (_customSerializers != null
            ? refer(r'$serializers')
            : DartTypes.celest.serializers.property('instance'));
  }

  final SerializationSpec serializationSpec;
  final Iterable<SerializationSpec> additionalSerializationSpecs;
  late final Expression _serializers;

  late final bool _isExtensionType = serializationSpec.isExtensionType;
  late final bool _isOverridden = type.isOverridden;

  // Overridden types are extension types but their serializers should apply
  // at the global level so that all instances of the representation type
  // are serialized the same.
  late final bool _isExtensionTypeWithIdentity =
      _isExtensionType && !_isOverridden;

  late final SerializationSpec? _parent = serializationSpec.parent;
  late final Set<Reference> _generics = _collectGenerics();

  late final jsonGenerator = JsonGenerator(serializers: _serializers);

  Set<Reference> _collectGenerics() {
    final collector = _GenericsCollector();
    serializationSpec.type.accept(collector);
    return collector.generics;
  }

  bool get isSubtype => _parent != null;

  /// The `fromJson` method to use and whether it is inherited from a parent.
  (Expression fromJson, bool usesParent, bool requiresNullCheck)? get fromJson {
    Reference? typeReference;
    var usesParent = false;
    if (serializationSpec.fromJsonType case final fromJsonType?) {
      typeReference = typeHelper.toReference(fromJsonType);
      usesParent =
          !const DartTypeEquality(
            ignoreNullability: true,
          ).equals(fromJsonType, type);
    }
    var parent = _parent;
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
    return (
      typeReference.nonNullable.property('fromJson'),
      usesParent,
      typeReference.isNullableOrFalse,
    );
  }

  bool get hasToJson {
    if (serializationSpec.toJsonType != null) {
      return true;
    }
    var parent = _parent;
    while (parent != null) {
      if (parent.toJsonType != null) {
        return true;
      }
      parent = parent.parent;
    }
    return false;
  }

  late final type = serializationSpec.type;
  late final typeReference = typeHelper.toReference(type).nonNullable.noBound;
  late final wireType = serializationSpec.wireType;
  late final castType = serializationSpec.castType;

  late final representationType = type.extensionTypeErasure;
  late final representationTypeRef = typeHelper.toReference(representationType);

  late final Code? _customSerializers = run(() {
    if (!_isExtensionTypeWithIdentity) {
      return null;
    }
    final interfaceSpecs = additionalSerializationSpecs.where(
      (spec) => spec.type is ast.InterfaceType,
    );
    if (interfaceSpecs.isEmpty) {
      return null;
    }
    Expression serializers = refer(r'$serializers');
    for (final spec in interfaceSpecs) {
      final serializer =
          SerializerGenerator(
            spec,
            serializers: refer(r'$serializers'),
          ).build().first;
      serializers = serializers.cascade('put').call([serializer.define()]);
    }
    return serializers.statement;
  });

  List<SerializerDefinition> build() {
    final serialize = _serialize(r'$value').code;

    final parameters = serializationSpec.parameters;
    final mayBeAbsent =
        (parameters.isEmpty || parameters.every((p) => p.isOptional)) &&
        serializationSpec.subtypes.isEmpty;
    final wireType = switch (type) {
      ast.InterfaceType(isEnumLike: true) => this.wireType,
      _ => castType.withNullability(mayBeAbsent),
    };
    final deserialize = _deserialize(r'$serialized', mayBeAbsent: mayBeAbsent);

    final serializerDefinitions = <SerializerDefinition>[];

    serializerDefinitions.add(
      SerializerDefinition(
        serialize: serialize,
        deserialize: deserialize,
        type: typeReference,
        dartType: type,
        generics: _generics,
        wireType: wireType,
        customSerializers: _customSerializers,
      ),
    );

    if (!_isExtensionTypeWithIdentity) {
      for (final subtype in serializationSpec.subtypes) {
        serializerDefinitions.addAll(
          SerializerGenerator(subtype, serializers: _serializers).build(),
        );
      }
      for (final additionalSpec in additionalSerializationSpecs) {
        serializerDefinitions.addAll(
          SerializerGenerator(
            additionalSpec,
            serializers: _serializers,
          ).build(),
        );
      }
    }

    return serializerDefinitions;
  }

  Expression _serialize(String from) {
    final Expression ref = _reference(from, isNullable: false);
    if (hasToJson) {
      final genericSerializers = <Expression>[];
      if (type case ast.InterfaceType(:final typeArguments)) {
        for (final typeArgument in typeArguments) {
          genericSerializers.add(
            Method(
              (m) =>
                  m
                    ..requiredParameters.add(
                      Parameter((p) => p..name = 'value'),
                    )
                    ..body =
                        jsonGenerator
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
                  literalString(subtype.type.element3!.name3!, raw: true).code,
                  const Code(','),
                ]);
              }
              b.statements.add(const Code('}'));
            }),
          ),
        });
      }
      return serialized;
    }
    if (serializationSpec.subtypes.isNotEmpty) {
      final serialize = _serializers.property('serialize');
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
                subtype.type.element3!.name3!,
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
                  .newInstance([literalString('Unknown subtype of ')])
                  .cascade('write')
                  .call([literalString(type.element3!.name3!, raw: true)])
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
    } else if (type.isEnumLike) {
      return ref.property('toString').call([]);
    }
    if (_isExtensionTypeWithIdentity) {
      return jsonGenerator.toJson(
        representationTypeRef,
        type.implementsRepresentationType
            ? ref
            : switch (serializationSpec.fields) {
              [final field] => ref.property(field.name),
              // No public field to reference. Just cast into representation.
              _ => ref.asA(representationTypeRef),
            },
      );
    }
    final serialized = <Expression, Expression>{};
    for (final field in serializationSpec.representationType.fields) {
      if (field.ignore) {
        continue;
      }
      final variableName = field.name;
      final fieldTypeRef = typeHelper.toReference(field.type);
      final serializedField = jsonGenerator.toJson(
        fieldTypeRef,
        ref.property(field.name),
      );
      if (fieldTypeRef.isNullableOrFalse) {
        final binding = nullCheckBind(variableName, serializedField);
        final key = mapIf(binding, literalString(field.name, raw: true));
        serialized[key] = refer(variableName);
      } else {
        serialized[literalString(field.name, raw: true)] = serializedField;
      }
    }
    return (serialized.isEmpty ? literalConstMap : literalMap)(
      serialized,
      DartTypes.core.string,
      DartTypes.core.object.nullable,
    );
  }

  Code _deserialize(String from, {required bool mayBeAbsent}) {
    if (fromJson
        case (final fromJson, final usesParent, final requiresNullCheck)?) {
      Expression ref = _reference(from, isNullable: false);
      if (mayBeAbsent) {
        ref = ref.ifNullThen(literalConstMap({}));
      }
      final genericDeserializers = <Expression>[];
      if (type case ast.InterfaceType(:final typeArguments)) {
        for (final typeArgument in typeArguments) {
          final typeArgumentRef = typeHelper.toReference(typeArgument);
          genericDeserializers.add(
            Method(
              (m) =>
                  m
                    ..requiredParameters.add(
                      Parameter((p) => p..name = 'value'),
                    )
                    ..body =
                        jsonGenerator
                            .fromJson(
                              typeArgumentRef,
                              refer('value'),
                              inNullableContext:
                                  typeArgumentRef.isNullableOrFalse,
                            )
                            .code,
            ).closure,
          );
        }
      }
      var deserialized = fromJson([
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
      if (requiresNullCheck) {
        deserialized = deserialized.nullChecked;
      }
      if (usesParent) {
        return deserialized.asA(typeReference).returned.statement;
      }
      return deserialized.returned.statement;
    }
    if (serializationSpec.subtypes.isNotEmpty) {
      assert(!mayBeAbsent, 'Classes with subtypes must have a map');
      final ref = _reference(from, isNullable: false);
      final deserialize = _serializers.property('deserialize');
      return Block((b) {
        final type = ref.index(literalString(r'$type', raw: true));
        for (final subtype in serializationSpec.subtypes) {
          final subtypeName = subtype.type.element3!.name3!;
          final subtypeRef = typeHelper.toReference(subtype.type).noBound;
          final subtypeCase = deserialize([ref], {}, [subtypeRef]);
          b.statements.add(
            subtypeCase.returned.wrapWithBlockIf(
              type.equalTo(literalString(subtypeName, raw: true)),
            ),
          );
        }
        b.addExpression(
          DartTypes.celest.serializationException.newInstance([
            DartTypes.core.stringBuffer
                .newInstance([literalString('Unknown subtype of ')])
                .cascade('write')
                .call([literalString(this.type.element3!.name3!, raw: true)])
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
    } else if (type.isEnumLike) {
      return typeReference.nonNullable
          .property('values')
          .property('firstWhere')
          .call([
            Method(
              (m) =>
                  m
                    ..requiredParameters.add(Parameter((p) => p..name = 'el'))
                    ..body =
                        ref
                            .equalTo(refer('el').property('toString').call([]))
                            .code,
            ).closure,
          ])
          .returned
          .statement;
    }
    if (_isExtensionTypeWithIdentity) {
      final deserialized = jsonGenerator.fromJson(
        representationTypeRef,
        ref,
        inNullableContext: mayBeAbsent,
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
      if (parameter.ignore) {
        continue;
      }
      final parameterWireName = parameter.name.nonPrivate;
      final reference = typeHelper.toReference(parameter.type);
      final (serialized, inNullableContext) =
          typeHelper.fromReference(serializationSpec.wireType).isDartCoreMap
              ? (ref.index(literalString(parameterWireName, raw: true)), true)
              : (ref, mayBeAbsent);
      final deserialized = jsonGenerator.fromJson(
        reference,
        serialized,
        defaultValue: parameter.defaultValue,
        inNullableContext: inNullableContext,
      );
      if (parameter.isPositional) {
        deserializedPositional.add(deserialized);
      } else {
        deserializedNamed[parameterWireName] = deserialized;
      }
    }
    return switch (type) {
      ast.InterfaceType() => () {
        // TODO(dnys1): Find a less hacky way to do this
        var constructor = typeReference;
        var cast = false;
        if (_isOverridden) {
          if (serializationSpec.wireConstructor!.enclosingElement2 !=
              type.element3) {
            constructor = representationTypeRef;
            cast = true;
          }
        }
        final instance = constructor.newInstance(
          deserializedPositional,
          deserializedNamed,
        );
        if (cast) {
          return instance.asA(typeReference);
        }
        return instance;
      }(),
      ast.RecordType() => literalRecord(
        deserializedPositional,
        deserializedNamed,
      ),
      _ => unreachable('Unsupported type: $type'),
    }.returned.statement;
  }

  Reference _reference(String variable, {required bool isNullable}) {
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
      ast.InterfaceType(:final typeArguments, element3: final element) => () {
        final name = StringBuffer(element.name3!);
        if (typeArguments.isNotEmpty) {
          name
            ..write('_')
            ..write(typeArguments.map((t) => t.classNamePrefix).join('_'));
        }
        return name.toString();
      }(),
      final ast.RecordType recordType => recordType.symbol,
      ast.TypeParameterType(element3: final element, :final bound) =>
        StringBuffer().let((buf) {
          buf.write(element.name3);
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
      typeParameterType.bound.element3 as InterfaceElement2;
  final subtypes = <_Reference>{
    _BoundReference(typeHelper.toReference(typeParameterType.bound)),
  };
  for (final subtype in typeHelper.subtypes[typeParameterBound]!) {
    subtypes.add(_SubtypeReference(typeHelper.toReference(subtype)));
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
