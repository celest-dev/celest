import 'package:celest_cli/openapi/generator/openapi_json_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class OpenApiArrayGenerator {
  OpenApiArrayGenerator({
    required this.name,
    required this.type,
  });

  final String name;
  final OpenApiIterableInterface type;

  Class generate() {
    final itemType = type.itemType.typeReference;
    final itemTypeRef = switch (type) {
      OpenApiSetType() => DartTypes.collection.delegatingSet(itemType),
      OpenApiListType() ||
      OpenApiIterableType() =>
        DartTypes.collection.delegatingList(itemType),
    };
    return Class(
      (b) => b
        ..modifier = ClassModifier.final$
        ..name = name
        ..extend = itemTypeRef
        ..constructors.addAll([
          Constructor(
            (c) => c
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'base'
                    ..toSuper = true,
                ),
              ),
          ),
          Constructor(
            (c) => c
              ..factory = true
              ..name = 'fromJson'
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'json'
                    ..type = DartTypes.core.list(
                      DartTypes.core.object.nullable,
                    ),
                ),
              )
              ..body = refer(name).newInstance([
                OpenApiJsonGenerator()
                    .fromJson(type.primitiveType, refer('json')),
              ]).code,
          ),
        ])
        ..methods.addAll([
          Method(
            (m) => m
              ..name = 'toJson'
              ..returns = DartTypes.core.list(DartTypes.core.object)
              ..body = OpenApiJsonGenerator()
                  .toJson(type.primitiveType, refer('this'))
                  .code,
          ),
        ]),
    );
  }
}
