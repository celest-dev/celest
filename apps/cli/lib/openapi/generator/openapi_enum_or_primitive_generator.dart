import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/codegen/reserved_words.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

final class OpenApiEnumOrPrimitiveGenerator {
  OpenApiEnumOrPrimitiveGenerator({
    required this.name,
    required this.enumValues,
    required this.primitiveType,
  });

  static final Logger logger = Logger('OpenApiEnumOrPrimitiveGenerator');

  final String name;
  final List<Object> enumValues;
  final OpenApiPrimitiveType primitiveType;

  final _reservedNames = <String>{};

  String _reserveName(String name) {
    name = _sanitizeEnumName(name);
    while (!_reservedNames.add(name)) {
      name = '$name\$';
    }
    return name;
  }

  String _sanitizeEnumName(String name) {
    if (name.isEmpty) {
      return r'$empty';
    }
    if (name.codeUnits.first >= 48 && name.codeUnits.first <= 57) {
      return '\$$name';
    }
    return sanitizeVariableName(name);
  }

  Spec generate() {
    return ExtensionType(
      (b) {
        b
          ..name = name
          ..constant = true
          ..primaryConstructorName = '_';

        final repType = DartTypes.core.object;
        b
          ..representationDeclaration = RepresentationDeclaration(
            (d) => d
              ..name = '_value'
              ..declaredRepresentationType = repType,
          )
          ..implements.add(repType)
          ..constructors.addAll([
            Constructor(
              (c) => c
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (p) => p
                      ..toThis = true
                      ..name = '_value'
                      ..type = primitiveType.primitiveType.typeReference,
                  ),
                ),
            ),
            Constructor(
              (c) => c
                ..name = 'fromJson'
                ..requiredParameters.add(
                  Parameter(
                    (p) => p
                      ..type = DartTypes.core.object.nullable
                      ..name = 'json',
                  ),
                )
                ..initializers.add(
                  refer('_value').assign(refer('json').nullChecked).code,
                ),
            ),
          ])
          ..fields.addAll([
            for (final enumValue in enumValues)
              Field(
                (f) => f
                  ..static = true
                  ..modifier = FieldModifier.constant
                  ..docs.add('/// `$enumValue`')
                  ..type = refer(name)
                  ..name = _reserveName(enumValue.toString().camelCase)
                  ..assignment = refer(name)
                      .constInstanceNamed('_', [literal(enumValue)]).code,
              ),
          ])
          ..methods.addAll([
            Method(
              (m) => m
                ..name = 'toJson'
                ..returns = repType
                ..lambda = true
                ..body = refer('_value').code,
            ),
            _encodeMethod,
          ]);
      },
    );
  }

  Method get _encodeMethod {
    return Method((m) {
      m
        ..name = 'encode'
        ..returns = DartTypes.core.void$
        ..annotations.add(DartTypes.meta.internal)
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..type = refer('EncodingContainer', '../encoding/encoder.dart')
              ..name = 'container',
          ),
        )
        ..lambda = true
        ..body =
            refer('container').property('write').call([refer('_value')]).code;
    });
  }
}
