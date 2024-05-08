import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

// need a way to store field name mappings
// need a way to store field type mappings
final class OpenApiUnionGenerator {
  OpenApiUnionGenerator({
    required this.name,
    required this.context,
    required this.type,
  });

  static final Logger logger = Logger('OpenApiSchemaGenerator');

  final String name;
  final OpenApiGeneratorContext context;
  final OpenApiSealedType type;

  Class generate() {
    logger.finest('Generating union: $name');
    final baseClass = Class((c) {
      c
        ..name = name
        ..sealed = true
        ..constructors.addAll([
          Constructor((c) => c..constant = true),
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
                final map = declareFinal('map').assign(
                  refer('json')
                      .asA(DartTypes.core.map())
                      .property('cast')
                      .call([], {}, [
                    DartTypes.core.string,
                    DartTypes.core.object.nullable,
                  ]),
                );
                b.addExpression(map);
                switch (type.discriminator) {
                  case FieldDiscriminator(:final wireName):
                    b.addExpression(
                      declareFinal('type').assign(
                        refer('map')
                            .index(literalString(wireName))
                            .asA(DartTypes.core.string),
                      ),
                    );
                    b.addExpression(
                      declareFinal('factory')
                          .assign(refer(r'$mapping').index(refer('type'))),
                    );
                    b.statements.add(
                      DartTypes.core.argumentError
                          .newInstance([
                            CodeExpression(
                              Code('\'Unknown type of $name: "\$type"\''),
                            ),
                          ])
                          .thrown
                          .wrapWithBlockIf(
                            refer('factory').equalTo(literalNull),
                          ),
                    );
                    b.addExpression(
                      refer('factory').call([refer('map')]).returned,
                    );
                  case TypeDiscriminator():
                    // b.statements.add(
                    //   refer('json')
                    //       .property(type.discriminator.propertyName.camelCase)
                    //       .switch_(
                    //     type.branches.map((branch) {
                    //       final branchType = branch.type.typeReference;
                    //       return Code(
                    //         'case ${literal(branch.name)}: return ${branchType.symbol}.fromJson(json);',
                    //       );
                    //     }),
                    //     defaultCase: const Code(
                    //       'throw UnsupportedError(\'Unknown discriminator\');',
                    //     ),
                    //   ),
                    // );
                    b.addExpression(
                      DartTypes.core.unimplementedError.newInstance([]).thrown,
                    );
                }
              }),
          ),
        ])
        ..methods.addAll([
          if (type.discriminator case FieldDiscriminator(:final dartName))
            Method(
              (m) => m
                ..type = MethodType.getter
                ..returns = DartTypes.core.string
                ..name = dartName,
            ),
          Method(
            (m) => m
              ..name = 'toJson'
              ..returns = DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.object.nullable,
              ),
          ),
          _encodeMethod,
        ]);
      if (type.discriminator case FieldDiscriminator(:final mapping)) {
        final mappingField = Field(
          (f) => f
            ..static = true
            ..modifier = FieldModifier.constant
            ..name = r'$mapping'
            ..type = DartTypes.core.map(
              DartTypes.core.string,
              FunctionType(
                (f) => f
                  ..returnType = refer(name)
                  ..requiredParameters.add(
                    DartTypes.core.object.nullable,
                  ),
              ),
            )
            ..assignment = literalConstMap(
              mapping
                  .map(
                    (value, subtype) => MapEntry(
                      literalString(value),
                      subtype.typeReference.nonNullable.property('fromJson'),
                    ),
                  )
                  .toMap(),
            ).code,
        );
        c.fields.add(mappingField);
        mapping.forEach((_, subtype) {
          context.implement(
            subtype.schema.name ?? subtype.typeReference.symbol,
            refer(name),
          );
        });
      }
    });
    return baseClass;
  }

  Method get _encodeMethod {
    return Method((m) {
      m
        ..name = 'encodeInto'
        ..returns = DartTypes.core.void$
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..type = refer('EncodingContainer', 'src/encoding/encoder.dart')
              ..name = 'container',
          ),
        );
    });
  }

  // // Method get _encodeMethod {
  // //   return Method((m) {
  // //     m
  // //       ..name = 'encodeInto'
  //
  // //       ..returns = DartTypes.core.map(
  // //         DartTypes.core.string,
  // //         DartTypes.core.object.nullable,
  // //       )
  // //       ..requiredParameters.add(
  // //         Parameter(
  // //           (p) => p
  // //             ..type = refer('Encoder', 'src/encoding/encoder.dart')
  // //             ..name = 'encoder',
  // //         ),
  // //       );
  // //   });
  // }
}
