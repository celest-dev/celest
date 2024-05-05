import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/codegen/reserved_words.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

final class OpenApiEnumGenerator {
  OpenApiEnumGenerator({
    required this.name,
    required this.type,
  });

  static final Logger logger = Logger('OpenApiEnumGenerator');

  final String name;
  final OpenApiEnumType type;

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

  ExtensionType generate() {
    return ExtensionType(
      (b) {
        b.name = name;
        b.constant = true;

        final repType = type.baseType.typeReference.nonNullable;
        b.representationDeclaration = RepresentationDeclaration(
          (d) => d
            ..name = '_'
            ..declaredRepresentationType = repType,
        );
        b.implements.add(repType);
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
}
