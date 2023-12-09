import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:collection/collection.dart';

enum _TypePosition { parameter, return$ }

sealed class Verdict {
  const Verdict();

  const factory Verdict.yes() = _VerdictYes;
  factory Verdict.no(String reason) = _VerdictNo.single;

  bool get isSerializable;
  List<String> get reasons;

  Verdict operator &(Verdict other) => switch ((this, other)) {
        (_VerdictYes(), _VerdictYes()) => const Verdict.yes(),
        (_VerdictYes(), _VerdictNo(:final reasons)) ||
        (_VerdictNo(:final reasons), _VerdictYes()) =>
          _VerdictNo(reasons),
        (
          _VerdictNo(reasons: final reasonsThis),
          _VerdictNo(reasons: final reasonsOther)
        ) =>
          _VerdictNo([...reasonsThis, ...reasonsOther]),
      };
}

final class _VerdictYes extends Verdict {
  const _VerdictYes();

  @override
  bool get isSerializable => true;

  @override
  List<String> get reasons => const [];
}

final class _VerdictNo extends Verdict {
  const _VerdictNo(this.reasons);
  _VerdictNo.single(String reason) : reasons = [reason];

  @override
  bool get isSerializable => false;

  @override
  final List<String> reasons;
}

extension TypeIsSerializable on DartType {
  Verdict get isValidReturnType =>
      flattened.accept(const _IsSerializable(_TypePosition.return$));

  Verdict get isValidParameterType =>
      flattened.accept(const _IsSerializable(_TypePosition.parameter));
}

final class _IsSerializable extends TypeVisitor<Verdict> {
  const _IsSerializable(this.position, [this.depth = 0]);

  final _TypePosition position;
  final int depth;

  Verdict? _isSimpleJson(InterfaceType type) {
    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreString ||
        type.isDartCoreNull ||
        type.isDartCoreObject) {
      return const Verdict.yes();
    }
    if (type.isDartCoreEnum) {
      return Verdict.no('Untyped enums are not supported');
    }
    if (type.isEnum) {
      return const Verdict.yes();
    }
    if (type.isDartCoreSet) {
      return Verdict.no('Set types are not supported');
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      return type.typeArguments.single.accept(
        _IsSerializable(position, depth + 1),
      );
    }
    if (type.isDartCoreMap) {
      if (!type.typeArguments[0].isDartCoreString) {
        return Verdict.no('Map keys must be strings');
      }
      return type.typeArguments[1].accept(
        _IsSerializable(position, depth + 1),
      );
    }
    return null;
  }

  @override
  Verdict visitDynamicType(DynamicType type) {
    // Needed to support `Map<String, dynamic>`.
    return const Verdict.yes();
  }

  @override
  Verdict visitFunctionType(FunctionType type) =>
      Verdict.no('Function types are not supported');

  @override
  Verdict visitInterfaceType(InterfaceType type) {
    if (_isSimpleJson(type) case final verdict?) {
      return verdict;
    }
    // TODO(dnys1): Define type checkers for all the Dart SDK class we want to
    // support.
    switch (position) {
      case _TypePosition.parameter:
        final fromJsonCtor = type.constructors.singleWhereOrNull(
          (element) => element.name == 'fromJson',
        );
        if (fromJsonCtor == null) {
          return Verdict.no(
            'No fromJson constructor found for type: ${type.element.name}',
          );
        }
        final requiredParam = fromJsonCtor.parameters.singleOrNull;
        if (requiredParam == null) {
          return Verdict.no(
            'No required parameter found for fromJson constructor of type: ${type.element.name}',
          );
        }
        if (requiredParam.type case final InterfaceType paramType) {
          if (_isSimpleJson(paramType) case final verdict?) {
            return verdict;
          }
        }
        return Verdict.no(
          'Invalid parameter type of ${type.element.name}\'s fromJson constructor: ${requiredParam.type}',
        );
      case _TypePosition.return$:
        final toJsonMethod = type.methods.singleWhereOrNull(
          (element) => element.name == 'toJson',
        );
        if (toJsonMethod == null) {
          return Verdict.no(
            'No toJson method found for type: $type',
          );
        }
        if (toJsonMethod.parameters.any((param) => !param.isOptional)) {
          return Verdict.no(
            'The toJson method of type $type must not have any required parameters',
          );
        }
        final returnType = toJsonMethod.returnType;
        if (returnType case final InterfaceType returnType) {
          if (_isSimpleJson(returnType) case final verdict?) {
            return verdict;
          }
        }
        return Verdict.no(
          'Invalid return type of ${type.element.name}\'s toJson method: $returnType',
        );
    }
  }

  @override
  Verdict visitInvalidType(InvalidType type) =>
      Verdict.no('Invalid type: $type');

  @override
  Verdict visitNeverType(NeverType type) =>
      Verdict.no('Never types are not supported');

  @override
  Verdict visitRecordType(RecordType type) {
    var verdict = const Verdict.yes();
    for (final field in type.positionalFields) {
      verdict &= field.type.accept(
        _IsSerializable(position, depth + 1),
      );
    }
    for (final field in type.namedFields) {
      verdict &= field.type.accept(
        _IsSerializable(position, depth + 1),
      );
    }
    return verdict;
  }

  @override
  Verdict visitTypeParameterType(TypeParameterType type) {
    // TODO: Generic tests and support?
    throw UnimplementedError();
  }

  @override
  Verdict visitVoidType(VoidType type) {
    if (depth == 0 && position == _TypePosition.return$) {
      return const Verdict.yes();
    }
    return Verdict.no('Void types are not supported in this position');
  }
}
