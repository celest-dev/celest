import 'package:celest_cli/openapi/generator/openapi_encoder.dart';
import 'package:celest_cli/openapi/generator/openapi_json_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_struct_generator.dart';
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
                    ..type = DartTypes.core.object.nullable,
                ),
              )
              ..body = Block((b) {
                b.addExpression(
                  declareFinal('list').assign(
                    refer('json').asA(
                      DartTypes.core.list(DartTypes.core.object.nullable),
                    ),
                  ),
                );
                b.addExpression(
                  refer(name).newInstance([
                    OpenApiJsonGenerator()
                        .fromJson(type.primitiveType, refer('list')),
                  ]).returned,
                );
              }),
          ),
        ])
        ..fields.add(codableTypeField(name))
        ..methods.addAll([
          Method(
            (m) => m
              ..name = 'toJson'
              ..returns = DartTypes.core.list(DartTypes.core.object)
              ..body = OpenApiJsonGenerator()
                  .toJson(type.primitiveType, refer('this'))
                  .code,
          ),
          _encodeMethod,
          encodeWithMethod,
        ]),
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
              ..type = DartTypes.codable.encoder(refer('V'))
              ..name = 'encoder',
          ),
        ])
        ..lambda = false
        ..body = Block((b) {
          b.addExpression(
            declareFinal('container').assign(
              refer('encoder').property('unkeyedContainer').call(
                [],
                {},
                [DartTypes.core.string],
              ),
            ),
          );
          b.addExpression(
            refer('instance').property('forEach').call(
              [
                Method(
                  (m) => m
                    ..requiredParameters.add(
                      Parameter(
                        (p) => p
                          ..name = 'el'
                          ..type = type.itemType.typeReference,
                      ),
                    )
                    ..lambda = true
                    ..body = Block((b) {
                      b.addExpression(
                        openApiEncoder.encode(
                          type: type.itemType,
                          ref: refer('el'),
                          container: refer('container'),
                          key: null,
                        ),
                      );
                    }),
                ).closure,
              ],
            ),
          );
          b.addExpression(refer('container').property('value').returned);
        });
    });
  }
}
