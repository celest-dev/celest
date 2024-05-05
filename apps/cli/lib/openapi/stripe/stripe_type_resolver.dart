import 'package:celest_cli/openapi/stripe/stripe_generator_context.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema_resolver.dart';

final class StripeTypeResolver extends OpenApiTypeSchemaResolver {
  StripeTypeResolver({
    required StripeOpenApiGeneratorContext super.context,
  });
}
