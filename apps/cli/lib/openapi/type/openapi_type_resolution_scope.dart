final class OpenApiTypeResolutionScope {
  const OpenApiTypeResolutionScope({
    required this.typeName,
    required this.url,
    this.sealedParent,
    this.needsWrapper = false,
    this.isNullable,
  });

  final String typeName;
  final String url;
  final String? sealedParent;
  final bool needsWrapper;
  final bool? isNullable;

  /// If `true`, generate a proper `enum`.
  /// If `false` generate an enum-like extension type.
  ///
  /// Generally, input types should never be enums, but output types should be
  /// so that the client can be alerted by breaking changes.
  bool get structuralEnums => needsWrapper;

  OpenApiTypeResolutionScope subscope(
    String name, {
    String? sealedParent,
    bool? isNullable,
  }) =>
      OpenApiTypeResolutionScope(
        typeName: '$typeName$name',
        url: url,
        sealedParent: sealedParent,
        needsWrapper: false, // Only top-level types need wrappers.
        isNullable: isNullable,
      );
}
