import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_system.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:code_builder/code_builder.dart' as codegen;

final class TypeHelper {
  TypeHelper({
    required ProjectPaths projectPaths,
  }) : _projectPaths = projectPaths;

  final ProjectPaths _projectPaths;
  TypeSystem? _typeSystem;
  TypeSystem get typeSystem {
    if (_typeSystem == null) {
      throw StateError(
        'TypeHelper.typeSystem was accessed before it was initialized. '
        'The type system is only available after analysis.',
      );
    }
    return _typeSystem!;
  }

  set typeSystem(TypeSystem typeSystem) {
    _typeSystem = typeSystem;
  }

  final _dartTypeToReference = <DartType, codegen.Reference>{};
  final _referenceToDartType = <codegen.Reference, DartType>{};
  final _wireTypeToDartType = <String, DartType>{};
  final _serializationVerdicts = <DartType, Verdict>{};

  codegen.Reference toReference(DartType type) {
    final reference = _dartTypeToReference[type] ??= type.accept(
      _TypeToCodeBuilder(projectRoot: _projectPaths.projectRoot),
    );
    _referenceToDartType[reference] ??= type;
    if (toUri(type) case final wireType?) {
      _wireTypeToDartType[wireType] ??= type;
    }
    return reference;
  }

  DartType fromReference(codegen.Reference reference) {
    final dartType = _referenceToDartType[reference];
    if (dartType == null) {
      throw unreachable(
        'Reference $reference was not found in the cache. Did you forget to '
        'call toReference?',
      );
    }
    return dartType;
  }

  String? toUri(DartType type) => switch (type.element) {
        final element? => urlOfElement(element),
        _ => null,
      };

  DartType fromWireType(String wireType) {
    final type = _wireTypeToDartType[wireType];
    if (type == null) {
      throw unreachable(
        'Wire type $wireType was not found in the cache. Did you forget to '
        'call toReference?',
      );
    }
    return type;
  }

  /// Determines whether a [DartType] can be serialized.
  ///
  /// Types must:
  /// - Be a simple JSON type (bool, double, int, String, null, Object)
  /// - Be an enum
  /// - Be a supported Dart SDK type
  /// - Be a class with a constructor named `fromJson` that takes a single
  ///   required parameter whose type is `Map<String, dynamic>`.
  /// - Be a class with a method named `toJson` that takes no required parameters.
  /// - Be a class which: has fields of the above types, has a constructor with
  ///   all fields present. For these classes, we generate custom serialization
  ///   code.
  Verdict isSerializable(DartType type) =>
      _serializationVerdicts[type] ??= type.accept(const IsSerializable());

  (
    Uri,
    codegen.Class,
    Set<DartType> referencedTypes,
  )? customSerializer(DartType type) {
    final verdict = isSerializable(type);
    if (verdict case VerdictYes(:final serializationSpec?)) {
      final serializerGenerator = SerializerGenerator(
        typeHelper: this,
        serializationSpec: serializationSpec,
      );
      final (clazz, referencedTypes) = serializerGenerator.build();
      return (serializationSpec.uri, clazz, referencedTypes);
    }
    return null;
  }
}

final class _TypeToCodeBuilder implements TypeVisitor<codegen.Reference> {
  const _TypeToCodeBuilder({
    required this.projectRoot,
  });

  final String projectRoot;

  @override
  codegen.Reference visitDynamicType(DynamicType type) =>
      DartTypes.core.dynamic;

  @override
  codegen.Reference visitFunctionType(FunctionType type) {
    return codegen.FunctionType(
      (b) => b
        ..returnType = type.returnType.accept(this)
        ..optionalParameters.addAll([
          for (final parameter
              in type.parameters.where((p) => p.isOptionalPositional))
            parameter.type.accept(this),
        ])
        ..requiredParameters.addAll([
          for (final parameter
              in type.parameters.where((p) => p.isRequiredPositional))
            parameter.type.accept(this),
        ])
        ..namedParameters.addAll({
          for (final parameter
              in type.parameters.where((p) => p.isOptionalNamed))
            parameter.name: parameter.type.accept(this),
        })
        ..namedRequiredParameters.addAll({
          for (final parameter
              in type.parameters.where((p) => p.isRequiredNamed))
            parameter.name: parameter.type.accept(this),
        })
        ..types.addAll([
          for (final formal in type.typeFormals)
            codegen.TypeReference(
              (t) => t
                ..symbol = formal.name
                ..bound = formal.bound?.accept(this),
            ),
        ]),
    );
  }

  @override
  codegen.Reference visitInterfaceType(InterfaceType type) {
    final typeArguments = type.typeArguments.map((type) => type.accept(this));
    final ref = codegen.TypeReference(
      (t) => t
        ..symbol = type.element.name
        ..url = type.uri
        ..types.addAll(typeArguments)
        ..isNullable = type.nullabilitySuffix != NullabilitySuffix.none,
    );
    return ref;
  }

  @override
  codegen.Reference visitInvalidType(InvalidType type) =>
      codegen.refer(type.getDisplayString(withNullability: false));

  @override
  codegen.Reference visitNeverType(NeverType type) => DartTypes.core.never;

  @override
  codegen.Reference visitRecordType(RecordType type) {
    return TypedefRecordType(
      // TODO(dnys1): How to handle no alias?
      symbol: type.alias!.element.name,
      url: type.alias!.element.sourceLocation.path,
      recordType: codegen.RecordType(
        (r) => r
          ..positionalFieldTypes.addAll([
            for (final parameter in type.positionalFields)
              parameter.type.accept(this),
          ])
          ..namedFieldTypes.addAll({
            for (final parameter in type.namedFields)
              parameter.name: parameter.type.accept(this),
          })
          ..isNullable = type.nullabilitySuffix != NullabilitySuffix.none,
      ),
      isNullable: type.nullabilitySuffix != NullabilitySuffix.none,
    );
  }

  @override
  codegen.Reference visitTypeParameterType(TypeParameterType type) {
    return codegen.TypeReference(
      (t) => t
        ..symbol = type.getDisplayString(withNullability: false)
        ..bound = type.bound is DynamicType ? null : type.bound.accept(this),
    );
  }

  @override
  codegen.Reference visitVoidType(VoidType type) => DartTypes.core.void$;
}
