import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/codegen/reserved_words.dart';
import 'package:celest_cli/openapi/generator/openapi_struct_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

final class OpenApiEnumGenerator {
  OpenApiEnumGenerator({
    required this.name,
    required this.type,
    required this.structuralEnum,
  });

  static final Logger logger = Logger('OpenApiEnumGenerator');

  final String name;
  final OpenApiEnumType type;
  final bool structuralEnum;

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
      return r'empty$';
    }
    if (name.codeUnits.first >= 48 && name.codeUnits.first <= 57) {
      return '\$$name';
    }
    if (name == 'self') {
      return r'self$';
    }
    return sanitizeVariableName(name);
  }

  Spec generate() {
    if (structuralEnum) {
      return Enum((b) {
        b.name = name;
        b.constructors.add(
          Constructor(
            (c) => c
              ..constant = true
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'name'
                    ..type = DartTypes.core.string,
                ),
              ),
          ),
        );
        b.fields.add(
          Field(
            (f) => f
              ..modifier = FieldModifier.final$
              ..type = DartTypes.core.string
              ..name = 'name',
          ),
        );
        b.values.addAll(
          type.values.map(
            (value) => EnumValue(
              (v) => v
                ..name = _reserveName((value as String).camelCase)
                ..arguments.add(literalString(value, raw: true))
                ..docs.add('/// `$v`'),
            ),
          ),
        );
      });
    }
    return ExtensionType(
      (b) {
        b.name = name;
        b.constant = true;

        final repType = type.baseType.typeReference.nonNullable;
        b.constructors.add(
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
                refer('_').assign(refer('json').asA(repType)).code,
              ),
          ),
        );

        b.methods.addAll([
          Method(
            (m) => m
              ..name = 'toJson'
              ..returns = repType
              ..lambda = true
              ..body = refer('_').code,
          ),
          _encodeMethod,
          encodeWithMethod,
        ]);
        b.representationDeclaration = RepresentationDeclaration(
          (d) => d
            ..name = '_'
            ..declaredRepresentationType = repType,
        );
        b.implements.add(repType);
        // b.fields.add(extensionTypeSelfField(name));
        for (final value in type.values) {
          b.fields.add(
            Field(
              (f) => f
                ..static = true
                ..modifier = FieldModifier.constant
                ..docs.add('/// `$value`')
                ..type = refer(name)
                ..name = _reserveName(value.toString().camelCase)
                ..assignment = refer(name).call([literal(value)]).code,
            ),
          );
        }
      },
    );
  }

  Method get _encodeMethod {
    return Method((m) {
      m
        ..static = true
        ..name = 'encode'
        ..types.add(refer('V'))
        ..returns = refer('V')
        ..requiredParameters.addAll([
          Parameter(
            (p) => p
              ..type = refer(name)
              ..name = 'instance',
          ),
          Parameter(
            (p) => p
              ..type = DartTypes.libcoder.encoder(refer('V'))
              ..name = 'encoder',
          ),
        ])
        ..lambda = false
        ..body = refer('encoder')
            .property('encodeString')
            .call([refer('instance')])
            .returned
            .statement;
    });
  }
}
