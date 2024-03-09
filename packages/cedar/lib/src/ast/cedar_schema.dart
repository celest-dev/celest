import 'package:cedar/src/ast/cedar_entity_id.dart';
import 'package:cedar/src/util.dart';

/// Dart representation of a Cedar [schema](https://docs.cedarpolicy.com/schema/schema.html).
final class CedarSchema {
  CedarSchema({
    Map<String, CedarNamespace>? namespaces,
  }) : _namespaces = namespaces ?? {};

  final Map<String, CedarNamespace> _namespaces;

  factory CedarSchema.fromJson(Map<String, Object?> json) {
    return CedarSchema(
      namespaces: json.map(
        (name, json) => MapEntry(
          name,
          CedarNamespace.fromJson(json as Map<String, Object?>),
        ),
      ),
    );
  }

  CedarNamespace? getNamespace(String name) {
    return _namespaces[name];
  }

  void updateNamespace(
      String name, CedarNamespace Function(CedarNamespace) updates) {
    _namespaces.update(
      name,
      (value) => updates(value),
      ifAbsent: () => updates(CedarNamespace()),
    );
  }

  Map<String, Object?> toJson() => _namespaces.map(
        (name, namespace) => MapEntry(name, namespace.toJson()),
      );
}

final class CedarNamespace {
  CedarNamespace({
    Map<String, CedarEntitySchema>? entityTypes,
    Map<String, CedarActionSchema>? actionTypes,
    Map<String, CedarType>? commonTypes,
  })  : _entityTypes = entityTypes,
        _actionTypes = actionTypes,
        _commonTypes = commonTypes;

  factory CedarNamespace.fromJson(Map<String, Object?> json) {
    return CedarNamespace(
      entityTypes: (json['entityTypes'] as Map<Object?, Object?>?)
          ?.cast<String, Object?>()
          .map(
            (name, json) => MapEntry(
              name,
              CedarEntitySchema.fromJson(
                  (json as Map<Object?, Object?>).cast()),
            ),
          ),
      actionTypes: (json['actions'] as Map<Object?, Object?>?)
          ?.cast<String, Object?>()
          .map(
            (name, json) => MapEntry(
              name,
              CedarActionSchema.fromJson(
                  (json as Map<Object?, Object?>).cast()),
            ),
          ),
      commonTypes: (json['commonTypes'] as Map<Object?, Object?>?)
          ?.cast<String, Object?>()
          .map(
            (name, json) => MapEntry(
              name,
              CedarType.fromJson((json as Map<Object?, Object?>).cast()),
            ),
          ),
    );
  }

  Map<String, CedarEntitySchema>? _entityTypes;
  Map<String, CedarActionSchema>? _actionTypes;
  Map<String, CedarType>? _commonTypes;

  void addEntitySchema(String name, CedarEntitySchema entityType) {
    (_entityTypes ??= {}).update(
      name,
      (value) => throw StateError('Entity type "$name" already exists'),
      ifAbsent: () => entityType,
    );
  }

  void addActionSchema(String name, CedarActionSchema actionType) {
    (_actionTypes ??= {}).update(
      name,
      (value) => throw StateError('Action type "$name" already exists'),
      ifAbsent: () => actionType,
    );
  }

  void addCommonType(String name, CedarTypeDefinition type) {
    (_commonTypes ??= {}).update(
      name,
      (value) => throw StateError('Common type "$name" already exists'),
      ifAbsent: () => type,
    );
  }

  Map<String, Object?> toJson() => {
        if (_entityTypes != null)
          'entityTypes': _entityTypes!.map(
            (name, entityType) => MapEntry(name, entityType.toJson()),
          ),
        if (_actionTypes != null)
          'actions': _actionTypes!.map(
            (name, actionType) => MapEntry(name, actionType.toJson()),
          ),
        if (_commonTypes != null)
          'commonTypes': _commonTypes!.map(
            (name, type) => MapEntry(name, type.toJson()),
          ),
      };
}

final class CedarEntitySchema {
  const CedarEntitySchema({
    this.memberOfTypes,
    this.shape,
  });

  factory CedarEntitySchema.fromJson(Map<String, Object?> json) {
    return CedarEntitySchema(
      memberOfTypes:
          (json['memberOfTypes'] as List<Object?>?)?.cast<String>().toList(),
      shape: (json['shape'] as Map<String, Object?>?)?.let(CedarType.fromJson),
    );
  }

  final List<String>? memberOfTypes;
  final CedarType? shape;

  Map<String, Object?> toJson() => {
        if (memberOfTypes != null) 'memberOfTypes': memberOfTypes,
        if (shape != null) 'shape': shape!.toJson(),
      };
}

sealed class CedarType {
  factory CedarType.fromJson(Map<String, Object?> json) {
    switch (json) {
      case {'type': 'Boolean'}:
        return CedarBooleanType(
          required: json['required'] as bool?,
        );
      case {'type': 'String'}:
        return CedarStringType(
          required: json['required'] as bool?,
        );
      case {'type': 'Long'}:
        return CedarLongType(
          required: json['required'] as bool?,
        );
      case {'type': 'Set'}:
        return CedarSetType(
          elementType: CedarType.fromJson(
            json['element'] as Map<String, Object?>,
          ),
          required: json['required'] as bool?,
        );
      case {'type': 'Record'}:
        return CedarRecordType(
          attributes: (json['attributes'] as Map<Object?, Object?>)
              .cast<String, Object?>()
              .map(
                (name, json) => MapEntry(
                  name,
                  CedarType.fromJson(json as Map<String, Object?>),
                ),
              ),
          required: json['required'] as bool?,
          additionalAttributes: json['additionalAttributes'] as bool?,
        );
      case {'type': 'Entity'}:
        return CedarEntityType(
          entityName: json['name'] as String,
          required: json['required'] as bool?,
        );
      case {'type': 'Extension', 'name': 'ipaddr'}:
        return CedarIpAddressType(
          required: json['required'] as bool?,
        );
      case {'type': 'Extension', 'name': 'decimal'}:
        return CedarDecimalType(
          required: json['required'] as bool?,
        );
      case {'type': final String type}:
        if (json.keys.length > 1) {
          throw ArgumentError.value(json, 'json', 'Invalid Cedar type');
        }
        return CedarTypeReference(type: type);
      default:
        throw ArgumentError.value(json, 'json', 'Invalid Cedar type');
    }
  }

  const factory CedarType.boolean({
    bool required,
  }) = CedarBooleanType;

  const factory CedarType.string({
    bool required,
  }) = CedarStringType;

  const factory CedarType.long({
    bool required,
  }) = CedarLongType;

  const factory CedarType.set({
    required CedarType elementType,
    bool required,
  }) = CedarSetType;

  const factory CedarType.record({
    required Map<String, CedarType> attributes,
    bool required,
  }) = CedarRecordType;

  const factory CedarType.entity({
    required String entityName,
    bool required,
  }) = CedarEntityType;

  const factory CedarType.ipAddress({
    bool required,
  }) = CedarIpAddressType;

  const factory CedarType.decimal({
    bool required,
  }) = CedarDecimalType;

  const factory CedarType.reference({
    required String type,
  }) = CedarTypeReference;

  Map<String, Object?> toJson();
}

final class CedarTypeReference implements CedarType {
  const CedarTypeReference({
    required this.type,
  });

  factory CedarTypeReference.fromJson(Map<String, Object?> json) {
    return CedarTypeReference(type: json['type'] as String);
  }

  final String type;

  @override
  Map<String, Object?> toJson() => {
        'type': type,
      };
}

sealed class CedarTypeDefinition implements CedarType {
  const CedarTypeDefinition({
    this.required,
  });

  /// Whether a value of this type is required.
  ///
  /// Defaults to `true`.
  final bool? required;

  const factory CedarTypeDefinition.boolean({
    bool required,
  }) = CedarBooleanType;

  const factory CedarTypeDefinition.string({
    bool required,
  }) = CedarStringType;

  const factory CedarTypeDefinition.long({
    bool required,
  }) = CedarLongType;

  const factory CedarTypeDefinition.set({
    required CedarType elementType,
    bool required,
  }) = CedarSetType;

  const factory CedarTypeDefinition.record({
    required Map<String, CedarType> attributes,
    bool required,
  }) = CedarRecordType;

  const factory CedarTypeDefinition.entity({
    required String entityName,
    bool required,
  }) = CedarEntityType;

  const factory CedarTypeDefinition.ipAddress({
    bool required,
  }) = CedarIpAddressType;

  const factory CedarTypeDefinition.decimal({
    bool required,
  }) = CedarDecimalType;
}

final class CedarBooleanType extends CedarTypeDefinition {
  const CedarBooleanType({
    super.required,
  });

  @override
  Map<String, Object?> toJson() => {
        'type': 'Boolean',
        if (required != null) 'required': required,
      };
}

final class CedarStringType extends CedarTypeDefinition {
  const CedarStringType({
    super.required,
  });

  @override
  Map<String, Object?> toJson() => {
        'type': 'String',
        if (required != null) 'required': required,
      };
}

final class CedarLongType extends CedarTypeDefinition {
  const CedarLongType({
    super.required,
  });

  @override
  Map<String, Object?> toJson() => {
        'type': 'Long',
        if (required != null) 'required': required,
      };
}

final class CedarSetType extends CedarTypeDefinition {
  const CedarSetType({
    required this.elementType,
    super.required,
  });

  /// The type of the elements in the set.
  final CedarType elementType;

  @override
  Map<String, Object?> toJson() => {
        'type': 'Set',
        if (required != null) 'required': required,
        'element': elementType.toJson(),
      };
}

final class CedarRecordType extends CedarTypeDefinition {
  const CedarRecordType({
    required this.attributes,
    super.required,
    this.additionalAttributes,
  });

  final Map<String, CedarType> attributes;
  // TODO: What is this used for?
  final bool? additionalAttributes;

  @override
  Map<String, Object?> toJson() => {
        'type': 'Record',
        if (required != null) 'required': required,
        'attributes': attributes.map(
          (name, type) => MapEntry(name, type.toJson()),
        ),
        if (additionalAttributes != null)
          'additionalAttributes': additionalAttributes,
      };
}

final class CedarEntityType extends CedarTypeDefinition {
  const CedarEntityType({
    required this.entityName,
    super.required,
  });

  /// The namespaced name of the entity type.
  final String entityName;

  @override
  Map<String, Object?> toJson() => {
        'type': 'Entity',
        if (required != null) 'required': required,
        'name': entityName,
      };
}

final class CedarIpAddressType extends CedarTypeDefinition {
  const CedarIpAddressType({
    super.required,
  });

  @override
  Map<String, Object?> toJson() => {
        'type': 'Extension',
        if (required != null) 'required': required,
        'name': 'ipaddr',
      };
}

final class CedarDecimalType extends CedarTypeDefinition {
  const CedarDecimalType({
    super.required,
  });

  @override
  Map<String, Object?> toJson() => {
        'type': 'Extension',
        if (required != null) 'required': required,
        'name': 'decimal',
      };
}

final class CedarActionSchema {
  const CedarActionSchema({
    this.memberOf,
    required this.appliesTo,
  });

  factory CedarActionSchema.fromJson(Map<String, Object?> json) {
    return CedarActionSchema(
      memberOf: (json['memberOf'] as List<Object?>?)
          ?.map((json) => CedarEntityId.fromJson(json as Map<String, Object?>))
          .toList(),
      appliesTo: switch (json['appliesTo']) {
        null => null,
        final Map<Object?, Object?> json => CedarActionAppliesTo.fromJson(
            json.cast(),
          ),
        _ => throw ArgumentError.value(
            json,
            'json',
            'Invalid Cedar action schema',
          ),
      },
    );
  }

  final List<CedarEntityId>? memberOf;
  final CedarActionAppliesTo? appliesTo;

  Map<String, Object?> toJson() => {
        'memberOf': memberOf?.map((e) => e.toJson()).toList(),
        'appliesTo': appliesTo?.toJson(),
      };
}

final class CedarActionAppliesTo {
  const CedarActionAppliesTo({
    this.principalTypes,
    this.resourceTypes,
    this.contextType,
  });

  factory CedarActionAppliesTo.fromJson(Map<String, Object?> json) {
    return CedarActionAppliesTo(
      principalTypes: (json['principalTypes'] as List<Object?>?)?.cast(),
      resourceTypes: (json['resourceTypes'] as List<Object?>?)?.cast(),
      contextType: json['context'] == null
          ? null
          : CedarType.fromJson(
              (json['context'] as Map<Object?, Object?>).cast(),
            ),
    );
  }

  final List<String>? principalTypes;
  final List<String>? resourceTypes;

  /// Must be a [CedarRecordType] or a [CedarTypeReference] to a
  /// [CedarRecordType].
  final CedarType? contextType;

  Map<String, Object?> toJson() => {
        'principalTypes': principalTypes,
        'resourceTypes': resourceTypes,
        if (contextType != null) 'context': contextType!.toJson(),
      };
}
