import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:analyzer/src/dart/element/type.dart';

extension TypeImplAlias on TypeImpl {
  TypeImpl withAlias(InstantiatedTypeAliasElement? alias) {
    final visitor = _TypeImplAliasVisitor();
    return acceptWithArgument(visitor, alias);
  }
}

final class _TypeImplAliasVisitor
    extends TypeVisitorWithArgument<TypeImpl, InstantiatedTypeAliasElement?> {
  @override
  TypeImpl visitDynamicType(
    DynamicType type,
    InstantiatedTypeAliasElement? alias,
  ) {
    return type as DynamicTypeImpl;
  }

  @override
  TypeImpl visitFunctionType(
    FunctionType type,
    InstantiatedTypeAliasElement? alias,
  ) {
    return FunctionTypeImpl(
      typeFormals: type.typeFormals,
      parameters: type.parameters,
      returnType: type.returnType,
      nullabilitySuffix: type.nullabilitySuffix,
      alias: alias,
    );
  }

  @override
  TypeImpl visitInterfaceType(
    InterfaceType type,
    InstantiatedTypeAliasElement? alias,
  ) {
    return InterfaceTypeImpl(
      element: type.element,
      typeArguments: type.typeArguments,
      nullabilitySuffix: type.nullabilitySuffix,
      alias: alias,
    );
  }

  @override
  TypeImpl visitInvalidType(
    InvalidType type,
    InstantiatedTypeAliasElement? alias,
  ) {
    return type as InvalidTypeImpl;
  }

  @override
  TypeImpl visitNeverType(NeverType type, InstantiatedTypeAliasElement? alias) {
    return type as NeverTypeImpl;
  }

  @override
  TypeImpl visitRecordType(
    RecordType type,
    InstantiatedTypeAliasElement? alias,
  ) {
    return RecordTypeImpl(
      positionalFields: type.positionalFields.cast(),
      namedFields: type.namedFields.cast(),
      nullabilitySuffix: type.nullabilitySuffix,
      alias: alias,
    );
  }

  @override
  TypeImpl visitTypeParameterType(
    TypeParameterType type,
    InstantiatedTypeAliasElement? alias,
  ) {
    return TypeParameterTypeImpl(
      element: type.element,
      nullabilitySuffix: type.nullabilitySuffix,
      alias: alias,
    );
  }

  @override
  TypeImpl visitVoidType(VoidType type, InstantiatedTypeAliasElement? alias) {
    return type as VoidTypeImpl;
  }
}
