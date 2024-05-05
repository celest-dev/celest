import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

// need a way to store field name mappings
// need a way to store field type mappings
final class OpenApiStructGenerator {
  OpenApiStructGenerator({
    required this.name,
    required this.type,
  });

  static final Logger logger = Logger('OpenApiSchemaGenerator');

  // final Map<String, String> _fieldNames = {};
  // String _dartFieldName(v3.NamedSchemaOrReference field) {
  //   if (_fieldNames.containsKey(field.name)) {
  //     return _fieldNames[field.name]!;
  //   }
  //   var candidate = field.name.camelCase;
  //   // if (field.name.startsWith('_')) {
  //   //   candidate = '\$_$candidate';
  //   // }
  //   // if (field.name.endsWith('_')) {
  //   //   candidate = '${candidate}_';
  //   // }
  //   final reserved = _fieldNames.values.toSet();
  //   if (!reserved.add(candidate)) {
  //     var i = 1;
  //     while (!reserved.add('$candidate$i')) {
  //       i++;
  //     }
  //     candidate = '$candidate$i';
  //   }
  //   _fieldNames[field.name] = candidate;
  //   return candidate;
  // }

  final String name;
  final OpenApiStructType type;
  late final ClassBuilder _class = ClassBuilder()
    ..modifier = ClassModifier.final$
    ..name = name
    ..docs.addAll([if (type.docs case final docs? when docs.isNotEmpty) docs]);

  Class generate() {
    logger.finest('Generating schema: $name');
    if (type.superType is! OpenApiAnyType) {
      _class.extend = type.superType.typeReference.nonNullable;
    }
    final ctor = ConstructorBuilder()
      ..constant = true
      ..docs.addAll([
        if (type.docs case final docs? when docs.isNotEmpty) docs,
      ]);
    for (final OpenApiField(:name, :dartName, type: fieldType)
        in type.fields.values) {
      if (type.discriminator?.propertyName == name &&
          type.superType is! OpenApiAnyType) {
        ctor.initializers.add(
          refer('super').call([], {dartName: literalString(this.name)}).code,
        );
      } else {
        if (fieldType is! OpenApiSingleValueType) {
          ctor.optionalParameters.add(
            Parameter(
              (b) => b
                ..name = dartName
                ..named = true
                ..toThis = true
                ..required = !fieldType.isNullable,
            ),
          );
        }
        _class.fields.add(
          Field((b) {
            b
              ..modifier = FieldModifier.final$
              ..name = dartName
              ..type = fieldType.typeReference
              ..docs.addAll([
                if (fieldType.docs case final docs? when docs.isNotEmpty) docs,
              ]);
            if (fieldType case OpenApiSingleValueType(:final value)) {
              b.assignment = literal(value).code;
            }
          }),
        );
      }
    }
    _class.constructors.add(ctor.build());
    return _class.build();
  }
}
