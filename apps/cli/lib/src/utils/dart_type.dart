import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:code_builder/code_builder.dart' hide FunctionType, RecordType;
import 'package:path/path.dart' as p;

final enumIndex = <Reference, bool>{};

extension DartTypeHelper on DartType {
  DartType get flattened {
    switch (this) {
      case final InterfaceType interface:
        final typeSystem = interface.element.library.typeSystem;
        return typeSystem.flatten(this);
      default:
        return this;
    }
  }

  bool get isEnum => element is EnumElement;

  Reference toCodeBuilder(String projectRoot) =>
      accept(_TypeToCodeBuilder(projectRoot: projectRoot));
}

final class _TypeToCodeBuilder implements TypeVisitor<Reference> {
  const _TypeToCodeBuilder({
    required this.projectRoot,
  });

  final String projectRoot;

  @override
  Reference visitDynamicType(DynamicType type) => refer('dynamic');

  @override
  Reference visitFunctionType(FunctionType type) {
    throw StateError('Bad type: $type');
  }

  @override
  Reference visitInterfaceType(InterfaceType type) {
    final typeArguments = type.typeArguments.map((type) => type.accept(this));
    final sourceUri = type.element.library.source.uri;
    final uri = switch (type) {
      _ when type.element.library.isDartCore => 'dart:core',
      _ when sourceUri.scheme == 'file' => p.relative(
          p.fromUri(sourceUri),
          from: projectRoot,
        ),
      _ => sourceUri.toString(),
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
