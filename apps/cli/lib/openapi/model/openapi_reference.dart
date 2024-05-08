part of 'openapi_v3.dart';

sealed class OpenApiComponentOrReference<T extends OpenApiComponent<T>> {
  T resolve(OpenApiComponents components);
}

sealed class OpenApiReference<T extends OpenApiComponent<T>>
    implements OpenApiComponentOrReference<T> {
  /// The reference identifier.
  ///
  /// This MUST be in the form of a URI.
  String get ref;
  String get name;

  /// A short summary which by default SHOULD override that of the referenced
  /// component.
  ///
  /// If the referenced object-type does not allow a summary field, then this
  /// field has no effect.
  String? get summary;

  /// A description which by default SHOULD override that of the referenced
  /// component.
  ///
  /// CommonMark syntax MAY be used for rich text representation. If the
  /// referenced object-type does not allow a description field, then this
  /// field has no effect.
  String? get description;
}

abstract class OpenApiHeaderReference
    implements
        Built<OpenApiHeaderReference, OpenApiHeaderReferenceBuilder>,
        OpenApiReference<OpenApiHeader> {
  factory OpenApiHeaderReference({
    required String ref,
    required String name,
    String? summary,
    String? description,
  }) {
    return _$OpenApiHeaderReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
    );
  }

  factory OpenApiHeaderReference.build([
    void Function(OpenApiHeaderReferenceBuilder) updates,
  ]) = _$OpenApiHeaderReference;

  OpenApiHeaderReference._();

  @override
  OpenApiHeader resolve(OpenApiComponents components) {
    return components.headers[name]!;
  }
}

abstract class OpenApiSchemaReference
    implements
        Built<OpenApiSchemaReference, OpenApiSchemaReferenceBuilder>,
        OpenApiReference<OpenApiSchema> {
  factory OpenApiSchemaReference({
    required String ref,
    required String name,
    String? summary,
    String? description,
  }) {
    return _$OpenApiSchemaReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
    );
  }

  factory OpenApiSchemaReference.build([
    void Function(OpenApiSchemaReferenceBuilder) updates,
  ]) = _$OpenApiSchemaReference;

  OpenApiSchemaReference._();

  @override
  OpenApiSchema resolve(OpenApiComponents components) {
    throw UnimplementedError();
    // return components.schemas[name]!;
  }
}

abstract class OpenApiParameterReference
    implements
        Built<OpenApiParameterReference, OpenApiParameterReferenceBuilder>,
        OpenApiReference<OpenApiParameter> {
  factory OpenApiParameterReference({
    required String ref,
    required String name,
    String? summary,
    String? description,
  }) {
    return _$OpenApiParameterReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
    );
  }

  factory OpenApiParameterReference.build([
    void Function(OpenApiParameterReferenceBuilder) updates,
  ]) = _$OpenApiParameterReference;

  OpenApiParameterReference._();

  @override
  OpenApiParameter resolve(OpenApiComponents components) {
    return components.parameters[name]!;
  }
}

abstract class OpenApiRequestBodyReference
    implements
        Built<OpenApiRequestBodyReference, OpenApiRequestBodyReferenceBuilder>,
        OpenApiReference<OpenApiRequestBody> {
  factory OpenApiRequestBodyReference({
    required String ref,
    required String name,
    String? summary,
    String? description,
  }) {
    return _$OpenApiRequestBodyReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
    );
  }

  factory OpenApiRequestBodyReference.build([
    void Function(OpenApiRequestBodyReferenceBuilder) updates,
  ]) = _$OpenApiRequestBodyReference;

  OpenApiRequestBodyReference._();

  @override
  OpenApiRequestBody resolve(OpenApiComponents components) {
    return components.requestBodies[name]!;
  }
}

abstract class OpenApiResponseReference
    implements
        Built<OpenApiResponseReference, OpenApiResponseReferenceBuilder>,
        OpenApiReference<OpenApiResponse> {
  factory OpenApiResponseReference({
    required String ref,
    required String name,
    String? summary,
    String? description,
  }) {
    return _$OpenApiResponseReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
    );
  }

  factory OpenApiResponseReference.build([
    void Function(OpenApiResponseReferenceBuilder) updates,
  ]) = _$OpenApiResponseReference;

  OpenApiResponseReference._();

  @override
  OpenApiResponse resolve(OpenApiComponents components) {
    return components.responses[name]!;
  }
}

// abstract class OpenApiSecuritySchemeReference
//     implements
//         Built<OpenApiSecuritySchemeReference, OpenApiSecuritySchemeReferenceBuilder>,
//         OpenApiReference<OpenApiSecurityScheme> {
//   factory OpenApiSecuritySchemeReference({
//     required String ref,
//     required String name,
//     String? summary,
//     String? description,
//   }) {
//     return _$OpenApiSecuritySchemeReference._(
//       ref: ref,
//       name: name,
//       summary: summary,
//       description: description,
//     );
//   }

//   factory OpenApiSecuritySchemeReference.build([
//     void Function(OpenApiSecuritySchemeReferenceBuilder) updates,
//   ]) = _$OpenApiSecuritySchemeReference;

//   OpenApiSecuritySchemeReference._();

//   @override
//   OpenApiSecurityScheme resolve(OpenApiComponents components) {
//     return components.securitySchemes[name];
//   }
// }

// abstract class OpenApiLinkReference
//     implements
//         Built<OpenApiLinkReference, OpenApiLinkReferenceBuilder>,
//         OpenApiReference<OpenApiLink> {
//   factory OpenApiLinkReference({
//     required String ref,
//     required String name,
//     String? summary,
//     String? description,
//   }) {
//     return _$OpenApiLinkReference._(
//       ref: ref,
//       name: name,
//       summary: summary,
//       description: description,
//     );
//   }

//   factory OpenApiLinkReference.build([
//     void Function(OpenApiLinkReferenceBuilder) updates,
//   ]) = _$OpenApiLinkReference;

//   OpenApiLinkReference._();

//   @override
//   OpenApiLink resolve(OpenApiComponents components) {
//     return components.links[name];
//   }
// }

// abstract class OpenApiCallbackReference
//     implements
//         Built<OpenApiCallbackReference, OpenApiCallbackReferenceBuilder>,
//         OpenApiReference<OpenApiCallback> {
//   factory OpenApiCallbackReference({
//     required String ref,
//     required String name,
//     String? summary,
//     String? description,
//   }) {
//     return _$OpenApiCallbackReference._(
//       ref: ref,
//       name: name,
//       summary: summary,
//       description: description,
//     );
//   }

//   factory OpenApiCallbackReference.build([
//     void Function(OpenApiCallbackReferenceBuilder) updates,
//   ]) = _$OpenApiCallbackReference;

//   OpenApiCallbackReference._();

//   @override
//   OpenApiCallback resolve(OpenApiComponents components) {
//     return components.callbacks[name];
//   }
// }
