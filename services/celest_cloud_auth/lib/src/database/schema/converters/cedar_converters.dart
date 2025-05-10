import 'dart:convert';

import 'package:cedar/cedar.dart';
import 'package:drift/drift.dart' hide Value;

// Typedef to avoid conflict with drift.Value in generated code.
typedef CedarValue = Value;

final class CedarEntityConverter implements TypeConverter<Entity, String> {
  const CedarEntityConverter();

  @override
  Entity fromSql(String fromDb) {
    return Entity.fromJson(jsonDecode(fromDb) as Map<String, Object?>);
  }

  @override
  String toSql(Entity value) {
    return jsonEncode(value.toJson());
  }
}

final class CedarEntityUidConverter
    implements TypeConverter<EntityUid, String> {
  const CedarEntityUidConverter();

  @override
  EntityUid fromSql(String fromDb) {
    return EntityUid.fromJson(jsonDecode(fromDb) as Map<String, Object?>);
  }

  @override
  String toSql(EntityUid value) {
    return jsonEncode(value.toJson());
  }
}

final class CedarEntityUidsConverter
    implements TypeConverter<List<EntityUid>, String> {
  const CedarEntityUidsConverter();

  @override
  List<EntityUid> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List)
        .map((json) => EntityUid.fromJson(json as Map<String, Object?>))
        .toList();
  }

  @override
  String toSql(List<EntityUid> value) {
    return jsonEncode(value.map((it) => it.toJson()).toList());
  }
}

final class CedarAttributesConverter
    implements TypeConverter<Map<String, CedarValue>, String> {
  const CedarAttributesConverter();

  @override
  Map<String, CedarValue> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as Map<Object?, Object?>)
        .cast<String, Object?>()
        .map((key, value) => MapEntry(key, CedarValue.fromJson(value)));
  }

  @override
  String toSql(Map<String, CedarValue> value) {
    return jsonEncode(value.map((key, value) => MapEntry(key, value.toJson())));
  }
}

final class CedarAuthorizationErrorsConverter
    implements TypeConverter<AuthorizationErrors, String> {
  const CedarAuthorizationErrorsConverter();

  @override
  AuthorizationErrors fromSql(String fromDb) {
    return AuthorizationErrors(
      (jsonDecode(fromDb) as List<Object?>)
          .map(
            (e) => AuthorizationException.fromJson(e as Map<String, Object?>),
          )
          .toList(),
    );
  }

  @override
  String toSql(AuthorizationErrors value) {
    return jsonEncode(
      value
          .map(
            // TODO(dnys1): Implement toJson for CedarAuthorizationError
            (e) => {'policy_id': e.policyId, 'message': e.message},
          )
          .toList(),
    );
  }
}

final class CedarAuthorizationReasonsConverter
    implements TypeConverter<List<String>, String> {
  const CedarAuthorizationReasonsConverter();

  @override
  List<String> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<Object?>).cast<String>();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

final class CedarEntityClosureConverter
    implements TypeConverter<List<Entity>, String> {
  const CedarEntityClosureConverter();

  @override
  List<Entity> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<Object?>)
        .map((e) => Entity.fromJson(e as Map<String, Object?>))
        .toList();
  }

  @override
  String toSql(List<Entity> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}

final class CedarPolicyConverter implements TypeConverter<Policy, String> {
  const CedarPolicyConverter();

  @override
  Policy fromSql(String fromDb) {
    return Policy.fromJson(jsonDecode(fromDb) as Map<String, Object?>);
  }

  @override
  String toSql(Policy value) {
    return jsonEncode(value.toJson());
  }
}
