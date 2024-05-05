import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart';

final class StripeOpenApiGeneratorContext extends OpenApiGeneratorContext {
  StripeOpenApiGeneratorContext({
    required super.document,
    super.apiName,
  }) {
    // Ensure generated.
    stripeResource;
    stripeEvent;
  }

  /// A map from path -> contextual operation name.
  final stripeOperationNames = <(String, OpenApiOperationType), String>{};

  /// Dart names of Stripe event types.
  final stripeEventTypes = <String>{};

  @override
  Iterable<TypeReference> structImplements(OpenApiStructTypeSchema schema) {
    return {
      if (schema.extensions['x-stripeResource']?.value
          case {'polymorphic_groups': final List<Object?> polymorphicGroups})
        ...polymorphicGroups.map(
          (group) => dartRefs[group]!.toTypeReference,
        ),
      if (schema.extensions['x-stripeEvent'] != null) stripeEvent,
    };
  }

  @override
  String? urlOf(String dartName) =>
      stripeEventTypes.contains(dartName) ? 'events.dart' : null;

  late final TypeReference stripeResource = run(() {
    registerSpec(
      'StripeResource',
      'models.dart',
      () => Class(
        (c) => c
          ..modifier = ClassModifier.final$
          ..name = 'StripeResource'
          ..constructors.add(
            Constructor(
              (ctor) {
                ctor
                  ..constant = true
                  ..optionalParameters.add(
                    Parameter(
                      (p) => p
                        ..name = 'id'
                        ..named = true
                        ..required = true
                        ..toThis = true,
                    ),
                  );
              },
            ),
          )
          ..fields.addAll([
            Field(
              (f) => f
                ..modifier = FieldModifier.final$
                // TODO: Should be non-null but `invoice` is nullable for some reason...
                // May cause problems with invoices
                ..type = DartTypes.core.string
                ..name = 'id',
            ),
          ])
          ..methods.add(
            Method(
              (m) => m
                ..returns = DartTypes.core.map(
                  DartTypes.core.string,
                  DartTypes.core.object.nullable,
                )
                ..name = 'toJson'
                ..lambda = true
                ..body = literalMap({'id': refer('id')}).code,
            ),
          ),
      ),
    );
    return refer(reserveName('StripeResource'), 'models.dart').toTypeReference;
  });

  late final TypeReference stripeEvent = run(() {
    registerSpec(
      'StripeEvent',
      'events.dart',
      () => Class(
        (c) => c
          ..sealed = true
          ..name = 'StripeEvent',
      ),
    );
    return refer(reserveName('StripeEvent'), 'events.dart').toTypeReference;
  });
}
