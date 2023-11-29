import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:celest_cli/analyzer/dart_type.dart';
import 'package:code_builder/code_builder.dart' hide RecordType, FunctionType;
import 'package:collection/collection.dart';

enum TypePosition { parameter, return$ }

class JsonVerdict {
  const JsonVerdict({
    required this.isJsonSerializable,
    required this.reason,
  });

  const JsonVerdict.yes()
      : isJsonSerializable = true,
        reason = '';

  const JsonVerdict.no(this.reason) : isJsonSerializable = false;

  final bool isJsonSerializable;
  final String reason;
}

final class IsJsonSerializable extends TypeVisitor<JsonVerdict> {
  const IsJsonSerializable(this.position);

  final TypePosition position;

  JsonVerdict? _isSimpleJson(DartType type) {
    if (type is! InterfaceType) {
      return JsonVerdict.no('Invalid type detected: $type');
    }
    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreString ||
        type.isDartCoreNull ||
        type.isDartCoreObject) {
      return const JsonVerdict.yes();
    }
    if (type.isDartCoreEnum) {
      return const JsonVerdict.no(
        'Untyped enums are not supported',
      );
    }
    if (type.isDartCoreSet) {
      // TODO(dnys1): Support?
      return const JsonVerdict.no(
        'Set types are not supported',
      );
    }
    if (type.isEnum) {
      return const JsonVerdict.yes();
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      return type.typeArguments.single.accept(this);
    }
    if (type.isDartCoreMap) {
      if (!type.typeArguments[0].isDartCoreString) {
        return const JsonVerdict.no(
          'Map keys must be strings',
        );
      }
      return type.typeArguments[1].accept(this);
    }
    return null;
  }

  @override
  JsonVerdict visitDynamicType(DynamicType type) => const JsonVerdict.yes();

  @override
  JsonVerdict visitFunctionType(FunctionType type) =>
      const JsonVerdict.no('Function types are not supported');

  @override
  JsonVerdict visitInterfaceType(InterfaceType type) {
    if (_isSimpleJson(type) case final verdict?) {
      return verdict;
    }
    switch (position) {
      case TypePosition.parameter:
        final fromJsonCtor = type.constructors.singleWhereOrNull(
          (element) => element.name == 'fromJson',
        );
        if (fromJsonCtor == null) {
          return JsonVerdict.no(
            'No fromJson constructor found for type: ${type.element.name}',
          );
        }
        final requiredParam = fromJsonCtor.parameters.singleOrNull;
        if (requiredParam == null) {
          return JsonVerdict.no(
            'No required parameter found for fromJson constructor of type: ${type.element.name}',
          );
        }
        return _isSimpleJson(requiredParam.type) ??
            JsonVerdict.no(
              'Invalid parameter type of ${type.element.name}\'s fromJson constructor: ${requiredParam.type}',
            );
      case TypePosition.return$:
        final toJsonMethod = type.methods.singleWhereOrNull(
          (element) => element.name == 'toJson',
        );
        if (toJsonMethod == null) {
          return JsonVerdict.no(
            'No toJson method found for type: $type',
          );
        }
        if (toJsonMethod.parameters.any((param) => !param.isOptional)) {
          return JsonVerdict.no(
            'The toJson method of type $type must not have any required parameters',
          );
        }
        final returnType = toJsonMethod.returnType;
        return _isSimpleJson(returnType) ??
            JsonVerdict.no(
              'Invalid return type of ${type.element.name}\'s toJson method: $returnType',
            );
    }
  }

  @override
  JsonVerdict visitInvalidType(InvalidType type) =>
      const JsonVerdict.no('Invalid type detected');

  @override
  JsonVerdict visitNeverType(NeverType type) =>
      const JsonVerdict.no('Never values are not supported');

  @override
  JsonVerdict visitRecordType(RecordType type) {
    // TODO(dnys1): Implement
    return const JsonVerdict.no('Record types are not supported');
    // var isJsonSerializable = true;
    // for (final field in type.namedFields) {
    //   isJsonSerializable &= field.type.accept(this);
    // }
    // for (final field in type.positionalFields) {
    //   isJsonSerializable &= field.type.accept(this);
    // }
    // return isJsonSerializable;
  }

  @override
  JsonVerdict visitTypeParameterType(TypeParameterType type) {
    throw UnimplementedError();
  }

  @override
  JsonVerdict visitVoidType(VoidType type) => const JsonVerdict.yes();
}

final class TypeToCodeBuilder implements TypeVisitor<Reference> {
  const TypeToCodeBuilder();

  @override
  Reference visitDynamicType(DynamicType type) => refer('dynamic');

  @override
  Reference visitFunctionType(FunctionType type) {
    throw StateError('Bad type: $type');
  }

  @override
  Reference visitInterfaceType(InterfaceType type) {
    final typeArguments = type.typeArguments.map((type) => type.accept(this));
    final uri = switch (type) {
      _ when type.element.library.isDartCore => 'dart:core',
      _ => type.element.library.source.uri.toString(),
    };
    final ref = TypeReference(
      (t) => t
        ..symbol = type.element.name
        ..url = uri
        ..types.addAll(typeArguments)
        ..isNullable = type.nullabilitySuffix != NullabilitySuffix.none,
    );
    enumIndex[ref] = type.isEnum;
    return ref;
  }

  @override
  Reference visitInvalidType(InvalidType type) {
    throw StateError('Bad type: $type');
  }

  @override
  Reference visitNeverType(NeverType type) => refer('Never', 'dart:core');

  @override
  Reference visitRecordType(RecordType type) {
    throw StateError('Bad type: $type');
  }

  @override
  Reference visitTypeParameterType(TypeParameterType type) {
    throw StateError('Bad type: $type');
  }

  @override
  Reference visitVoidType(VoidType type) => refer('void');
}

extension ReferenceSerialization on Reference {
  Expression toJson(Expression ref) {
    final type = toTypeReference;
    if (type.isDartAsyncFuture || type.isDartAsyncFutureOr) {
      return type.types.single.toJson(ref);
    }
    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreString ||
        type.isDartCoreObject ||
        type.isDartCoreNull) {
      return ref;
    }
    if (type.isEnum) {
      return ref.property('name');
    }
    if (type.isDartCoreSet || type.isDartCoreEnum) {
      throw StateError('Bad type: $type');
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      final element = refer('el');
      final serializedElement = toTypeReference.types.single.toJson(element);
      if (element == serializedElement) {
        return ref;
      }
      return ref
          .property('map')
          .call([
            Method(
              (m) => m
                ..requiredParameters.add(
                  Parameter(
                    (p) => p..name = 'el',
                  ),
                )
                ..body = serializedElement.code
                ..lambda = true,
            ).closure,
          ])
          .property('toList')
          .call([]);
    }
    if (type.isDartCoreMap) {
      if (!type.types[0].isDartCoreString) {
        throw StateError('Bad type: $type');
      }
      final value = refer('value');
      final serializedValue = type.types[1].toJson(value);
      if (value == serializedValue) {
        return ref;
      }
      return ref.property('map').call([
        Method(
          (m) => m
            ..requiredParameters.add(
              Parameter(
                (p) => p..name = 'key',
              ),
            )
            ..requiredParameters.add(
              Parameter(
                (p) => p..name = 'value',
              ),
            )
            ..body = refer('MapEntry').newInstance([
              refer('key'),
              serializedValue,
            ]).code
            ..lambda = true,
        ).closure,
      ]);
    }
    return ref.property('toJson').call([]);
  }

  Expression _fromJson(Expression ref) {
    final type = toTypeReference;
    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreString ||
        type.isDartCoreNull) {
      return ref.asA(this);
    }
    if (type.isEnum) {
      return property('values')
          .property('byName')
          .call([ref.asA(refer('String', 'dart:core'))]);
    }
    if (type.isDartCoreSet || type.isDartCoreEnum) {
      throw StateError('Bad type: $type');
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      final cast = ref.asA(
        TypeReference(
          (t) => t
            ..symbol = 'Iterable'
            ..url = 'dart:core'
            ..types.add(refer('Object?', 'dart:core'))
            ..isNullable = type.toTypeReference.isNullable,
        ),
      );
      final element = refer('el');
      final serializedElement = type.types.single.fromJson(element);
      if (element == serializedElement) {
        return cast;
      }
      return cast
          .property('map')
          .call([
            Method(
              (m) => m
                ..requiredParameters.add(
                  Parameter(
                    (p) => p..name = 'el',
                  ),
                )
                ..body = serializedElement.code
                ..lambda = true,
            ).closure,
          ])
          .property('toList')
          .call([]);
    }
    if (type.isDartCoreMap) {
      if (!type.types[0].isDartCoreString) {
        throw StateError('Bad type: $type');
      }
      final cast = ref.asA(
        TypeReference(
          (t) => t
            ..symbol = 'Map'
            ..url = 'dart:core'
            ..types.addAll([
              refer('String', 'dart:core'),
              refer('Object?', 'dart:core'),
            ]),
        ),
      );
      final value = refer('value');
      final serializedValue = type.types[1].fromJson(value);
      if (value == serializedValue) {
        return cast;
      }
      return cast.property('map').call([
        Method(
          (m) => m
            ..requiredParameters.add(
              Parameter(
                (p) => p..name = 'key',
              ),
            )
            ..requiredParameters.add(
              Parameter(
                (p) => p..name = 'value',
              ),
            )
            ..body = refer('MapEntry').newInstance([
              refer('key'),
              serializedValue,
            ]).code
            ..lambda = true,
        ).closure,
      ]);
    }
    return newInstanceNamed('fromJson', [
      ref.asA(
        TypeReference(
          (t) => t
            ..symbol = 'Map'
            ..url = 'dart:core'
            ..types.addAll([
              refer('String', 'dart:core'),
              refer('dynamic'),
            ]),
        ),
      ),
    ]);
  }

  Expression fromJson(Expression ref) {
    final fromJson = _fromJson(ref);
    if (!toTypeReference.nullable) {
      return fromJson;
    }
    return ref.equalTo(literalNull).conditional(literalNull, fromJson);
  }
}
