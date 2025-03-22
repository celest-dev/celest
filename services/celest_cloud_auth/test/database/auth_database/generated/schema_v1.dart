// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Users extends Table with TableInfo<Users, UsersData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> givenName = GeneratedColumn<String>(
      'given_name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> familyName = GeneratedColumn<String>(
      'family_name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> timeZone = GeneratedColumn<String>(
      'time_zone', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
      'language_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<double> createTime = GeneratedColumn<double>(
      'create_time', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
      defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final GeneratedColumn<double> updateTime = GeneratedColumn<double>(
      'update_time', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        givenName,
        familyName,
        timeZone,
        languageCode,
        createTime,
        updateTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UsersData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      givenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}given_name']),
      familyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}family_name']),
      timeZone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_zone']),
      languageCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_code']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}update_time']),
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UsersData extends DataClass implements Insertable<UsersData> {
  final String userId;
  final String? givenName;
  final String? familyName;
  final String? timeZone;
  final String? languageCode;
  final double createTime;
  final double? updateTime;
  const UsersData(
      {required this.userId,
      this.givenName,
      this.familyName,
      this.timeZone,
      this.languageCode,
      required this.createTime,
      this.updateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || givenName != null) {
      map['given_name'] = Variable<String>(givenName);
    }
    if (!nullToAbsent || familyName != null) {
      map['family_name'] = Variable<String>(familyName);
    }
    if (!nullToAbsent || timeZone != null) {
      map['time_zone'] = Variable<String>(timeZone);
    }
    if (!nullToAbsent || languageCode != null) {
      map['language_code'] = Variable<String>(languageCode);
    }
    map['create_time'] = Variable<double>(createTime);
    if (!nullToAbsent || updateTime != null) {
      map['update_time'] = Variable<double>(updateTime);
    }
    return map;
  }

  factory UsersData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersData(
      userId: serializer.fromJson<String>(json['userId']),
      givenName: serializer.fromJson<String?>(json['givenName']),
      familyName: serializer.fromJson<String?>(json['familyName']),
      timeZone: serializer.fromJson<String?>(json['timeZone']),
      languageCode: serializer.fromJson<String?>(json['languageCode']),
      createTime: serializer.fromJson<double>(json['createTime']),
      updateTime: serializer.fromJson<double?>(json['updateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'givenName': serializer.toJson<String?>(givenName),
      'familyName': serializer.toJson<String?>(familyName),
      'timeZone': serializer.toJson<String?>(timeZone),
      'languageCode': serializer.toJson<String?>(languageCode),
      'createTime': serializer.toJson<double>(createTime),
      'updateTime': serializer.toJson<double?>(updateTime),
    };
  }

  UsersData copyWith(
          {String? userId,
          Value<String?> givenName = const Value.absent(),
          Value<String?> familyName = const Value.absent(),
          Value<String?> timeZone = const Value.absent(),
          Value<String?> languageCode = const Value.absent(),
          double? createTime,
          Value<double?> updateTime = const Value.absent()}) =>
      UsersData(
        userId: userId ?? this.userId,
        givenName: givenName.present ? givenName.value : this.givenName,
        familyName: familyName.present ? familyName.value : this.familyName,
        timeZone: timeZone.present ? timeZone.value : this.timeZone,
        languageCode:
            languageCode.present ? languageCode.value : this.languageCode,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime.present ? updateTime.value : this.updateTime,
      );
  UsersData copyWithCompanion(UsersCompanion data) {
    return UsersData(
      userId: data.userId.present ? data.userId.value : this.userId,
      givenName: data.givenName.present ? data.givenName.value : this.givenName,
      familyName:
          data.familyName.present ? data.familyName.value : this.familyName,
      timeZone: data.timeZone.present ? data.timeZone.value : this.timeZone,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersData(')
          ..write('userId: $userId, ')
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('timeZone: $timeZone, ')
          ..write('languageCode: $languageCode, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, givenName, familyName, timeZone,
      languageCode, createTime, updateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersData &&
          other.userId == this.userId &&
          other.givenName == this.givenName &&
          other.familyName == this.familyName &&
          other.timeZone == this.timeZone &&
          other.languageCode == this.languageCode &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime);
}

class UsersCompanion extends UpdateCompanion<UsersData> {
  final Value<String> userId;
  final Value<String?> givenName;
  final Value<String?> familyName;
  final Value<String?> timeZone;
  final Value<String?> languageCode;
  final Value<double> createTime;
  final Value<double?> updateTime;
  final Value<int> rowid;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.givenName = const Value.absent(),
    this.familyName = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String userId,
    this.givenName = const Value.absent(),
    this.familyName = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<UsersData> custom({
    Expression<String>? userId,
    Expression<String>? givenName,
    Expression<String>? familyName,
    Expression<String>? timeZone,
    Expression<String>? languageCode,
    Expression<double>? createTime,
    Expression<double>? updateTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (givenName != null) 'given_name': givenName,
      if (familyName != null) 'family_name': familyName,
      if (timeZone != null) 'time_zone': timeZone,
      if (languageCode != null) 'language_code': languageCode,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? userId,
      Value<String?>? givenName,
      Value<String?>? familyName,
      Value<String?>? timeZone,
      Value<String?>? languageCode,
      Value<double>? createTime,
      Value<double?>? updateTime,
      Value<int>? rowid}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      timeZone: timeZone ?? this.timeZone,
      languageCode: languageCode ?? this.languageCode,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (givenName.present) {
      map['given_name'] = Variable<String>(givenName.value);
    }
    if (familyName.present) {
      map['family_name'] = Variable<String>(familyName.value);
    }
    if (timeZone.present) {
      map['time_zone'] = Variable<String>(timeZone.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<double>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<double>(updateTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('timeZone: $timeZone, ')
          ..write('languageCode: $languageCode, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarTypes extends Table with TableInfo<CedarTypes, CedarTypesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarTypes(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> fqn = GeneratedColumn<String>(
      'fqn', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  @override
  List<GeneratedColumn> get $columns => [fqn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_types';
  @override
  Set<GeneratedColumn> get $primaryKey => {fqn};
  @override
  CedarTypesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarTypesData(
      fqn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fqn'])!,
    );
  }

  @override
  CedarTypes createAlias(String alias) {
    return CedarTypes(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CedarTypesData extends DataClass implements Insertable<CedarTypesData> {
  final String fqn;
  const CedarTypesData({required this.fqn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['fqn'] = Variable<String>(fqn);
    return map;
  }

  factory CedarTypesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CedarTypesData(
      fqn: serializer.fromJson<String>(json['fqn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fqn': serializer.toJson<String>(fqn),
    };
  }

  CedarTypesData copyWith({String? fqn}) => CedarTypesData(
        fqn: fqn ?? this.fqn,
      );
  CedarTypesData copyWithCompanion(CedarTypesCompanion data) {
    return CedarTypesData(
      fqn: data.fqn.present ? data.fqn.value : this.fqn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarTypesData(')
          ..write('fqn: $fqn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => fqn.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CedarTypesData && other.fqn == this.fqn);
}

class CedarTypesCompanion extends UpdateCompanion<CedarTypesData> {
  final Value<String> fqn;
  final Value<int> rowid;
  const CedarTypesCompanion({
    this.fqn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CedarTypesCompanion.insert({
    required String fqn,
    this.rowid = const Value.absent(),
  }) : fqn = Value(fqn);
  static Insertable<CedarTypesData> custom({
    Expression<String>? fqn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (fqn != null) 'fqn': fqn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CedarTypesCompanion copyWith({Value<String>? fqn, Value<int>? rowid}) {
    return CedarTypesCompanion(
      fqn: fqn ?? this.fqn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (fqn.present) {
      map['fqn'] = Variable<String>(fqn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarTypesCompanion(')
          ..write('fqn: $fqn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarEntities extends Table
    with TableInfo<CedarEntities, CedarEntitiesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarEntities(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES cedar_types(fqn)');
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> attributeJson = GeneratedColumn<String>(
      'attribute_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'{}\'',
      defaultValue: const CustomExpression('\'{}\''));
  late final GeneratedColumn<String> entityJson = GeneratedColumn<String>(
      'entity_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', entity_type, \'id\', entity_id)) VIRTUAL');
  @override
  List<GeneratedColumn> get $columns =>
      [entityType, entityId, attributeJson, entityJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_entities';
  @override
  Set<GeneratedColumn> get $primaryKey => {entityType, entityId};
  @override
  CedarEntitiesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarEntitiesData(
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      attributeJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attribute_json'])!,
      entityJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_json'])!,
    );
  }

  @override
  CedarEntities createAlias(String alias) {
    return CedarEntities(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT cedar_entities_pk PRIMARY KEY(entity_type, entity_id)ON CONFLICT IGNORE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CedarEntitiesData extends DataClass
    implements Insertable<CedarEntitiesData> {
  final String entityType;
  final String entityId;
  final String attributeJson;
  final String entityJson;
  const CedarEntitiesData(
      {required this.entityType,
      required this.entityId,
      required this.attributeJson,
      required this.entityJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['attribute_json'] = Variable<String>(attributeJson);
    map['entity_json'] = Variable<String>(entityJson);
    return map;
  }

  factory CedarEntitiesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CedarEntitiesData(
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      attributeJson: serializer.fromJson<String>(json['attributeJson']),
      entityJson: serializer.fromJson<String>(json['entityJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'attributeJson': serializer.toJson<String>(attributeJson),
      'entityJson': serializer.toJson<String>(entityJson),
    };
  }

  CedarEntitiesData copyWith(
          {String? entityType,
          String? entityId,
          String? attributeJson,
          String? entityJson}) =>
      CedarEntitiesData(
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        attributeJson: attributeJson ?? this.attributeJson,
        entityJson: entityJson ?? this.entityJson,
      );
  CedarEntitiesData copyWithCompanion(CedarEntitiesCompanion data) {
    return CedarEntitiesData(
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      attributeJson: data.attributeJson.present
          ? data.attributeJson.value
          : this.attributeJson,
      entityJson:
          data.entityJson.present ? data.entityJson.value : this.entityJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarEntitiesData(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('attributeJson: $attributeJson, ')
          ..write('entityJson: $entityJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(entityType, entityId, attributeJson, entityJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CedarEntitiesData &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.attributeJson == this.attributeJson &&
          other.entityJson == this.entityJson);
}

class CedarEntitiesCompanion extends UpdateCompanion<CedarEntitiesData> {
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> attributeJson;
  final Value<String> entityJson;
  const CedarEntitiesCompanion({
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.attributeJson = const Value.absent(),
    this.entityJson = const Value.absent(),
  });
  CedarEntitiesCompanion.insert({
    required String entityType,
    required String entityId,
    this.attributeJson = const Value.absent(),
    required String entityJson,
  })  : entityType = Value(entityType),
        entityId = Value(entityId),
        entityJson = Value(entityJson);
  static Insertable<CedarEntitiesData> custom({
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? attributeJson,
    Expression<String>? entityJson,
  }) {
    return RawValuesInsertable({
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (attributeJson != null) 'attribute_json': attributeJson,
      if (entityJson != null) 'entity_json': entityJson,
    });
  }

  CedarEntitiesCompanion copyWith(
      {Value<String>? entityType,
      Value<String>? entityId,
      Value<String>? attributeJson,
      Value<String>? entityJson}) {
    return CedarEntitiesCompanion(
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      attributeJson: attributeJson ?? this.attributeJson,
      entityJson: entityJson ?? this.entityJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (attributeJson.present) {
      map['attribute_json'] = Variable<String>(attributeJson.value);
    }
    if (entityJson.present) {
      map['entity_json'] = Variable<String>(entityJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarEntitiesCompanion(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('attributeJson: $attributeJson, ')
          ..write('entityJson: $entityJson')
          ..write(')'))
        .toString();
  }
}

class CedarRelationships extends Table
    with TableInfo<CedarRelationships, CedarRelationshipsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarRelationships(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> entityJson = GeneratedColumn<String>(
      'entity_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', entity_type, \'id\', entity_id)) VIRTUAL');
  late final GeneratedColumn<String> parentType = GeneratedColumn<String>(
      'parent_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> parentJson = GeneratedColumn<String>(
      'parent_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', parent_type, \'id\', parent_id)) VIRTUAL');
  @override
  List<GeneratedColumn> get $columns =>
      [entityType, entityId, entityJson, parentType, parentId, parentJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_relationships';
  @override
  Set<GeneratedColumn> get $primaryKey =>
      {entityType, entityId, parentType, parentId};
  @override
  CedarRelationshipsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarRelationshipsData(
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      entityJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_json'])!,
      parentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_type'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_id'])!,
      parentJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_json'])!,
    );
  }

  @override
  CedarRelationships createAlias(String alias) {
    return CedarRelationships(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT cedar_relationships_pk PRIMARY KEY(entity_type, entity_id, parent_type, parent_id)ON CONFLICT IGNORE',
        'CONSTRAINT cedar_relationships_fk_entity FOREIGN KEY(entity_type, entity_id)REFERENCES cedar_entities(entity_type, entity_id)',
        'CONSTRAINT cedar_relationships_fk_parent FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CedarRelationshipsData extends DataClass
    implements Insertable<CedarRelationshipsData> {
  final String entityType;
  final String entityId;
  final String entityJson;
  final String parentType;
  final String parentId;
  final String parentJson;
  const CedarRelationshipsData(
      {required this.entityType,
      required this.entityId,
      required this.entityJson,
      required this.parentType,
      required this.parentId,
      required this.parentJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['entity_json'] = Variable<String>(entityJson);
    map['parent_type'] = Variable<String>(parentType);
    map['parent_id'] = Variable<String>(parentId);
    map['parent_json'] = Variable<String>(parentJson);
    return map;
  }

  factory CedarRelationshipsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CedarRelationshipsData(
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      entityJson: serializer.fromJson<String>(json['entityJson']),
      parentType: serializer.fromJson<String>(json['parentType']),
      parentId: serializer.fromJson<String>(json['parentId']),
      parentJson: serializer.fromJson<String>(json['parentJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'entityJson': serializer.toJson<String>(entityJson),
      'parentType': serializer.toJson<String>(parentType),
      'parentId': serializer.toJson<String>(parentId),
      'parentJson': serializer.toJson<String>(parentJson),
    };
  }

  CedarRelationshipsData copyWith(
          {String? entityType,
          String? entityId,
          String? entityJson,
          String? parentType,
          String? parentId,
          String? parentJson}) =>
      CedarRelationshipsData(
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        entityJson: entityJson ?? this.entityJson,
        parentType: parentType ?? this.parentType,
        parentId: parentId ?? this.parentId,
        parentJson: parentJson ?? this.parentJson,
      );
  CedarRelationshipsData copyWithCompanion(CedarRelationshipsCompanion data) {
    return CedarRelationshipsData(
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      entityJson:
          data.entityJson.present ? data.entityJson.value : this.entityJson,
      parentType:
          data.parentType.present ? data.parentType.value : this.parentType,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      parentJson:
          data.parentJson.present ? data.parentJson.value : this.parentJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarRelationshipsData(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('entityJson: $entityJson, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('parentJson: $parentJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      entityType, entityId, entityJson, parentType, parentId, parentJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CedarRelationshipsData &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.entityJson == this.entityJson &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.parentJson == this.parentJson);
}

class CedarRelationshipsCompanion
    extends UpdateCompanion<CedarRelationshipsData> {
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> entityJson;
  final Value<String> parentType;
  final Value<String> parentId;
  final Value<String> parentJson;
  const CedarRelationshipsCompanion({
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.entityJson = const Value.absent(),
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    this.parentJson = const Value.absent(),
  });
  CedarRelationshipsCompanion.insert({
    required String entityType,
    required String entityId,
    required String entityJson,
    required String parentType,
    required String parentId,
    required String parentJson,
  })  : entityType = Value(entityType),
        entityId = Value(entityId),
        entityJson = Value(entityJson),
        parentType = Value(parentType),
        parentId = Value(parentId),
        parentJson = Value(parentJson);
  static Insertable<CedarRelationshipsData> custom({
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? entityJson,
    Expression<String>? parentType,
    Expression<String>? parentId,
    Expression<String>? parentJson,
  }) {
    return RawValuesInsertable({
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (entityJson != null) 'entity_json': entityJson,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (parentJson != null) 'parent_json': parentJson,
    });
  }

  CedarRelationshipsCompanion copyWith(
      {Value<String>? entityType,
      Value<String>? entityId,
      Value<String>? entityJson,
      Value<String>? parentType,
      Value<String>? parentId,
      Value<String>? parentJson}) {
    return CedarRelationshipsCompanion(
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      entityJson: entityJson ?? this.entityJson,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      parentJson: parentJson ?? this.parentJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (entityJson.present) {
      map['entity_json'] = Variable<String>(entityJson.value);
    }
    if (parentType.present) {
      map['parent_type'] = Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (parentJson.present) {
      map['parent_json'] = Variable<String>(parentJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarRelationshipsCompanion(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('entityJson: $entityJson, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('parentJson: $parentJson')
          ..write(')'))
        .toString();
  }
}

class UserEmails extends Table with TableInfo<UserEmails, UserEmailsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserEmails(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
      'is_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
      'is_primary', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  @override
  List<GeneratedColumn> get $columns => [userId, email, isVerified, isPrimary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_emails';
  @override
  Set<GeneratedColumn> get $primaryKey => {userId, email};
  @override
  UserEmailsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEmailsData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      isVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_verified'])!,
      isPrimary: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_primary'])!,
    );
  }

  @override
  UserEmails createAlias(String alias) {
    return UserEmails(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT user_emails_pk PRIMARY KEY(user_id, email)',
        'CONSTRAINT user_emails_user_fk FOREIGN KEY(user_id)REFERENCES users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class UserEmailsData extends DataClass implements Insertable<UserEmailsData> {
  final String userId;
  final String email;
  final bool isVerified;
  final bool isPrimary;
  const UserEmailsData(
      {required this.userId,
      required this.email,
      required this.isVerified,
      required this.isPrimary});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['email'] = Variable<String>(email);
    map['is_verified'] = Variable<bool>(isVerified);
    map['is_primary'] = Variable<bool>(isPrimary);
    return map;
  }

  factory UserEmailsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEmailsData(
      userId: serializer.fromJson<String>(json['userId']),
      email: serializer.fromJson<String>(json['email']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
      isPrimary: serializer.fromJson<bool>(json['isPrimary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'email': serializer.toJson<String>(email),
      'isVerified': serializer.toJson<bool>(isVerified),
      'isPrimary': serializer.toJson<bool>(isPrimary),
    };
  }

  UserEmailsData copyWith(
          {String? userId, String? email, bool? isVerified, bool? isPrimary}) =>
      UserEmailsData(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        isVerified: isVerified ?? this.isVerified,
        isPrimary: isPrimary ?? this.isPrimary,
      );
  UserEmailsData copyWithCompanion(UserEmailsCompanion data) {
    return UserEmailsData(
      userId: data.userId.present ? data.userId.value : this.userId,
      email: data.email.present ? data.email.value : this.email,
      isVerified:
          data.isVerified.present ? data.isVerified.value : this.isVerified,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEmailsData(')
          ..write('userId: $userId, ')
          ..write('email: $email, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, email, isVerified, isPrimary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEmailsData &&
          other.userId == this.userId &&
          other.email == this.email &&
          other.isVerified == this.isVerified &&
          other.isPrimary == this.isPrimary);
}

class UserEmailsCompanion extends UpdateCompanion<UserEmailsData> {
  final Value<String> userId;
  final Value<String> email;
  final Value<bool> isVerified;
  final Value<bool> isPrimary;
  const UserEmailsCompanion({
    this.userId = const Value.absent(),
    this.email = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
  });
  UserEmailsCompanion.insert({
    required String userId,
    required String email,
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
  })  : userId = Value(userId),
        email = Value(email);
  static Insertable<UserEmailsData> custom({
    Expression<String>? userId,
    Expression<String>? email,
    Expression<bool>? isVerified,
    Expression<bool>? isPrimary,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (email != null) 'email': email,
      if (isVerified != null) 'is_verified': isVerified,
      if (isPrimary != null) 'is_primary': isPrimary,
    });
  }

  UserEmailsCompanion copyWith(
      {Value<String>? userId,
      Value<String>? email,
      Value<bool>? isVerified,
      Value<bool>? isPrimary}) {
    return UserEmailsCompanion(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      isVerified: isVerified ?? this.isVerified,
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<bool>(isPrimary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEmailsCompanion(')
          ..write('userId: $userId, ')
          ..write('email: $email, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class UserPhoneNumbers extends Table
    with TableInfo<UserPhoneNumbers, UserPhoneNumbersData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserPhoneNumbers(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
      'is_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
      'is_primary', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  @override
  List<GeneratedColumn> get $columns =>
      [userId, phoneNumber, isVerified, isPrimary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_phone_numbers';
  @override
  Set<GeneratedColumn> get $primaryKey => {userId, phoneNumber};
  @override
  UserPhoneNumbersData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPhoneNumbersData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      isVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_verified'])!,
      isPrimary: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_primary'])!,
    );
  }

  @override
  UserPhoneNumbers createAlias(String alias) {
    return UserPhoneNumbers(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT user_phone_numbers_pk PRIMARY KEY(user_id, phone_number)',
        'CONSTRAINT user_phone_numbers_user_fk FOREIGN KEY(user_id)REFERENCES users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class UserPhoneNumbersData extends DataClass
    implements Insertable<UserPhoneNumbersData> {
  final String userId;
  final String phoneNumber;
  final bool isVerified;
  final bool isPrimary;
  const UserPhoneNumbersData(
      {required this.userId,
      required this.phoneNumber,
      required this.isVerified,
      required this.isPrimary});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['is_verified'] = Variable<bool>(isVerified);
    map['is_primary'] = Variable<bool>(isPrimary);
    return map;
  }

  factory UserPhoneNumbersData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPhoneNumbersData(
      userId: serializer.fromJson<String>(json['userId']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
      isPrimary: serializer.fromJson<bool>(json['isPrimary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'isVerified': serializer.toJson<bool>(isVerified),
      'isPrimary': serializer.toJson<bool>(isPrimary),
    };
  }

  UserPhoneNumbersData copyWith(
          {String? userId,
          String? phoneNumber,
          bool? isVerified,
          bool? isPrimary}) =>
      UserPhoneNumbersData(
        userId: userId ?? this.userId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        isVerified: isVerified ?? this.isVerified,
        isPrimary: isPrimary ?? this.isPrimary,
      );
  UserPhoneNumbersData copyWithCompanion(UserPhoneNumbersCompanion data) {
    return UserPhoneNumbersData(
      userId: data.userId.present ? data.userId.value : this.userId,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      isVerified:
          data.isVerified.present ? data.isVerified.value : this.isVerified,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserPhoneNumbersData(')
          ..write('userId: $userId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, phoneNumber, isVerified, isPrimary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPhoneNumbersData &&
          other.userId == this.userId &&
          other.phoneNumber == this.phoneNumber &&
          other.isVerified == this.isVerified &&
          other.isPrimary == this.isPrimary);
}

class UserPhoneNumbersCompanion extends UpdateCompanion<UserPhoneNumbersData> {
  final Value<String> userId;
  final Value<String> phoneNumber;
  final Value<bool> isVerified;
  final Value<bool> isPrimary;
  const UserPhoneNumbersCompanion({
    this.userId = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
  });
  UserPhoneNumbersCompanion.insert({
    required String userId,
    required String phoneNumber,
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
  })  : userId = Value(userId),
        phoneNumber = Value(phoneNumber);
  static Insertable<UserPhoneNumbersData> custom({
    Expression<String>? userId,
    Expression<String>? phoneNumber,
    Expression<bool>? isVerified,
    Expression<bool>? isPrimary,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (isVerified != null) 'is_verified': isVerified,
      if (isPrimary != null) 'is_primary': isPrimary,
    });
  }

  UserPhoneNumbersCompanion copyWith(
      {Value<String>? userId,
      Value<String>? phoneNumber,
      Value<bool>? isVerified,
      Value<bool>? isPrimary}) {
    return UserPhoneNumbersCompanion(
      userId: userId ?? this.userId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isVerified: isVerified ?? this.isVerified,
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<bool>(isPrimary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPhoneNumbersCompanion(')
          ..write('userId: $userId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class CelestProjects extends Table
    with TableInfo<CelestProjects, CelestProjectsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestProjects(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<Uint8List> resolvedAst =
      GeneratedColumn<Uint8List>('resolved_ast', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
      'etag', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [projectId, version, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_projects';
  @override
  Set<GeneratedColumn> get $primaryKey => {projectId};
  @override
  CelestProjectsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CelestProjectsData(
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version'])!,
      resolvedAst: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}resolved_ast'])!,
      etag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etag'])!,
    );
  }

  @override
  CelestProjects createAlias(String alias) {
    return CelestProjects(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CelestProjectsData extends DataClass
    implements Insertable<CelestProjectsData> {
  final String projectId;
  final String version;
  final Uint8List resolvedAst;
  final String etag;
  const CelestProjectsData(
      {required this.projectId,
      required this.version,
      required this.resolvedAst,
      required this.etag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_id'] = Variable<String>(projectId);
    map['version'] = Variable<String>(version);
    map['resolved_ast'] = Variable<Uint8List>(resolvedAst);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  factory CelestProjectsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CelestProjectsData(
      projectId: serializer.fromJson<String>(json['projectId']),
      version: serializer.fromJson<String>(json['version']),
      resolvedAst: serializer.fromJson<Uint8List>(json['resolvedAst']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'projectId': serializer.toJson<String>(projectId),
      'version': serializer.toJson<String>(version),
      'resolvedAst': serializer.toJson<Uint8List>(resolvedAst),
      'etag': serializer.toJson<String>(etag),
    };
  }

  CelestProjectsData copyWith(
          {String? projectId,
          String? version,
          Uint8List? resolvedAst,
          String? etag}) =>
      CelestProjectsData(
        projectId: projectId ?? this.projectId,
        version: version ?? this.version,
        resolvedAst: resolvedAst ?? this.resolvedAst,
        etag: etag ?? this.etag,
      );
  CelestProjectsData copyWithCompanion(CelestProjectsCompanion data) {
    return CelestProjectsData(
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      version: data.version.present ? data.version.value : this.version,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CelestProjectsData(')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      projectId, version, $driftBlobEquality.hash(resolvedAst), etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CelestProjectsData &&
          other.projectId == this.projectId &&
          other.version == this.version &&
          $driftBlobEquality.equals(other.resolvedAst, this.resolvedAst) &&
          other.etag == this.etag);
}

class CelestProjectsCompanion extends UpdateCompanion<CelestProjectsData> {
  final Value<String> projectId;
  final Value<String> version;
  final Value<Uint8List> resolvedAst;
  final Value<String> etag;
  final Value<int> rowid;
  const CelestProjectsCompanion({
    this.projectId = const Value.absent(),
    this.version = const Value.absent(),
    this.resolvedAst = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CelestProjectsCompanion.insert({
    required String projectId,
    required String version,
    required Uint8List resolvedAst,
    required String etag,
    this.rowid = const Value.absent(),
  })  : projectId = Value(projectId),
        version = Value(version),
        resolvedAst = Value(resolvedAst),
        etag = Value(etag);
  static Insertable<CelestProjectsData> custom({
    Expression<String>? projectId,
    Expression<String>? version,
    Expression<Uint8List>? resolvedAst,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (projectId != null) 'project_id': projectId,
      if (version != null) 'version': version,
      if (resolvedAst != null) 'resolved_ast': resolvedAst,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CelestProjectsCompanion copyWith(
      {Value<String>? projectId,
      Value<String>? version,
      Value<Uint8List>? resolvedAst,
      Value<String>? etag,
      Value<int>? rowid}) {
    return CelestProjectsCompanion(
      projectId: projectId ?? this.projectId,
      version: version ?? this.version,
      resolvedAst: resolvedAst ?? this.resolvedAst,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (resolvedAst.present) {
      map['resolved_ast'] = Variable<Uint8List>(resolvedAst.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CelestProjectsCompanion(')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CelestApis extends Table with TableInfo<CelestApis, CelestApisData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestApis(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> apiId = GeneratedColumn<String>(
      'api_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<Uint8List> resolvedAst =
      GeneratedColumn<Uint8List>('resolved_ast', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
      'etag', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [apiId, projectId, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_apis';
  @override
  Set<GeneratedColumn> get $primaryKey => {apiId};
  @override
  CelestApisData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CelestApisData(
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}api_id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      resolvedAst: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}resolved_ast'])!,
      etag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etag'])!,
    );
  }

  @override
  CelestApis createAlias(String alias) {
    return CelestApis(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT celest_apis_project_fk FOREIGN KEY(project_id)REFERENCES celest_projects(project_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CelestApisData extends DataClass implements Insertable<CelestApisData> {
  final String apiId;
  final String projectId;
  final Uint8List resolvedAst;
  final String etag;
  const CelestApisData(
      {required this.apiId,
      required this.projectId,
      required this.resolvedAst,
      required this.etag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['api_id'] = Variable<String>(apiId);
    map['project_id'] = Variable<String>(projectId);
    map['resolved_ast'] = Variable<Uint8List>(resolvedAst);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  factory CelestApisData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CelestApisData(
      apiId: serializer.fromJson<String>(json['apiId']),
      projectId: serializer.fromJson<String>(json['projectId']),
      resolvedAst: serializer.fromJson<Uint8List>(json['resolvedAst']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'apiId': serializer.toJson<String>(apiId),
      'projectId': serializer.toJson<String>(projectId),
      'resolvedAst': serializer.toJson<Uint8List>(resolvedAst),
      'etag': serializer.toJson<String>(etag),
    };
  }

  CelestApisData copyWith(
          {String? apiId,
          String? projectId,
          Uint8List? resolvedAst,
          String? etag}) =>
      CelestApisData(
        apiId: apiId ?? this.apiId,
        projectId: projectId ?? this.projectId,
        resolvedAst: resolvedAst ?? this.resolvedAst,
        etag: etag ?? this.etag,
      );
  CelestApisData copyWithCompanion(CelestApisCompanion data) {
    return CelestApisData(
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CelestApisData(')
          ..write('apiId: $apiId, ')
          ..write('projectId: $projectId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(apiId, projectId, $driftBlobEquality.hash(resolvedAst), etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CelestApisData &&
          other.apiId == this.apiId &&
          other.projectId == this.projectId &&
          $driftBlobEquality.equals(other.resolvedAst, this.resolvedAst) &&
          other.etag == this.etag);
}

class CelestApisCompanion extends UpdateCompanion<CelestApisData> {
  final Value<String> apiId;
  final Value<String> projectId;
  final Value<Uint8List> resolvedAst;
  final Value<String> etag;
  final Value<int> rowid;
  const CelestApisCompanion({
    this.apiId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.resolvedAst = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CelestApisCompanion.insert({
    required String apiId,
    required String projectId,
    required Uint8List resolvedAst,
    required String etag,
    this.rowid = const Value.absent(),
  })  : apiId = Value(apiId),
        projectId = Value(projectId),
        resolvedAst = Value(resolvedAst),
        etag = Value(etag);
  static Insertable<CelestApisData> custom({
    Expression<String>? apiId,
    Expression<String>? projectId,
    Expression<Uint8List>? resolvedAst,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (apiId != null) 'api_id': apiId,
      if (projectId != null) 'project_id': projectId,
      if (resolvedAst != null) 'resolved_ast': resolvedAst,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CelestApisCompanion copyWith(
      {Value<String>? apiId,
      Value<String>? projectId,
      Value<Uint8List>? resolvedAst,
      Value<String>? etag,
      Value<int>? rowid}) {
    return CelestApisCompanion(
      apiId: apiId ?? this.apiId,
      projectId: projectId ?? this.projectId,
      resolvedAst: resolvedAst ?? this.resolvedAst,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (apiId.present) {
      map['api_id'] = Variable<String>(apiId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (resolvedAst.present) {
      map['resolved_ast'] = Variable<Uint8List>(resolvedAst.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CelestApisCompanion(')
          ..write('apiId: $apiId, ')
          ..write('projectId: $projectId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CelestFunctions extends Table
    with TableInfo<CelestFunctions, CelestFunctionsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestFunctions(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> functionId = GeneratedColumn<String>(
      'function_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> apiId = GeneratedColumn<String>(
      'api_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<Uint8List> resolvedAst =
      GeneratedColumn<Uint8List>('resolved_ast', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
      'etag', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [functionId, apiId, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_functions';
  @override
  Set<GeneratedColumn> get $primaryKey => {functionId};
  @override
  CelestFunctionsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CelestFunctionsData(
      functionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}function_id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}api_id'])!,
      resolvedAst: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}resolved_ast'])!,
      etag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etag'])!,
    );
  }

  @override
  CelestFunctions createAlias(String alias) {
    return CelestFunctions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT celest_functions_api_fk FOREIGN KEY(api_id)REFERENCES celest_apis(api_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CelestFunctionsData extends DataClass
    implements Insertable<CelestFunctionsData> {
  final String functionId;
  final String apiId;
  final Uint8List resolvedAst;
  final String etag;
  const CelestFunctionsData(
      {required this.functionId,
      required this.apiId,
      required this.resolvedAst,
      required this.etag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['function_id'] = Variable<String>(functionId);
    map['api_id'] = Variable<String>(apiId);
    map['resolved_ast'] = Variable<Uint8List>(resolvedAst);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  factory CelestFunctionsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CelestFunctionsData(
      functionId: serializer.fromJson<String>(json['functionId']),
      apiId: serializer.fromJson<String>(json['apiId']),
      resolvedAst: serializer.fromJson<Uint8List>(json['resolvedAst']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'functionId': serializer.toJson<String>(functionId),
      'apiId': serializer.toJson<String>(apiId),
      'resolvedAst': serializer.toJson<Uint8List>(resolvedAst),
      'etag': serializer.toJson<String>(etag),
    };
  }

  CelestFunctionsData copyWith(
          {String? functionId,
          String? apiId,
          Uint8List? resolvedAst,
          String? etag}) =>
      CelestFunctionsData(
        functionId: functionId ?? this.functionId,
        apiId: apiId ?? this.apiId,
        resolvedAst: resolvedAst ?? this.resolvedAst,
        etag: etag ?? this.etag,
      );
  CelestFunctionsData copyWithCompanion(CelestFunctionsCompanion data) {
    return CelestFunctionsData(
      functionId:
          data.functionId.present ? data.functionId.value : this.functionId,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CelestFunctionsData(')
          ..write('functionId: $functionId, ')
          ..write('apiId: $apiId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      functionId, apiId, $driftBlobEquality.hash(resolvedAst), etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CelestFunctionsData &&
          other.functionId == this.functionId &&
          other.apiId == this.apiId &&
          $driftBlobEquality.equals(other.resolvedAst, this.resolvedAst) &&
          other.etag == this.etag);
}

class CelestFunctionsCompanion extends UpdateCompanion<CelestFunctionsData> {
  final Value<String> functionId;
  final Value<String> apiId;
  final Value<Uint8List> resolvedAst;
  final Value<String> etag;
  final Value<int> rowid;
  const CelestFunctionsCompanion({
    this.functionId = const Value.absent(),
    this.apiId = const Value.absent(),
    this.resolvedAst = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CelestFunctionsCompanion.insert({
    required String functionId,
    required String apiId,
    required Uint8List resolvedAst,
    required String etag,
    this.rowid = const Value.absent(),
  })  : functionId = Value(functionId),
        apiId = Value(apiId),
        resolvedAst = Value(resolvedAst),
        etag = Value(etag);
  static Insertable<CelestFunctionsData> custom({
    Expression<String>? functionId,
    Expression<String>? apiId,
    Expression<Uint8List>? resolvedAst,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (functionId != null) 'function_id': functionId,
      if (apiId != null) 'api_id': apiId,
      if (resolvedAst != null) 'resolved_ast': resolvedAst,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CelestFunctionsCompanion copyWith(
      {Value<String>? functionId,
      Value<String>? apiId,
      Value<Uint8List>? resolvedAst,
      Value<String>? etag,
      Value<int>? rowid}) {
    return CelestFunctionsCompanion(
      functionId: functionId ?? this.functionId,
      apiId: apiId ?? this.apiId,
      resolvedAst: resolvedAst ?? this.resolvedAst,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (functionId.present) {
      map['function_id'] = Variable<String>(functionId.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<String>(apiId.value);
    }
    if (resolvedAst.present) {
      map['resolved_ast'] = Variable<Uint8List>(resolvedAst.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CelestFunctionsCompanion(')
          ..write('functionId: $functionId, ')
          ..write('apiId: $apiId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarPolicies extends Table
    with TableInfo<CedarPolicies, CedarPoliciesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarPolicies(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> policyId = GeneratedColumn<String>(
      'policy_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final GeneratedColumn<String> policy = GeneratedColumn<String>(
      'policy', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> enforcementLevel = GeneratedColumn<int>(
      'enforcement_level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const CustomExpression('1'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, policyId, policy, enforcementLevel];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_policies';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CedarPoliciesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarPoliciesData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      policyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}policy_id'])!,
      policy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}policy'])!,
      enforcementLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}enforcement_level'])!,
    );
  }

  @override
  CedarPolicies createAlias(String alias) {
    return CedarPolicies(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['CHECK(enforcement_level IN (0, 1))'];
  @override
  bool get dontWriteConstraints => true;
}

class CedarPoliciesData extends DataClass
    implements Insertable<CedarPoliciesData> {
  final String id;
  final String policyId;
  final String policy;
  final int enforcementLevel;
  const CedarPoliciesData(
      {required this.id,
      required this.policyId,
      required this.policy,
      required this.enforcementLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['policy_id'] = Variable<String>(policyId);
    map['policy'] = Variable<String>(policy);
    map['enforcement_level'] = Variable<int>(enforcementLevel);
    return map;
  }

  factory CedarPoliciesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CedarPoliciesData(
      id: serializer.fromJson<String>(json['id']),
      policyId: serializer.fromJson<String>(json['policyId']),
      policy: serializer.fromJson<String>(json['policy']),
      enforcementLevel: serializer.fromJson<int>(json['enforcementLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'policyId': serializer.toJson<String>(policyId),
      'policy': serializer.toJson<String>(policy),
      'enforcementLevel': serializer.toJson<int>(enforcementLevel),
    };
  }

  CedarPoliciesData copyWith(
          {String? id,
          String? policyId,
          String? policy,
          int? enforcementLevel}) =>
      CedarPoliciesData(
        id: id ?? this.id,
        policyId: policyId ?? this.policyId,
        policy: policy ?? this.policy,
        enforcementLevel: enforcementLevel ?? this.enforcementLevel,
      );
  CedarPoliciesData copyWithCompanion(CedarPoliciesCompanion data) {
    return CedarPoliciesData(
      id: data.id.present ? data.id.value : this.id,
      policyId: data.policyId.present ? data.policyId.value : this.policyId,
      policy: data.policy.present ? data.policy.value : this.policy,
      enforcementLevel: data.enforcementLevel.present
          ? data.enforcementLevel.value
          : this.enforcementLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarPoliciesData(')
          ..write('id: $id, ')
          ..write('policyId: $policyId, ')
          ..write('policy: $policy, ')
          ..write('enforcementLevel: $enforcementLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, policyId, policy, enforcementLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CedarPoliciesData &&
          other.id == this.id &&
          other.policyId == this.policyId &&
          other.policy == this.policy &&
          other.enforcementLevel == this.enforcementLevel);
}

class CedarPoliciesCompanion extends UpdateCompanion<CedarPoliciesData> {
  final Value<String> id;
  final Value<String> policyId;
  final Value<String> policy;
  final Value<int> enforcementLevel;
  final Value<int> rowid;
  const CedarPoliciesCompanion({
    this.id = const Value.absent(),
    this.policyId = const Value.absent(),
    this.policy = const Value.absent(),
    this.enforcementLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CedarPoliciesCompanion.insert({
    required String id,
    required String policyId,
    required String policy,
    this.enforcementLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        policyId = Value(policyId),
        policy = Value(policy);
  static Insertable<CedarPoliciesData> custom({
    Expression<String>? id,
    Expression<String>? policyId,
    Expression<String>? policy,
    Expression<int>? enforcementLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (policyId != null) 'policy_id': policyId,
      if (policy != null) 'policy': policy,
      if (enforcementLevel != null) 'enforcement_level': enforcementLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CedarPoliciesCompanion copyWith(
      {Value<String>? id,
      Value<String>? policyId,
      Value<String>? policy,
      Value<int>? enforcementLevel,
      Value<int>? rowid}) {
    return CedarPoliciesCompanion(
      id: id ?? this.id,
      policyId: policyId ?? this.policyId,
      policy: policy ?? this.policy,
      enforcementLevel: enforcementLevel ?? this.enforcementLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (policyId.present) {
      map['policy_id'] = Variable<String>(policyId.value);
    }
    if (policy.present) {
      map['policy'] = Variable<String>(policy.value);
    }
    if (enforcementLevel.present) {
      map['enforcement_level'] = Variable<int>(enforcementLevel.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarPoliciesCompanion(')
          ..write('id: $id, ')
          ..write('policyId: $policyId, ')
          ..write('policy: $policy, ')
          ..write('enforcementLevel: $enforcementLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarPolicyTemplates extends Table
    with TableInfo<CedarPolicyTemplates, CedarPolicyTemplatesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarPolicyTemplates(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
      'template_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final GeneratedColumn<String> template = GeneratedColumn<String>(
      'template', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, templateId, template];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_policy_templates';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CedarPolicyTemplatesData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarPolicyTemplatesData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      templateId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}template_id'])!,
      template: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}template'])!,
    );
  }

  @override
  CedarPolicyTemplates createAlias(String alias) {
    return CedarPolicyTemplates(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['CHECK(template IS NOT NULL OR template IS NOT NULL)'];
  @override
  bool get dontWriteConstraints => true;
}

class CedarPolicyTemplatesData extends DataClass
    implements Insertable<CedarPolicyTemplatesData> {
  final String id;
  final String templateId;
  final String template;
  const CedarPolicyTemplatesData(
      {required this.id, required this.templateId, required this.template});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['template_id'] = Variable<String>(templateId);
    map['template'] = Variable<String>(template);
    return map;
  }

  factory CedarPolicyTemplatesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CedarPolicyTemplatesData(
      id: serializer.fromJson<String>(json['id']),
      templateId: serializer.fromJson<String>(json['templateId']),
      template: serializer.fromJson<String>(json['template']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'templateId': serializer.toJson<String>(templateId),
      'template': serializer.toJson<String>(template),
    };
  }

  CedarPolicyTemplatesData copyWith(
          {String? id, String? templateId, String? template}) =>
      CedarPolicyTemplatesData(
        id: id ?? this.id,
        templateId: templateId ?? this.templateId,
        template: template ?? this.template,
      );
  CedarPolicyTemplatesData copyWithCompanion(
      CedarPolicyTemplatesCompanion data) {
    return CedarPolicyTemplatesData(
      id: data.id.present ? data.id.value : this.id,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
      template: data.template.present ? data.template.value : this.template,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicyTemplatesData(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('template: $template')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templateId, template);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CedarPolicyTemplatesData &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.template == this.template);
}

class CedarPolicyTemplatesCompanion
    extends UpdateCompanion<CedarPolicyTemplatesData> {
  final Value<String> id;
  final Value<String> templateId;
  final Value<String> template;
  final Value<int> rowid;
  const CedarPolicyTemplatesCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.template = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CedarPolicyTemplatesCompanion.insert({
    required String id,
    required String templateId,
    required String template,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        templateId = Value(templateId),
        template = Value(template);
  static Insertable<CedarPolicyTemplatesData> custom({
    Expression<String>? id,
    Expression<String>? templateId,
    Expression<String>? template,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (template != null) 'template': template,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CedarPolicyTemplatesCompanion copyWith(
      {Value<String>? id,
      Value<String>? templateId,
      Value<String>? template,
      Value<int>? rowid}) {
    return CedarPolicyTemplatesCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      template: template ?? this.template,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (template.present) {
      map['template'] = Variable<String>(template.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicyTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('template: $template, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarPolicyTemplateLinks extends Table
    with TableInfo<CedarPolicyTemplateLinks, CedarPolicyTemplateLinksData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarPolicyTemplateLinks(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> policyId = GeneratedColumn<String>(
      'policy_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
      'template_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> principalType = GeneratedColumn<String>(
      'principal_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> principalId = GeneratedColumn<String>(
      'principal_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
      'resource_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
      'resource_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> enforcementLevel = GeneratedColumn<int>(
      'enforcement_level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const CustomExpression('1'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        policyId,
        templateId,
        principalType,
        principalId,
        resourceType,
        resourceId,
        enforcementLevel
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_policy_template_links';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CedarPolicyTemplateLinksData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarPolicyTemplateLinksData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      policyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}policy_id'])!,
      templateId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}template_id'])!,
      principalType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}principal_type']),
      principalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}principal_id']),
      resourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_type']),
      resourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_id']),
      enforcementLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}enforcement_level'])!,
    );
  }

  @override
  CedarPolicyTemplateLinks createAlias(String alias) {
    return CedarPolicyTemplateLinks(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CHECK(principal_type IS NOT NULL AND principal_id IS NOT NULL OR resource_type IS NOT NULL AND resource_id IS NOT NULL)',
        'CHECK(enforcement_level IN (0, 1))',
        'CONSTRAINT cedar_policy_template_links_fk_template_id FOREIGN KEY(template_id)REFERENCES cedar_policy_templates(template_id)ON UPDATE CASCADE ON DELETE CASCADE',
        'CONSTRAINT cedar_policy_template_links_fk_principal FOREIGN KEY(principal_type, principal_id)REFERENCES cedar_entities(entity_type, entity_id)ON DELETE CASCADE',
        'CONSTRAINT cedar_policy_template_links_fk_resource FOREIGN KEY(resource_type, resource_id)REFERENCES cedar_entities(entity_type, entity_id)ON DELETE CASCADE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CedarPolicyTemplateLinksData extends DataClass
    implements Insertable<CedarPolicyTemplateLinksData> {
  final String id;
  final String policyId;
  final String templateId;
  final String? principalType;
  final String? principalId;
  final String? resourceType;
  final String? resourceId;
  final int enforcementLevel;
  const CedarPolicyTemplateLinksData(
      {required this.id,
      required this.policyId,
      required this.templateId,
      this.principalType,
      this.principalId,
      this.resourceType,
      this.resourceId,
      required this.enforcementLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['policy_id'] = Variable<String>(policyId);
    map['template_id'] = Variable<String>(templateId);
    if (!nullToAbsent || principalType != null) {
      map['principal_type'] = Variable<String>(principalType);
    }
    if (!nullToAbsent || principalId != null) {
      map['principal_id'] = Variable<String>(principalId);
    }
    if (!nullToAbsent || resourceType != null) {
      map['resource_type'] = Variable<String>(resourceType);
    }
    if (!nullToAbsent || resourceId != null) {
      map['resource_id'] = Variable<String>(resourceId);
    }
    map['enforcement_level'] = Variable<int>(enforcementLevel);
    return map;
  }

  factory CedarPolicyTemplateLinksData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CedarPolicyTemplateLinksData(
      id: serializer.fromJson<String>(json['id']),
      policyId: serializer.fromJson<String>(json['policyId']),
      templateId: serializer.fromJson<String>(json['templateId']),
      principalType: serializer.fromJson<String?>(json['principalType']),
      principalId: serializer.fromJson<String?>(json['principalId']),
      resourceType: serializer.fromJson<String?>(json['resourceType']),
      resourceId: serializer.fromJson<String?>(json['resourceId']),
      enforcementLevel: serializer.fromJson<int>(json['enforcementLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'policyId': serializer.toJson<String>(policyId),
      'templateId': serializer.toJson<String>(templateId),
      'principalType': serializer.toJson<String?>(principalType),
      'principalId': serializer.toJson<String?>(principalId),
      'resourceType': serializer.toJson<String?>(resourceType),
      'resourceId': serializer.toJson<String?>(resourceId),
      'enforcementLevel': serializer.toJson<int>(enforcementLevel),
    };
  }

  CedarPolicyTemplateLinksData copyWith(
          {String? id,
          String? policyId,
          String? templateId,
          Value<String?> principalType = const Value.absent(),
          Value<String?> principalId = const Value.absent(),
          Value<String?> resourceType = const Value.absent(),
          Value<String?> resourceId = const Value.absent(),
          int? enforcementLevel}) =>
      CedarPolicyTemplateLinksData(
        id: id ?? this.id,
        policyId: policyId ?? this.policyId,
        templateId: templateId ?? this.templateId,
        principalType:
            principalType.present ? principalType.value : this.principalType,
        principalId: principalId.present ? principalId.value : this.principalId,
        resourceType:
            resourceType.present ? resourceType.value : this.resourceType,
        resourceId: resourceId.present ? resourceId.value : this.resourceId,
        enforcementLevel: enforcementLevel ?? this.enforcementLevel,
      );
  CedarPolicyTemplateLinksData copyWithCompanion(
      CedarPolicyTemplateLinksCompanion data) {
    return CedarPolicyTemplateLinksData(
      id: data.id.present ? data.id.value : this.id,
      policyId: data.policyId.present ? data.policyId.value : this.policyId,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
      principalType: data.principalType.present
          ? data.principalType.value
          : this.principalType,
      principalId:
          data.principalId.present ? data.principalId.value : this.principalId,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      enforcementLevel: data.enforcementLevel.present
          ? data.enforcementLevel.value
          : this.enforcementLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicyTemplateLinksData(')
          ..write('id: $id, ')
          ..write('policyId: $policyId, ')
          ..write('templateId: $templateId, ')
          ..write('principalType: $principalType, ')
          ..write('principalId: $principalId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('enforcementLevel: $enforcementLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, policyId, templateId, principalType,
      principalId, resourceType, resourceId, enforcementLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CedarPolicyTemplateLinksData &&
          other.id == this.id &&
          other.policyId == this.policyId &&
          other.templateId == this.templateId &&
          other.principalType == this.principalType &&
          other.principalId == this.principalId &&
          other.resourceType == this.resourceType &&
          other.resourceId == this.resourceId &&
          other.enforcementLevel == this.enforcementLevel);
}

class CedarPolicyTemplateLinksCompanion
    extends UpdateCompanion<CedarPolicyTemplateLinksData> {
  final Value<String> id;
  final Value<String> policyId;
  final Value<String> templateId;
  final Value<String?> principalType;
  final Value<String?> principalId;
  final Value<String?> resourceType;
  final Value<String?> resourceId;
  final Value<int> enforcementLevel;
  final Value<int> rowid;
  const CedarPolicyTemplateLinksCompanion({
    this.id = const Value.absent(),
    this.policyId = const Value.absent(),
    this.templateId = const Value.absent(),
    this.principalType = const Value.absent(),
    this.principalId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.enforcementLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CedarPolicyTemplateLinksCompanion.insert({
    required String id,
    required String policyId,
    required String templateId,
    this.principalType = const Value.absent(),
    this.principalId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.enforcementLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        policyId = Value(policyId),
        templateId = Value(templateId);
  static Insertable<CedarPolicyTemplateLinksData> custom({
    Expression<String>? id,
    Expression<String>? policyId,
    Expression<String>? templateId,
    Expression<String>? principalType,
    Expression<String>? principalId,
    Expression<String>? resourceType,
    Expression<String>? resourceId,
    Expression<int>? enforcementLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (policyId != null) 'policy_id': policyId,
      if (templateId != null) 'template_id': templateId,
      if (principalType != null) 'principal_type': principalType,
      if (principalId != null) 'principal_id': principalId,
      if (resourceType != null) 'resource_type': resourceType,
      if (resourceId != null) 'resource_id': resourceId,
      if (enforcementLevel != null) 'enforcement_level': enforcementLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CedarPolicyTemplateLinksCompanion copyWith(
      {Value<String>? id,
      Value<String>? policyId,
      Value<String>? templateId,
      Value<String?>? principalType,
      Value<String?>? principalId,
      Value<String?>? resourceType,
      Value<String?>? resourceId,
      Value<int>? enforcementLevel,
      Value<int>? rowid}) {
    return CedarPolicyTemplateLinksCompanion(
      id: id ?? this.id,
      policyId: policyId ?? this.policyId,
      templateId: templateId ?? this.templateId,
      principalType: principalType ?? this.principalType,
      principalId: principalId ?? this.principalId,
      resourceType: resourceType ?? this.resourceType,
      resourceId: resourceId ?? this.resourceId,
      enforcementLevel: enforcementLevel ?? this.enforcementLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (policyId.present) {
      map['policy_id'] = Variable<String>(policyId.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (principalType.present) {
      map['principal_type'] = Variable<String>(principalType.value);
    }
    if (principalId.present) {
      map['principal_id'] = Variable<String>(principalId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(resourceType.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (enforcementLevel.present) {
      map['enforcement_level'] = Variable<int>(enforcementLevel.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicyTemplateLinksCompanion(')
          ..write('id: $id, ')
          ..write('policyId: $policyId, ')
          ..write('templateId: $templateId, ')
          ..write('principalType: $principalType, ')
          ..write('principalId: $principalId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('enforcementLevel: $enforcementLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarAuthorizationLogs extends Table
    with TableInfo<CedarAuthorizationLogs, CedarAuthorizationLogsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarAuthorizationLogs(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> rowid = GeneratedColumn<int>(
      'rowid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
      defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final GeneratedColumn<DateTime> expireTime = GeneratedColumn<DateTime>(
      'expire_time', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> principalType = GeneratedColumn<String>(
      'principal_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> principalId = GeneratedColumn<String>(
      'principal_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
      'action_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> actionId = GeneratedColumn<String>(
      'action_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
      'resource_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
      'resource_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> contextJson = GeneratedColumn<String>(
      'context_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'{}\'',
      defaultValue: const CustomExpression('\'{}\''));
  late final GeneratedColumn<bool> decision = GeneratedColumn<bool>(
      'decision', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> reasonsJson = GeneratedColumn<String>(
      'reasons_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'[]\'',
      defaultValue: const CustomExpression('\'[]\''));
  late final GeneratedColumn<String> errorsJson = GeneratedColumn<String>(
      'errors_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'[]\'',
      defaultValue: const CustomExpression('\'[]\''));
  @override
  List<GeneratedColumn> get $columns => [
        rowid,
        createTime,
        expireTime,
        principalType,
        principalId,
        actionType,
        actionId,
        resourceType,
        resourceId,
        contextJson,
        decision,
        reasonsJson,
        errorsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_authorization_logs';
  @override
  Set<GeneratedColumn> get $primaryKey => {rowid};
  @override
  CedarAuthorizationLogsData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarAuthorizationLogsData(
      rowid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rowid'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      expireTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expire_time']),
      principalType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}principal_type']),
      principalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}principal_id']),
      actionType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_type']),
      actionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_id']),
      resourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_type']),
      resourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_id']),
      contextJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context_json'])!,
      decision: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}decision'])!,
      reasonsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reasons_json'])!,
      errorsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}errors_json'])!,
    );
  }

  @override
  CedarAuthorizationLogs createAlias(String alias) {
    return CedarAuthorizationLogs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CedarAuthorizationLogsData extends DataClass
    implements Insertable<CedarAuthorizationLogsData> {
  final int rowid;
  final DateTime createTime;
  final DateTime? expireTime;
  final String? principalType;
  final String? principalId;
  final String? actionType;
  final String? actionId;
  final String? resourceType;
  final String? resourceId;
  final String contextJson;
  final bool decision;
  final String reasonsJson;
  final String errorsJson;
  const CedarAuthorizationLogsData(
      {required this.rowid,
      required this.createTime,
      this.expireTime,
      this.principalType,
      this.principalId,
      this.actionType,
      this.actionId,
      this.resourceType,
      this.resourceId,
      required this.contextJson,
      required this.decision,
      required this.reasonsJson,
      required this.errorsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rowid'] = Variable<int>(rowid);
    map['create_time'] = Variable<DateTime>(createTime);
    if (!nullToAbsent || expireTime != null) {
      map['expire_time'] = Variable<DateTime>(expireTime);
    }
    if (!nullToAbsent || principalType != null) {
      map['principal_type'] = Variable<String>(principalType);
    }
    if (!nullToAbsent || principalId != null) {
      map['principal_id'] = Variable<String>(principalId);
    }
    if (!nullToAbsent || actionType != null) {
      map['action_type'] = Variable<String>(actionType);
    }
    if (!nullToAbsent || actionId != null) {
      map['action_id'] = Variable<String>(actionId);
    }
    if (!nullToAbsent || resourceType != null) {
      map['resource_type'] = Variable<String>(resourceType);
    }
    if (!nullToAbsent || resourceId != null) {
      map['resource_id'] = Variable<String>(resourceId);
    }
    map['context_json'] = Variable<String>(contextJson);
    map['decision'] = Variable<bool>(decision);
    map['reasons_json'] = Variable<String>(reasonsJson);
    map['errors_json'] = Variable<String>(errorsJson);
    return map;
  }

  factory CedarAuthorizationLogsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CedarAuthorizationLogsData(
      rowid: serializer.fromJson<int>(json['rowid']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      expireTime: serializer.fromJson<DateTime?>(json['expireTime']),
      principalType: serializer.fromJson<String?>(json['principalType']),
      principalId: serializer.fromJson<String?>(json['principalId']),
      actionType: serializer.fromJson<String?>(json['actionType']),
      actionId: serializer.fromJson<String?>(json['actionId']),
      resourceType: serializer.fromJson<String?>(json['resourceType']),
      resourceId: serializer.fromJson<String?>(json['resourceId']),
      contextJson: serializer.fromJson<String>(json['contextJson']),
      decision: serializer.fromJson<bool>(json['decision']),
      reasonsJson: serializer.fromJson<String>(json['reasonsJson']),
      errorsJson: serializer.fromJson<String>(json['errorsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowid': serializer.toJson<int>(rowid),
      'createTime': serializer.toJson<DateTime>(createTime),
      'expireTime': serializer.toJson<DateTime?>(expireTime),
      'principalType': serializer.toJson<String?>(principalType),
      'principalId': serializer.toJson<String?>(principalId),
      'actionType': serializer.toJson<String?>(actionType),
      'actionId': serializer.toJson<String?>(actionId),
      'resourceType': serializer.toJson<String?>(resourceType),
      'resourceId': serializer.toJson<String?>(resourceId),
      'contextJson': serializer.toJson<String>(contextJson),
      'decision': serializer.toJson<bool>(decision),
      'reasonsJson': serializer.toJson<String>(reasonsJson),
      'errorsJson': serializer.toJson<String>(errorsJson),
    };
  }

  CedarAuthorizationLogsData copyWith(
          {int? rowid,
          DateTime? createTime,
          Value<DateTime?> expireTime = const Value.absent(),
          Value<String?> principalType = const Value.absent(),
          Value<String?> principalId = const Value.absent(),
          Value<String?> actionType = const Value.absent(),
          Value<String?> actionId = const Value.absent(),
          Value<String?> resourceType = const Value.absent(),
          Value<String?> resourceId = const Value.absent(),
          String? contextJson,
          bool? decision,
          String? reasonsJson,
          String? errorsJson}) =>
      CedarAuthorizationLogsData(
        rowid: rowid ?? this.rowid,
        createTime: createTime ?? this.createTime,
        expireTime: expireTime.present ? expireTime.value : this.expireTime,
        principalType:
            principalType.present ? principalType.value : this.principalType,
        principalId: principalId.present ? principalId.value : this.principalId,
        actionType: actionType.present ? actionType.value : this.actionType,
        actionId: actionId.present ? actionId.value : this.actionId,
        resourceType:
            resourceType.present ? resourceType.value : this.resourceType,
        resourceId: resourceId.present ? resourceId.value : this.resourceId,
        contextJson: contextJson ?? this.contextJson,
        decision: decision ?? this.decision,
        reasonsJson: reasonsJson ?? this.reasonsJson,
        errorsJson: errorsJson ?? this.errorsJson,
      );
  CedarAuthorizationLogsData copyWithCompanion(
      CedarAuthorizationLogsCompanion data) {
    return CedarAuthorizationLogsData(
      rowid: data.rowid.present ? data.rowid.value : this.rowid,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      expireTime:
          data.expireTime.present ? data.expireTime.value : this.expireTime,
      principalType: data.principalType.present
          ? data.principalType.value
          : this.principalType,
      principalId:
          data.principalId.present ? data.principalId.value : this.principalId,
      actionType:
          data.actionType.present ? data.actionType.value : this.actionType,
      actionId: data.actionId.present ? data.actionId.value : this.actionId,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      contextJson:
          data.contextJson.present ? data.contextJson.value : this.contextJson,
      decision: data.decision.present ? data.decision.value : this.decision,
      reasonsJson:
          data.reasonsJson.present ? data.reasonsJson.value : this.reasonsJson,
      errorsJson:
          data.errorsJson.present ? data.errorsJson.value : this.errorsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarAuthorizationLogsData(')
          ..write('rowid: $rowid, ')
          ..write('createTime: $createTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('principalType: $principalType, ')
          ..write('principalId: $principalId, ')
          ..write('actionType: $actionType, ')
          ..write('actionId: $actionId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('contextJson: $contextJson, ')
          ..write('decision: $decision, ')
          ..write('reasonsJson: $reasonsJson, ')
          ..write('errorsJson: $errorsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      rowid,
      createTime,
      expireTime,
      principalType,
      principalId,
      actionType,
      actionId,
      resourceType,
      resourceId,
      contextJson,
      decision,
      reasonsJson,
      errorsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CedarAuthorizationLogsData &&
          other.rowid == this.rowid &&
          other.createTime == this.createTime &&
          other.expireTime == this.expireTime &&
          other.principalType == this.principalType &&
          other.principalId == this.principalId &&
          other.actionType == this.actionType &&
          other.actionId == this.actionId &&
          other.resourceType == this.resourceType &&
          other.resourceId == this.resourceId &&
          other.contextJson == this.contextJson &&
          other.decision == this.decision &&
          other.reasonsJson == this.reasonsJson &&
          other.errorsJson == this.errorsJson);
}

class CedarAuthorizationLogsCompanion
    extends UpdateCompanion<CedarAuthorizationLogsData> {
  final Value<int> rowid;
  final Value<DateTime> createTime;
  final Value<DateTime?> expireTime;
  final Value<String?> principalType;
  final Value<String?> principalId;
  final Value<String?> actionType;
  final Value<String?> actionId;
  final Value<String?> resourceType;
  final Value<String?> resourceId;
  final Value<String> contextJson;
  final Value<bool> decision;
  final Value<String> reasonsJson;
  final Value<String> errorsJson;
  const CedarAuthorizationLogsCompanion({
    this.rowid = const Value.absent(),
    this.createTime = const Value.absent(),
    this.expireTime = const Value.absent(),
    this.principalType = const Value.absent(),
    this.principalId = const Value.absent(),
    this.actionType = const Value.absent(),
    this.actionId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.contextJson = const Value.absent(),
    this.decision = const Value.absent(),
    this.reasonsJson = const Value.absent(),
    this.errorsJson = const Value.absent(),
  });
  CedarAuthorizationLogsCompanion.insert({
    this.rowid = const Value.absent(),
    this.createTime = const Value.absent(),
    this.expireTime = const Value.absent(),
    this.principalType = const Value.absent(),
    this.principalId = const Value.absent(),
    this.actionType = const Value.absent(),
    this.actionId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.contextJson = const Value.absent(),
    required bool decision,
    this.reasonsJson = const Value.absent(),
    this.errorsJson = const Value.absent(),
  }) : decision = Value(decision);
  static Insertable<CedarAuthorizationLogsData> custom({
    Expression<int>? rowid,
    Expression<DateTime>? createTime,
    Expression<DateTime>? expireTime,
    Expression<String>? principalType,
    Expression<String>? principalId,
    Expression<String>? actionType,
    Expression<String>? actionId,
    Expression<String>? resourceType,
    Expression<String>? resourceId,
    Expression<String>? contextJson,
    Expression<bool>? decision,
    Expression<String>? reasonsJson,
    Expression<String>? errorsJson,
  }) {
    return RawValuesInsertable({
      if (rowid != null) 'rowid': rowid,
      if (createTime != null) 'create_time': createTime,
      if (expireTime != null) 'expire_time': expireTime,
      if (principalType != null) 'principal_type': principalType,
      if (principalId != null) 'principal_id': principalId,
      if (actionType != null) 'action_type': actionType,
      if (actionId != null) 'action_id': actionId,
      if (resourceType != null) 'resource_type': resourceType,
      if (resourceId != null) 'resource_id': resourceId,
      if (contextJson != null) 'context_json': contextJson,
      if (decision != null) 'decision': decision,
      if (reasonsJson != null) 'reasons_json': reasonsJson,
      if (errorsJson != null) 'errors_json': errorsJson,
    });
  }

  CedarAuthorizationLogsCompanion copyWith(
      {Value<int>? rowid,
      Value<DateTime>? createTime,
      Value<DateTime?>? expireTime,
      Value<String?>? principalType,
      Value<String?>? principalId,
      Value<String?>? actionType,
      Value<String?>? actionId,
      Value<String?>? resourceType,
      Value<String?>? resourceId,
      Value<String>? contextJson,
      Value<bool>? decision,
      Value<String>? reasonsJson,
      Value<String>? errorsJson}) {
    return CedarAuthorizationLogsCompanion(
      rowid: rowid ?? this.rowid,
      createTime: createTime ?? this.createTime,
      expireTime: expireTime ?? this.expireTime,
      principalType: principalType ?? this.principalType,
      principalId: principalId ?? this.principalId,
      actionType: actionType ?? this.actionType,
      actionId: actionId ?? this.actionId,
      resourceType: resourceType ?? this.resourceType,
      resourceId: resourceId ?? this.resourceId,
      contextJson: contextJson ?? this.contextJson,
      decision: decision ?? this.decision,
      reasonsJson: reasonsJson ?? this.reasonsJson,
      errorsJson: errorsJson ?? this.errorsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (expireTime.present) {
      map['expire_time'] = Variable<DateTime>(expireTime.value);
    }
    if (principalType.present) {
      map['principal_type'] = Variable<String>(principalType.value);
    }
    if (principalId.present) {
      map['principal_id'] = Variable<String>(principalId.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (actionId.present) {
      map['action_id'] = Variable<String>(actionId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(resourceType.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (contextJson.present) {
      map['context_json'] = Variable<String>(contextJson.value);
    }
    if (decision.present) {
      map['decision'] = Variable<bool>(decision.value);
    }
    if (reasonsJson.present) {
      map['reasons_json'] = Variable<String>(reasonsJson.value);
    }
    if (errorsJson.present) {
      map['errors_json'] = Variable<String>(errorsJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarAuthorizationLogsCompanion(')
          ..write('rowid: $rowid, ')
          ..write('createTime: $createTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('principalType: $principalType, ')
          ..write('principalId: $principalId, ')
          ..write('actionType: $actionType, ')
          ..write('actionId: $actionId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('contextJson: $contextJson, ')
          ..write('decision: $decision, ')
          ..write('reasonsJson: $reasonsJson, ')
          ..write('errorsJson: $errorsJson')
          ..write(')'))
        .toString();
  }
}

class CryptoKeys extends Table with TableInfo<CryptoKeys, CryptoKeysData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CryptoKeys(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<Uint8List> cryptoKeyId =
      GeneratedColumn<Uint8List>('crypto_key_id', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> keyPurpose = GeneratedColumn<String>(
      'key_purpose', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> keyAlgorithm = GeneratedColumn<String>(
      'key_algorithm', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<Uint8List> keyMaterial =
      GeneratedColumn<Uint8List>('key_material', aliasedName, true,
          type: DriftSqlType.blob,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final GeneratedColumn<String> externalCryptoKeyId =
      GeneratedColumn<String>('external_crypto_key_id', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: 'UNIQUE');
  @override
  List<GeneratedColumn> get $columns =>
      [cryptoKeyId, keyPurpose, keyAlgorithm, keyMaterial, externalCryptoKeyId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crypto_keys';
  @override
  Set<GeneratedColumn> get $primaryKey => {cryptoKeyId};
  @override
  CryptoKeysData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CryptoKeysData(
      cryptoKeyId: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}crypto_key_id'])!,
      keyPurpose: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key_purpose'])!,
      keyAlgorithm: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key_algorithm'])!,
      keyMaterial: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}key_material']),
      externalCryptoKeyId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}external_crypto_key_id']),
    );
  }

  @override
  CryptoKeys createAlias(String alias) {
    return CryptoKeys(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CHECK(key_material IS NOT NULL OR external_crypto_key_id IS NOT NULL)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CryptoKeysData extends DataClass implements Insertable<CryptoKeysData> {
  final Uint8List cryptoKeyId;
  final String keyPurpose;
  final String keyAlgorithm;
  final Uint8List? keyMaterial;
  final String? externalCryptoKeyId;
  const CryptoKeysData(
      {required this.cryptoKeyId,
      required this.keyPurpose,
      required this.keyAlgorithm,
      this.keyMaterial,
      this.externalCryptoKeyId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['crypto_key_id'] = Variable<Uint8List>(cryptoKeyId);
    map['key_purpose'] = Variable<String>(keyPurpose);
    map['key_algorithm'] = Variable<String>(keyAlgorithm);
    if (!nullToAbsent || keyMaterial != null) {
      map['key_material'] = Variable<Uint8List>(keyMaterial);
    }
    if (!nullToAbsent || externalCryptoKeyId != null) {
      map['external_crypto_key_id'] = Variable<String>(externalCryptoKeyId);
    }
    return map;
  }

  factory CryptoKeysData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CryptoKeysData(
      cryptoKeyId: serializer.fromJson<Uint8List>(json['cryptoKeyId']),
      keyPurpose: serializer.fromJson<String>(json['keyPurpose']),
      keyAlgorithm: serializer.fromJson<String>(json['keyAlgorithm']),
      keyMaterial: serializer.fromJson<Uint8List?>(json['keyMaterial']),
      externalCryptoKeyId:
          serializer.fromJson<String?>(json['externalCryptoKeyId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cryptoKeyId': serializer.toJson<Uint8List>(cryptoKeyId),
      'keyPurpose': serializer.toJson<String>(keyPurpose),
      'keyAlgorithm': serializer.toJson<String>(keyAlgorithm),
      'keyMaterial': serializer.toJson<Uint8List?>(keyMaterial),
      'externalCryptoKeyId': serializer.toJson<String?>(externalCryptoKeyId),
    };
  }

  CryptoKeysData copyWith(
          {Uint8List? cryptoKeyId,
          String? keyPurpose,
          String? keyAlgorithm,
          Value<Uint8List?> keyMaterial = const Value.absent(),
          Value<String?> externalCryptoKeyId = const Value.absent()}) =>
      CryptoKeysData(
        cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
        keyPurpose: keyPurpose ?? this.keyPurpose,
        keyAlgorithm: keyAlgorithm ?? this.keyAlgorithm,
        keyMaterial: keyMaterial.present ? keyMaterial.value : this.keyMaterial,
        externalCryptoKeyId: externalCryptoKeyId.present
            ? externalCryptoKeyId.value
            : this.externalCryptoKeyId,
      );
  CryptoKeysData copyWithCompanion(CryptoKeysCompanion data) {
    return CryptoKeysData(
      cryptoKeyId:
          data.cryptoKeyId.present ? data.cryptoKeyId.value : this.cryptoKeyId,
      keyPurpose:
          data.keyPurpose.present ? data.keyPurpose.value : this.keyPurpose,
      keyAlgorithm: data.keyAlgorithm.present
          ? data.keyAlgorithm.value
          : this.keyAlgorithm,
      keyMaterial:
          data.keyMaterial.present ? data.keyMaterial.value : this.keyMaterial,
      externalCryptoKeyId: data.externalCryptoKeyId.present
          ? data.externalCryptoKeyId.value
          : this.externalCryptoKeyId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CryptoKeysData(')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('keyPurpose: $keyPurpose, ')
          ..write('keyAlgorithm: $keyAlgorithm, ')
          ..write('keyMaterial: $keyMaterial, ')
          ..write('externalCryptoKeyId: $externalCryptoKeyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      $driftBlobEquality.hash(cryptoKeyId),
      keyPurpose,
      keyAlgorithm,
      $driftBlobEquality.hash(keyMaterial),
      externalCryptoKeyId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CryptoKeysData &&
          $driftBlobEquality.equals(other.cryptoKeyId, this.cryptoKeyId) &&
          other.keyPurpose == this.keyPurpose &&
          other.keyAlgorithm == this.keyAlgorithm &&
          $driftBlobEquality.equals(other.keyMaterial, this.keyMaterial) &&
          other.externalCryptoKeyId == this.externalCryptoKeyId);
}

class CryptoKeysCompanion extends UpdateCompanion<CryptoKeysData> {
  final Value<Uint8List> cryptoKeyId;
  final Value<String> keyPurpose;
  final Value<String> keyAlgorithm;
  final Value<Uint8List?> keyMaterial;
  final Value<String?> externalCryptoKeyId;
  final Value<int> rowid;
  const CryptoKeysCompanion({
    this.cryptoKeyId = const Value.absent(),
    this.keyPurpose = const Value.absent(),
    this.keyAlgorithm = const Value.absent(),
    this.keyMaterial = const Value.absent(),
    this.externalCryptoKeyId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CryptoKeysCompanion.insert({
    required Uint8List cryptoKeyId,
    required String keyPurpose,
    required String keyAlgorithm,
    this.keyMaterial = const Value.absent(),
    this.externalCryptoKeyId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : cryptoKeyId = Value(cryptoKeyId),
        keyPurpose = Value(keyPurpose),
        keyAlgorithm = Value(keyAlgorithm);
  static Insertable<CryptoKeysData> custom({
    Expression<Uint8List>? cryptoKeyId,
    Expression<String>? keyPurpose,
    Expression<String>? keyAlgorithm,
    Expression<Uint8List>? keyMaterial,
    Expression<String>? externalCryptoKeyId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cryptoKeyId != null) 'crypto_key_id': cryptoKeyId,
      if (keyPurpose != null) 'key_purpose': keyPurpose,
      if (keyAlgorithm != null) 'key_algorithm': keyAlgorithm,
      if (keyMaterial != null) 'key_material': keyMaterial,
      if (externalCryptoKeyId != null)
        'external_crypto_key_id': externalCryptoKeyId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CryptoKeysCompanion copyWith(
      {Value<Uint8List>? cryptoKeyId,
      Value<String>? keyPurpose,
      Value<String>? keyAlgorithm,
      Value<Uint8List?>? keyMaterial,
      Value<String?>? externalCryptoKeyId,
      Value<int>? rowid}) {
    return CryptoKeysCompanion(
      cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
      keyPurpose: keyPurpose ?? this.keyPurpose,
      keyAlgorithm: keyAlgorithm ?? this.keyAlgorithm,
      keyMaterial: keyMaterial ?? this.keyMaterial,
      externalCryptoKeyId: externalCryptoKeyId ?? this.externalCryptoKeyId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cryptoKeyId.present) {
      map['crypto_key_id'] = Variable<Uint8List>(cryptoKeyId.value);
    }
    if (keyPurpose.present) {
      map['key_purpose'] = Variable<String>(keyPurpose.value);
    }
    if (keyAlgorithm.present) {
      map['key_algorithm'] = Variable<String>(keyAlgorithm.value);
    }
    if (keyMaterial.present) {
      map['key_material'] = Variable<Uint8List>(keyMaterial.value);
    }
    if (externalCryptoKeyId.present) {
      map['external_crypto_key_id'] =
          Variable<String>(externalCryptoKeyId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CryptoKeysCompanion(')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('keyPurpose: $keyPurpose, ')
          ..write('keyAlgorithm: $keyAlgorithm, ')
          ..write('keyMaterial: $keyMaterial, ')
          ..write('externalCryptoKeyId: $externalCryptoKeyId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Sessions extends Table with TableInfo<Sessions, SessionsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Sessions(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> rowid = GeneratedColumn<int>(
      'rowid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final GeneratedColumn<Uint8List> cryptoKeyId =
      GeneratedColumn<Uint8List>('crypto_key_id', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<Uint8List> clientInfo = GeneratedColumn<Uint8List>(
      'client_info', aliasedName, false,
      type: DriftSqlType.blob,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<Uint8List> authenticationFactor =
      GeneratedColumn<Uint8List>('authentication_factor', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<Uint8List> state = GeneratedColumn<Uint8List>(
      'state', aliasedName, true,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
      'ip_address', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> externalSessionId =
      GeneratedColumn<String>('external_session_id', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final GeneratedColumn<double> createTime = GeneratedColumn<double>(
      'create_time', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
      defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final GeneratedColumn<double> updateTime = GeneratedColumn<double>(
      'update_time', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<double> expireTime = GeneratedColumn<double>(
      'expire_time', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<double> cancelTime = GeneratedColumn<double>(
      'cancel_time', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        rowid,
        sessionId,
        cryptoKeyId,
        userId,
        clientInfo,
        authenticationFactor,
        state,
        ipAddress,
        externalSessionId,
        createTime,
        updateTime,
        expireTime,
        cancelTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  Set<GeneratedColumn> get $primaryKey => {rowid};
  @override
  SessionsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionsData(
      rowid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rowid'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      cryptoKeyId: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}crypto_key_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id']),
      clientInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}client_info'])!,
      authenticationFactor: attachedDatabase.typeMapping.read(
          DriftSqlType.blob, data['${effectivePrefix}authentication_factor'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}state']),
      ipAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ip_address']),
      externalSessionId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}external_session_id']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}update_time']),
      expireTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expire_time'])!,
      cancelTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cancel_time']),
    );
  }

  @override
  Sessions createAlias(String alias) {
    return Sessions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT sessions_user_fk FOREIGN KEY(user_id)REFERENCES users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
        'CONSTRAINT sessions_key_fk FOREIGN KEY(crypto_key_id)REFERENCES crypto_keys(crypto_key_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class SessionsData extends DataClass implements Insertable<SessionsData> {
  final int rowid;
  final String sessionId;
  final Uint8List cryptoKeyId;
  final String? userId;
  final Uint8List clientInfo;
  final Uint8List authenticationFactor;
  final Uint8List? state;
  final String? ipAddress;
  final String? externalSessionId;
  final double createTime;
  final double? updateTime;
  final double expireTime;
  final double? cancelTime;
  const SessionsData(
      {required this.rowid,
      required this.sessionId,
      required this.cryptoKeyId,
      this.userId,
      required this.clientInfo,
      required this.authenticationFactor,
      this.state,
      this.ipAddress,
      this.externalSessionId,
      required this.createTime,
      this.updateTime,
      required this.expireTime,
      this.cancelTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rowid'] = Variable<int>(rowid);
    map['session_id'] = Variable<String>(sessionId);
    map['crypto_key_id'] = Variable<Uint8List>(cryptoKeyId);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['client_info'] = Variable<Uint8List>(clientInfo);
    map['authentication_factor'] = Variable<Uint8List>(authenticationFactor);
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<Uint8List>(state);
    }
    if (!nullToAbsent || ipAddress != null) {
      map['ip_address'] = Variable<String>(ipAddress);
    }
    if (!nullToAbsent || externalSessionId != null) {
      map['external_session_id'] = Variable<String>(externalSessionId);
    }
    map['create_time'] = Variable<double>(createTime);
    if (!nullToAbsent || updateTime != null) {
      map['update_time'] = Variable<double>(updateTime);
    }
    map['expire_time'] = Variable<double>(expireTime);
    if (!nullToAbsent || cancelTime != null) {
      map['cancel_time'] = Variable<double>(cancelTime);
    }
    return map;
  }

  factory SessionsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionsData(
      rowid: serializer.fromJson<int>(json['rowid']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      cryptoKeyId: serializer.fromJson<Uint8List>(json['cryptoKeyId']),
      userId: serializer.fromJson<String?>(json['userId']),
      clientInfo: serializer.fromJson<Uint8List>(json['clientInfo']),
      authenticationFactor:
          serializer.fromJson<Uint8List>(json['authenticationFactor']),
      state: serializer.fromJson<Uint8List?>(json['state']),
      ipAddress: serializer.fromJson<String?>(json['ipAddress']),
      externalSessionId:
          serializer.fromJson<String?>(json['externalSessionId']),
      createTime: serializer.fromJson<double>(json['createTime']),
      updateTime: serializer.fromJson<double?>(json['updateTime']),
      expireTime: serializer.fromJson<double>(json['expireTime']),
      cancelTime: serializer.fromJson<double?>(json['cancelTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowid': serializer.toJson<int>(rowid),
      'sessionId': serializer.toJson<String>(sessionId),
      'cryptoKeyId': serializer.toJson<Uint8List>(cryptoKeyId),
      'userId': serializer.toJson<String?>(userId),
      'clientInfo': serializer.toJson<Uint8List>(clientInfo),
      'authenticationFactor':
          serializer.toJson<Uint8List>(authenticationFactor),
      'state': serializer.toJson<Uint8List?>(state),
      'ipAddress': serializer.toJson<String?>(ipAddress),
      'externalSessionId': serializer.toJson<String?>(externalSessionId),
      'createTime': serializer.toJson<double>(createTime),
      'updateTime': serializer.toJson<double?>(updateTime),
      'expireTime': serializer.toJson<double>(expireTime),
      'cancelTime': serializer.toJson<double?>(cancelTime),
    };
  }

  SessionsData copyWith(
          {int? rowid,
          String? sessionId,
          Uint8List? cryptoKeyId,
          Value<String?> userId = const Value.absent(),
          Uint8List? clientInfo,
          Uint8List? authenticationFactor,
          Value<Uint8List?> state = const Value.absent(),
          Value<String?> ipAddress = const Value.absent(),
          Value<String?> externalSessionId = const Value.absent(),
          double? createTime,
          Value<double?> updateTime = const Value.absent(),
          double? expireTime,
          Value<double?> cancelTime = const Value.absent()}) =>
      SessionsData(
        rowid: rowid ?? this.rowid,
        sessionId: sessionId ?? this.sessionId,
        cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
        userId: userId.present ? userId.value : this.userId,
        clientInfo: clientInfo ?? this.clientInfo,
        authenticationFactor: authenticationFactor ?? this.authenticationFactor,
        state: state.present ? state.value : this.state,
        ipAddress: ipAddress.present ? ipAddress.value : this.ipAddress,
        externalSessionId: externalSessionId.present
            ? externalSessionId.value
            : this.externalSessionId,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime.present ? updateTime.value : this.updateTime,
        expireTime: expireTime ?? this.expireTime,
        cancelTime: cancelTime.present ? cancelTime.value : this.cancelTime,
      );
  SessionsData copyWithCompanion(SessionsCompanion data) {
    return SessionsData(
      rowid: data.rowid.present ? data.rowid.value : this.rowid,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      cryptoKeyId:
          data.cryptoKeyId.present ? data.cryptoKeyId.value : this.cryptoKeyId,
      userId: data.userId.present ? data.userId.value : this.userId,
      clientInfo:
          data.clientInfo.present ? data.clientInfo.value : this.clientInfo,
      authenticationFactor: data.authenticationFactor.present
          ? data.authenticationFactor.value
          : this.authenticationFactor,
      state: data.state.present ? data.state.value : this.state,
      ipAddress: data.ipAddress.present ? data.ipAddress.value : this.ipAddress,
      externalSessionId: data.externalSessionId.present
          ? data.externalSessionId.value
          : this.externalSessionId,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
      expireTime:
          data.expireTime.present ? data.expireTime.value : this.expireTime,
      cancelTime:
          data.cancelTime.present ? data.cancelTime.value : this.cancelTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionsData(')
          ..write('rowid: $rowid, ')
          ..write('sessionId: $sessionId, ')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('userId: $userId, ')
          ..write('clientInfo: $clientInfo, ')
          ..write('authenticationFactor: $authenticationFactor, ')
          ..write('state: $state, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('externalSessionId: $externalSessionId, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('cancelTime: $cancelTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      rowid,
      sessionId,
      $driftBlobEquality.hash(cryptoKeyId),
      userId,
      $driftBlobEquality.hash(clientInfo),
      $driftBlobEquality.hash(authenticationFactor),
      $driftBlobEquality.hash(state),
      ipAddress,
      externalSessionId,
      createTime,
      updateTime,
      expireTime,
      cancelTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionsData &&
          other.rowid == this.rowid &&
          other.sessionId == this.sessionId &&
          $driftBlobEquality.equals(other.cryptoKeyId, this.cryptoKeyId) &&
          other.userId == this.userId &&
          $driftBlobEquality.equals(other.clientInfo, this.clientInfo) &&
          $driftBlobEquality.equals(
              other.authenticationFactor, this.authenticationFactor) &&
          $driftBlobEquality.equals(other.state, this.state) &&
          other.ipAddress == this.ipAddress &&
          other.externalSessionId == this.externalSessionId &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.expireTime == this.expireTime &&
          other.cancelTime == this.cancelTime);
}

class SessionsCompanion extends UpdateCompanion<SessionsData> {
  final Value<int> rowid;
  final Value<String> sessionId;
  final Value<Uint8List> cryptoKeyId;
  final Value<String?> userId;
  final Value<Uint8List> clientInfo;
  final Value<Uint8List> authenticationFactor;
  final Value<Uint8List?> state;
  final Value<String?> ipAddress;
  final Value<String?> externalSessionId;
  final Value<double> createTime;
  final Value<double?> updateTime;
  final Value<double> expireTime;
  final Value<double?> cancelTime;
  const SessionsCompanion({
    this.rowid = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.cryptoKeyId = const Value.absent(),
    this.userId = const Value.absent(),
    this.clientInfo = const Value.absent(),
    this.authenticationFactor = const Value.absent(),
    this.state = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.externalSessionId = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.expireTime = const Value.absent(),
    this.cancelTime = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.rowid = const Value.absent(),
    required String sessionId,
    required Uint8List cryptoKeyId,
    this.userId = const Value.absent(),
    required Uint8List clientInfo,
    required Uint8List authenticationFactor,
    this.state = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.externalSessionId = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    required double expireTime,
    this.cancelTime = const Value.absent(),
  })  : sessionId = Value(sessionId),
        cryptoKeyId = Value(cryptoKeyId),
        clientInfo = Value(clientInfo),
        authenticationFactor = Value(authenticationFactor),
        expireTime = Value(expireTime);
  static Insertable<SessionsData> custom({
    Expression<int>? rowid,
    Expression<String>? sessionId,
    Expression<Uint8List>? cryptoKeyId,
    Expression<String>? userId,
    Expression<Uint8List>? clientInfo,
    Expression<Uint8List>? authenticationFactor,
    Expression<Uint8List>? state,
    Expression<String>? ipAddress,
    Expression<String>? externalSessionId,
    Expression<double>? createTime,
    Expression<double>? updateTime,
    Expression<double>? expireTime,
    Expression<double>? cancelTime,
  }) {
    return RawValuesInsertable({
      if (rowid != null) 'rowid': rowid,
      if (sessionId != null) 'session_id': sessionId,
      if (cryptoKeyId != null) 'crypto_key_id': cryptoKeyId,
      if (userId != null) 'user_id': userId,
      if (clientInfo != null) 'client_info': clientInfo,
      if (authenticationFactor != null)
        'authentication_factor': authenticationFactor,
      if (state != null) 'state': state,
      if (ipAddress != null) 'ip_address': ipAddress,
      if (externalSessionId != null) 'external_session_id': externalSessionId,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (expireTime != null) 'expire_time': expireTime,
      if (cancelTime != null) 'cancel_time': cancelTime,
    });
  }

  SessionsCompanion copyWith(
      {Value<int>? rowid,
      Value<String>? sessionId,
      Value<Uint8List>? cryptoKeyId,
      Value<String?>? userId,
      Value<Uint8List>? clientInfo,
      Value<Uint8List>? authenticationFactor,
      Value<Uint8List?>? state,
      Value<String?>? ipAddress,
      Value<String?>? externalSessionId,
      Value<double>? createTime,
      Value<double?>? updateTime,
      Value<double>? expireTime,
      Value<double?>? cancelTime}) {
    return SessionsCompanion(
      rowid: rowid ?? this.rowid,
      sessionId: sessionId ?? this.sessionId,
      cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
      userId: userId ?? this.userId,
      clientInfo: clientInfo ?? this.clientInfo,
      authenticationFactor: authenticationFactor ?? this.authenticationFactor,
      state: state ?? this.state,
      ipAddress: ipAddress ?? this.ipAddress,
      externalSessionId: externalSessionId ?? this.externalSessionId,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      expireTime: expireTime ?? this.expireTime,
      cancelTime: cancelTime ?? this.cancelTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (cryptoKeyId.present) {
      map['crypto_key_id'] = Variable<Uint8List>(cryptoKeyId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (clientInfo.present) {
      map['client_info'] = Variable<Uint8List>(clientInfo.value);
    }
    if (authenticationFactor.present) {
      map['authentication_factor'] =
          Variable<Uint8List>(authenticationFactor.value);
    }
    if (state.present) {
      map['state'] = Variable<Uint8List>(state.value);
    }
    if (ipAddress.present) {
      map['ip_address'] = Variable<String>(ipAddress.value);
    }
    if (externalSessionId.present) {
      map['external_session_id'] = Variable<String>(externalSessionId.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<double>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<double>(updateTime.value);
    }
    if (expireTime.present) {
      map['expire_time'] = Variable<double>(expireTime.value);
    }
    if (cancelTime.present) {
      map['cancel_time'] = Variable<double>(cancelTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('rowid: $rowid, ')
          ..write('sessionId: $sessionId, ')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('userId: $userId, ')
          ..write('clientInfo: $clientInfo, ')
          ..write('authenticationFactor: $authenticationFactor, ')
          ..write('state: $state, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('externalSessionId: $externalSessionId, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('cancelTime: $cancelTime')
          ..write(')'))
        .toString();
  }
}

class OtpCodes extends Table with TableInfo<OtpCodes, OtpCodesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  OtpCodes(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> rowid = GeneratedColumn<int>(
      'rowid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final GeneratedColumn<int> resendAttempt = GeneratedColumn<int>(
      'resend_attempt', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<int> verifyAttempt = GeneratedColumn<int>(
      'verify_attempt', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<double> updateTime = GeneratedColumn<double>(
      'update_time', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
      defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'));
  @override
  List<GeneratedColumn> get $columns =>
      [rowid, sessionId, resendAttempt, verifyAttempt, updateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'otp_codes';
  @override
  Set<GeneratedColumn> get $primaryKey => {rowid};
  @override
  OtpCodesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OtpCodesData(
      rowid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rowid'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      resendAttempt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}resend_attempt'])!,
      verifyAttempt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}verify_attempt'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}update_time'])!,
    );
  }

  @override
  OtpCodes createAlias(String alias) {
    return OtpCodes(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT otp_codes_session_fk FOREIGN KEY(session_id)REFERENCES sessions(session_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class OtpCodesData extends DataClass implements Insertable<OtpCodesData> {
  final int rowid;
  final String sessionId;
  final int resendAttempt;
  final int verifyAttempt;
  final double updateTime;
  const OtpCodesData(
      {required this.rowid,
      required this.sessionId,
      required this.resendAttempt,
      required this.verifyAttempt,
      required this.updateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rowid'] = Variable<int>(rowid);
    map['session_id'] = Variable<String>(sessionId);
    map['resend_attempt'] = Variable<int>(resendAttempt);
    map['verify_attempt'] = Variable<int>(verifyAttempt);
    map['update_time'] = Variable<double>(updateTime);
    return map;
  }

  factory OtpCodesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OtpCodesData(
      rowid: serializer.fromJson<int>(json['rowid']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      resendAttempt: serializer.fromJson<int>(json['resendAttempt']),
      verifyAttempt: serializer.fromJson<int>(json['verifyAttempt']),
      updateTime: serializer.fromJson<double>(json['updateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowid': serializer.toJson<int>(rowid),
      'sessionId': serializer.toJson<String>(sessionId),
      'resendAttempt': serializer.toJson<int>(resendAttempt),
      'verifyAttempt': serializer.toJson<int>(verifyAttempt),
      'updateTime': serializer.toJson<double>(updateTime),
    };
  }

  OtpCodesData copyWith(
          {int? rowid,
          String? sessionId,
          int? resendAttempt,
          int? verifyAttempt,
          double? updateTime}) =>
      OtpCodesData(
        rowid: rowid ?? this.rowid,
        sessionId: sessionId ?? this.sessionId,
        resendAttempt: resendAttempt ?? this.resendAttempt,
        verifyAttempt: verifyAttempt ?? this.verifyAttempt,
        updateTime: updateTime ?? this.updateTime,
      );
  OtpCodesData copyWithCompanion(OtpCodesCompanion data) {
    return OtpCodesData(
      rowid: data.rowid.present ? data.rowid.value : this.rowid,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      resendAttempt: data.resendAttempt.present
          ? data.resendAttempt.value
          : this.resendAttempt,
      verifyAttempt: data.verifyAttempt.present
          ? data.verifyAttempt.value
          : this.verifyAttempt,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OtpCodesData(')
          ..write('rowid: $rowid, ')
          ..write('sessionId: $sessionId, ')
          ..write('resendAttempt: $resendAttempt, ')
          ..write('verifyAttempt: $verifyAttempt, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(rowid, sessionId, resendAttempt, verifyAttempt, updateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OtpCodesData &&
          other.rowid == this.rowid &&
          other.sessionId == this.sessionId &&
          other.resendAttempt == this.resendAttempt &&
          other.verifyAttempt == this.verifyAttempt &&
          other.updateTime == this.updateTime);
}

class OtpCodesCompanion extends UpdateCompanion<OtpCodesData> {
  final Value<int> rowid;
  final Value<String> sessionId;
  final Value<int> resendAttempt;
  final Value<int> verifyAttempt;
  final Value<double> updateTime;
  const OtpCodesCompanion({
    this.rowid = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.resendAttempt = const Value.absent(),
    this.verifyAttempt = const Value.absent(),
    this.updateTime = const Value.absent(),
  });
  OtpCodesCompanion.insert({
    this.rowid = const Value.absent(),
    required String sessionId,
    this.resendAttempt = const Value.absent(),
    this.verifyAttempt = const Value.absent(),
    this.updateTime = const Value.absent(),
  }) : sessionId = Value(sessionId);
  static Insertable<OtpCodesData> custom({
    Expression<int>? rowid,
    Expression<String>? sessionId,
    Expression<int>? resendAttempt,
    Expression<int>? verifyAttempt,
    Expression<double>? updateTime,
  }) {
    return RawValuesInsertable({
      if (rowid != null) 'rowid': rowid,
      if (sessionId != null) 'session_id': sessionId,
      if (resendAttempt != null) 'resend_attempt': resendAttempt,
      if (verifyAttempt != null) 'verify_attempt': verifyAttempt,
      if (updateTime != null) 'update_time': updateTime,
    });
  }

  OtpCodesCompanion copyWith(
      {Value<int>? rowid,
      Value<String>? sessionId,
      Value<int>? resendAttempt,
      Value<int>? verifyAttempt,
      Value<double>? updateTime}) {
    return OtpCodesCompanion(
      rowid: rowid ?? this.rowid,
      sessionId: sessionId ?? this.sessionId,
      resendAttempt: resendAttempt ?? this.resendAttempt,
      verifyAttempt: verifyAttempt ?? this.verifyAttempt,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (resendAttempt.present) {
      map['resend_attempt'] = Variable<int>(resendAttempt.value);
    }
    if (verifyAttempt.present) {
      map['verify_attempt'] = Variable<int>(verifyAttempt.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<double>(updateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OtpCodesCompanion(')
          ..write('rowid: $rowid, ')
          ..write('sessionId: $sessionId, ')
          ..write('resendAttempt: $resendAttempt, ')
          ..write('verifyAttempt: $verifyAttempt, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }
}

class Corks extends Table with TableInfo<Corks, CorksData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Corks(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<Uint8List> corkId = GeneratedColumn<Uint8List>(
      'cork_id', aliasedName, false,
      type: DriftSqlType.blob,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<Uint8List> cryptoKeyId =
      GeneratedColumn<Uint8List>('crypto_key_id', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> bearerType = GeneratedColumn<String>(
      'bearer_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> bearerId = GeneratedColumn<String>(
      'bearer_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> audienceType = GeneratedColumn<String>(
      'audience_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> audienceId = GeneratedColumn<String>(
      'audience_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> issuerType = GeneratedColumn<String>(
      'issuer_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> issuerId = GeneratedColumn<String>(
      'issuer_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<double> createTime = GeneratedColumn<double>(
      'create_time', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
      defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final GeneratedColumn<double> expireTime = GeneratedColumn<double>(
      'expire_time', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<double> lastUseTime = GeneratedColumn<double>(
      'last_use_time', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        corkId,
        cryptoKeyId,
        bearerType,
        bearerId,
        audienceType,
        audienceId,
        issuerType,
        issuerId,
        createTime,
        expireTime,
        lastUseTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'corks';
  @override
  Set<GeneratedColumn> get $primaryKey => {corkId};
  @override
  CorksData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CorksData(
      corkId: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}cork_id'])!,
      cryptoKeyId: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}crypto_key_id'])!,
      bearerType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bearer_type']),
      bearerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bearer_id']),
      audienceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audience_type']),
      audienceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audience_id']),
      issuerType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}issuer_type']),
      issuerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}issuer_id']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}create_time'])!,
      expireTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expire_time']),
      lastUseTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}last_use_time']),
    );
  }

  @override
  Corks createAlias(String alias) {
    return Corks(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT corks_crypto_key_fk FOREIGN KEY(crypto_key_id)REFERENCES crypto_keys(crypto_key_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
        'CONSTRAINT corks_bearer_fk FOREIGN KEY(bearer_type, bearer_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
        'CONSTRAINT corks_audience_fk FOREIGN KEY(audience_type, audience_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
        'CONSTRAINT corks_issuer_fk FOREIGN KEY(issuer_type, issuer_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CorksData extends DataClass implements Insertable<CorksData> {
  final Uint8List corkId;
  final Uint8List cryptoKeyId;
  final String? bearerType;
  final String? bearerId;
  final String? audienceType;
  final String? audienceId;
  final String? issuerType;
  final String? issuerId;
  final double createTime;
  final double? expireTime;
  final double? lastUseTime;
  const CorksData(
      {required this.corkId,
      required this.cryptoKeyId,
      this.bearerType,
      this.bearerId,
      this.audienceType,
      this.audienceId,
      this.issuerType,
      this.issuerId,
      required this.createTime,
      this.expireTime,
      this.lastUseTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cork_id'] = Variable<Uint8List>(corkId);
    map['crypto_key_id'] = Variable<Uint8List>(cryptoKeyId);
    if (!nullToAbsent || bearerType != null) {
      map['bearer_type'] = Variable<String>(bearerType);
    }
    if (!nullToAbsent || bearerId != null) {
      map['bearer_id'] = Variable<String>(bearerId);
    }
    if (!nullToAbsent || audienceType != null) {
      map['audience_type'] = Variable<String>(audienceType);
    }
    if (!nullToAbsent || audienceId != null) {
      map['audience_id'] = Variable<String>(audienceId);
    }
    if (!nullToAbsent || issuerType != null) {
      map['issuer_type'] = Variable<String>(issuerType);
    }
    if (!nullToAbsent || issuerId != null) {
      map['issuer_id'] = Variable<String>(issuerId);
    }
    map['create_time'] = Variable<double>(createTime);
    if (!nullToAbsent || expireTime != null) {
      map['expire_time'] = Variable<double>(expireTime);
    }
    if (!nullToAbsent || lastUseTime != null) {
      map['last_use_time'] = Variable<double>(lastUseTime);
    }
    return map;
  }

  factory CorksData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CorksData(
      corkId: serializer.fromJson<Uint8List>(json['corkId']),
      cryptoKeyId: serializer.fromJson<Uint8List>(json['cryptoKeyId']),
      bearerType: serializer.fromJson<String?>(json['bearerType']),
      bearerId: serializer.fromJson<String?>(json['bearerId']),
      audienceType: serializer.fromJson<String?>(json['audienceType']),
      audienceId: serializer.fromJson<String?>(json['audienceId']),
      issuerType: serializer.fromJson<String?>(json['issuerType']),
      issuerId: serializer.fromJson<String?>(json['issuerId']),
      createTime: serializer.fromJson<double>(json['createTime']),
      expireTime: serializer.fromJson<double?>(json['expireTime']),
      lastUseTime: serializer.fromJson<double?>(json['lastUseTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'corkId': serializer.toJson<Uint8List>(corkId),
      'cryptoKeyId': serializer.toJson<Uint8List>(cryptoKeyId),
      'bearerType': serializer.toJson<String?>(bearerType),
      'bearerId': serializer.toJson<String?>(bearerId),
      'audienceType': serializer.toJson<String?>(audienceType),
      'audienceId': serializer.toJson<String?>(audienceId),
      'issuerType': serializer.toJson<String?>(issuerType),
      'issuerId': serializer.toJson<String?>(issuerId),
      'createTime': serializer.toJson<double>(createTime),
      'expireTime': serializer.toJson<double?>(expireTime),
      'lastUseTime': serializer.toJson<double?>(lastUseTime),
    };
  }

  CorksData copyWith(
          {Uint8List? corkId,
          Uint8List? cryptoKeyId,
          Value<String?> bearerType = const Value.absent(),
          Value<String?> bearerId = const Value.absent(),
          Value<String?> audienceType = const Value.absent(),
          Value<String?> audienceId = const Value.absent(),
          Value<String?> issuerType = const Value.absent(),
          Value<String?> issuerId = const Value.absent(),
          double? createTime,
          Value<double?> expireTime = const Value.absent(),
          Value<double?> lastUseTime = const Value.absent()}) =>
      CorksData(
        corkId: corkId ?? this.corkId,
        cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
        bearerType: bearerType.present ? bearerType.value : this.bearerType,
        bearerId: bearerId.present ? bearerId.value : this.bearerId,
        audienceType:
            audienceType.present ? audienceType.value : this.audienceType,
        audienceId: audienceId.present ? audienceId.value : this.audienceId,
        issuerType: issuerType.present ? issuerType.value : this.issuerType,
        issuerId: issuerId.present ? issuerId.value : this.issuerId,
        createTime: createTime ?? this.createTime,
        expireTime: expireTime.present ? expireTime.value : this.expireTime,
        lastUseTime: lastUseTime.present ? lastUseTime.value : this.lastUseTime,
      );
  CorksData copyWithCompanion(CorksCompanion data) {
    return CorksData(
      corkId: data.corkId.present ? data.corkId.value : this.corkId,
      cryptoKeyId:
          data.cryptoKeyId.present ? data.cryptoKeyId.value : this.cryptoKeyId,
      bearerType:
          data.bearerType.present ? data.bearerType.value : this.bearerType,
      bearerId: data.bearerId.present ? data.bearerId.value : this.bearerId,
      audienceType: data.audienceType.present
          ? data.audienceType.value
          : this.audienceType,
      audienceId:
          data.audienceId.present ? data.audienceId.value : this.audienceId,
      issuerType:
          data.issuerType.present ? data.issuerType.value : this.issuerType,
      issuerId: data.issuerId.present ? data.issuerId.value : this.issuerId,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      expireTime:
          data.expireTime.present ? data.expireTime.value : this.expireTime,
      lastUseTime:
          data.lastUseTime.present ? data.lastUseTime.value : this.lastUseTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CorksData(')
          ..write('corkId: $corkId, ')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('bearerType: $bearerType, ')
          ..write('bearerId: $bearerId, ')
          ..write('audienceType: $audienceType, ')
          ..write('audienceId: $audienceId, ')
          ..write('issuerType: $issuerType, ')
          ..write('issuerId: $issuerId, ')
          ..write('createTime: $createTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('lastUseTime: $lastUseTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      $driftBlobEquality.hash(corkId),
      $driftBlobEquality.hash(cryptoKeyId),
      bearerType,
      bearerId,
      audienceType,
      audienceId,
      issuerType,
      issuerId,
      createTime,
      expireTime,
      lastUseTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CorksData &&
          $driftBlobEquality.equals(other.corkId, this.corkId) &&
          $driftBlobEquality.equals(other.cryptoKeyId, this.cryptoKeyId) &&
          other.bearerType == this.bearerType &&
          other.bearerId == this.bearerId &&
          other.audienceType == this.audienceType &&
          other.audienceId == this.audienceId &&
          other.issuerType == this.issuerType &&
          other.issuerId == this.issuerId &&
          other.createTime == this.createTime &&
          other.expireTime == this.expireTime &&
          other.lastUseTime == this.lastUseTime);
}

class CorksCompanion extends UpdateCompanion<CorksData> {
  final Value<Uint8List> corkId;
  final Value<Uint8List> cryptoKeyId;
  final Value<String?> bearerType;
  final Value<String?> bearerId;
  final Value<String?> audienceType;
  final Value<String?> audienceId;
  final Value<String?> issuerType;
  final Value<String?> issuerId;
  final Value<double> createTime;
  final Value<double?> expireTime;
  final Value<double?> lastUseTime;
  final Value<int> rowid;
  const CorksCompanion({
    this.corkId = const Value.absent(),
    this.cryptoKeyId = const Value.absent(),
    this.bearerType = const Value.absent(),
    this.bearerId = const Value.absent(),
    this.audienceType = const Value.absent(),
    this.audienceId = const Value.absent(),
    this.issuerType = const Value.absent(),
    this.issuerId = const Value.absent(),
    this.createTime = const Value.absent(),
    this.expireTime = const Value.absent(),
    this.lastUseTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CorksCompanion.insert({
    required Uint8List corkId,
    required Uint8List cryptoKeyId,
    this.bearerType = const Value.absent(),
    this.bearerId = const Value.absent(),
    this.audienceType = const Value.absent(),
    this.audienceId = const Value.absent(),
    this.issuerType = const Value.absent(),
    this.issuerId = const Value.absent(),
    this.createTime = const Value.absent(),
    this.expireTime = const Value.absent(),
    this.lastUseTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : corkId = Value(corkId),
        cryptoKeyId = Value(cryptoKeyId);
  static Insertable<CorksData> custom({
    Expression<Uint8List>? corkId,
    Expression<Uint8List>? cryptoKeyId,
    Expression<String>? bearerType,
    Expression<String>? bearerId,
    Expression<String>? audienceType,
    Expression<String>? audienceId,
    Expression<String>? issuerType,
    Expression<String>? issuerId,
    Expression<double>? createTime,
    Expression<double>? expireTime,
    Expression<double>? lastUseTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (corkId != null) 'cork_id': corkId,
      if (cryptoKeyId != null) 'crypto_key_id': cryptoKeyId,
      if (bearerType != null) 'bearer_type': bearerType,
      if (bearerId != null) 'bearer_id': bearerId,
      if (audienceType != null) 'audience_type': audienceType,
      if (audienceId != null) 'audience_id': audienceId,
      if (issuerType != null) 'issuer_type': issuerType,
      if (issuerId != null) 'issuer_id': issuerId,
      if (createTime != null) 'create_time': createTime,
      if (expireTime != null) 'expire_time': expireTime,
      if (lastUseTime != null) 'last_use_time': lastUseTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CorksCompanion copyWith(
      {Value<Uint8List>? corkId,
      Value<Uint8List>? cryptoKeyId,
      Value<String?>? bearerType,
      Value<String?>? bearerId,
      Value<String?>? audienceType,
      Value<String?>? audienceId,
      Value<String?>? issuerType,
      Value<String?>? issuerId,
      Value<double>? createTime,
      Value<double?>? expireTime,
      Value<double?>? lastUseTime,
      Value<int>? rowid}) {
    return CorksCompanion(
      corkId: corkId ?? this.corkId,
      cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
      bearerType: bearerType ?? this.bearerType,
      bearerId: bearerId ?? this.bearerId,
      audienceType: audienceType ?? this.audienceType,
      audienceId: audienceId ?? this.audienceId,
      issuerType: issuerType ?? this.issuerType,
      issuerId: issuerId ?? this.issuerId,
      createTime: createTime ?? this.createTime,
      expireTime: expireTime ?? this.expireTime,
      lastUseTime: lastUseTime ?? this.lastUseTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (corkId.present) {
      map['cork_id'] = Variable<Uint8List>(corkId.value);
    }
    if (cryptoKeyId.present) {
      map['crypto_key_id'] = Variable<Uint8List>(cryptoKeyId.value);
    }
    if (bearerType.present) {
      map['bearer_type'] = Variable<String>(bearerType.value);
    }
    if (bearerId.present) {
      map['bearer_id'] = Variable<String>(bearerId.value);
    }
    if (audienceType.present) {
      map['audience_type'] = Variable<String>(audienceType.value);
    }
    if (audienceId.present) {
      map['audience_id'] = Variable<String>(audienceId.value);
    }
    if (issuerType.present) {
      map['issuer_type'] = Variable<String>(issuerType.value);
    }
    if (issuerId.present) {
      map['issuer_id'] = Variable<String>(issuerId.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<double>(createTime.value);
    }
    if (expireTime.present) {
      map['expire_time'] = Variable<double>(expireTime.value);
    }
    if (lastUseTime.present) {
      map['last_use_time'] = Variable<double>(lastUseTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CorksCompanion(')
          ..write('corkId: $corkId, ')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('bearerType: $bearerType, ')
          ..write('bearerId: $bearerId, ')
          ..write('audienceType: $audienceType, ')
          ..write('audienceId: $audienceId, ')
          ..write('issuerType: $issuerType, ')
          ..write('issuerId: $issuerId, ')
          ..write('createTime: $createTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('lastUseTime: $lastUseTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV1 extends GeneratedDatabase {
  DatabaseAtV1(QueryExecutor e) : super(e);
  late final Users users = Users(this);
  late final CedarTypes cedarTypes = CedarTypes(this);
  late final CedarEntities cedarEntities = CedarEntities(this);
  late final Trigger usersCreate = Trigger(
      'CREATE TRIGGER IF NOT EXISTS users_create BEFORE INSERT ON users BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::User\', NEW.user_id);END',
      'users_create');
  late final CedarRelationships cedarRelationships = CedarRelationships(this);
  late final Trigger usersDelete = Trigger(
      'CREATE TRIGGER IF NOT EXISTS users_delete AFTER DELETE ON users BEGIN DELETE FROM cedar_relationships WHERE(entity_type = \'Celest::User\' AND entity_id = OLD.user_id)OR(parent_type = \'Celest::User\' AND parent_id = OLD.user_id);DELETE FROM cedar_entities WHERE entity_id = OLD.user_id AND entity_type = \'Celest::User\';END',
      'users_delete');
  late final UserEmails userEmails = UserEmails(this);
  late final UserPhoneNumbers userPhoneNumbers = UserPhoneNumbers(this);
  late final CelestProjects celestProjects = CelestProjects(this);
  late final CelestApis celestApis = CelestApis(this);
  late final Index celestApisProjectIdx = Index('celest_apis_project_idx',
      'CREATE INDEX IF NOT EXISTS celest_apis_project_idx ON celest_apis (project_id)');
  late final Trigger celestApisTriggerCreate = Trigger(
      'CREATE TRIGGER IF NOT EXISTS celest_apis_trigger_create BEFORE INSERT ON celest_apis BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Api\', NEW.api_id);END',
      'celest_apis_trigger_create');
  late final Trigger celestApisTriggerDelete = Trigger(
      'CREATE TRIGGER IF NOT EXISTS celest_apis_trigger_delete AFTER DELETE ON celest_apis BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Api\' AND entity_id = OLD.api_id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Api\' AND parent_id = OLD.api_id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Api\' AND entity_id = OLD.api_id;END',
      'celest_apis_trigger_delete');
  late final CelestFunctions celestFunctions = CelestFunctions(this);
  late final Index celestFunctionsApiIdx = Index('celest_functions_api_idx',
      'CREATE INDEX IF NOT EXISTS celest_functions_api_idx ON celest_functions (api_id)');
  late final Trigger celestFunctionsTriggerCreate = Trigger(
      'CREATE TRIGGER IF NOT EXISTS celest_functions_trigger_create BEFORE INSERT ON celest_functions BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Function\', NEW.function_id);INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Function\', NEW.function_id, \'Celest::Api\', NEW.api_id);END',
      'celest_functions_trigger_create');
  late final Trigger celestFunctionsTriggerDelete = Trigger(
      'CREATE TRIGGER IF NOT EXISTS celest_functions_trigger_delete AFTER DELETE ON celest_functions BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Function\' AND entity_id = OLD.function_id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Function\' AND parent_id = OLD.function_id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Function\' AND entity_id = OLD.function_id;END',
      'celest_functions_trigger_delete');
  late final Index cedarRelationshipsFkEntityIdx = Index(
      'cedar_relationships_fk_entity_idx',
      'CREATE INDEX IF NOT EXISTS cedar_relationships_fk_entity_idx ON cedar_relationships (entity_type, entity_id)');
  late final Index cedarRelationshipsFkParentIdx = Index(
      'cedar_relationships_fk_parent_idx',
      'CREATE INDEX IF NOT EXISTS cedar_relationships_fk_parent_idx ON cedar_relationships (parent_type, parent_id)');
  late final CedarPolicies cedarPolicies = CedarPolicies(this);
  late final CedarPolicyTemplates cedarPolicyTemplates =
      CedarPolicyTemplates(this);
  late final CedarPolicyTemplateLinks cedarPolicyTemplateLinks =
      CedarPolicyTemplateLinks(this);
  late final Index cedarPolicyTemplateLinksFkTemplateIdIdx = Index(
      'cedar_policy_template_links_fk_template_id_idx',
      'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_template_id_idx ON cedar_policy_template_links (template_id)');
  late final Index cedarPolicyTemplateLinksFkPrincipalIdx = Index(
      'cedar_policy_template_links_fk_principal_idx',
      'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_principal_idx ON cedar_policy_template_links (principal_type, principal_id)');
  late final Index cedarPolicyTemplateLinksFkResourceIdx = Index(
      'cedar_policy_template_links_fk_resource_idx',
      'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_resource_idx ON cedar_policy_template_links (resource_type, resource_id)');
  late final CedarAuthorizationLogs cedarAuthorizationLogs =
      CedarAuthorizationLogs(this);
  late final CryptoKeys cryptoKeys = CryptoKeys(this);
  late final Index cryptoKeysExternalCryptoKeyIdIdx = Index(
      'crypto_keys_external_crypto_key_id_idx',
      'CREATE INDEX IF NOT EXISTS crypto_keys_external_crypto_key_id_idx ON crypto_keys (external_crypto_key_id)');
  late final Sessions sessions = Sessions(this);
  late final Index sessionsUserIdx = Index('sessions_user_idx',
      'CREATE INDEX IF NOT EXISTS sessions_user_idx ON sessions (user_id)');
  late final Index sessionsCryptoKeyIdx = Index('sessions_crypto_key_idx',
      'CREATE INDEX IF NOT EXISTS sessions_crypto_key_idx ON sessions (crypto_key_id)');
  late final Index sessionsExternalSessionIdIdx = Index(
      'sessions_external_session_id_idx',
      'CREATE INDEX IF NOT EXISTS sessions_external_session_id_idx ON sessions (external_session_id)');
  late final Trigger authSessionsUpdateTime = Trigger(
      'CREATE TRIGGER IF NOT EXISTS auth_sessions_update_time AFTER UPDATE ON sessions BEGIN UPDATE sessions SET update_time = unixepoch(\'now\', \'subsec\') WHERE "rowid" = OLD."rowid";END',
      'auth_sessions_update_time');
  late final OtpCodes otpCodes = OtpCodes(this);
  late final Index otpCodesSessionIdx = Index('otp_codes_session_idx',
      'CREATE INDEX IF NOT EXISTS otp_codes_session_idx ON otp_codes (session_id)');
  late final Corks corks = Corks(this);
  late final Index corksCryptoKeyIdx = Index('corks_crypto_key_idx',
      'CREATE INDEX IF NOT EXISTS corks_crypto_key_idx ON corks (crypto_key_id)');
  late final Index corksBearerIdx = Index('corks_bearer_idx',
      'CREATE INDEX IF NOT EXISTS corks_bearer_idx ON corks (bearer_type, bearer_id)');
  late final Index corksAudienceIdx = Index('corks_audience_idx',
      'CREATE INDEX IF NOT EXISTS corks_audience_idx ON corks (audience_type, audience_id)');
  late final Index corksIssuerIdx = Index('corks_issuer_idx',
      'CREATE INDEX IF NOT EXISTS corks_issuer_idx ON corks (issuer_type, issuer_id)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        cedarTypes,
        cedarEntities,
        usersCreate,
        cedarRelationships,
        usersDelete,
        userEmails,
        userPhoneNumbers,
        celestProjects,
        celestApis,
        celestApisProjectIdx,
        celestApisTriggerCreate,
        celestApisTriggerDelete,
        celestFunctions,
        celestFunctionsApiIdx,
        celestFunctionsTriggerCreate,
        celestFunctionsTriggerDelete,
        cedarRelationshipsFkEntityIdx,
        cedarRelationshipsFkParentIdx,
        cedarPolicies,
        cedarPolicyTemplates,
        cedarPolicyTemplateLinks,
        cedarPolicyTemplateLinksFkTemplateIdIdx,
        cedarPolicyTemplateLinksFkPrincipalIdx,
        cedarPolicyTemplateLinksFkResourceIdx,
        cedarAuthorizationLogs,
        cryptoKeys,
        cryptoKeysExternalCryptoKeyIdIdx,
        sessions,
        sessionsUserIdx,
        sessionsCryptoKeyIdx,
        sessionsExternalSessionIdIdx,
        authSessionsUpdateTime,
        otpCodes,
        otpCodesSessionIdx,
        corks,
        corksCryptoKeyIdx,
        corksBearerIdx,
        corksAudienceIdx,
        corksIssuerIdx
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('celest_apis',
                limitUpdateKind: UpdateKind.delete),
            result: [],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('celest_apis',
                limitUpdateKind: UpdateKind.delete),
            result: [],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('celest_functions',
                limitUpdateKind: UpdateKind.delete),
            result: [],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('celest_functions',
                limitUpdateKind: UpdateKind.delete),
            result: [],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sessions',
                limitUpdateKind: UpdateKind.delete),
            result: [],
          ),
        ],
      );
  @override
  int get schemaVersion => 1;
}
