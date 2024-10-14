import 'dart:convert';

import 'package:celest_core/celest_core.dart';
import 'package:drift/drift.dart';

export 'package:celest_core/celest_core.dart' show User, Email, PhoneNumber;

final class EmailConverter implements TypeConverter<Email, String> {
  const EmailConverter();

  @override
  Email fromSql(String fromDb) {
    return Email.fromJson(jsonDecode(fromDb) as Map<String, Object?>);
  }

  @override
  String toSql(Email value) {
    return jsonEncode(value.toJson());
  }
}

final class EmailsConverter implements TypeConverter<List<Email>, String> {
  const EmailsConverter();

  @override
  List<Email> fromSql(String fromDb) {
    final json = jsonDecode(fromDb) as List<Object?>;
    return json.map((e) => Email.fromJson(e as Map<String, Object?>)).toList();
  }

  @override
  String toSql(List<Email> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}

final class PhoneNumberConverter implements TypeConverter<PhoneNumber, String> {
  const PhoneNumberConverter();

  @override
  PhoneNumber fromSql(String fromDb) {
    return PhoneNumber.fromJson(jsonDecode(fromDb) as Map<String, Object?>);
  }

  @override
  String toSql(PhoneNumber value) {
    return jsonEncode(value.toJson());
  }
}

final class PhoneNumbersConverter
    implements TypeConverter<List<PhoneNumber>, String> {
  const PhoneNumbersConverter();

  @override
  List<PhoneNumber> fromSql(String fromDb) {
    final json = jsonDecode(fromDb) as List<Object?>;
    return json
        .map((pn) => PhoneNumber.fromJson(pn as Map<String, Object?>))
        .toList();
  }

  @override
  String toSql(List<PhoneNumber> value) {
    return jsonEncode(value.map((pn) => pn.toJson()).toList());
  }
}
