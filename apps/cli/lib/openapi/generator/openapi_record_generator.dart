import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:code_builder/code_builder.dart';

final class OpenApiRecordGenerator {
  OpenApiRecordGenerator({
    required this.name,
    required this.type,
  });

  final String name;
  final OpenApiRecordType type;

  Class generate() {
    return Class(
      (b) => b
        ..name = name
        ..extend = DartTypes.collection.delegatingMap(
          DartTypes.core.string,
          type.valueType.typeReference,
        )
        ..constructors.add(
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
        ),
    );
  }
}
