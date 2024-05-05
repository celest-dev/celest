final class OpenApiTypeResolutionScope {
  const OpenApiTypeResolutionScope({
    required this.typeName,
    this.needsWrapper = false,
    this.isNullable,
  });

  final String typeName;
  final bool needsWrapper;
  final bool? isNullable;

  OpenApiTypeResolutionScope subscope(
    String name, {
    bool? isNullable,
  }) =>
      OpenApiTypeResolutionScope(
        typeName: '$typeName$name',
        needsWrapper: needsWrapper,
        isNullable: isNullable,
      );
}
