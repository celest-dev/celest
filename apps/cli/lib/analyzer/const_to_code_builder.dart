import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/dart/constant/value.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:code_builder/code_builder.dart';

extension ConstToCodeBuilder on DartObject {
  R accept<R>(DartObjectVisitor<R> visitor) {
    return visitor.visit(this as DartObjectImpl);
  }

  Expression? get toCodeBuilder => accept(const _ConstToCodeBuilder());
}

abstract base class DartObjectVisitor<R> {
  const DartObjectVisitor();

  R visit(DartObjectImpl node) {
    if (node.variable
        case VariableElement(:final library?, isPrivate: false) &&
            final variable?
        // Private variable references cannot be copied to the generated code, so
        // we use the raw value instead.
        //
        // Variables defined outside `lib/` cannot be copied to the generated
        // code, so we use the raw value instead.
        when !library.isWithinProject || library.isWithinProjectLib) {
      return visitVariableReference(variable);
    } else if (node.toBoolValue() case final boolValue?) {
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
      return visitListValue(listValue);
    } else if (node.toMapValue() case final mapValue?) {
      return visitMapValue(mapValue);
    } else if (node.isNull) {
      return visitNullValue();
    } else if (node.state case final RecordState record) {
      return visitRecordValue(
        record.positionalFields,
        record.namedFields,
      );
    } else if (node.toStringValue() case final stringValue?) {
      return visitStringValue(stringValue);
    } else if (node.toSymbolValue() case final symbolValue?) {
      return visitSymbolValue(symbolValue);
    } else if (node.toTypeValue() case final typeValue?) {
      return visitTypeValue(typeValue);
    } else {
      throw StateError('Invalid DartObjectImpl: $node');
    }
  }

  R visitBoolValue(bool value);

  R visitDoubleValue(double value);

  R visitEnumValue(DartType type, String name);

  R visitInstanceCreation(ConstructorInvocation invocation);

  R visitIntValue(int value);

  R visitListValue(List<DartObjectImpl> value);

  R visitMapValue(Map<DartObjectImpl, DartObjectImpl> value);

  R visitNullValue();

  R visitRecordValue(
    List<DartObjectImpl> positionalFields,
    Map<String, DartObjectImpl> namedFields,
  );

  R visitStringValue(String value);

  R visitSymbolValue(String value);

  R visitTypeValue(DartType value);

  R visitVariableReference(VariableElement variable);
}

final class _ConstToCodeBuilder extends DartObjectVisitor<Expression?> {
  const _ConstToCodeBuilder();

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
    final constructorEl = invocation.constructor;
    final expressionType = constructorEl.returnType;
    final namedParameters = invocation.namedArguments.map((name, value) {
      return MapEntry(name, value.toCodeBuilder ?? literalNull);
    });
    final positionalParameters = invocation.positionalArguments
        .map((el) => el.toCodeBuilder ?? literalNull);
    if (constructorEl.name.isNotEmpty) {
      return typeHelper.toReference(expressionType).constInstanceNamed(
            constructorEl.name,
            positionalParameters,
            namedParameters,
          );
    }
    return typeHelper.toReference(expressionType).constInstance(
          positionalParameters,
          namedParameters,
        );
  }

  @override
  Expression visitIntValue(int value) => literalNum(value);

  @override
  Expression visitListValue(List<DartObjectImpl> value) => literalConstList(
        value.map((el) => el.toCodeBuilder ?? literalNull).toList(),
      );

  @override
  Expression visitMapValue(Map<DartObjectImpl, DartObjectImpl> mapValue) =>
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
  Expression visitVariableReference(VariableElement variable) {
    return switch (variable) {
      TopLevelVariableElement() => refer(
          variable.name,
          variable.library.source.uri.toString(),
        ),
      FieldElement(:final enclosingElement) => refer(
          enclosingElement.displayName,
          enclosingElement.library!.source.uri.toString(),
        ).property(variable.name),
      _ => unreachable('Invalid variable element: $variable'),
    };
  }
}
