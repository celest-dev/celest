import 'package:celest_cli/openapi/generator/generator.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:lib_openapi/openapi_v3.dart' as v3;

final class OpenApiSchemaGenerator implements Generator<ClassBuilder> {
  OpenApiSchemaGenerator({
    required this.name,
    required this.schema,
  });

  final String name;
  final v3.Schema schema;
  late final ClassBuilder _class = ClassBuilder()
    ..modifier = ClassModifier.final$
    ..name = name
    ..docs.addAll([
      if (schema.hasDescription()) schema.description,
    ]);

  @override
  ClassBuilder generate() {
    print('Generating schema: $name');
    print('Required: ${schema.required}');
    for (final field in schema.properties.additionalProperties) {
      _class.fields.add(
        Field(
          (b) => b
            ..modifier = FieldModifier.final$
            ..name = field.name
            ..type = openapi.schemaOrReference(field.value).rebuild(
                  (t) => t..isNullable = !schema.required.contains(field.name),
                ),
        ),
      );
    }
    _class.constructors.add(
      Constructor(
        (b) => b
          ..constant = true
          ..optionalParameters.addAll(
            schema.properties.additionalProperties.map(
              (field) => Parameter(
                (b) => b
                  ..name = field.name
                  ..named = true
                  ..toThis = true
                  ..required = schema.required.contains(field.name),
              ),
            ),
          ),
      ),
    );
    return _class;
  }
}
