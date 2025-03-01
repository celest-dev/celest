import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';

typedef OpenApiNameResolver = Iterable<String> Function();

final class OpenApiTypeResolutionScope {
  const OpenApiTypeResolutionScope({
    this.global = false,
    this.nameContext,
    required this.nameResolver,
    required this.url,
    this.sealedParent,
    this.mimeType,
    this.needsWrapper = false,
    this.isNullable,
  });

  final bool global;
  final String? nameContext;
  final OpenApiNameResolver nameResolver;
  final String url;
  final String? sealedParent;
  final bool needsWrapper;
  final String? mimeType;
  final bool? isNullable;

  bool get isFile => mimeType != null && mimeType!.startsWith('multipart');

  String typeName(OpenApiGeneratorContext context, OpenApiTypeSchema schema) {
    if (schema.ref != null) {
      return context.dartNames[schema.name]!;
    }
    final triedNames = <String>[];
    for (final maybeTypeName in nameResolver()) {
      triedNames.add(maybeTypeName);
      final typeName = context.tryReserveName(maybeTypeName, schema);
      if (typeName != null) {
        return typeName;
      }
    }
    context.fail(
      'Could not reserve name for schema. Tried: $triedNames.',
      additionalContext: {
        'schema': schema,
        'reservations': {
          for (final name in triedNames) name: context.reservedNames[name],
        },
      },
    );
  }

  /// If `true`, generate a proper `enum`.
  /// If `false` generate an enum-like extension type.
  ///
  /// Generally, input types should never be enums, but output types should be
  /// so that the client can be alerted by breaking changes.
  bool get structuralEnums => needsWrapper;

  OpenApiTypeResolutionScope subscope({
    OpenApiNameResolver? nameResolver,
    String? sealedParent,
    bool? isNullable,
  }) => OpenApiTypeResolutionScope(
    nameContext: nameContext,
    nameResolver: nameResolver ?? this.nameResolver,
    url: url,
    sealedParent: sealedParent,
    mimeType: mimeType,
    needsWrapper: false, // Only top-level types need wrappers.
    isNullable: isNullable,
  );
}
