part of 'openapi_ast.dart';

abstract class OpenApiComponentOrRef<T extends OpenApiComponent<T>>
    implements
        Built<OpenApiComponentOrRef<T>, OpenApiComponentOrRefBuilder<T>>,
        OpenApiNode {
  factory OpenApiComponentOrRef.component({
    required T component,
    String? ref,
  }) {
    return _$OpenApiComponentOrRef<T>._(
      ref: ref,
      component: component,
    );
  }

  factory OpenApiComponentOrRef.reference({
    required OpenApiReference<T> reference,
    String? ref,
    YamlNode? node,
  }) {
    return _$OpenApiComponentOrRef<T>._(
      ref: ref,
      node: node,
      reference: reference,
    );
  }

  factory OpenApiComponentOrRef.build([
    void Function(OpenApiComponentOrRefBuilder<T>) updates,
  ]) = _$OpenApiComponentOrRef<T>;

  OpenApiComponentOrRef._();

  @BuiltValueHook(finalizeBuilder: true)
  static void
      _finalize<T extends OpenApiComponent<T>, R extends OpenApiReference<T>>(
    OpenApiComponentOrRefBuilder<T> builder,
  ) {
    final setNeither = builder.component == null && builder.reference == null;
    final setBoth = builder.component != null && builder.reference != null;
    if (setNeither || setBoth) {
      throw ArgumentError(
        'Exactly one of component or reference must be set',
      );
    }
  }

  @override
  String? get ref;

  T? get component;
  OpenApiReference<T>? get reference;

  T resolve(OpenApiComponents components) {
    if (component case final component?) {
      return component;
    }
    final reference = this.reference!;
    return reference.resolve(components).rebuild(
      (b) {
        if (reference.summary case final summary) {
          b.summary = summary;
        }
        if (reference.description case final description) {
          b.description = description;
        }
      },
    );
  }

  @override
  R accept<R>(OpenApiVisitor<R> visitor) {
    if (component case final component?) {
      return component.accept(visitor);
    }
    return reference!.accept(visitor);
  }

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) {
    if (component case final component?) {
      return component.acceptWithArg(visitor, arg);
    }
    return reference!.acceptWithArg(visitor, arg);
  }
}

sealed class OpenApiReference<T extends OpenApiComponent<T>>
    implements OpenApiNode {
  /// The reference identifier.
  ///
  /// This MUST be in the form of a URI.
  @override
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

  T resolve(OpenApiComponents components);
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
    YamlNode? node,
  }) {
    return _$OpenApiHeaderReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
      node: node,
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

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitReference(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) {
    return visitor.visitReference(this, arg);
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
    YamlNode? node,
  }) {
    return _$OpenApiSchemaReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
      node: node,
    );
  }

  factory OpenApiSchemaReference.build([
    void Function(OpenApiSchemaReferenceBuilder) updates,
  ]) = _$OpenApiSchemaReference;

  OpenApiSchemaReference._();

  @override
  OpenApiSchema resolve(OpenApiComponents components) {
    return components.schemas[name]!;
  }

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitReference(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) {
    return visitor.visitReference(this, arg);
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
    YamlNode? node,
  }) {
    return _$OpenApiParameterReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
      node: node,
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

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitReference(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) {
    return visitor.visitReference(this, arg);
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
    YamlNode? node,
  }) {
    return _$OpenApiRequestBodyReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
      node: node,
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

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitReference(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) {
    return visitor.visitReference(this, arg);
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
    YamlNode? node,
  }) {
    return _$OpenApiResponseReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
      node: node,
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

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitReference(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) {
    return visitor.visitReference(this, arg);
  }
}

abstract class OpenApiPathItemReference
    implements
        Built<OpenApiPathItemReference, OpenApiPathItemReferenceBuilder>,
        OpenApiReference<OpenApiPathItem> {
  factory OpenApiPathItemReference({
    required String ref,
    required String name,
    String? summary,
    String? description,
    YamlNode? node,
  }) {
    return _$OpenApiPathItemReference._(
      ref: ref,
      name: name,
      summary: summary,
      description: description,
      node: node,
    );
  }

  factory OpenApiPathItemReference.build([
    void Function(OpenApiPathItemReferenceBuilder) updates,
  ]) = _$OpenApiPathItemReference;

  OpenApiPathItemReference._();

  @override
  OpenApiPathItem resolve(OpenApiComponents components) {
    return components.paths[name]!;
  }

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitReference(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) {
    return visitor.visitReference(this, arg);
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
