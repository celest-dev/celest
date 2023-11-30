import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:collection/collection.dart';

enum _TypePosition { parameter, return$ }

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

extension TypeIsJsonSerializable on DartType {
  JsonVerdict get isValidReturnType =>
      flattened.accept(const _IsJsonSerializable(_TypePosition.return$));

  JsonVerdict get isValidParameterType =>
      flattened.accept(const _IsJsonSerializable(_TypePosition.parameter));
}

final class _IsJsonSerializable extends TypeVisitor<JsonVerdict> {
  const _IsJsonSerializable(this.position);

  final _TypePosition position;

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
      case _TypePosition.parameter:
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
      case _TypePosition.return$:
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
