import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
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
        ..constructors.add(
          Constructor((c) => c..constant = true),
        );
      if (type.discriminator case final discriminator?) {
        c.methods.add(
          Method(
            (m) => m
              ..type = MethodType.getter
              ..returns = DartTypes.core.string
              ..name = discriminator.propertyName.camelCase,
          ),
        );
      }
      for (final branch in type.branches) {
        if (branch.type.typeReference.url == 'dart:core') {
          continue;
        }
        // context.after(() {
        //   context.updateDefinition(
        //     branch.type.typeReference.symbol,
        //     updateClass: (class_) {
        //       class_.implements.add(refer(name));
        //       c.constructors.add(
        //         Constructor(
        //           (c) => c
        //             ..factory = true
        //             ..name = branch.name.camelCase
        //             ..requiredParameters.add(
        //               Parameter(
        //                 (p) => p
        //                   ..type = branch.type.typeReference
        //                   ..name = branch.name.camelCase,
        //               ),
        //             )
        //             ..lambda = true
        //             ..body = refer(branch.name.camelCase).code,
        //         ),
        //       );
        //     },
        //   );
        // });
      }
    });
    return baseClass;
  }
}
