import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/dart/constant/value.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

extension ConstToCodeBuilder on DartObject {
  R accept<R>(DartObjectVisitor<R> visitor) {
    return visitor.visit(this as DartObjectImpl);
  }

  Expression? get toCodeBuilder => accept(const _ConstToCodeBuilder());
  ast.DartValue? get toDartValue => accept(const _ConstToDartValue());
}

abstract base class DartObjectVisitor<R> {
  const DartObjectVisitor();

  R visit(DartObjectImpl node) {
    if (node.toBoolValue() case final boolValue?) {
      return visitBoolValue(boolValue);
    } else if (node.toDoubleValue() case final doubleValue?) {
      return visitDoubleValue(doubleValue);
    } else if (node.type case final InterfaceType interface
        when interface.isEnum) {
      return visitEnumValue(
        interface,
        node.getField('_name')!.toStringValue()!,
      );
    } else if (node.getInvocation() case final invocation?) {
      return visitInstanceCreation(invocation);
    } else if (node.toIntValue() case final intValue?) {
      return visitIntValue(intValue);
    } else if (node.toListValue() case final listValue?) {
      return visitListValue(listValue, node.type);
    } else if (node.toMapValue() case final mapValue?) {
      return visitMapValue(mapValue, node.type);
    } else if (node.isNull) {
      return visitNullValue();
    } else if (node.state case final RecordState record) {
      return visitRecordValue(
        record.positionalFields,
        record.namedFields,
        node.type,
      );
    } else if (node.toStringValue() case final stringValue?) {
      return visitStringValue(stringValue);
    } else if (node.toSymbolValue() case final symbolValue?) {
      return visitSymbolValue(symbolValue);
    } else if (node.toTypeValue() case final typeValue?) {
      return visitTypeValue(typeValue);
    } else {
      return null as R;
    }
  }

  R visitBoolValue(bool value);

  R visitDoubleValue(double value);

  R visitEnumValue(DartType type, String name);

  R visitInstanceCreation(ConstructorInvocation invocation);

  R visitIntValue(int value);

  R visitListValue(List<DartObjectImpl> value, DartType staticType);

  R visitMapValue(
    Map<DartObjectImpl, DartObjectImpl> value,
    DartType staticType,
  );

  R visitNullValue();

  R visitRecordValue(
    List<DartObjectImpl> positionalFields,
    Map<String, DartObjectImpl> namedFields,
    DartType staticType,
  );

  R visitStringValue(String value);

  R visitSymbolValue(String value);

  R visitTypeValue(DartType value);

  R visitVariableReference(VariableElement2 variable);
}

final class _ConstToCodeBuilder extends DartObjectVisitor<Expression?> {
  const _ConstToCodeBuilder();

  @override
  Expression? visit(DartObjectImpl node) {
    if (node.variable2
        case VariableElement2(library2: final library?, isPrivate: false) &&
            final variable
        // Private variable references cannot be copied to the generated code, so
        // we use the raw value instead.
        //
        // Variables defined outside `lib/` cannot be copied to the generated
        // code, so we use the raw value instead.
        when !library.isWithinProject || library.isWithinProjectLib) {
      return visitVariableReference(variable);
    }
    return super.visit(node);
  }

  @override
  Expression visitBoolValue(bool value) => literalBool(value);

  @override
  Expression visitDoubleValue(double value) => literalNum(value);

  @override
  Expression visitEnumValue(DartType type, String name) {
    return typeHelper.toReference(type).property(name);
  }

  @override
  Expression visitInstanceCreation(ConstructorInvocation invocation) {
    final constructorEl = invocation.constructor2;
    final expressionType = constructorEl.returnType;
    final namedParameters = invocation.namedArguments.map((name, value) {
      return MapEntry(name, value.toCodeBuilder ?? literalNull);
    });
    final positionalParameters = invocation.positionalArguments.map(
      (el) => el.toCodeBuilder ?? literalNull,
    );
    if (constructorEl.name3!.isNotEmpty) {
      return typeHelper.toReference(expressionType).constInstanceNamed(
            constructorEl.name3!,
            positionalParameters,
            namedParameters,
          );
    }
    return typeHelper
        .toReference(expressionType)
        .constInstance(positionalParameters, namedParameters);
  }

  @override
  Expression visitIntValue(int value) => literalNum(value);

  @override
  Expression visitListValue(List<DartObjectImpl> value, DartType staticType) =>
      literalConstList(
        value.map((el) => el.toCodeBuilder ?? literalNull).toList(),
      );

  @override
  Expression visitMapValue(
    Map<DartObjectImpl, DartObjectImpl> mapValue,
    DartType staticType,
  ) =>
      literalConstMap({
        for (final MapEntry(:key, :value) in mapValue.entries)
          key.toCodeBuilder: value.toCodeBuilder ?? literalNull,
      });

  @override
  Expression? visitNullValue() => null;

  @override
  Expression visitRecordValue(
    List<DartObjectImpl> positionalFields,
    Map<String, DartObjectImpl> namedFields,
    DartType staticType,
  ) {
    return literalConstRecord(
      positionalFields.map((el) => el.toCodeBuilder ?? literalNull).toList(),
      namedFields.map(
        (name, value) => MapEntry(name, value.toCodeBuilder ?? literalNull),
      ),
    );
  }

  @override
  Expression visitStringValue(String value) => literalString(value);

  @override
  Expression visitSymbolValue(String value) => CodeExpression(Code('#$value'));

  @override
  Expression visitTypeValue(DartType value) => typeHelper.toReference(value);

  @override
  Expression visitVariableReference(VariableElement2 variable) {
    return switch (variable) {
      TopLevelVariableElement2() => refer(
          variable.name3!,
          variable.library2.firstFragment.source.uri.toString(),
        ),
      FieldElement2(enclosingElement2: final enclosingElement) => refer(
          enclosingElement.displayName,
          enclosingElement.library2.firstFragment.source.uri.toString(),
        ).property(variable.name3!),
      _ => unreachable('Invalid variable element: $variable'),
    };
  }
}

final class _ConstToDartValue extends DartObjectVisitor<ast.DartValue> {
  const _ConstToDartValue();

  @override
  ast.DartValue visitBoolValue(bool value) {
    return ast.DartBool(value);
  }

  @override
  ast.DartValue visitDoubleValue(double value) {
    return ast.DartDouble(value);
  }

  @override
  ast.DartValue visitEnumValue(DartType type, String name) {
    return ast.DartEnum(typeHelper.toReference(type).toTypeReference, name);
  }

  @override
  ast.DartValue visitInstanceCreation(ConstructorInvocation invocation) {
    final constructorEl = invocation.constructor2;
    final namedParameters = invocation.namedArguments.map((name, value) {
      return MapEntry(name, value.accept(this));
    });
    final positionalParameterNames = constructorEl.formalParameters
        .where((it) => it.isPositional)
        .map((it) => it.name3!)
        .toList();
    final positionalParameterValues =
        invocation.positionalArguments.map((el) => el.accept(this)).toList();
    final className = constructorEl.enclosingElement2.displayName;
    final classRef = typeHelper
        .toReference(constructorEl.enclosingElement2.thisType)
        .toTypeReference;
    assert(() {
      if (positionalParameterNames.length < positionalParameterValues.length) {
        throw StateError(
          'Mismatched positional parameters for type $classRef '
          '("$className.${constructorEl.name3}"): '
          'names $positionalParameterNames, '
          'values $positionalParameterValues.',
        );
      }
      return true;
    }());
    return ast.DartInstance(
      classRef: classRef,
      constructor: constructorEl.name3!,
      positionalArguments: Map.fromEntries(
        positionalParameterValues.mapIndexed((index, value) {
          return MapEntry(positionalParameterNames[index], value);
        }),
      ),
      namedArguments: namedParameters,
      staticType:
          typeHelper.toReference(constructorEl.returnType).toTypeReference,
    );
  }

  @override
  ast.DartValue visitIntValue(int value) {
    return ast.DartInt(value);
  }

  @override
  ast.DartValue visitListValue(
    List<DartObjectImpl> value,
    DartType staticType,
  ) {
    return ast.DartList(
      value.map((el) => el.accept(this)).toList(),
      staticType: typeHelper.toReference(staticType).toTypeReference,
    );
  }

  @override
  ast.DartValue visitMapValue(
    Map<DartObjectImpl, DartObjectImpl> value,
    DartType staticType,
  ) {
    return ast.DartMap(
      value.map((key, value) => MapEntry(key.accept(this), value.accept(this))),
      staticType: typeHelper.toReference(staticType).toTypeReference,
    );
  }

  @override
  ast.DartValue visitNullValue() {
    return ast.DartNull();
  }

  @override
  ast.DartValue visitRecordValue(
    List<DartObjectImpl> positionalFields,
    Map<String, DartObjectImpl> namedFields,
    DartType staticType,
  ) {
    return ast.DartRecord(
      positionalFields: positionalFields.map((el) => el.accept(this)).toList(),
      namedFields: namedFields.map(
        (name, value) => MapEntry(name, value.accept(this)),
      ),
      staticType: typeHelper.toReference(staticType).toTypeReference,
    );
  }

  @override
  ast.DartValue visitStringValue(String value) {
    return ast.DartString(value);
  }

  @override
  ast.DartValue visitSymbolValue(String value) {
    return ast.DartSymbolLiteral(value);
  }

  @override
  ast.DartValue visitTypeValue(DartType value) {
    return ast.DartTypeLiteral(typeHelper.toReference(value).toTypeReference);
  }

  @override
  ast.DartValue visitVariableReference(VariableElement2 variable) {
    unreachable('Should use the raw value instead.');
  }
}
