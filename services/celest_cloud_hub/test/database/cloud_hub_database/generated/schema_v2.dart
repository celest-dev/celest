// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class CloudAuthUsers extends Table
    with TableInfo<CloudAuthUsers, CloudAuthUsersData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthUsers(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> givenName = GeneratedColumn<String>(
    'given_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> familyName = GeneratedColumn<String>(
    'family_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> timeZone = GeneratedColumn<String>(
    'time_zone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<double> createTime = GeneratedColumn<double>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<double> updateTime = GeneratedColumn<double>(
    'update_time',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    givenName,
    familyName,
    timeZone,
    languageCode,
    createTime,
    updateTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_users';
  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  CloudAuthUsersData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthUsersData(
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      givenName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}given_name'],
      ),
      familyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}family_name'],
      ),
      timeZone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time_zone'],
      ),
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      ),
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}create_time'],
          )!,
      updateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}update_time'],
      ),
    );
  }

  @override
  CloudAuthUsers createAlias(String alias) {
    return CloudAuthUsers(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthUsersData extends DataClass
    implements Insertable<CloudAuthUsersData> {
  final String userId;
  final String? givenName;
  final String? familyName;
  final String? timeZone;
  final String? languageCode;
  final double createTime;
  final double? updateTime;
  const CloudAuthUsersData({
    required this.userId,
    this.givenName,
    this.familyName,
    this.timeZone,
    this.languageCode,
    required this.createTime,
    this.updateTime,
  });
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

  CloudAuthUsersCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthUsersCompanion(
      userId: Value(userId),
      givenName:
          givenName == null && nullToAbsent
              ? const Value.absent()
              : Value(givenName),
      familyName:
          familyName == null && nullToAbsent
              ? const Value.absent()
              : Value(familyName),
      timeZone:
          timeZone == null && nullToAbsent
              ? const Value.absent()
              : Value(timeZone),
      languageCode:
          languageCode == null && nullToAbsent
              ? const Value.absent()
              : Value(languageCode),
      createTime: Value(createTime),
      updateTime:
          updateTime == null && nullToAbsent
              ? const Value.absent()
              : Value(updateTime),
    );
  }

  factory CloudAuthUsersData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthUsersData(
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

  CloudAuthUsersData copyWith({
    String? userId,
    Value<String?> givenName = const Value.absent(),
    Value<String?> familyName = const Value.absent(),
    Value<String?> timeZone = const Value.absent(),
    Value<String?> languageCode = const Value.absent(),
    double? createTime,
    Value<double?> updateTime = const Value.absent(),
  }) => CloudAuthUsersData(
    userId: userId ?? this.userId,
    givenName: givenName.present ? givenName.value : this.givenName,
    familyName: familyName.present ? familyName.value : this.familyName,
    timeZone: timeZone.present ? timeZone.value : this.timeZone,
    languageCode: languageCode.present ? languageCode.value : this.languageCode,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime.present ? updateTime.value : this.updateTime,
  );
  CloudAuthUsersData copyWithCompanion(CloudAuthUsersCompanion data) {
    return CloudAuthUsersData(
      userId: data.userId.present ? data.userId.value : this.userId,
      givenName: data.givenName.present ? data.givenName.value : this.givenName,
      familyName:
          data.familyName.present ? data.familyName.value : this.familyName,
      timeZone: data.timeZone.present ? data.timeZone.value : this.timeZone,
      languageCode:
          data.languageCode.present
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
    return (StringBuffer('CloudAuthUsersData(')
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
  int get hashCode => Object.hash(
    userId,
    givenName,
    familyName,
    timeZone,
    languageCode,
    createTime,
    updateTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudAuthUsersData &&
          other.userId == this.userId &&
          other.givenName == this.givenName &&
          other.familyName == this.familyName &&
          other.timeZone == this.timeZone &&
          other.languageCode == this.languageCode &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime);
}

class CloudAuthUsersCompanion extends UpdateCompanion<CloudAuthUsersData> {
  final Value<String> userId;
  final Value<String?> givenName;
  final Value<String?> familyName;
  final Value<String?> timeZone;
  final Value<String?> languageCode;
  final Value<double> createTime;
  final Value<double?> updateTime;
  final Value<int> rowid;
  const CloudAuthUsersCompanion({
    this.userId = const Value.absent(),
    this.givenName = const Value.absent(),
    this.familyName = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudAuthUsersCompanion.insert({
    required String userId,
    this.givenName = const Value.absent(),
    this.familyName = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<CloudAuthUsersData> custom({
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

  CloudAuthUsersCompanion copyWith({
    Value<String>? userId,
    Value<String?>? givenName,
    Value<String?>? familyName,
    Value<String?>? timeZone,
    Value<String?>? languageCode,
    Value<double>? createTime,
    Value<double?>? updateTime,
    Value<int>? rowid,
  }) {
    return CloudAuthUsersCompanion(
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
    return (StringBuffer('CloudAuthUsersCompanion(')
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
    'fqn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
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
      fqn:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}fqn'],
          )!,
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

  CedarTypesCompanion toCompanion(bool nullToAbsent) {
    return CedarTypesCompanion(fqn: Value(fqn));
  }

  factory CedarTypesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CedarTypesData(fqn: serializer.fromJson<String>(json['fqn']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'fqn': serializer.toJson<String>(fqn)};
  }

  CedarTypesData copyWith({String? fqn}) =>
      CedarTypesData(fqn: fqn ?? this.fqn);
  CedarTypesData copyWithCompanion(CedarTypesCompanion data) {
    return CedarTypesData(fqn: data.fqn.present ? data.fqn.value : this.fqn);
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
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES cedar_types(fqn)',
  );
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> attributeJson = GeneratedColumn<String>(
    'attribute_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'{}\'',
    defaultValue: const CustomExpression('\'{}\''),
  );
  late final GeneratedColumn<String> entityJson = GeneratedColumn<String>(
    'entity_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', entity_type, \'id\', entity_id)) VIRTUAL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    entityType,
    entityId,
    attributeJson,
    entityJson,
  ];
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
      entityType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}entity_type'],
          )!,
      entityId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}entity_id'],
          )!,
      attributeJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}attribute_json'],
          )!,
      entityJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}entity_json'],
          )!,
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
    'CONSTRAINT cedar_entities_pk PRIMARY KEY(entity_type, entity_id)ON CONFLICT IGNORE',
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
  const CedarEntitiesData({
    required this.entityType,
    required this.entityId,
    required this.attributeJson,
    required this.entityJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['attribute_json'] = Variable<String>(attributeJson);
    map['entity_json'] = Variable<String>(entityJson);
    return map;
  }

  CedarEntitiesCompanion toCompanion(bool nullToAbsent) {
    return CedarEntitiesCompanion(
      entityType: Value(entityType),
      entityId: Value(entityId),
      attributeJson: Value(attributeJson),
      entityJson: Value(entityJson),
    );
  }

  factory CedarEntitiesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  CedarEntitiesData copyWith({
    String? entityType,
    String? entityId,
    String? attributeJson,
    String? entityJson,
  }) => CedarEntitiesData(
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
      attributeJson:
          data.attributeJson.present
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
  }) : entityType = Value(entityType),
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

  CedarEntitiesCompanion copyWith({
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? attributeJson,
    Value<String>? entityJson,
  }) {
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
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> entityJson = GeneratedColumn<String>(
    'entity_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', entity_type, \'id\', entity_id)) VIRTUAL',
  );
  late final GeneratedColumn<String> parentType = GeneratedColumn<String>(
    'parent_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> parentJson = GeneratedColumn<String>(
    'parent_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', parent_type, \'id\', parent_id)) VIRTUAL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    entityType,
    entityId,
    entityJson,
    parentType,
    parentId,
    parentJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_relationships';
  @override
  Set<GeneratedColumn> get $primaryKey => {
    entityType,
    entityId,
    parentType,
    parentId,
  };
  @override
  CedarRelationshipsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarRelationshipsData(
      entityType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}entity_type'],
          )!,
      entityId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}entity_id'],
          )!,
      entityJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}entity_json'],
          )!,
      parentType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_type'],
          )!,
      parentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_id'],
          )!,
      parentJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_json'],
          )!,
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
    'CONSTRAINT cedar_relationships_fk_entity FOREIGN KEY(entity_type, entity_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE',
    'CONSTRAINT cedar_relationships_fk_parent FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE',
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
  const CedarRelationshipsData({
    required this.entityType,
    required this.entityId,
    required this.entityJson,
    required this.parentType,
    required this.parentId,
    required this.parentJson,
  });
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

  CedarRelationshipsCompanion toCompanion(bool nullToAbsent) {
    return CedarRelationshipsCompanion(
      entityType: Value(entityType),
      entityId: Value(entityId),
      entityJson: Value(entityJson),
      parentType: Value(parentType),
      parentId: Value(parentId),
      parentJson: Value(parentJson),
    );
  }

  factory CedarRelationshipsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  CedarRelationshipsData copyWith({
    String? entityType,
    String? entityId,
    String? entityJson,
    String? parentType,
    String? parentId,
    String? parentJson,
  }) => CedarRelationshipsData(
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
    entityType,
    entityId,
    entityJson,
    parentType,
    parentId,
    parentJson,
  );
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
  }) : entityType = Value(entityType),
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

  CedarRelationshipsCompanion copyWith({
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? entityJson,
    Value<String>? parentType,
    Value<String>? parentId,
    Value<String>? parentJson,
  }) {
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

class CloudAuthUserEmails extends Table
    with TableInfo<CloudAuthUserEmails, CloudAuthUserEmailsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthUserEmails(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
    'is_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
    'is_primary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  @override
  List<GeneratedColumn> get $columns => [userId, email, isVerified, isPrimary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_user_emails';
  @override
  Set<GeneratedColumn> get $primaryKey => {userId, email};
  @override
  CloudAuthUserEmailsData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthUserEmailsData(
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      isVerified:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_verified'],
          )!,
      isPrimary:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_primary'],
          )!,
    );
  }

  @override
  CloudAuthUserEmails createAlias(String alias) {
    return CloudAuthUserEmails(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_user_emails_pk PRIMARY KEY(user_id, email)',
    'CONSTRAINT cloud_auth_user_emails_user_fk FOREIGN KEY(user_id)REFERENCES cloud_auth_users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthUserEmailsData extends DataClass
    implements Insertable<CloudAuthUserEmailsData> {
  final String userId;
  final String email;
  final bool isVerified;
  final bool isPrimary;
  const CloudAuthUserEmailsData({
    required this.userId,
    required this.email,
    required this.isVerified,
    required this.isPrimary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['email'] = Variable<String>(email);
    map['is_verified'] = Variable<bool>(isVerified);
    map['is_primary'] = Variable<bool>(isPrimary);
    return map;
  }

  CloudAuthUserEmailsCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthUserEmailsCompanion(
      userId: Value(userId),
      email: Value(email),
      isVerified: Value(isVerified),
      isPrimary: Value(isPrimary),
    );
  }

  factory CloudAuthUserEmailsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthUserEmailsData(
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

  CloudAuthUserEmailsData copyWith({
    String? userId,
    String? email,
    bool? isVerified,
    bool? isPrimary,
  }) => CloudAuthUserEmailsData(
    userId: userId ?? this.userId,
    email: email ?? this.email,
    isVerified: isVerified ?? this.isVerified,
    isPrimary: isPrimary ?? this.isPrimary,
  );
  CloudAuthUserEmailsData copyWithCompanion(CloudAuthUserEmailsCompanion data) {
    return CloudAuthUserEmailsData(
      userId: data.userId.present ? data.userId.value : this.userId,
      email: data.email.present ? data.email.value : this.email,
      isVerified:
          data.isVerified.present ? data.isVerified.value : this.isVerified,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthUserEmailsData(')
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
      (other is CloudAuthUserEmailsData &&
          other.userId == this.userId &&
          other.email == this.email &&
          other.isVerified == this.isVerified &&
          other.isPrimary == this.isPrimary);
}

class CloudAuthUserEmailsCompanion
    extends UpdateCompanion<CloudAuthUserEmailsData> {
  final Value<String> userId;
  final Value<String> email;
  final Value<bool> isVerified;
  final Value<bool> isPrimary;
  const CloudAuthUserEmailsCompanion({
    this.userId = const Value.absent(),
    this.email = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
  });
  CloudAuthUserEmailsCompanion.insert({
    required String userId,
    required String email,
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
  }) : userId = Value(userId),
       email = Value(email);
  static Insertable<CloudAuthUserEmailsData> custom({
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

  CloudAuthUserEmailsCompanion copyWith({
    Value<String>? userId,
    Value<String>? email,
    Value<bool>? isVerified,
    Value<bool>? isPrimary,
  }) {
    return CloudAuthUserEmailsCompanion(
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
    return (StringBuffer('CloudAuthUserEmailsCompanion(')
          ..write('userId: $userId, ')
          ..write('email: $email, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class CloudAuthUserPhoneNumbers extends Table
    with TableInfo<CloudAuthUserPhoneNumbers, CloudAuthUserPhoneNumbersData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthUserPhoneNumbers(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
    'is_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
    'is_primary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    phoneNumber,
    isVerified,
    isPrimary,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_user_phone_numbers';
  @override
  Set<GeneratedColumn> get $primaryKey => {userId, phoneNumber};
  @override
  CloudAuthUserPhoneNumbersData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthUserPhoneNumbersData(
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      phoneNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}phone_number'],
          )!,
      isVerified:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_verified'],
          )!,
      isPrimary:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_primary'],
          )!,
    );
  }

  @override
  CloudAuthUserPhoneNumbers createAlias(String alias) {
    return CloudAuthUserPhoneNumbers(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_user_phone_numbers_pk PRIMARY KEY(user_id, phone_number)',
    'CONSTRAINT cloud_auth_user_phone_numbers_user_fk FOREIGN KEY(user_id)REFERENCES cloud_auth_users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthUserPhoneNumbersData extends DataClass
    implements Insertable<CloudAuthUserPhoneNumbersData> {
  final String userId;
  final String phoneNumber;
  final bool isVerified;
  final bool isPrimary;
  const CloudAuthUserPhoneNumbersData({
    required this.userId,
    required this.phoneNumber,
    required this.isVerified,
    required this.isPrimary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['is_verified'] = Variable<bool>(isVerified);
    map['is_primary'] = Variable<bool>(isPrimary);
    return map;
  }

  CloudAuthUserPhoneNumbersCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthUserPhoneNumbersCompanion(
      userId: Value(userId),
      phoneNumber: Value(phoneNumber),
      isVerified: Value(isVerified),
      isPrimary: Value(isPrimary),
    );
  }

  factory CloudAuthUserPhoneNumbersData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthUserPhoneNumbersData(
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

  CloudAuthUserPhoneNumbersData copyWith({
    String? userId,
    String? phoneNumber,
    bool? isVerified,
    bool? isPrimary,
  }) => CloudAuthUserPhoneNumbersData(
    userId: userId ?? this.userId,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    isVerified: isVerified ?? this.isVerified,
    isPrimary: isPrimary ?? this.isPrimary,
  );
  CloudAuthUserPhoneNumbersData copyWithCompanion(
    CloudAuthUserPhoneNumbersCompanion data,
  ) {
    return CloudAuthUserPhoneNumbersData(
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
    return (StringBuffer('CloudAuthUserPhoneNumbersData(')
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
      (other is CloudAuthUserPhoneNumbersData &&
          other.userId == this.userId &&
          other.phoneNumber == this.phoneNumber &&
          other.isVerified == this.isVerified &&
          other.isPrimary == this.isPrimary);
}

class CloudAuthUserPhoneNumbersCompanion
    extends UpdateCompanion<CloudAuthUserPhoneNumbersData> {
  final Value<String> userId;
  final Value<String> phoneNumber;
  final Value<bool> isVerified;
  final Value<bool> isPrimary;
  const CloudAuthUserPhoneNumbersCompanion({
    this.userId = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
  });
  CloudAuthUserPhoneNumbersCompanion.insert({
    required String userId,
    required String phoneNumber,
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
  }) : userId = Value(userId),
       phoneNumber = Value(phoneNumber);
  static Insertable<CloudAuthUserPhoneNumbersData> custom({
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

  CloudAuthUserPhoneNumbersCompanion copyWith({
    Value<String>? userId,
    Value<String>? phoneNumber,
    Value<bool>? isVerified,
    Value<bool>? isPrimary,
  }) {
    return CloudAuthUserPhoneNumbersCompanion(
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
    return (StringBuffer('CloudAuthUserPhoneNumbersCompanion(')
          ..write('userId: $userId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class CloudAuthProjects extends Table
    with TableInfo<CloudAuthProjects, CloudAuthProjectsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthProjects(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<Uint8List> resolvedAst =
      GeneratedColumn<Uint8List>(
        'resolved_ast',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [projectId, version, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_projects';
  @override
  Set<GeneratedColumn> get $primaryKey => {projectId};
  @override
  CloudAuthProjectsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthProjectsData(
      projectId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      version:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}version'],
          )!,
      resolvedAst:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}resolved_ast'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  CloudAuthProjects createAlias(String alias) {
    return CloudAuthProjects(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthProjectsData extends DataClass
    implements Insertable<CloudAuthProjectsData> {
  final String projectId;
  final String version;
  final Uint8List resolvedAst;
  final String etag;
  const CloudAuthProjectsData({
    required this.projectId,
    required this.version,
    required this.resolvedAst,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_id'] = Variable<String>(projectId);
    map['version'] = Variable<String>(version);
    map['resolved_ast'] = Variable<Uint8List>(resolvedAst);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  CloudAuthProjectsCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthProjectsCompanion(
      projectId: Value(projectId),
      version: Value(version),
      resolvedAst: Value(resolvedAst),
      etag: Value(etag),
    );
  }

  factory CloudAuthProjectsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthProjectsData(
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

  CloudAuthProjectsData copyWith({
    String? projectId,
    String? version,
    Uint8List? resolvedAst,
    String? etag,
  }) => CloudAuthProjectsData(
    projectId: projectId ?? this.projectId,
    version: version ?? this.version,
    resolvedAst: resolvedAst ?? this.resolvedAst,
    etag: etag ?? this.etag,
  );
  CloudAuthProjectsData copyWithCompanion(CloudAuthProjectsCompanion data) {
    return CloudAuthProjectsData(
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      version: data.version.present ? data.version.value : this.version,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthProjectsData(')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    projectId,
    version,
    $driftBlobEquality.hash(resolvedAst),
    etag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudAuthProjectsData &&
          other.projectId == this.projectId &&
          other.version == this.version &&
          $driftBlobEquality.equals(other.resolvedAst, this.resolvedAst) &&
          other.etag == this.etag);
}

class CloudAuthProjectsCompanion
    extends UpdateCompanion<CloudAuthProjectsData> {
  final Value<String> projectId;
  final Value<String> version;
  final Value<Uint8List> resolvedAst;
  final Value<String> etag;
  final Value<int> rowid;
  const CloudAuthProjectsCompanion({
    this.projectId = const Value.absent(),
    this.version = const Value.absent(),
    this.resolvedAst = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudAuthProjectsCompanion.insert({
    required String projectId,
    required String version,
    required Uint8List resolvedAst,
    required String etag,
    this.rowid = const Value.absent(),
  }) : projectId = Value(projectId),
       version = Value(version),
       resolvedAst = Value(resolvedAst),
       etag = Value(etag);
  static Insertable<CloudAuthProjectsData> custom({
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

  CloudAuthProjectsCompanion copyWith({
    Value<String>? projectId,
    Value<String>? version,
    Value<Uint8List>? resolvedAst,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return CloudAuthProjectsCompanion(
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
    return (StringBuffer('CloudAuthProjectsCompanion(')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CloudAuthApis extends Table
    with TableInfo<CloudAuthApis, CloudAuthApisData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthApis(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> apiId = GeneratedColumn<String>(
    'api_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<Uint8List> resolvedAst =
      GeneratedColumn<Uint8List>(
        'resolved_ast',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [apiId, projectId, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_apis';
  @override
  Set<GeneratedColumn> get $primaryKey => {apiId};
  @override
  CloudAuthApisData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthApisData(
      apiId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}api_id'],
          )!,
      projectId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      resolvedAst:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}resolved_ast'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  CloudAuthApis createAlias(String alias) {
    return CloudAuthApis(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_apis_project_fk FOREIGN KEY(project_id)REFERENCES cloud_auth_projects(project_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthApisData extends DataClass
    implements Insertable<CloudAuthApisData> {
  final String apiId;
  final String projectId;
  final Uint8List resolvedAst;
  final String etag;
  const CloudAuthApisData({
    required this.apiId,
    required this.projectId,
    required this.resolvedAst,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['api_id'] = Variable<String>(apiId);
    map['project_id'] = Variable<String>(projectId);
    map['resolved_ast'] = Variable<Uint8List>(resolvedAst);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  CloudAuthApisCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthApisCompanion(
      apiId: Value(apiId),
      projectId: Value(projectId),
      resolvedAst: Value(resolvedAst),
      etag: Value(etag),
    );
  }

  factory CloudAuthApisData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthApisData(
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

  CloudAuthApisData copyWith({
    String? apiId,
    String? projectId,
    Uint8List? resolvedAst,
    String? etag,
  }) => CloudAuthApisData(
    apiId: apiId ?? this.apiId,
    projectId: projectId ?? this.projectId,
    resolvedAst: resolvedAst ?? this.resolvedAst,
    etag: etag ?? this.etag,
  );
  CloudAuthApisData copyWithCompanion(CloudAuthApisCompanion data) {
    return CloudAuthApisData(
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthApisData(')
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
      (other is CloudAuthApisData &&
          other.apiId == this.apiId &&
          other.projectId == this.projectId &&
          $driftBlobEquality.equals(other.resolvedAst, this.resolvedAst) &&
          other.etag == this.etag);
}

class CloudAuthApisCompanion extends UpdateCompanion<CloudAuthApisData> {
  final Value<String> apiId;
  final Value<String> projectId;
  final Value<Uint8List> resolvedAst;
  final Value<String> etag;
  final Value<int> rowid;
  const CloudAuthApisCompanion({
    this.apiId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.resolvedAst = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudAuthApisCompanion.insert({
    required String apiId,
    required String projectId,
    required Uint8List resolvedAst,
    required String etag,
    this.rowid = const Value.absent(),
  }) : apiId = Value(apiId),
       projectId = Value(projectId),
       resolvedAst = Value(resolvedAst),
       etag = Value(etag);
  static Insertable<CloudAuthApisData> custom({
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

  CloudAuthApisCompanion copyWith({
    Value<String>? apiId,
    Value<String>? projectId,
    Value<Uint8List>? resolvedAst,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return CloudAuthApisCompanion(
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
    return (StringBuffer('CloudAuthApisCompanion(')
          ..write('apiId: $apiId, ')
          ..write('projectId: $projectId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CloudAuthFunctions extends Table
    with TableInfo<CloudAuthFunctions, CloudAuthFunctionsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthFunctions(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> functionId = GeneratedColumn<String>(
    'function_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> apiId = GeneratedColumn<String>(
    'api_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<Uint8List> resolvedAst =
      GeneratedColumn<Uint8List>(
        'resolved_ast',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [functionId, apiId, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_functions';
  @override
  Set<GeneratedColumn> get $primaryKey => {functionId};
  @override
  CloudAuthFunctionsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthFunctionsData(
      functionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}function_id'],
          )!,
      apiId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}api_id'],
          )!,
      resolvedAst:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}resolved_ast'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  CloudAuthFunctions createAlias(String alias) {
    return CloudAuthFunctions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_functions_api_fk FOREIGN KEY(api_id)REFERENCES cloud_auth_apis(api_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthFunctionsData extends DataClass
    implements Insertable<CloudAuthFunctionsData> {
  final String functionId;
  final String apiId;
  final Uint8List resolvedAst;
  final String etag;
  const CloudAuthFunctionsData({
    required this.functionId,
    required this.apiId,
    required this.resolvedAst,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['function_id'] = Variable<String>(functionId);
    map['api_id'] = Variable<String>(apiId);
    map['resolved_ast'] = Variable<Uint8List>(resolvedAst);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  CloudAuthFunctionsCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthFunctionsCompanion(
      functionId: Value(functionId),
      apiId: Value(apiId),
      resolvedAst: Value(resolvedAst),
      etag: Value(etag),
    );
  }

  factory CloudAuthFunctionsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthFunctionsData(
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

  CloudAuthFunctionsData copyWith({
    String? functionId,
    String? apiId,
    Uint8List? resolvedAst,
    String? etag,
  }) => CloudAuthFunctionsData(
    functionId: functionId ?? this.functionId,
    apiId: apiId ?? this.apiId,
    resolvedAst: resolvedAst ?? this.resolvedAst,
    etag: etag ?? this.etag,
  );
  CloudAuthFunctionsData copyWithCompanion(CloudAuthFunctionsCompanion data) {
    return CloudAuthFunctionsData(
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
    return (StringBuffer('CloudAuthFunctionsData(')
          ..write('functionId: $functionId, ')
          ..write('apiId: $apiId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    functionId,
    apiId,
    $driftBlobEquality.hash(resolvedAst),
    etag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudAuthFunctionsData &&
          other.functionId == this.functionId &&
          other.apiId == this.apiId &&
          $driftBlobEquality.equals(other.resolvedAst, this.resolvedAst) &&
          other.etag == this.etag);
}

class CloudAuthFunctionsCompanion
    extends UpdateCompanion<CloudAuthFunctionsData> {
  final Value<String> functionId;
  final Value<String> apiId;
  final Value<Uint8List> resolvedAst;
  final Value<String> etag;
  final Value<int> rowid;
  const CloudAuthFunctionsCompanion({
    this.functionId = const Value.absent(),
    this.apiId = const Value.absent(),
    this.resolvedAst = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudAuthFunctionsCompanion.insert({
    required String functionId,
    required String apiId,
    required Uint8List resolvedAst,
    required String etag,
    this.rowid = const Value.absent(),
  }) : functionId = Value(functionId),
       apiId = Value(apiId),
       resolvedAst = Value(resolvedAst),
       etag = Value(etag);
  static Insertable<CloudAuthFunctionsData> custom({
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

  CloudAuthFunctionsCompanion copyWith({
    Value<String>? functionId,
    Value<String>? apiId,
    Value<Uint8List>? resolvedAst,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return CloudAuthFunctionsCompanion(
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
    return (StringBuffer('CloudAuthFunctionsCompanion(')
          ..write('functionId: $functionId, ')
          ..write('apiId: $apiId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CloudAuthMeta extends Table
    with TableInfo<CloudAuthMeta, CloudAuthMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthMeta(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  @override
  List<GeneratedColumn> get $columns => [schemaVersion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_meta';
  @override
  Set<GeneratedColumn> get $primaryKey => {schemaVersion};
  @override
  CloudAuthMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthMetaData(
      schemaVersion:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}schema_version'],
          )!,
    );
  }

  @override
  CloudAuthMeta createAlias(String alias) {
    return CloudAuthMeta(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthMetaData extends DataClass
    implements Insertable<CloudAuthMetaData> {
  final int schemaVersion;
  const CloudAuthMetaData({required this.schemaVersion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['schema_version'] = Variable<int>(schemaVersion);
    return map;
  }

  CloudAuthMetaCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthMetaCompanion(schemaVersion: Value(schemaVersion));
  }

  factory CloudAuthMetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthMetaData(
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'schemaVersion': serializer.toJson<int>(schemaVersion),
    };
  }

  CloudAuthMetaData copyWith({int? schemaVersion}) =>
      CloudAuthMetaData(schemaVersion: schemaVersion ?? this.schemaVersion);
  CloudAuthMetaData copyWithCompanion(CloudAuthMetaCompanion data) {
    return CloudAuthMetaData(
      schemaVersion:
          data.schemaVersion.present
              ? data.schemaVersion.value
              : this.schemaVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthMetaData(')
          ..write('schemaVersion: $schemaVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => schemaVersion.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudAuthMetaData && other.schemaVersion == this.schemaVersion);
}

class CloudAuthMetaCompanion extends UpdateCompanion<CloudAuthMetaData> {
  final Value<int> schemaVersion;
  const CloudAuthMetaCompanion({this.schemaVersion = const Value.absent()});
  CloudAuthMetaCompanion.insert({this.schemaVersion = const Value.absent()});
  static Insertable<CloudAuthMetaData> custom({
    Expression<int>? schemaVersion,
  }) {
    return RawValuesInsertable({
      if (schemaVersion != null) 'schema_version': schemaVersion,
    });
  }

  CloudAuthMetaCompanion copyWith({Value<int>? schemaVersion}) {
    return CloudAuthMetaCompanion(
      schemaVersion: schemaVersion ?? this.schemaVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthMetaCompanion(')
          ..write('schemaVersion: $schemaVersion')
          ..write(')'))
        .toString();
  }
}

class CloudAuthCryptoKeys extends Table
    with TableInfo<CloudAuthCryptoKeys, CloudAuthCryptoKeysData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthCryptoKeys(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<Uint8List> cryptoKeyId =
      GeneratedColumn<Uint8List>(
        'crypto_key_id',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      );
  late final GeneratedColumn<String> keyPurpose = GeneratedColumn<String>(
    'key_purpose',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> keyAlgorithm = GeneratedColumn<String>(
    'key_algorithm',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<Uint8List> keyMaterial =
      GeneratedColumn<Uint8List>(
        'key_material',
        aliasedName,
        true,
        type: DriftSqlType.blob,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<String> externalCryptoKeyId =
      GeneratedColumn<String>(
        'external_crypto_key_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'UNIQUE',
      );
  @override
  List<GeneratedColumn> get $columns => [
    cryptoKeyId,
    keyPurpose,
    keyAlgorithm,
    keyMaterial,
    externalCryptoKeyId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_crypto_keys';
  @override
  Set<GeneratedColumn> get $primaryKey => {cryptoKeyId};
  @override
  CloudAuthCryptoKeysData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthCryptoKeysData(
      cryptoKeyId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}crypto_key_id'],
          )!,
      keyPurpose:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}key_purpose'],
          )!,
      keyAlgorithm:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}key_algorithm'],
          )!,
      keyMaterial: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}key_material'],
      ),
      externalCryptoKeyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_crypto_key_id'],
      ),
    );
  }

  @override
  CloudAuthCryptoKeys createAlias(String alias) {
    return CloudAuthCryptoKeys(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(key_material IS NOT NULL OR external_crypto_key_id IS NOT NULL)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthCryptoKeysData extends DataClass
    implements Insertable<CloudAuthCryptoKeysData> {
  final Uint8List cryptoKeyId;
  final String keyPurpose;
  final String keyAlgorithm;
  final Uint8List? keyMaterial;
  final String? externalCryptoKeyId;
  const CloudAuthCryptoKeysData({
    required this.cryptoKeyId,
    required this.keyPurpose,
    required this.keyAlgorithm,
    this.keyMaterial,
    this.externalCryptoKeyId,
  });
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

  CloudAuthCryptoKeysCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthCryptoKeysCompanion(
      cryptoKeyId: Value(cryptoKeyId),
      keyPurpose: Value(keyPurpose),
      keyAlgorithm: Value(keyAlgorithm),
      keyMaterial:
          keyMaterial == null && nullToAbsent
              ? const Value.absent()
              : Value(keyMaterial),
      externalCryptoKeyId:
          externalCryptoKeyId == null && nullToAbsent
              ? const Value.absent()
              : Value(externalCryptoKeyId),
    );
  }

  factory CloudAuthCryptoKeysData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthCryptoKeysData(
      cryptoKeyId: serializer.fromJson<Uint8List>(json['cryptoKeyId']),
      keyPurpose: serializer.fromJson<String>(json['keyPurpose']),
      keyAlgorithm: serializer.fromJson<String>(json['keyAlgorithm']),
      keyMaterial: serializer.fromJson<Uint8List?>(json['keyMaterial']),
      externalCryptoKeyId: serializer.fromJson<String?>(
        json['externalCryptoKeyId'],
      ),
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

  CloudAuthCryptoKeysData copyWith({
    Uint8List? cryptoKeyId,
    String? keyPurpose,
    String? keyAlgorithm,
    Value<Uint8List?> keyMaterial = const Value.absent(),
    Value<String?> externalCryptoKeyId = const Value.absent(),
  }) => CloudAuthCryptoKeysData(
    cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
    keyPurpose: keyPurpose ?? this.keyPurpose,
    keyAlgorithm: keyAlgorithm ?? this.keyAlgorithm,
    keyMaterial: keyMaterial.present ? keyMaterial.value : this.keyMaterial,
    externalCryptoKeyId:
        externalCryptoKeyId.present
            ? externalCryptoKeyId.value
            : this.externalCryptoKeyId,
  );
  CloudAuthCryptoKeysData copyWithCompanion(CloudAuthCryptoKeysCompanion data) {
    return CloudAuthCryptoKeysData(
      cryptoKeyId:
          data.cryptoKeyId.present ? data.cryptoKeyId.value : this.cryptoKeyId,
      keyPurpose:
          data.keyPurpose.present ? data.keyPurpose.value : this.keyPurpose,
      keyAlgorithm:
          data.keyAlgorithm.present
              ? data.keyAlgorithm.value
              : this.keyAlgorithm,
      keyMaterial:
          data.keyMaterial.present ? data.keyMaterial.value : this.keyMaterial,
      externalCryptoKeyId:
          data.externalCryptoKeyId.present
              ? data.externalCryptoKeyId.value
              : this.externalCryptoKeyId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthCryptoKeysData(')
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
    externalCryptoKeyId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudAuthCryptoKeysData &&
          $driftBlobEquality.equals(other.cryptoKeyId, this.cryptoKeyId) &&
          other.keyPurpose == this.keyPurpose &&
          other.keyAlgorithm == this.keyAlgorithm &&
          $driftBlobEquality.equals(other.keyMaterial, this.keyMaterial) &&
          other.externalCryptoKeyId == this.externalCryptoKeyId);
}

class CloudAuthCryptoKeysCompanion
    extends UpdateCompanion<CloudAuthCryptoKeysData> {
  final Value<Uint8List> cryptoKeyId;
  final Value<String> keyPurpose;
  final Value<String> keyAlgorithm;
  final Value<Uint8List?> keyMaterial;
  final Value<String?> externalCryptoKeyId;
  final Value<int> rowid;
  const CloudAuthCryptoKeysCompanion({
    this.cryptoKeyId = const Value.absent(),
    this.keyPurpose = const Value.absent(),
    this.keyAlgorithm = const Value.absent(),
    this.keyMaterial = const Value.absent(),
    this.externalCryptoKeyId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudAuthCryptoKeysCompanion.insert({
    required Uint8List cryptoKeyId,
    required String keyPurpose,
    required String keyAlgorithm,
    this.keyMaterial = const Value.absent(),
    this.externalCryptoKeyId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cryptoKeyId = Value(cryptoKeyId),
       keyPurpose = Value(keyPurpose),
       keyAlgorithm = Value(keyAlgorithm);
  static Insertable<CloudAuthCryptoKeysData> custom({
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

  CloudAuthCryptoKeysCompanion copyWith({
    Value<Uint8List>? cryptoKeyId,
    Value<String>? keyPurpose,
    Value<String>? keyAlgorithm,
    Value<Uint8List?>? keyMaterial,
    Value<String?>? externalCryptoKeyId,
    Value<int>? rowid,
  }) {
    return CloudAuthCryptoKeysCompanion(
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
      map['external_crypto_key_id'] = Variable<String>(
        externalCryptoKeyId.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthCryptoKeysCompanion(')
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

class CloudAuthSessions extends Table
    with TableInfo<CloudAuthSessions, CloudAuthSessionsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthSessions(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> rowid = GeneratedColumn<int>(
    'rowid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<Uint8List> cryptoKeyId =
      GeneratedColumn<Uint8List>(
        'crypto_key_id',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<Uint8List> clientInfo = GeneratedColumn<Uint8List>(
    'client_info',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<Uint8List> authenticationFactor =
      GeneratedColumn<Uint8List>(
        'authentication_factor',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<Uint8List> state = GeneratedColumn<Uint8List>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
    'ip_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> externalSessionId =
      GeneratedColumn<String>(
        'external_session_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  late final GeneratedColumn<double> createTime = GeneratedColumn<double>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<double> updateTime = GeneratedColumn<double>(
    'update_time',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<double> expireTime = GeneratedColumn<double>(
    'expire_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_sessions';
  @override
  Set<GeneratedColumn> get $primaryKey => {rowid};
  @override
  CloudAuthSessionsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthSessionsData(
      rowid:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}rowid'],
          )!,
      sessionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}session_id'],
          )!,
      cryptoKeyId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}crypto_key_id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      clientInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}client_info'],
      ),
      authenticationFactor:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}authentication_factor'],
          )!,
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}state'],
      ),
      ipAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ip_address'],
      ),
      externalSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_session_id'],
      ),
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}create_time'],
          )!,
      updateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}update_time'],
      ),
      expireTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}expire_time'],
          )!,
    );
  }

  @override
  CloudAuthSessions createAlias(String alias) {
    return CloudAuthSessions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_sessions_user_fk FOREIGN KEY(user_id)REFERENCES cloud_auth_users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
    'CONSTRAINT cloud_auth_sessions_key_fk FOREIGN KEY(crypto_key_id)REFERENCES cloud_auth_crypto_keys(crypto_key_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthSessionsData extends DataClass
    implements Insertable<CloudAuthSessionsData> {
  final int rowid;
  final String sessionId;
  final Uint8List cryptoKeyId;
  final String userId;
  final Uint8List? clientInfo;
  final Uint8List authenticationFactor;
  final Uint8List? state;
  final String? ipAddress;
  final String? externalSessionId;
  final double createTime;
  final double? updateTime;
  final double expireTime;
  const CloudAuthSessionsData({
    required this.rowid,
    required this.sessionId,
    required this.cryptoKeyId,
    required this.userId,
    this.clientInfo,
    required this.authenticationFactor,
    this.state,
    this.ipAddress,
    this.externalSessionId,
    required this.createTime,
    this.updateTime,
    required this.expireTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rowid'] = Variable<int>(rowid);
    map['session_id'] = Variable<String>(sessionId);
    map['crypto_key_id'] = Variable<Uint8List>(cryptoKeyId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || clientInfo != null) {
      map['client_info'] = Variable<Uint8List>(clientInfo);
    }
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
    return map;
  }

  CloudAuthSessionsCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthSessionsCompanion(
      rowid: Value(rowid),
      sessionId: Value(sessionId),
      cryptoKeyId: Value(cryptoKeyId),
      userId: Value(userId),
      clientInfo:
          clientInfo == null && nullToAbsent
              ? const Value.absent()
              : Value(clientInfo),
      authenticationFactor: Value(authenticationFactor),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      ipAddress:
          ipAddress == null && nullToAbsent
              ? const Value.absent()
              : Value(ipAddress),
      externalSessionId:
          externalSessionId == null && nullToAbsent
              ? const Value.absent()
              : Value(externalSessionId),
      createTime: Value(createTime),
      updateTime:
          updateTime == null && nullToAbsent
              ? const Value.absent()
              : Value(updateTime),
      expireTime: Value(expireTime),
    );
  }

  factory CloudAuthSessionsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthSessionsData(
      rowid: serializer.fromJson<int>(json['rowid']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      cryptoKeyId: serializer.fromJson<Uint8List>(json['cryptoKeyId']),
      userId: serializer.fromJson<String>(json['userId']),
      clientInfo: serializer.fromJson<Uint8List?>(json['clientInfo']),
      authenticationFactor: serializer.fromJson<Uint8List>(
        json['authenticationFactor'],
      ),
      state: serializer.fromJson<Uint8List?>(json['state']),
      ipAddress: serializer.fromJson<String?>(json['ipAddress']),
      externalSessionId: serializer.fromJson<String?>(
        json['externalSessionId'],
      ),
      createTime: serializer.fromJson<double>(json['createTime']),
      updateTime: serializer.fromJson<double?>(json['updateTime']),
      expireTime: serializer.fromJson<double>(json['expireTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowid': serializer.toJson<int>(rowid),
      'sessionId': serializer.toJson<String>(sessionId),
      'cryptoKeyId': serializer.toJson<Uint8List>(cryptoKeyId),
      'userId': serializer.toJson<String>(userId),
      'clientInfo': serializer.toJson<Uint8List?>(clientInfo),
      'authenticationFactor': serializer.toJson<Uint8List>(
        authenticationFactor,
      ),
      'state': serializer.toJson<Uint8List?>(state),
      'ipAddress': serializer.toJson<String?>(ipAddress),
      'externalSessionId': serializer.toJson<String?>(externalSessionId),
      'createTime': serializer.toJson<double>(createTime),
      'updateTime': serializer.toJson<double?>(updateTime),
      'expireTime': serializer.toJson<double>(expireTime),
    };
  }

  CloudAuthSessionsData copyWith({
    int? rowid,
    String? sessionId,
    Uint8List? cryptoKeyId,
    String? userId,
    Value<Uint8List?> clientInfo = const Value.absent(),
    Uint8List? authenticationFactor,
    Value<Uint8List?> state = const Value.absent(),
    Value<String?> ipAddress = const Value.absent(),
    Value<String?> externalSessionId = const Value.absent(),
    double? createTime,
    Value<double?> updateTime = const Value.absent(),
    double? expireTime,
  }) => CloudAuthSessionsData(
    rowid: rowid ?? this.rowid,
    sessionId: sessionId ?? this.sessionId,
    cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
    userId: userId ?? this.userId,
    clientInfo: clientInfo.present ? clientInfo.value : this.clientInfo,
    authenticationFactor: authenticationFactor ?? this.authenticationFactor,
    state: state.present ? state.value : this.state,
    ipAddress: ipAddress.present ? ipAddress.value : this.ipAddress,
    externalSessionId:
        externalSessionId.present
            ? externalSessionId.value
            : this.externalSessionId,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime.present ? updateTime.value : this.updateTime,
    expireTime: expireTime ?? this.expireTime,
  );
  CloudAuthSessionsData copyWithCompanion(CloudAuthSessionsCompanion data) {
    return CloudAuthSessionsData(
      rowid: data.rowid.present ? data.rowid.value : this.rowid,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      cryptoKeyId:
          data.cryptoKeyId.present ? data.cryptoKeyId.value : this.cryptoKeyId,
      userId: data.userId.present ? data.userId.value : this.userId,
      clientInfo:
          data.clientInfo.present ? data.clientInfo.value : this.clientInfo,
      authenticationFactor:
          data.authenticationFactor.present
              ? data.authenticationFactor.value
              : this.authenticationFactor,
      state: data.state.present ? data.state.value : this.state,
      ipAddress: data.ipAddress.present ? data.ipAddress.value : this.ipAddress,
      externalSessionId:
          data.externalSessionId.present
              ? data.externalSessionId.value
              : this.externalSessionId,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
      expireTime:
          data.expireTime.present ? data.expireTime.value : this.expireTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthSessionsData(')
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
          ..write('expireTime: $expireTime')
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
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudAuthSessionsData &&
          other.rowid == this.rowid &&
          other.sessionId == this.sessionId &&
          $driftBlobEquality.equals(other.cryptoKeyId, this.cryptoKeyId) &&
          other.userId == this.userId &&
          $driftBlobEquality.equals(other.clientInfo, this.clientInfo) &&
          $driftBlobEquality.equals(
            other.authenticationFactor,
            this.authenticationFactor,
          ) &&
          $driftBlobEquality.equals(other.state, this.state) &&
          other.ipAddress == this.ipAddress &&
          other.externalSessionId == this.externalSessionId &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.expireTime == this.expireTime);
}

class CloudAuthSessionsCompanion
    extends UpdateCompanion<CloudAuthSessionsData> {
  final Value<int> rowid;
  final Value<String> sessionId;
  final Value<Uint8List> cryptoKeyId;
  final Value<String> userId;
  final Value<Uint8List?> clientInfo;
  final Value<Uint8List> authenticationFactor;
  final Value<Uint8List?> state;
  final Value<String?> ipAddress;
  final Value<String?> externalSessionId;
  final Value<double> createTime;
  final Value<double?> updateTime;
  final Value<double> expireTime;
  const CloudAuthSessionsCompanion({
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
  });
  CloudAuthSessionsCompanion.insert({
    this.rowid = const Value.absent(),
    required String sessionId,
    required Uint8List cryptoKeyId,
    required String userId,
    this.clientInfo = const Value.absent(),
    required Uint8List authenticationFactor,
    this.state = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.externalSessionId = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    required double expireTime,
  }) : sessionId = Value(sessionId),
       cryptoKeyId = Value(cryptoKeyId),
       userId = Value(userId),
       authenticationFactor = Value(authenticationFactor),
       expireTime = Value(expireTime);
  static Insertable<CloudAuthSessionsData> custom({
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
    });
  }

  CloudAuthSessionsCompanion copyWith({
    Value<int>? rowid,
    Value<String>? sessionId,
    Value<Uint8List>? cryptoKeyId,
    Value<String>? userId,
    Value<Uint8List?>? clientInfo,
    Value<Uint8List>? authenticationFactor,
    Value<Uint8List?>? state,
    Value<String?>? ipAddress,
    Value<String?>? externalSessionId,
    Value<double>? createTime,
    Value<double?>? updateTime,
    Value<double>? expireTime,
  }) {
    return CloudAuthSessionsCompanion(
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
      map['authentication_factor'] = Variable<Uint8List>(
        authenticationFactor.value,
      );
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthSessionsCompanion(')
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
          ..write('expireTime: $expireTime')
          ..write(')'))
        .toString();
  }
}

class CloudAuthOtpCodes extends Table
    with TableInfo<CloudAuthOtpCodes, CloudAuthOtpCodesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthOtpCodes(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> rowid = GeneratedColumn<int>(
    'rowid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<int> resendAttempt = GeneratedColumn<int>(
    'resend_attempt',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> verifyAttempt = GeneratedColumn<int>(
    'verify_attempt',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<double> updateTime = GeneratedColumn<double>(
    'update_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    rowid,
    sessionId,
    resendAttempt,
    verifyAttempt,
    updateTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_otp_codes';
  @override
  Set<GeneratedColumn> get $primaryKey => {rowid};
  @override
  CloudAuthOtpCodesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthOtpCodesData(
      rowid:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}rowid'],
          )!,
      sessionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}session_id'],
          )!,
      resendAttempt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}resend_attempt'],
          )!,
      verifyAttempt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}verify_attempt'],
          )!,
      updateTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}update_time'],
          )!,
    );
  }

  @override
  CloudAuthOtpCodes createAlias(String alias) {
    return CloudAuthOtpCodes(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_otp_codes_session_id_fk FOREIGN KEY(session_id)REFERENCES cloud_auth_sessions(session_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthOtpCodesData extends DataClass
    implements Insertable<CloudAuthOtpCodesData> {
  final int rowid;
  final String sessionId;
  final int resendAttempt;
  final int verifyAttempt;
  final double updateTime;
  const CloudAuthOtpCodesData({
    required this.rowid,
    required this.sessionId,
    required this.resendAttempt,
    required this.verifyAttempt,
    required this.updateTime,
  });
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

  CloudAuthOtpCodesCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthOtpCodesCompanion(
      rowid: Value(rowid),
      sessionId: Value(sessionId),
      resendAttempt: Value(resendAttempt),
      verifyAttempt: Value(verifyAttempt),
      updateTime: Value(updateTime),
    );
  }

  factory CloudAuthOtpCodesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthOtpCodesData(
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

  CloudAuthOtpCodesData copyWith({
    int? rowid,
    String? sessionId,
    int? resendAttempt,
    int? verifyAttempt,
    double? updateTime,
  }) => CloudAuthOtpCodesData(
    rowid: rowid ?? this.rowid,
    sessionId: sessionId ?? this.sessionId,
    resendAttempt: resendAttempt ?? this.resendAttempt,
    verifyAttempt: verifyAttempt ?? this.verifyAttempt,
    updateTime: updateTime ?? this.updateTime,
  );
  CloudAuthOtpCodesData copyWithCompanion(CloudAuthOtpCodesCompanion data) {
    return CloudAuthOtpCodesData(
      rowid: data.rowid.present ? data.rowid.value : this.rowid,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      resendAttempt:
          data.resendAttempt.present
              ? data.resendAttempt.value
              : this.resendAttempt,
      verifyAttempt:
          data.verifyAttempt.present
              ? data.verifyAttempt.value
              : this.verifyAttempt,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthOtpCodesData(')
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
      (other is CloudAuthOtpCodesData &&
          other.rowid == this.rowid &&
          other.sessionId == this.sessionId &&
          other.resendAttempt == this.resendAttempt &&
          other.verifyAttempt == this.verifyAttempt &&
          other.updateTime == this.updateTime);
}

class CloudAuthOtpCodesCompanion
    extends UpdateCompanion<CloudAuthOtpCodesData> {
  final Value<int> rowid;
  final Value<String> sessionId;
  final Value<int> resendAttempt;
  final Value<int> verifyAttempt;
  final Value<double> updateTime;
  const CloudAuthOtpCodesCompanion({
    this.rowid = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.resendAttempt = const Value.absent(),
    this.verifyAttempt = const Value.absent(),
    this.updateTime = const Value.absent(),
  });
  CloudAuthOtpCodesCompanion.insert({
    this.rowid = const Value.absent(),
    required String sessionId,
    this.resendAttempt = const Value.absent(),
    this.verifyAttempt = const Value.absent(),
    this.updateTime = const Value.absent(),
  }) : sessionId = Value(sessionId);
  static Insertable<CloudAuthOtpCodesData> custom({
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

  CloudAuthOtpCodesCompanion copyWith({
    Value<int>? rowid,
    Value<String>? sessionId,
    Value<int>? resendAttempt,
    Value<int>? verifyAttempt,
    Value<double>? updateTime,
  }) {
    return CloudAuthOtpCodesCompanion(
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
    return (StringBuffer('CloudAuthOtpCodesCompanion(')
          ..write('rowid: $rowid, ')
          ..write('sessionId: $sessionId, ')
          ..write('resendAttempt: $resendAttempt, ')
          ..write('verifyAttempt: $verifyAttempt, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }
}

class CloudAuthCorks extends Table
    with TableInfo<CloudAuthCorks, CloudAuthCorksData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthCorks(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<Uint8List> corkId = GeneratedColumn<Uint8List>(
    'cork_id',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<Uint8List> cryptoKeyId =
      GeneratedColumn<Uint8List>(
        'crypto_key_id',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> bearerType = GeneratedColumn<String>(
    'bearer_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> bearerId = GeneratedColumn<String>(
    'bearer_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> audienceType = GeneratedColumn<String>(
    'audience_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> audienceId = GeneratedColumn<String>(
    'audience_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> issuerType = GeneratedColumn<String>(
    'issuer_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> issuerId = GeneratedColumn<String>(
    'issuer_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<double> createTime = GeneratedColumn<double>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<double> expireTime = GeneratedColumn<double>(
    'expire_time',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<double> lastUseTime = GeneratedColumn<double>(
    'last_use_time',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
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
    lastUseTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_corks';
  @override
  Set<GeneratedColumn> get $primaryKey => {corkId};
  @override
  CloudAuthCorksData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudAuthCorksData(
      corkId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}cork_id'],
          )!,
      cryptoKeyId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}crypto_key_id'],
          )!,
      bearerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bearer_type'],
      ),
      bearerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bearer_id'],
      ),
      audienceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audience_type'],
      ),
      audienceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audience_id'],
      ),
      issuerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}issuer_type'],
      ),
      issuerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}issuer_id'],
      ),
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}create_time'],
          )!,
      expireTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}expire_time'],
      ),
      lastUseTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}last_use_time'],
      ),
    );
  }

  @override
  CloudAuthCorks createAlias(String alias) {
    return CloudAuthCorks(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_corks_crypto_key_fk FOREIGN KEY(crypto_key_id)REFERENCES cloud_auth_crypto_keys(crypto_key_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
    'CONSTRAINT cloud_auth_corks_bearer_fk FOREIGN KEY(bearer_type, bearer_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
    'CONSTRAINT cloud_auth_corks_audience_fk FOREIGN KEY(audience_type, audience_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
    'CONSTRAINT cloud_auth_corks_issuer_fk FOREIGN KEY(issuer_type, issuer_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthCorksData extends DataClass
    implements Insertable<CloudAuthCorksData> {
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
  const CloudAuthCorksData({
    required this.corkId,
    required this.cryptoKeyId,
    this.bearerType,
    this.bearerId,
    this.audienceType,
    this.audienceId,
    this.issuerType,
    this.issuerId,
    required this.createTime,
    this.expireTime,
    this.lastUseTime,
  });
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

  CloudAuthCorksCompanion toCompanion(bool nullToAbsent) {
    return CloudAuthCorksCompanion(
      corkId: Value(corkId),
      cryptoKeyId: Value(cryptoKeyId),
      bearerType:
          bearerType == null && nullToAbsent
              ? const Value.absent()
              : Value(bearerType),
      bearerId:
          bearerId == null && nullToAbsent
              ? const Value.absent()
              : Value(bearerId),
      audienceType:
          audienceType == null && nullToAbsent
              ? const Value.absent()
              : Value(audienceType),
      audienceId:
          audienceId == null && nullToAbsent
              ? const Value.absent()
              : Value(audienceId),
      issuerType:
          issuerType == null && nullToAbsent
              ? const Value.absent()
              : Value(issuerType),
      issuerId:
          issuerId == null && nullToAbsent
              ? const Value.absent()
              : Value(issuerId),
      createTime: Value(createTime),
      expireTime:
          expireTime == null && nullToAbsent
              ? const Value.absent()
              : Value(expireTime),
      lastUseTime:
          lastUseTime == null && nullToAbsent
              ? const Value.absent()
              : Value(lastUseTime),
    );
  }

  factory CloudAuthCorksData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudAuthCorksData(
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

  CloudAuthCorksData copyWith({
    Uint8List? corkId,
    Uint8List? cryptoKeyId,
    Value<String?> bearerType = const Value.absent(),
    Value<String?> bearerId = const Value.absent(),
    Value<String?> audienceType = const Value.absent(),
    Value<String?> audienceId = const Value.absent(),
    Value<String?> issuerType = const Value.absent(),
    Value<String?> issuerId = const Value.absent(),
    double? createTime,
    Value<double?> expireTime = const Value.absent(),
    Value<double?> lastUseTime = const Value.absent(),
  }) => CloudAuthCorksData(
    corkId: corkId ?? this.corkId,
    cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
    bearerType: bearerType.present ? bearerType.value : this.bearerType,
    bearerId: bearerId.present ? bearerId.value : this.bearerId,
    audienceType: audienceType.present ? audienceType.value : this.audienceType,
    audienceId: audienceId.present ? audienceId.value : this.audienceId,
    issuerType: issuerType.present ? issuerType.value : this.issuerType,
    issuerId: issuerId.present ? issuerId.value : this.issuerId,
    createTime: createTime ?? this.createTime,
    expireTime: expireTime.present ? expireTime.value : this.expireTime,
    lastUseTime: lastUseTime.present ? lastUseTime.value : this.lastUseTime,
  );
  CloudAuthCorksData copyWithCompanion(CloudAuthCorksCompanion data) {
    return CloudAuthCorksData(
      corkId: data.corkId.present ? data.corkId.value : this.corkId,
      cryptoKeyId:
          data.cryptoKeyId.present ? data.cryptoKeyId.value : this.cryptoKeyId,
      bearerType:
          data.bearerType.present ? data.bearerType.value : this.bearerType,
      bearerId: data.bearerId.present ? data.bearerId.value : this.bearerId,
      audienceType:
          data.audienceType.present
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
    return (StringBuffer('CloudAuthCorksData(')
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
    lastUseTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudAuthCorksData &&
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

class CloudAuthCorksCompanion extends UpdateCompanion<CloudAuthCorksData> {
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
  const CloudAuthCorksCompanion({
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
  CloudAuthCorksCompanion.insert({
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
  }) : corkId = Value(corkId),
       cryptoKeyId = Value(cryptoKeyId);
  static Insertable<CloudAuthCorksData> custom({
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

  CloudAuthCorksCompanion copyWith({
    Value<Uint8List>? corkId,
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
    Value<int>? rowid,
  }) {
    return CloudAuthCorksCompanion(
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
    return (StringBuffer('CloudAuthCorksCompanion(')
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

class CedarPolicies extends Table
    with TableInfo<CedarPolicies, CedarPoliciesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarPolicies(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> policyId = GeneratedColumn<String>(
    'policy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<String> policy = GeneratedColumn<String>(
    'policy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> enforcementLevel = GeneratedColumn<int>(
    'enforcement_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    policyId,
    policy,
    enforcementLevel,
  ];
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
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      policyId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}policy_id'],
          )!,
      policy:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}policy'],
          )!,
      enforcementLevel:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enforcement_level'],
          )!,
    );
  }

  @override
  CedarPolicies createAlias(String alias) {
    return CedarPolicies(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(enforcement_level IN (0, 1))',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CedarPoliciesData extends DataClass
    implements Insertable<CedarPoliciesData> {
  final String id;
  final String policyId;
  final String policy;
  final int enforcementLevel;
  const CedarPoliciesData({
    required this.id,
    required this.policyId,
    required this.policy,
    required this.enforcementLevel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['policy_id'] = Variable<String>(policyId);
    map['policy'] = Variable<String>(policy);
    map['enforcement_level'] = Variable<int>(enforcementLevel);
    return map;
  }

  CedarPoliciesCompanion toCompanion(bool nullToAbsent) {
    return CedarPoliciesCompanion(
      id: Value(id),
      policyId: Value(policyId),
      policy: Value(policy),
      enforcementLevel: Value(enforcementLevel),
    );
  }

  factory CedarPoliciesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  CedarPoliciesData copyWith({
    String? id,
    String? policyId,
    String? policy,
    int? enforcementLevel,
  }) => CedarPoliciesData(
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
      enforcementLevel:
          data.enforcementLevel.present
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
  }) : id = Value(id),
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

  CedarPoliciesCompanion copyWith({
    Value<String>? id,
    Value<String>? policyId,
    Value<String>? policy,
    Value<int>? enforcementLevel,
    Value<int>? rowid,
  }) {
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<String> template = GeneratedColumn<String>(
    'template',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
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
  CedarPolicyTemplatesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarPolicyTemplatesData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      templateId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}template_id'],
          )!,
      template:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}template'],
          )!,
    );
  }

  @override
  CedarPolicyTemplates createAlias(String alias) {
    return CedarPolicyTemplates(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(template IS NOT NULL OR template IS NOT NULL)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CedarPolicyTemplatesData extends DataClass
    implements Insertable<CedarPolicyTemplatesData> {
  final String id;
  final String templateId;
  final String template;
  const CedarPolicyTemplatesData({
    required this.id,
    required this.templateId,
    required this.template,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['template_id'] = Variable<String>(templateId);
    map['template'] = Variable<String>(template);
    return map;
  }

  CedarPolicyTemplatesCompanion toCompanion(bool nullToAbsent) {
    return CedarPolicyTemplatesCompanion(
      id: Value(id),
      templateId: Value(templateId),
      template: Value(template),
    );
  }

  factory CedarPolicyTemplatesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  CedarPolicyTemplatesData copyWith({
    String? id,
    String? templateId,
    String? template,
  }) => CedarPolicyTemplatesData(
    id: id ?? this.id,
    templateId: templateId ?? this.templateId,
    template: template ?? this.template,
  );
  CedarPolicyTemplatesData copyWithCompanion(
    CedarPolicyTemplatesCompanion data,
  ) {
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
  }) : id = Value(id),
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

  CedarPolicyTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? templateId,
    Value<String>? template,
    Value<int>? rowid,
  }) {
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> policyId = GeneratedColumn<String>(
    'policy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> principalType = GeneratedColumn<String>(
    'principal_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> principalId = GeneratedColumn<String>(
    'principal_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
    'resource_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
    'resource_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<int> enforcementLevel = GeneratedColumn<int>(
    'enforcement_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    policyId,
    templateId,
    principalType,
    principalId,
    resourceType,
    resourceId,
    enforcementLevel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_policy_template_links';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CedarPolicyTemplateLinksData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarPolicyTemplateLinksData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      policyId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}policy_id'],
          )!,
      templateId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}template_id'],
          )!,
      principalType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}principal_type'],
      ),
      principalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}principal_id'],
      ),
      resourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_type'],
      ),
      resourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_id'],
      ),
      enforcementLevel:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enforcement_level'],
          )!,
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
    'CONSTRAINT cedar_policy_template_links_fk_resource FOREIGN KEY(resource_type, resource_id)REFERENCES cedar_entities(entity_type, entity_id)ON DELETE CASCADE',
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
  const CedarPolicyTemplateLinksData({
    required this.id,
    required this.policyId,
    required this.templateId,
    this.principalType,
    this.principalId,
    this.resourceType,
    this.resourceId,
    required this.enforcementLevel,
  });
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

  CedarPolicyTemplateLinksCompanion toCompanion(bool nullToAbsent) {
    return CedarPolicyTemplateLinksCompanion(
      id: Value(id),
      policyId: Value(policyId),
      templateId: Value(templateId),
      principalType:
          principalType == null && nullToAbsent
              ? const Value.absent()
              : Value(principalType),
      principalId:
          principalId == null && nullToAbsent
              ? const Value.absent()
              : Value(principalId),
      resourceType:
          resourceType == null && nullToAbsent
              ? const Value.absent()
              : Value(resourceType),
      resourceId:
          resourceId == null && nullToAbsent
              ? const Value.absent()
              : Value(resourceId),
      enforcementLevel: Value(enforcementLevel),
    );
  }

  factory CedarPolicyTemplateLinksData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  CedarPolicyTemplateLinksData copyWith({
    String? id,
    String? policyId,
    String? templateId,
    Value<String?> principalType = const Value.absent(),
    Value<String?> principalId = const Value.absent(),
    Value<String?> resourceType = const Value.absent(),
    Value<String?> resourceId = const Value.absent(),
    int? enforcementLevel,
  }) => CedarPolicyTemplateLinksData(
    id: id ?? this.id,
    policyId: policyId ?? this.policyId,
    templateId: templateId ?? this.templateId,
    principalType:
        principalType.present ? principalType.value : this.principalType,
    principalId: principalId.present ? principalId.value : this.principalId,
    resourceType: resourceType.present ? resourceType.value : this.resourceType,
    resourceId: resourceId.present ? resourceId.value : this.resourceId,
    enforcementLevel: enforcementLevel ?? this.enforcementLevel,
  );
  CedarPolicyTemplateLinksData copyWithCompanion(
    CedarPolicyTemplateLinksCompanion data,
  ) {
    return CedarPolicyTemplateLinksData(
      id: data.id.present ? data.id.value : this.id,
      policyId: data.policyId.present ? data.policyId.value : this.policyId,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
      principalType:
          data.principalType.present
              ? data.principalType.value
              : this.principalType,
      principalId:
          data.principalId.present ? data.principalId.value : this.principalId,
      resourceType:
          data.resourceType.present
              ? data.resourceType.value
              : this.resourceType,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      enforcementLevel:
          data.enforcementLevel.present
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
  int get hashCode => Object.hash(
    id,
    policyId,
    templateId,
    principalType,
    principalId,
    resourceType,
    resourceId,
    enforcementLevel,
  );
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
  }) : id = Value(id),
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

  CedarPolicyTemplateLinksCompanion copyWith({
    Value<String>? id,
    Value<String>? policyId,
    Value<String>? templateId,
    Value<String?>? principalType,
    Value<String?>? principalId,
    Value<String?>? resourceType,
    Value<String?>? resourceId,
    Value<int>? enforcementLevel,
    Value<int>? rowid,
  }) {
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
    'rowid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<DateTime> expireTime = GeneratedColumn<DateTime>(
    'expire_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> principalType = GeneratedColumn<String>(
    'principal_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> principalId = GeneratedColumn<String>(
    'principal_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
    'action_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> actionId = GeneratedColumn<String>(
    'action_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
    'resource_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
    'resource_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> contextJson = GeneratedColumn<String>(
    'context_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'{}\'',
    defaultValue: const CustomExpression('\'{}\''),
  );
  late final GeneratedColumn<bool> decision = GeneratedColumn<bool>(
    'decision',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> reasonsJson = GeneratedColumn<String>(
    'reasons_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'[]\'',
    defaultValue: const CustomExpression('\'[]\''),
  );
  late final GeneratedColumn<String> errorsJson = GeneratedColumn<String>(
    'errors_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'[]\'',
    defaultValue: const CustomExpression('\'[]\''),
  );
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
    errorsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_authorization_logs';
  @override
  Set<GeneratedColumn> get $primaryKey => {rowid};
  @override
  CedarAuthorizationLogsData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CedarAuthorizationLogsData(
      rowid:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}rowid'],
          )!,
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      expireTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expire_time'],
      ),
      principalType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}principal_type'],
      ),
      principalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}principal_id'],
      ),
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_type'],
      ),
      actionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_id'],
      ),
      resourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_type'],
      ),
      resourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_id'],
      ),
      contextJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}context_json'],
          )!,
      decision:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}decision'],
          )!,
      reasonsJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}reasons_json'],
          )!,
      errorsJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}errors_json'],
          )!,
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
  const CedarAuthorizationLogsData({
    required this.rowid,
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
    required this.errorsJson,
  });
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

  CedarAuthorizationLogsCompanion toCompanion(bool nullToAbsent) {
    return CedarAuthorizationLogsCompanion(
      rowid: Value(rowid),
      createTime: Value(createTime),
      expireTime:
          expireTime == null && nullToAbsent
              ? const Value.absent()
              : Value(expireTime),
      principalType:
          principalType == null && nullToAbsent
              ? const Value.absent()
              : Value(principalType),
      principalId:
          principalId == null && nullToAbsent
              ? const Value.absent()
              : Value(principalId),
      actionType:
          actionType == null && nullToAbsent
              ? const Value.absent()
              : Value(actionType),
      actionId:
          actionId == null && nullToAbsent
              ? const Value.absent()
              : Value(actionId),
      resourceType:
          resourceType == null && nullToAbsent
              ? const Value.absent()
              : Value(resourceType),
      resourceId:
          resourceId == null && nullToAbsent
              ? const Value.absent()
              : Value(resourceId),
      contextJson: Value(contextJson),
      decision: Value(decision),
      reasonsJson: Value(reasonsJson),
      errorsJson: Value(errorsJson),
    );
  }

  factory CedarAuthorizationLogsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  CedarAuthorizationLogsData copyWith({
    int? rowid,
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
    String? errorsJson,
  }) => CedarAuthorizationLogsData(
    rowid: rowid ?? this.rowid,
    createTime: createTime ?? this.createTime,
    expireTime: expireTime.present ? expireTime.value : this.expireTime,
    principalType:
        principalType.present ? principalType.value : this.principalType,
    principalId: principalId.present ? principalId.value : this.principalId,
    actionType: actionType.present ? actionType.value : this.actionType,
    actionId: actionId.present ? actionId.value : this.actionId,
    resourceType: resourceType.present ? resourceType.value : this.resourceType,
    resourceId: resourceId.present ? resourceId.value : this.resourceId,
    contextJson: contextJson ?? this.contextJson,
    decision: decision ?? this.decision,
    reasonsJson: reasonsJson ?? this.reasonsJson,
    errorsJson: errorsJson ?? this.errorsJson,
  );
  CedarAuthorizationLogsData copyWithCompanion(
    CedarAuthorizationLogsCompanion data,
  ) {
    return CedarAuthorizationLogsData(
      rowid: data.rowid.present ? data.rowid.value : this.rowid,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      expireTime:
          data.expireTime.present ? data.expireTime.value : this.expireTime,
      principalType:
          data.principalType.present
              ? data.principalType.value
              : this.principalType,
      principalId:
          data.principalId.present ? data.principalId.value : this.principalId,
      actionType:
          data.actionType.present ? data.actionType.value : this.actionType,
      actionId: data.actionId.present ? data.actionId.value : this.actionId,
      resourceType:
          data.resourceType.present
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
    errorsJson,
  );
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

  CedarAuthorizationLogsCompanion copyWith({
    Value<int>? rowid,
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
    Value<String>? errorsJson,
  }) {
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

class UserMemberships extends Table
    with TableInfo<UserMemberships, UserMembershipsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserMemberships(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> membershipId = GeneratedColumn<String>(
    'membership_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> parentType = GeneratedColumn<String>(
    'parent_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
    'update_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    membershipId,
    userId,
    parentType,
    parentId,
    role,
    createTime,
    updateTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_memberships';
  @override
  Set<GeneratedColumn> get $primaryKey => {membershipId};
  @override
  UserMembershipsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserMembershipsData(
      membershipId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}membership_id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      parentType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_type'],
          )!,
      parentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_id'],
          )!,
      role:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}role'],
          )!,
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      updateTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}update_time'],
          )!,
    );
  }

  @override
  UserMemberships createAlias(String alias) {
    return UserMemberships(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(parent_type = \'Celest::Organization\' OR parent_type = \'Celest::Project\' OR parent_type = \'Celest::Project::Environment\')',
    'CONSTRAINT user_memberships_parent_fk FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class UserMembershipsData extends DataClass
    implements Insertable<UserMembershipsData> {
  final String membershipId;
  final String userId;
  final String parentType;
  final String parentId;
  final String role;
  final DateTime createTime;
  final DateTime updateTime;
  const UserMembershipsData({
    required this.membershipId,
    required this.userId,
    required this.parentType,
    required this.parentId,
    required this.role,
    required this.createTime,
    required this.updateTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['membership_id'] = Variable<String>(membershipId);
    map['user_id'] = Variable<String>(userId);
    map['parent_type'] = Variable<String>(parentType);
    map['parent_id'] = Variable<String>(parentId);
    map['role'] = Variable<String>(role);
    map['create_time'] = Variable<DateTime>(createTime);
    map['update_time'] = Variable<DateTime>(updateTime);
    return map;
  }

  UserMembershipsCompanion toCompanion(bool nullToAbsent) {
    return UserMembershipsCompanion(
      membershipId: Value(membershipId),
      userId: Value(userId),
      parentType: Value(parentType),
      parentId: Value(parentId),
      role: Value(role),
      createTime: Value(createTime),
      updateTime: Value(updateTime),
    );
  }

  factory UserMembershipsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserMembershipsData(
      membershipId: serializer.fromJson<String>(json['membershipId']),
      userId: serializer.fromJson<String>(json['userId']),
      parentType: serializer.fromJson<String>(json['parentType']),
      parentId: serializer.fromJson<String>(json['parentId']),
      role: serializer.fromJson<String>(json['role']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime>(json['updateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'membershipId': serializer.toJson<String>(membershipId),
      'userId': serializer.toJson<String>(userId),
      'parentType': serializer.toJson<String>(parentType),
      'parentId': serializer.toJson<String>(parentId),
      'role': serializer.toJson<String>(role),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime>(updateTime),
    };
  }

  UserMembershipsData copyWith({
    String? membershipId,
    String? userId,
    String? parentType,
    String? parentId,
    String? role,
    DateTime? createTime,
    DateTime? updateTime,
  }) => UserMembershipsData(
    membershipId: membershipId ?? this.membershipId,
    userId: userId ?? this.userId,
    parentType: parentType ?? this.parentType,
    parentId: parentId ?? this.parentId,
    role: role ?? this.role,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime ?? this.updateTime,
  );
  UserMembershipsData copyWithCompanion(UserMembershipsCompanion data) {
    return UserMembershipsData(
      membershipId:
          data.membershipId.present
              ? data.membershipId.value
              : this.membershipId,
      userId: data.userId.present ? data.userId.value : this.userId,
      parentType:
          data.parentType.present ? data.parentType.value : this.parentType,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      role: data.role.present ? data.role.value : this.role,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserMembershipsData(')
          ..write('membershipId: $membershipId, ')
          ..write('userId: $userId, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('role: $role, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    membershipId,
    userId,
    parentType,
    parentId,
    role,
    createTime,
    updateTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserMembershipsData &&
          other.membershipId == this.membershipId &&
          other.userId == this.userId &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.role == this.role &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime);
}

class UserMembershipsCompanion extends UpdateCompanion<UserMembershipsData> {
  final Value<String> membershipId;
  final Value<String> userId;
  final Value<String> parentType;
  final Value<String> parentId;
  final Value<String> role;
  final Value<DateTime> createTime;
  final Value<DateTime> updateTime;
  final Value<int> rowid;
  const UserMembershipsCompanion({
    this.membershipId = const Value.absent(),
    this.userId = const Value.absent(),
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    this.role = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserMembershipsCompanion.insert({
    required String membershipId,
    required String userId,
    required String parentType,
    required String parentId,
    required String role,
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : membershipId = Value(membershipId),
       userId = Value(userId),
       parentType = Value(parentType),
       parentId = Value(parentId),
       role = Value(role);
  static Insertable<UserMembershipsData> custom({
    Expression<String>? membershipId,
    Expression<String>? userId,
    Expression<String>? parentType,
    Expression<String>? parentId,
    Expression<String>? role,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (membershipId != null) 'membership_id': membershipId,
      if (userId != null) 'user_id': userId,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (role != null) 'role': role,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserMembershipsCompanion copyWith({
    Value<String>? membershipId,
    Value<String>? userId,
    Value<String>? parentType,
    Value<String>? parentId,
    Value<String>? role,
    Value<DateTime>? createTime,
    Value<DateTime>? updateTime,
    Value<int>? rowid,
  }) {
    return UserMembershipsCompanion(
      membershipId: membershipId ?? this.membershipId,
      userId: userId ?? this.userId,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      role: role ?? this.role,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (membershipId.present) {
      map['membership_id'] = Variable<String>(membershipId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (parentType.present) {
      map['parent_type'] = Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserMembershipsCompanion(')
          ..write('membershipId: $membershipId, ')
          ..write('userId: $userId, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('role: $role, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Organizations extends Table
    with TableInfo<Organizations, OrganizationsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Organizations(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> parentType = GeneratedColumn<String>(
    'parent_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'CREATING\'',
    defaultValue: const CustomExpression('\'CREATING\''),
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
    'update_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<DateTime> deleteTime = GeneratedColumn<DateTime>(
    'delete_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<DateTime> purgeTime = GeneratedColumn<DateTime>(
    'purge_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> annotations = GeneratedColumn<String>(
    'annotations',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> primaryRegion = GeneratedColumn<String>(
    'primary_region',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<bool> reconciling = GeneratedColumn<bool>(
    'reconciling',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (hex(md5(json_array(id, parent_type, parent_id, organization_id, state, display_name, create_time, update_time, delete_time, purge_time, annotations, primary_region, reconciling)))) STORED',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentType,
    parentId,
    organizationId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    purgeTime,
    annotations,
    primaryRegion,
    reconciling,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organizations';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrganizationsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganizationsData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      parentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_type'],
      ),
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      organizationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}organization_id'],
          )!,
      state:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}state'],
          )!,
      displayName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}display_name'],
          )!,
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      updateTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}update_time'],
          )!,
      deleteTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}delete_time'],
      ),
      purgeTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}purge_time'],
      ),
      annotations: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}annotations'],
      ),
      primaryRegion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}primary_region'],
      ),
      reconciling:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}reconciling'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  Organizations createAlias(String alias) {
    return Organizations(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT organizations_parent_fk FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE SET NULL',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class OrganizationsData extends DataClass
    implements Insertable<OrganizationsData> {
  final String id;
  final String? parentType;
  final String? parentId;
  final String organizationId;
  final String state;
  final String displayName;
  final DateTime createTime;
  final DateTime updateTime;
  final DateTime? deleteTime;
  final DateTime? purgeTime;
  final String? annotations;
  final String? primaryRegion;
  final bool reconciling;
  final String etag;
  const OrganizationsData({
    required this.id,
    this.parentType,
    this.parentId,
    required this.organizationId,
    required this.state,
    required this.displayName,
    required this.createTime,
    required this.updateTime,
    this.deleteTime,
    this.purgeTime,
    this.annotations,
    this.primaryRegion,
    required this.reconciling,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || parentType != null) {
      map['parent_type'] = Variable<String>(parentType);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    map['organization_id'] = Variable<String>(organizationId);
    map['state'] = Variable<String>(state);
    map['display_name'] = Variable<String>(displayName);
    map['create_time'] = Variable<DateTime>(createTime);
    map['update_time'] = Variable<DateTime>(updateTime);
    if (!nullToAbsent || deleteTime != null) {
      map['delete_time'] = Variable<DateTime>(deleteTime);
    }
    if (!nullToAbsent || purgeTime != null) {
      map['purge_time'] = Variable<DateTime>(purgeTime);
    }
    if (!nullToAbsent || annotations != null) {
      map['annotations'] = Variable<String>(annotations);
    }
    if (!nullToAbsent || primaryRegion != null) {
      map['primary_region'] = Variable<String>(primaryRegion);
    }
    map['reconciling'] = Variable<bool>(reconciling);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  OrganizationsCompanion toCompanion(bool nullToAbsent) {
    return OrganizationsCompanion(
      id: Value(id),
      parentType:
          parentType == null && nullToAbsent
              ? const Value.absent()
              : Value(parentType),
      parentId:
          parentId == null && nullToAbsent
              ? const Value.absent()
              : Value(parentId),
      organizationId: Value(organizationId),
      state: Value(state),
      displayName: Value(displayName),
      createTime: Value(createTime),
      updateTime: Value(updateTime),
      deleteTime:
          deleteTime == null && nullToAbsent
              ? const Value.absent()
              : Value(deleteTime),
      purgeTime:
          purgeTime == null && nullToAbsent
              ? const Value.absent()
              : Value(purgeTime),
      annotations:
          annotations == null && nullToAbsent
              ? const Value.absent()
              : Value(annotations),
      primaryRegion:
          primaryRegion == null && nullToAbsent
              ? const Value.absent()
              : Value(primaryRegion),
      reconciling: Value(reconciling),
      etag: Value(etag),
    );
  }

  factory OrganizationsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizationsData(
      id: serializer.fromJson<String>(json['id']),
      parentType: serializer.fromJson<String?>(json['parentType']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      organizationId: serializer.fromJson<String>(json['organizationId']),
      state: serializer.fromJson<String>(json['state']),
      displayName: serializer.fromJson<String>(json['displayName']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime>(json['updateTime']),
      deleteTime: serializer.fromJson<DateTime?>(json['deleteTime']),
      purgeTime: serializer.fromJson<DateTime?>(json['purgeTime']),
      annotations: serializer.fromJson<String?>(json['annotations']),
      primaryRegion: serializer.fromJson<String?>(json['primaryRegion']),
      reconciling: serializer.fromJson<bool>(json['reconciling']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parentType': serializer.toJson<String?>(parentType),
      'parentId': serializer.toJson<String?>(parentId),
      'organizationId': serializer.toJson<String>(organizationId),
      'state': serializer.toJson<String>(state),
      'displayName': serializer.toJson<String>(displayName),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime>(updateTime),
      'deleteTime': serializer.toJson<DateTime?>(deleteTime),
      'purgeTime': serializer.toJson<DateTime?>(purgeTime),
      'annotations': serializer.toJson<String?>(annotations),
      'primaryRegion': serializer.toJson<String?>(primaryRegion),
      'reconciling': serializer.toJson<bool>(reconciling),
      'etag': serializer.toJson<String>(etag),
    };
  }

  OrganizationsData copyWith({
    String? id,
    Value<String?> parentType = const Value.absent(),
    Value<String?> parentId = const Value.absent(),
    String? organizationId,
    String? state,
    String? displayName,
    DateTime? createTime,
    DateTime? updateTime,
    Value<DateTime?> deleteTime = const Value.absent(),
    Value<DateTime?> purgeTime = const Value.absent(),
    Value<String?> annotations = const Value.absent(),
    Value<String?> primaryRegion = const Value.absent(),
    bool? reconciling,
    String? etag,
  }) => OrganizationsData(
    id: id ?? this.id,
    parentType: parentType.present ? parentType.value : this.parentType,
    parentId: parentId.present ? parentId.value : this.parentId,
    organizationId: organizationId ?? this.organizationId,
    state: state ?? this.state,
    displayName: displayName ?? this.displayName,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime ?? this.updateTime,
    deleteTime: deleteTime.present ? deleteTime.value : this.deleteTime,
    purgeTime: purgeTime.present ? purgeTime.value : this.purgeTime,
    annotations: annotations.present ? annotations.value : this.annotations,
    primaryRegion:
        primaryRegion.present ? primaryRegion.value : this.primaryRegion,
    reconciling: reconciling ?? this.reconciling,
    etag: etag ?? this.etag,
  );
  OrganizationsData copyWithCompanion(OrganizationsCompanion data) {
    return OrganizationsData(
      id: data.id.present ? data.id.value : this.id,
      parentType:
          data.parentType.present ? data.parentType.value : this.parentType,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      organizationId:
          data.organizationId.present
              ? data.organizationId.value
              : this.organizationId,
      state: data.state.present ? data.state.value : this.state,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
      deleteTime:
          data.deleteTime.present ? data.deleteTime.value : this.deleteTime,
      purgeTime: data.purgeTime.present ? data.purgeTime.value : this.purgeTime,
      annotations:
          data.annotations.present ? data.annotations.value : this.annotations,
      primaryRegion:
          data.primaryRegion.present
              ? data.primaryRegion.value
              : this.primaryRegion,
      reconciling:
          data.reconciling.present ? data.reconciling.value : this.reconciling,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationsData(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('organizationId: $organizationId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('purgeTime: $purgeTime, ')
          ..write('annotations: $annotations, ')
          ..write('primaryRegion: $primaryRegion, ')
          ..write('reconciling: $reconciling, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentType,
    parentId,
    organizationId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    purgeTime,
    annotations,
    primaryRegion,
    reconciling,
    etag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationsData &&
          other.id == this.id &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.organizationId == this.organizationId &&
          other.state == this.state &&
          other.displayName == this.displayName &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.deleteTime == this.deleteTime &&
          other.purgeTime == this.purgeTime &&
          other.annotations == this.annotations &&
          other.primaryRegion == this.primaryRegion &&
          other.reconciling == this.reconciling &&
          other.etag == this.etag);
}

class OrganizationsCompanion extends UpdateCompanion<OrganizationsData> {
  final Value<String> id;
  final Value<String?> parentType;
  final Value<String?> parentId;
  final Value<String> organizationId;
  final Value<String> state;
  final Value<String> displayName;
  final Value<DateTime> createTime;
  final Value<DateTime> updateTime;
  final Value<DateTime?> deleteTime;
  final Value<DateTime?> purgeTime;
  final Value<String?> annotations;
  final Value<String?> primaryRegion;
  final Value<bool> reconciling;
  final Value<String> etag;
  final Value<int> rowid;
  const OrganizationsCompanion({
    this.id = const Value.absent(),
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.state = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.purgeTime = const Value.absent(),
    this.annotations = const Value.absent(),
    this.primaryRegion = const Value.absent(),
    this.reconciling = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrganizationsCompanion.insert({
    required String id,
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    required String organizationId,
    this.state = const Value.absent(),
    required String displayName,
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.purgeTime = const Value.absent(),
    this.annotations = const Value.absent(),
    this.primaryRegion = const Value.absent(),
    this.reconciling = const Value.absent(),
    required String etag,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       organizationId = Value(organizationId),
       displayName = Value(displayName),
       etag = Value(etag);
  static Insertable<OrganizationsData> custom({
    Expression<String>? id,
    Expression<String>? parentType,
    Expression<String>? parentId,
    Expression<String>? organizationId,
    Expression<String>? state,
    Expression<String>? displayName,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<DateTime>? deleteTime,
    Expression<DateTime>? purgeTime,
    Expression<String>? annotations,
    Expression<String>? primaryRegion,
    Expression<bool>? reconciling,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (organizationId != null) 'organization_id': organizationId,
      if (state != null) 'state': state,
      if (displayName != null) 'display_name': displayName,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (deleteTime != null) 'delete_time': deleteTime,
      if (purgeTime != null) 'purge_time': purgeTime,
      if (annotations != null) 'annotations': annotations,
      if (primaryRegion != null) 'primary_region': primaryRegion,
      if (reconciling != null) 'reconciling': reconciling,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrganizationsCompanion copyWith({
    Value<String>? id,
    Value<String?>? parentType,
    Value<String?>? parentId,
    Value<String>? organizationId,
    Value<String>? state,
    Value<String>? displayName,
    Value<DateTime>? createTime,
    Value<DateTime>? updateTime,
    Value<DateTime?>? deleteTime,
    Value<DateTime?>? purgeTime,
    Value<String?>? annotations,
    Value<String?>? primaryRegion,
    Value<bool>? reconciling,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return OrganizationsCompanion(
      id: id ?? this.id,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      organizationId: organizationId ?? this.organizationId,
      state: state ?? this.state,
      displayName: displayName ?? this.displayName,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      deleteTime: deleteTime ?? this.deleteTime,
      purgeTime: purgeTime ?? this.purgeTime,
      annotations: annotations ?? this.annotations,
      primaryRegion: primaryRegion ?? this.primaryRegion,
      reconciling: reconciling ?? this.reconciling,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (parentType.present) {
      map['parent_type'] = Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (deleteTime.present) {
      map['delete_time'] = Variable<DateTime>(deleteTime.value);
    }
    if (purgeTime.present) {
      map['purge_time'] = Variable<DateTime>(purgeTime.value);
    }
    if (annotations.present) {
      map['annotations'] = Variable<String>(annotations.value);
    }
    if (primaryRegion.present) {
      map['primary_region'] = Variable<String>(primaryRegion.value);
    }
    if (reconciling.present) {
      map['reconciling'] = Variable<bool>(reconciling.value);
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
    return (StringBuffer('OrganizationsCompanion(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('organizationId: $organizationId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('purgeTime: $purgeTime, ')
          ..write('annotations: $annotations, ')
          ..write('primaryRegion: $primaryRegion, ')
          ..write('reconciling: $reconciling, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Projects extends Table with TableInfo<Projects, ProjectsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Projects(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> parentType = GeneratedColumn<String>(
    'parent_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'CREATING\'',
    defaultValue: const CustomExpression('\'CREATING\''),
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
    'update_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<DateTime> deleteTime = GeneratedColumn<DateTime>(
    'delete_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<DateTime> purgeTime = GeneratedColumn<DateTime>(
    'purge_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> annotations = GeneratedColumn<String>(
    'annotations',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> regions = GeneratedColumn<String>(
    'regions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<bool> reconciling = GeneratedColumn<bool>(
    'reconciling',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (hex(md5(json_array(id, parent_type, parent_id, project_id, state, display_name, create_time, update_time, delete_time, purge_time, annotations, regions, reconciling)))) STORED',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentType,
    parentId,
    projectId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    purgeTime,
    annotations,
    regions,
    reconciling,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {projectId, parentId},
  ];
  @override
  ProjectsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectsData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      parentType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_type'],
          )!,
      parentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_id'],
          )!,
      projectId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      state:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}state'],
          )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      updateTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}update_time'],
          )!,
      deleteTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}delete_time'],
      ),
      purgeTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}purge_time'],
      ),
      annotations: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}annotations'],
      ),
      regions:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}regions'],
          )!,
      reconciling:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}reconciling'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  Projects createAlias(String alias) {
    return Projects(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(parent_type = \'Celest::Organization\')',
    'CONSTRAINT projects_fk_parent FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE',
    'CONSTRAINT projects_fk_organization FOREIGN KEY(parent_id)REFERENCES organizations(id)ON UPDATE CASCADE ON DELETE CASCADE',
    'CONSTRAINT projects_uq_project_id UNIQUE(project_id, parent_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectsData extends DataClass implements Insertable<ProjectsData> {
  final String id;
  final String parentType;
  final String parentId;
  final String projectId;
  final String state;
  final String? displayName;
  final DateTime createTime;
  final DateTime updateTime;
  final DateTime? deleteTime;
  final DateTime? purgeTime;
  final String? annotations;
  final String regions;
  final bool reconciling;
  final String etag;
  const ProjectsData({
    required this.id,
    required this.parentType,
    required this.parentId,
    required this.projectId,
    required this.state,
    this.displayName,
    required this.createTime,
    required this.updateTime,
    this.deleteTime,
    this.purgeTime,
    this.annotations,
    required this.regions,
    required this.reconciling,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['parent_type'] = Variable<String>(parentType);
    map['parent_id'] = Variable<String>(parentId);
    map['project_id'] = Variable<String>(projectId);
    map['state'] = Variable<String>(state);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    map['create_time'] = Variable<DateTime>(createTime);
    map['update_time'] = Variable<DateTime>(updateTime);
    if (!nullToAbsent || deleteTime != null) {
      map['delete_time'] = Variable<DateTime>(deleteTime);
    }
    if (!nullToAbsent || purgeTime != null) {
      map['purge_time'] = Variable<DateTime>(purgeTime);
    }
    if (!nullToAbsent || annotations != null) {
      map['annotations'] = Variable<String>(annotations);
    }
    map['regions'] = Variable<String>(regions);
    map['reconciling'] = Variable<bool>(reconciling);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      parentType: Value(parentType),
      parentId: Value(parentId),
      projectId: Value(projectId),
      state: Value(state),
      displayName:
          displayName == null && nullToAbsent
              ? const Value.absent()
              : Value(displayName),
      createTime: Value(createTime),
      updateTime: Value(updateTime),
      deleteTime:
          deleteTime == null && nullToAbsent
              ? const Value.absent()
              : Value(deleteTime),
      purgeTime:
          purgeTime == null && nullToAbsent
              ? const Value.absent()
              : Value(purgeTime),
      annotations:
          annotations == null && nullToAbsent
              ? const Value.absent()
              : Value(annotations),
      regions: Value(regions),
      reconciling: Value(reconciling),
      etag: Value(etag),
    );
  }

  factory ProjectsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectsData(
      id: serializer.fromJson<String>(json['id']),
      parentType: serializer.fromJson<String>(json['parentType']),
      parentId: serializer.fromJson<String>(json['parentId']),
      projectId: serializer.fromJson<String>(json['projectId']),
      state: serializer.fromJson<String>(json['state']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime>(json['updateTime']),
      deleteTime: serializer.fromJson<DateTime?>(json['deleteTime']),
      purgeTime: serializer.fromJson<DateTime?>(json['purgeTime']),
      annotations: serializer.fromJson<String?>(json['annotations']),
      regions: serializer.fromJson<String>(json['regions']),
      reconciling: serializer.fromJson<bool>(json['reconciling']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parentType': serializer.toJson<String>(parentType),
      'parentId': serializer.toJson<String>(parentId),
      'projectId': serializer.toJson<String>(projectId),
      'state': serializer.toJson<String>(state),
      'displayName': serializer.toJson<String?>(displayName),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime>(updateTime),
      'deleteTime': serializer.toJson<DateTime?>(deleteTime),
      'purgeTime': serializer.toJson<DateTime?>(purgeTime),
      'annotations': serializer.toJson<String?>(annotations),
      'regions': serializer.toJson<String>(regions),
      'reconciling': serializer.toJson<bool>(reconciling),
      'etag': serializer.toJson<String>(etag),
    };
  }

  ProjectsData copyWith({
    String? id,
    String? parentType,
    String? parentId,
    String? projectId,
    String? state,
    Value<String?> displayName = const Value.absent(),
    DateTime? createTime,
    DateTime? updateTime,
    Value<DateTime?> deleteTime = const Value.absent(),
    Value<DateTime?> purgeTime = const Value.absent(),
    Value<String?> annotations = const Value.absent(),
    String? regions,
    bool? reconciling,
    String? etag,
  }) => ProjectsData(
    id: id ?? this.id,
    parentType: parentType ?? this.parentType,
    parentId: parentId ?? this.parentId,
    projectId: projectId ?? this.projectId,
    state: state ?? this.state,
    displayName: displayName.present ? displayName.value : this.displayName,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime ?? this.updateTime,
    deleteTime: deleteTime.present ? deleteTime.value : this.deleteTime,
    purgeTime: purgeTime.present ? purgeTime.value : this.purgeTime,
    annotations: annotations.present ? annotations.value : this.annotations,
    regions: regions ?? this.regions,
    reconciling: reconciling ?? this.reconciling,
    etag: etag ?? this.etag,
  );
  ProjectsData copyWithCompanion(ProjectsCompanion data) {
    return ProjectsData(
      id: data.id.present ? data.id.value : this.id,
      parentType:
          data.parentType.present ? data.parentType.value : this.parentType,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      state: data.state.present ? data.state.value : this.state,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
      deleteTime:
          data.deleteTime.present ? data.deleteTime.value : this.deleteTime,
      purgeTime: data.purgeTime.present ? data.purgeTime.value : this.purgeTime,
      annotations:
          data.annotations.present ? data.annotations.value : this.annotations,
      regions: data.regions.present ? data.regions.value : this.regions,
      reconciling:
          data.reconciling.present ? data.reconciling.value : this.reconciling,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsData(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('projectId: $projectId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('purgeTime: $purgeTime, ')
          ..write('annotations: $annotations, ')
          ..write('regions: $regions, ')
          ..write('reconciling: $reconciling, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentType,
    parentId,
    projectId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    purgeTime,
    annotations,
    regions,
    reconciling,
    etag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectsData &&
          other.id == this.id &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.projectId == this.projectId &&
          other.state == this.state &&
          other.displayName == this.displayName &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.deleteTime == this.deleteTime &&
          other.purgeTime == this.purgeTime &&
          other.annotations == this.annotations &&
          other.regions == this.regions &&
          other.reconciling == this.reconciling &&
          other.etag == this.etag);
}

class ProjectsCompanion extends UpdateCompanion<ProjectsData> {
  final Value<String> id;
  final Value<String> parentType;
  final Value<String> parentId;
  final Value<String> projectId;
  final Value<String> state;
  final Value<String?> displayName;
  final Value<DateTime> createTime;
  final Value<DateTime> updateTime;
  final Value<DateTime?> deleteTime;
  final Value<DateTime?> purgeTime;
  final Value<String?> annotations;
  final Value<String> regions;
  final Value<bool> reconciling;
  final Value<String> etag;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.state = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.purgeTime = const Value.absent(),
    this.annotations = const Value.absent(),
    this.regions = const Value.absent(),
    this.reconciling = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String parentType,
    required String parentId,
    required String projectId,
    this.state = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.purgeTime = const Value.absent(),
    this.annotations = const Value.absent(),
    required String regions,
    this.reconciling = const Value.absent(),
    required String etag,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       parentType = Value(parentType),
       parentId = Value(parentId),
       projectId = Value(projectId),
       regions = Value(regions),
       etag = Value(etag);
  static Insertable<ProjectsData> custom({
    Expression<String>? id,
    Expression<String>? parentType,
    Expression<String>? parentId,
    Expression<String>? projectId,
    Expression<String>? state,
    Expression<String>? displayName,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<DateTime>? deleteTime,
    Expression<DateTime>? purgeTime,
    Expression<String>? annotations,
    Expression<String>? regions,
    Expression<bool>? reconciling,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (projectId != null) 'project_id': projectId,
      if (state != null) 'state': state,
      if (displayName != null) 'display_name': displayName,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (deleteTime != null) 'delete_time': deleteTime,
      if (purgeTime != null) 'purge_time': purgeTime,
      if (annotations != null) 'annotations': annotations,
      if (regions != null) 'regions': regions,
      if (reconciling != null) 'reconciling': reconciling,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? parentType,
    Value<String>? parentId,
    Value<String>? projectId,
    Value<String>? state,
    Value<String?>? displayName,
    Value<DateTime>? createTime,
    Value<DateTime>? updateTime,
    Value<DateTime?>? deleteTime,
    Value<DateTime?>? purgeTime,
    Value<String?>? annotations,
    Value<String>? regions,
    Value<bool>? reconciling,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      projectId: projectId ?? this.projectId,
      state: state ?? this.state,
      displayName: displayName ?? this.displayName,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      deleteTime: deleteTime ?? this.deleteTime,
      purgeTime: purgeTime ?? this.purgeTime,
      annotations: annotations ?? this.annotations,
      regions: regions ?? this.regions,
      reconciling: reconciling ?? this.reconciling,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (parentType.present) {
      map['parent_type'] = Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (deleteTime.present) {
      map['delete_time'] = Variable<DateTime>(deleteTime.value);
    }
    if (purgeTime.present) {
      map['purge_time'] = Variable<DateTime>(purgeTime.value);
    }
    if (annotations.present) {
      map['annotations'] = Variable<String>(annotations.value);
    }
    if (regions.present) {
      map['regions'] = Variable<String>(regions.value);
    }
    if (reconciling.present) {
      map['reconciling'] = Variable<bool>(reconciling.value);
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
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('projectId: $projectId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('purgeTime: $purgeTime, ')
          ..write('annotations: $annotations, ')
          ..write('regions: $regions, ')
          ..write('reconciling: $reconciling, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironments extends Table
    with TableInfo<ProjectEnvironments, ProjectEnvironmentsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironments(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> parentType = GeneratedColumn<String>(
    'parent_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> projectEnvironmentId =
      GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'CREATING\'',
    defaultValue: const CustomExpression('\'CREATING\''),
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
    'update_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<DateTime> deleteTime = GeneratedColumn<DateTime>(
    'delete_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> annotations = GeneratedColumn<String>(
    'annotations',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<bool> reconciling = GeneratedColumn<bool>(
    'reconciling',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (state IN (\'CREATING\', \'UPDATING\', \'DELETING\')) VIRTUAL',
  );
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (hex(md5(json_array(id, parent_type, parent_id, project_environment_id, state, display_name, create_time, update_time, delete_time, annotations, reconciling)))) STORED',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentType,
    parentId,
    projectEnvironmentId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    annotations,
    reconciling,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environments';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {projectEnvironmentId, parentId},
  ];
  @override
  ProjectEnvironmentsData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEnvironmentsData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      parentType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_type'],
          )!,
      parentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}parent_id'],
          )!,
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      state:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}state'],
          )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      updateTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}update_time'],
          )!,
      deleteTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}delete_time'],
      ),
      annotations: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}annotations'],
      ),
      reconciling:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}reconciling'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  ProjectEnvironments createAlias(String alias) {
    return ProjectEnvironments(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(parent_type = \'Celest::Project\')',
    'CONSTRAINT project_environments_parent_fk FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE',
    'CONSTRAINT project_environments_organization_fk FOREIGN KEY(parent_id)REFERENCES projects(id)ON UPDATE CASCADE ON DELETE CASCADE',
    'CONSTRAINT project_environments_project_environment_id_unique_idx UNIQUE(project_environment_id, parent_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironmentsData extends DataClass
    implements Insertable<ProjectEnvironmentsData> {
  final String id;
  final String parentType;
  final String parentId;
  final String projectEnvironmentId;
  final String state;
  final String? displayName;
  final DateTime createTime;
  final DateTime updateTime;
  final DateTime? deleteTime;
  final String? annotations;
  final bool reconciling;
  final String etag;
  const ProjectEnvironmentsData({
    required this.id,
    required this.parentType,
    required this.parentId,
    required this.projectEnvironmentId,
    required this.state,
    this.displayName,
    required this.createTime,
    required this.updateTime,
    this.deleteTime,
    this.annotations,
    required this.reconciling,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['parent_type'] = Variable<String>(parentType);
    map['parent_id'] = Variable<String>(parentId);
    map['project_environment_id'] = Variable<String>(projectEnvironmentId);
    map['state'] = Variable<String>(state);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    map['create_time'] = Variable<DateTime>(createTime);
    map['update_time'] = Variable<DateTime>(updateTime);
    if (!nullToAbsent || deleteTime != null) {
      map['delete_time'] = Variable<DateTime>(deleteTime);
    }
    if (!nullToAbsent || annotations != null) {
      map['annotations'] = Variable<String>(annotations);
    }
    map['reconciling'] = Variable<bool>(reconciling);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  ProjectEnvironmentsCompanion toCompanion(bool nullToAbsent) {
    return ProjectEnvironmentsCompanion(
      id: Value(id),
      parentType: Value(parentType),
      parentId: Value(parentId),
      projectEnvironmentId: Value(projectEnvironmentId),
      state: Value(state),
      displayName:
          displayName == null && nullToAbsent
              ? const Value.absent()
              : Value(displayName),
      createTime: Value(createTime),
      updateTime: Value(updateTime),
      deleteTime:
          deleteTime == null && nullToAbsent
              ? const Value.absent()
              : Value(deleteTime),
      annotations:
          annotations == null && nullToAbsent
              ? const Value.absent()
              : Value(annotations),
      reconciling: Value(reconciling),
      etag: Value(etag),
    );
  }

  factory ProjectEnvironmentsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentsData(
      id: serializer.fromJson<String>(json['id']),
      parentType: serializer.fromJson<String>(json['parentType']),
      parentId: serializer.fromJson<String>(json['parentId']),
      projectEnvironmentId: serializer.fromJson<String>(
        json['projectEnvironmentId'],
      ),
      state: serializer.fromJson<String>(json['state']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime>(json['updateTime']),
      deleteTime: serializer.fromJson<DateTime?>(json['deleteTime']),
      annotations: serializer.fromJson<String?>(json['annotations']),
      reconciling: serializer.fromJson<bool>(json['reconciling']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parentType': serializer.toJson<String>(parentType),
      'parentId': serializer.toJson<String>(parentId),
      'projectEnvironmentId': serializer.toJson<String>(projectEnvironmentId),
      'state': serializer.toJson<String>(state),
      'displayName': serializer.toJson<String?>(displayName),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime>(updateTime),
      'deleteTime': serializer.toJson<DateTime?>(deleteTime),
      'annotations': serializer.toJson<String?>(annotations),
      'reconciling': serializer.toJson<bool>(reconciling),
      'etag': serializer.toJson<String>(etag),
    };
  }

  ProjectEnvironmentsData copyWith({
    String? id,
    String? parentType,
    String? parentId,
    String? projectEnvironmentId,
    String? state,
    Value<String?> displayName = const Value.absent(),
    DateTime? createTime,
    DateTime? updateTime,
    Value<DateTime?> deleteTime = const Value.absent(),
    Value<String?> annotations = const Value.absent(),
    bool? reconciling,
    String? etag,
  }) => ProjectEnvironmentsData(
    id: id ?? this.id,
    parentType: parentType ?? this.parentType,
    parentId: parentId ?? this.parentId,
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    state: state ?? this.state,
    displayName: displayName.present ? displayName.value : this.displayName,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime ?? this.updateTime,
    deleteTime: deleteTime.present ? deleteTime.value : this.deleteTime,
    annotations: annotations.present ? annotations.value : this.annotations,
    reconciling: reconciling ?? this.reconciling,
    etag: etag ?? this.etag,
  );
  ProjectEnvironmentsData copyWithCompanion(ProjectEnvironmentsCompanion data) {
    return ProjectEnvironmentsData(
      id: data.id.present ? data.id.value : this.id,
      parentType:
          data.parentType.present ? data.parentType.value : this.parentType,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      projectEnvironmentId:
          data.projectEnvironmentId.present
              ? data.projectEnvironmentId.value
              : this.projectEnvironmentId,
      state: data.state.present ? data.state.value : this.state,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
      deleteTime:
          data.deleteTime.present ? data.deleteTime.value : this.deleteTime,
      annotations:
          data.annotations.present ? data.annotations.value : this.annotations,
      reconciling:
          data.reconciling.present ? data.reconciling.value : this.reconciling,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentsData(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('annotations: $annotations, ')
          ..write('reconciling: $reconciling, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentType,
    parentId,
    projectEnvironmentId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    annotations,
    reconciling,
    etag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironmentsData &&
          other.id == this.id &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          other.state == this.state &&
          other.displayName == this.displayName &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.deleteTime == this.deleteTime &&
          other.annotations == this.annotations &&
          other.reconciling == this.reconciling &&
          other.etag == this.etag);
}

class ProjectEnvironmentsCompanion
    extends UpdateCompanion<ProjectEnvironmentsData> {
  final Value<String> id;
  final Value<String> parentType;
  final Value<String> parentId;
  final Value<String> projectEnvironmentId;
  final Value<String> state;
  final Value<String?> displayName;
  final Value<DateTime> createTime;
  final Value<DateTime> updateTime;
  final Value<DateTime?> deleteTime;
  final Value<String?> annotations;
  final Value<bool> reconciling;
  final Value<String> etag;
  final Value<int> rowid;
  const ProjectEnvironmentsCompanion({
    this.id = const Value.absent(),
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    this.projectEnvironmentId = const Value.absent(),
    this.state = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.annotations = const Value.absent(),
    this.reconciling = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectEnvironmentsCompanion.insert({
    required String id,
    required String parentType,
    required String parentId,
    required String projectEnvironmentId,
    this.state = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.annotations = const Value.absent(),
    required bool reconciling,
    required String etag,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       parentType = Value(parentType),
       parentId = Value(parentId),
       projectEnvironmentId = Value(projectEnvironmentId),
       reconciling = Value(reconciling),
       etag = Value(etag);
  static Insertable<ProjectEnvironmentsData> custom({
    Expression<String>? id,
    Expression<String>? parentType,
    Expression<String>? parentId,
    Expression<String>? projectEnvironmentId,
    Expression<String>? state,
    Expression<String>? displayName,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<DateTime>? deleteTime,
    Expression<String>? annotations,
    Expression<bool>? reconciling,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (state != null) 'state': state,
      if (displayName != null) 'display_name': displayName,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (deleteTime != null) 'delete_time': deleteTime,
      if (annotations != null) 'annotations': annotations,
      if (reconciling != null) 'reconciling': reconciling,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectEnvironmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? parentType,
    Value<String>? parentId,
    Value<String>? projectEnvironmentId,
    Value<String>? state,
    Value<String?>? displayName,
    Value<DateTime>? createTime,
    Value<DateTime>? updateTime,
    Value<DateTime?>? deleteTime,
    Value<String?>? annotations,
    Value<bool>? reconciling,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return ProjectEnvironmentsCompanion(
      id: id ?? this.id,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      state: state ?? this.state,
      displayName: displayName ?? this.displayName,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      deleteTime: deleteTime ?? this.deleteTime,
      annotations: annotations ?? this.annotations,
      reconciling: reconciling ?? this.reconciling,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (parentType.present) {
      map['parent_type'] = Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (deleteTime.present) {
      map['delete_time'] = Variable<DateTime>(deleteTime.value);
    }
    if (annotations.present) {
      map['annotations'] = Variable<String>(annotations.value);
    }
    if (reconciling.present) {
      map['reconciling'] = Variable<bool>(reconciling.value);
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
    return (StringBuffer('ProjectEnvironmentsCompanion(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('annotations: $annotations, ')
          ..write('reconciling: $reconciling, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironmentAsts extends Table
    with TableInfo<ProjectEnvironmentAsts, ProjectEnvironmentAstsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentAsts(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> projectEnvironmentId =
      GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      );
  late final GeneratedColumn<Uint8List> ast = GeneratedColumn<Uint8List>(
    'ast',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> digest = GeneratedColumn<String>(
    'digest',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL GENERATED ALWAYS AS (hex(md5(ast))) STORED',
  );
  @override
  List<GeneratedColumn> get $columns => [
    projectEnvironmentId,
    ast,
    version,
    digest,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environment_asts';
  @override
  Set<GeneratedColumn> get $primaryKey => {projectEnvironmentId};
  @override
  ProjectEnvironmentAstsData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEnvironmentAstsData(
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      ast:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}ast'],
          )!,
      version:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}version'],
          )!,
      digest:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}digest'],
          )!,
    );
  }

  @override
  ProjectEnvironmentAsts createAlias(String alias) {
    return ProjectEnvironmentAsts(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'CONSTRAINT fk_environment_metadata_project_environment_id FOREIGN KEY(project_environment_id)REFERENCES project_environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironmentAstsData extends DataClass
    implements Insertable<ProjectEnvironmentAstsData> {
  final String projectEnvironmentId;
  final Uint8List ast;
  final int version;
  final String digest;
  const ProjectEnvironmentAstsData({
    required this.projectEnvironmentId,
    required this.ast,
    required this.version,
    required this.digest,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_environment_id'] = Variable<String>(projectEnvironmentId);
    map['ast'] = Variable<Uint8List>(ast);
    map['version'] = Variable<int>(version);
    map['digest'] = Variable<String>(digest);
    return map;
  }

  ProjectEnvironmentAstsCompanion toCompanion(bool nullToAbsent) {
    return ProjectEnvironmentAstsCompanion(
      projectEnvironmentId: Value(projectEnvironmentId),
      ast: Value(ast),
      version: Value(version),
      digest: Value(digest),
    );
  }

  factory ProjectEnvironmentAstsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentAstsData(
      projectEnvironmentId: serializer.fromJson<String>(
        json['projectEnvironmentId'],
      ),
      ast: serializer.fromJson<Uint8List>(json['ast']),
      version: serializer.fromJson<int>(json['version']),
      digest: serializer.fromJson<String>(json['digest']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'projectEnvironmentId': serializer.toJson<String>(projectEnvironmentId),
      'ast': serializer.toJson<Uint8List>(ast),
      'version': serializer.toJson<int>(version),
      'digest': serializer.toJson<String>(digest),
    };
  }

  ProjectEnvironmentAstsData copyWith({
    String? projectEnvironmentId,
    Uint8List? ast,
    int? version,
    String? digest,
  }) => ProjectEnvironmentAstsData(
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    ast: ast ?? this.ast,
    version: version ?? this.version,
    digest: digest ?? this.digest,
  );
  ProjectEnvironmentAstsData copyWithCompanion(
    ProjectEnvironmentAstsCompanion data,
  ) {
    return ProjectEnvironmentAstsData(
      projectEnvironmentId:
          data.projectEnvironmentId.present
              ? data.projectEnvironmentId.value
              : this.projectEnvironmentId,
      ast: data.ast.present ? data.ast.value : this.ast,
      version: data.version.present ? data.version.value : this.version,
      digest: data.digest.present ? data.digest.value : this.digest,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentAstsData(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('ast: $ast, ')
          ..write('version: $version, ')
          ..write('digest: $digest')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    projectEnvironmentId,
    $driftBlobEquality.hash(ast),
    version,
    digest,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironmentAstsData &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          $driftBlobEquality.equals(other.ast, this.ast) &&
          other.version == this.version &&
          other.digest == this.digest);
}

class ProjectEnvironmentAstsCompanion
    extends UpdateCompanion<ProjectEnvironmentAstsData> {
  final Value<String> projectEnvironmentId;
  final Value<Uint8List> ast;
  final Value<int> version;
  final Value<String> digest;
  const ProjectEnvironmentAstsCompanion({
    this.projectEnvironmentId = const Value.absent(),
    this.ast = const Value.absent(),
    this.version = const Value.absent(),
    this.digest = const Value.absent(),
  });
  ProjectEnvironmentAstsCompanion.insert({
    required String projectEnvironmentId,
    required Uint8List ast,
    required int version,
    required String digest,
  }) : projectEnvironmentId = Value(projectEnvironmentId),
       ast = Value(ast),
       version = Value(version),
       digest = Value(digest);
  static Insertable<ProjectEnvironmentAstsData> custom({
    Expression<String>? projectEnvironmentId,
    Expression<Uint8List>? ast,
    Expression<int>? version,
    Expression<String>? digest,
  }) {
    return RawValuesInsertable({
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (ast != null) 'ast': ast,
      if (version != null) 'version': version,
      if (digest != null) 'digest': digest,
    });
  }

  ProjectEnvironmentAstsCompanion copyWith({
    Value<String>? projectEnvironmentId,
    Value<Uint8List>? ast,
    Value<int>? version,
    Value<String>? digest,
  }) {
    return ProjectEnvironmentAstsCompanion(
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      ast: ast ?? this.ast,
      version: version ?? this.version,
      digest: digest ?? this.digest,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (ast.present) {
      map['ast'] = Variable<Uint8List>(ast.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (digest.present) {
      map['digest'] = Variable<String>(digest.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentAstsCompanion(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('ast: $ast, ')
          ..write('version: $version, ')
          ..write('digest: $digest')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironmentAssets extends Table
    with TableInfo<ProjectEnvironmentAssets, ProjectEnvironmentAssetsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentAssets(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> projectEnvironmentId =
      GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> bucket = GeneratedColumn<String>(
    'bucket',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    projectEnvironmentId,
    type,
    bucket,
    name,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environment_assets';
  @override
  Set<GeneratedColumn> get $primaryKey => {projectEnvironmentId, name};
  @override
  ProjectEnvironmentAssetsData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEnvironmentAssetsData(
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      bucket:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}bucket'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  ProjectEnvironmentAssets createAlias(String alias) {
    return ProjectEnvironmentAssets(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(project_environment_id, name)',
    'CONSTRAINT fk_environment_assets_project_environment_id FOREIGN KEY(project_environment_id)REFERENCES project_environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironmentAssetsData extends DataClass
    implements Insertable<ProjectEnvironmentAssetsData> {
  final String projectEnvironmentId;
  final String type;
  final String bucket;
  final String name;
  final String etag;
  const ProjectEnvironmentAssetsData({
    required this.projectEnvironmentId,
    required this.type,
    required this.bucket,
    required this.name,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_environment_id'] = Variable<String>(projectEnvironmentId);
    map['type'] = Variable<String>(type);
    map['bucket'] = Variable<String>(bucket);
    map['name'] = Variable<String>(name);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  ProjectEnvironmentAssetsCompanion toCompanion(bool nullToAbsent) {
    return ProjectEnvironmentAssetsCompanion(
      projectEnvironmentId: Value(projectEnvironmentId),
      type: Value(type),
      bucket: Value(bucket),
      name: Value(name),
      etag: Value(etag),
    );
  }

  factory ProjectEnvironmentAssetsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentAssetsData(
      projectEnvironmentId: serializer.fromJson<String>(
        json['projectEnvironmentId'],
      ),
      type: serializer.fromJson<String>(json['type']),
      bucket: serializer.fromJson<String>(json['bucket']),
      name: serializer.fromJson<String>(json['name']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'projectEnvironmentId': serializer.toJson<String>(projectEnvironmentId),
      'type': serializer.toJson<String>(type),
      'bucket': serializer.toJson<String>(bucket),
      'name': serializer.toJson<String>(name),
      'etag': serializer.toJson<String>(etag),
    };
  }

  ProjectEnvironmentAssetsData copyWith({
    String? projectEnvironmentId,
    String? type,
    String? bucket,
    String? name,
    String? etag,
  }) => ProjectEnvironmentAssetsData(
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    type: type ?? this.type,
    bucket: bucket ?? this.bucket,
    name: name ?? this.name,
    etag: etag ?? this.etag,
  );
  ProjectEnvironmentAssetsData copyWithCompanion(
    ProjectEnvironmentAssetsCompanion data,
  ) {
    return ProjectEnvironmentAssetsData(
      projectEnvironmentId:
          data.projectEnvironmentId.present
              ? data.projectEnvironmentId.value
              : this.projectEnvironmentId,
      type: data.type.present ? data.type.value : this.type,
      bucket: data.bucket.present ? data.bucket.value : this.bucket,
      name: data.name.present ? data.name.value : this.name,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentAssetsData(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('type: $type, ')
          ..write('bucket: $bucket, ')
          ..write('name: $name, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(projectEnvironmentId, type, bucket, name, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironmentAssetsData &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          other.type == this.type &&
          other.bucket == this.bucket &&
          other.name == this.name &&
          other.etag == this.etag);
}

class ProjectEnvironmentAssetsCompanion
    extends UpdateCompanion<ProjectEnvironmentAssetsData> {
  final Value<String> projectEnvironmentId;
  final Value<String> type;
  final Value<String> bucket;
  final Value<String> name;
  final Value<String> etag;
  const ProjectEnvironmentAssetsCompanion({
    this.projectEnvironmentId = const Value.absent(),
    this.type = const Value.absent(),
    this.bucket = const Value.absent(),
    this.name = const Value.absent(),
    this.etag = const Value.absent(),
  });
  ProjectEnvironmentAssetsCompanion.insert({
    required String projectEnvironmentId,
    required String type,
    required String bucket,
    required String name,
    required String etag,
  }) : projectEnvironmentId = Value(projectEnvironmentId),
       type = Value(type),
       bucket = Value(bucket),
       name = Value(name),
       etag = Value(etag);
  static Insertable<ProjectEnvironmentAssetsData> custom({
    Expression<String>? projectEnvironmentId,
    Expression<String>? type,
    Expression<String>? bucket,
    Expression<String>? name,
    Expression<String>? etag,
  }) {
    return RawValuesInsertable({
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (type != null) 'type': type,
      if (bucket != null) 'bucket': bucket,
      if (name != null) 'name': name,
      if (etag != null) 'etag': etag,
    });
  }

  ProjectEnvironmentAssetsCompanion copyWith({
    Value<String>? projectEnvironmentId,
    Value<String>? type,
    Value<String>? bucket,
    Value<String>? name,
    Value<String>? etag,
  }) {
    return ProjectEnvironmentAssetsCompanion(
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      type: type ?? this.type,
      bucket: bucket ?? this.bucket,
      name: name ?? this.name,
      etag: etag ?? this.etag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (bucket.present) {
      map['bucket'] = Variable<String>(bucket.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentAssetsCompanion(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('type: $type, ')
          ..write('bucket: $bucket, ')
          ..write('name: $name, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }
}

class TursoDatabases extends Table
    with TableInfo<TursoDatabases, TursoDatabasesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TursoDatabases(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> databaseName = GeneratedColumn<String>(
    'database_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> databaseGroup = GeneratedColumn<String>(
    'database_group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> databaseUrl = GeneratedColumn<String>(
    'database_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> databaseToken = GeneratedColumn<String>(
    'database_token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    databaseName,
    databaseGroup,
    databaseUrl,
    databaseToken,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'turso_databases';
  @override
  Set<GeneratedColumn> get $primaryKey => {databaseName};
  @override
  TursoDatabasesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TursoDatabasesData(
      databaseName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}database_name'],
          )!,
      databaseGroup:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}database_group'],
          )!,
      databaseUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}database_url'],
          )!,
      databaseToken:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}database_token'],
          )!,
    );
  }

  @override
  TursoDatabases createAlias(String alias) {
    return TursoDatabases(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TursoDatabasesData extends DataClass
    implements Insertable<TursoDatabasesData> {
  final String databaseName;
  final String databaseGroup;
  final String databaseUrl;
  final String databaseToken;
  const TursoDatabasesData({
    required this.databaseName,
    required this.databaseGroup,
    required this.databaseUrl,
    required this.databaseToken,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['database_name'] = Variable<String>(databaseName);
    map['database_group'] = Variable<String>(databaseGroup);
    map['database_url'] = Variable<String>(databaseUrl);
    map['database_token'] = Variable<String>(databaseToken);
    return map;
  }

  TursoDatabasesCompanion toCompanion(bool nullToAbsent) {
    return TursoDatabasesCompanion(
      databaseName: Value(databaseName),
      databaseGroup: Value(databaseGroup),
      databaseUrl: Value(databaseUrl),
      databaseToken: Value(databaseToken),
    );
  }

  factory TursoDatabasesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TursoDatabasesData(
      databaseName: serializer.fromJson<String>(json['databaseName']),
      databaseGroup: serializer.fromJson<String>(json['databaseGroup']),
      databaseUrl: serializer.fromJson<String>(json['databaseUrl']),
      databaseToken: serializer.fromJson<String>(json['databaseToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'databaseName': serializer.toJson<String>(databaseName),
      'databaseGroup': serializer.toJson<String>(databaseGroup),
      'databaseUrl': serializer.toJson<String>(databaseUrl),
      'databaseToken': serializer.toJson<String>(databaseToken),
    };
  }

  TursoDatabasesData copyWith({
    String? databaseName,
    String? databaseGroup,
    String? databaseUrl,
    String? databaseToken,
  }) => TursoDatabasesData(
    databaseName: databaseName ?? this.databaseName,
    databaseGroup: databaseGroup ?? this.databaseGroup,
    databaseUrl: databaseUrl ?? this.databaseUrl,
    databaseToken: databaseToken ?? this.databaseToken,
  );
  TursoDatabasesData copyWithCompanion(TursoDatabasesCompanion data) {
    return TursoDatabasesData(
      databaseName:
          data.databaseName.present
              ? data.databaseName.value
              : this.databaseName,
      databaseGroup:
          data.databaseGroup.present
              ? data.databaseGroup.value
              : this.databaseGroup,
      databaseUrl:
          data.databaseUrl.present ? data.databaseUrl.value : this.databaseUrl,
      databaseToken:
          data.databaseToken.present
              ? data.databaseToken.value
              : this.databaseToken,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TursoDatabasesData(')
          ..write('databaseName: $databaseName, ')
          ..write('databaseGroup: $databaseGroup, ')
          ..write('databaseUrl: $databaseUrl, ')
          ..write('databaseToken: $databaseToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(databaseName, databaseGroup, databaseUrl, databaseToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TursoDatabasesData &&
          other.databaseName == this.databaseName &&
          other.databaseGroup == this.databaseGroup &&
          other.databaseUrl == this.databaseUrl &&
          other.databaseToken == this.databaseToken);
}

class TursoDatabasesCompanion extends UpdateCompanion<TursoDatabasesData> {
  final Value<String> databaseName;
  final Value<String> databaseGroup;
  final Value<String> databaseUrl;
  final Value<String> databaseToken;
  final Value<int> rowid;
  const TursoDatabasesCompanion({
    this.databaseName = const Value.absent(),
    this.databaseGroup = const Value.absent(),
    this.databaseUrl = const Value.absent(),
    this.databaseToken = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TursoDatabasesCompanion.insert({
    required String databaseName,
    required String databaseGroup,
    required String databaseUrl,
    required String databaseToken,
    this.rowid = const Value.absent(),
  }) : databaseName = Value(databaseName),
       databaseGroup = Value(databaseGroup),
       databaseUrl = Value(databaseUrl),
       databaseToken = Value(databaseToken);
  static Insertable<TursoDatabasesData> custom({
    Expression<String>? databaseName,
    Expression<String>? databaseGroup,
    Expression<String>? databaseUrl,
    Expression<String>? databaseToken,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (databaseName != null) 'database_name': databaseName,
      if (databaseGroup != null) 'database_group': databaseGroup,
      if (databaseUrl != null) 'database_url': databaseUrl,
      if (databaseToken != null) 'database_token': databaseToken,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TursoDatabasesCompanion copyWith({
    Value<String>? databaseName,
    Value<String>? databaseGroup,
    Value<String>? databaseUrl,
    Value<String>? databaseToken,
    Value<int>? rowid,
  }) {
    return TursoDatabasesCompanion(
      databaseName: databaseName ?? this.databaseName,
      databaseGroup: databaseGroup ?? this.databaseGroup,
      databaseUrl: databaseUrl ?? this.databaseUrl,
      databaseToken: databaseToken ?? this.databaseToken,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (databaseName.present) {
      map['database_name'] = Variable<String>(databaseName.value);
    }
    if (databaseGroup.present) {
      map['database_group'] = Variable<String>(databaseGroup.value);
    }
    if (databaseUrl.present) {
      map['database_url'] = Variable<String>(databaseUrl.value);
    }
    if (databaseToken.present) {
      map['database_token'] = Variable<String>(databaseToken.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TursoDatabasesCompanion(')
          ..write('databaseName: $databaseName, ')
          ..write('databaseGroup: $databaseGroup, ')
          ..write('databaseUrl: $databaseUrl, ')
          ..write('databaseToken: $databaseToken, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironmentStates extends Table
    with TableInfo<ProjectEnvironmentStates, ProjectEnvironmentStatesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentStates(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> projectEnvironmentId =
      GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      );
  late final GeneratedColumn<String> flyAppName = GeneratedColumn<String>(
    'fly_app_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> flyVolumeName = GeneratedColumn<String>(
    'fly_volume_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> flyMacaroonToken = GeneratedColumn<String>(
    'fly_macaroon_token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> domainName = GeneratedColumn<String>(
    'domain_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> tursoDatabaseName =
      GeneratedColumn<String>(
        'turso_database_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  @override
  List<GeneratedColumn> get $columns => [
    projectEnvironmentId,
    flyAppName,
    flyVolumeName,
    flyMacaroonToken,
    domainName,
    tursoDatabaseName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environment_states';
  @override
  Set<GeneratedColumn> get $primaryKey => {projectEnvironmentId};
  @override
  ProjectEnvironmentStatesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEnvironmentStatesData(
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      flyAppName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fly_app_name'],
      ),
      flyVolumeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fly_volume_name'],
      ),
      flyMacaroonToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fly_macaroon_token'],
      ),
      domainName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}domain_name'],
      ),
      tursoDatabaseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}turso_database_name'],
      ),
    );
  }

  @override
  ProjectEnvironmentStates createAlias(String alias) {
    return ProjectEnvironmentStates(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'CONSTRAINT fk_project_environment_state_project_environment_id FOREIGN KEY(project_environment_id)REFERENCES project_environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
    'CONSTRAINT fk_project_environment_state_turso_database FOREIGN KEY(turso_database_name)REFERENCES turso_databases(database_name)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironmentStatesData extends DataClass
    implements Insertable<ProjectEnvironmentStatesData> {
  final String projectEnvironmentId;
  final String? flyAppName;
  final String? flyVolumeName;
  final String? flyMacaroonToken;
  final String? domainName;
  final String? tursoDatabaseName;
  const ProjectEnvironmentStatesData({
    required this.projectEnvironmentId,
    this.flyAppName,
    this.flyVolumeName,
    this.flyMacaroonToken,
    this.domainName,
    this.tursoDatabaseName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_environment_id'] = Variable<String>(projectEnvironmentId);
    if (!nullToAbsent || flyAppName != null) {
      map['fly_app_name'] = Variable<String>(flyAppName);
    }
    if (!nullToAbsent || flyVolumeName != null) {
      map['fly_volume_name'] = Variable<String>(flyVolumeName);
    }
    if (!nullToAbsent || flyMacaroonToken != null) {
      map['fly_macaroon_token'] = Variable<String>(flyMacaroonToken);
    }
    if (!nullToAbsent || domainName != null) {
      map['domain_name'] = Variable<String>(domainName);
    }
    if (!nullToAbsent || tursoDatabaseName != null) {
      map['turso_database_name'] = Variable<String>(tursoDatabaseName);
    }
    return map;
  }

  ProjectEnvironmentStatesCompanion toCompanion(bool nullToAbsent) {
    return ProjectEnvironmentStatesCompanion(
      projectEnvironmentId: Value(projectEnvironmentId),
      flyAppName:
          flyAppName == null && nullToAbsent
              ? const Value.absent()
              : Value(flyAppName),
      flyVolumeName:
          flyVolumeName == null && nullToAbsent
              ? const Value.absent()
              : Value(flyVolumeName),
      flyMacaroonToken:
          flyMacaroonToken == null && nullToAbsent
              ? const Value.absent()
              : Value(flyMacaroonToken),
      domainName:
          domainName == null && nullToAbsent
              ? const Value.absent()
              : Value(domainName),
      tursoDatabaseName:
          tursoDatabaseName == null && nullToAbsent
              ? const Value.absent()
              : Value(tursoDatabaseName),
    );
  }

  factory ProjectEnvironmentStatesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentStatesData(
      projectEnvironmentId: serializer.fromJson<String>(
        json['projectEnvironmentId'],
      ),
      flyAppName: serializer.fromJson<String?>(json['flyAppName']),
      flyVolumeName: serializer.fromJson<String?>(json['flyVolumeName']),
      flyMacaroonToken: serializer.fromJson<String?>(json['flyMacaroonToken']),
      domainName: serializer.fromJson<String?>(json['domainName']),
      tursoDatabaseName: serializer.fromJson<String?>(
        json['tursoDatabaseName'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'projectEnvironmentId': serializer.toJson<String>(projectEnvironmentId),
      'flyAppName': serializer.toJson<String?>(flyAppName),
      'flyVolumeName': serializer.toJson<String?>(flyVolumeName),
      'flyMacaroonToken': serializer.toJson<String?>(flyMacaroonToken),
      'domainName': serializer.toJson<String?>(domainName),
      'tursoDatabaseName': serializer.toJson<String?>(tursoDatabaseName),
    };
  }

  ProjectEnvironmentStatesData copyWith({
    String? projectEnvironmentId,
    Value<String?> flyAppName = const Value.absent(),
    Value<String?> flyVolumeName = const Value.absent(),
    Value<String?> flyMacaroonToken = const Value.absent(),
    Value<String?> domainName = const Value.absent(),
    Value<String?> tursoDatabaseName = const Value.absent(),
  }) => ProjectEnvironmentStatesData(
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    flyAppName: flyAppName.present ? flyAppName.value : this.flyAppName,
    flyVolumeName:
        flyVolumeName.present ? flyVolumeName.value : this.flyVolumeName,
    flyMacaroonToken:
        flyMacaroonToken.present
            ? flyMacaroonToken.value
            : this.flyMacaroonToken,
    domainName: domainName.present ? domainName.value : this.domainName,
    tursoDatabaseName:
        tursoDatabaseName.present
            ? tursoDatabaseName.value
            : this.tursoDatabaseName,
  );
  ProjectEnvironmentStatesData copyWithCompanion(
    ProjectEnvironmentStatesCompanion data,
  ) {
    return ProjectEnvironmentStatesData(
      projectEnvironmentId:
          data.projectEnvironmentId.present
              ? data.projectEnvironmentId.value
              : this.projectEnvironmentId,
      flyAppName:
          data.flyAppName.present ? data.flyAppName.value : this.flyAppName,
      flyVolumeName:
          data.flyVolumeName.present
              ? data.flyVolumeName.value
              : this.flyVolumeName,
      flyMacaroonToken:
          data.flyMacaroonToken.present
              ? data.flyMacaroonToken.value
              : this.flyMacaroonToken,
      domainName:
          data.domainName.present ? data.domainName.value : this.domainName,
      tursoDatabaseName:
          data.tursoDatabaseName.present
              ? data.tursoDatabaseName.value
              : this.tursoDatabaseName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentStatesData(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('flyAppName: $flyAppName, ')
          ..write('flyVolumeName: $flyVolumeName, ')
          ..write('flyMacaroonToken: $flyMacaroonToken, ')
          ..write('domainName: $domainName, ')
          ..write('tursoDatabaseName: $tursoDatabaseName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    projectEnvironmentId,
    flyAppName,
    flyVolumeName,
    flyMacaroonToken,
    domainName,
    tursoDatabaseName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironmentStatesData &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          other.flyAppName == this.flyAppName &&
          other.flyVolumeName == this.flyVolumeName &&
          other.flyMacaroonToken == this.flyMacaroonToken &&
          other.domainName == this.domainName &&
          other.tursoDatabaseName == this.tursoDatabaseName);
}

class ProjectEnvironmentStatesCompanion
    extends UpdateCompanion<ProjectEnvironmentStatesData> {
  final Value<String> projectEnvironmentId;
  final Value<String?> flyAppName;
  final Value<String?> flyVolumeName;
  final Value<String?> flyMacaroonToken;
  final Value<String?> domainName;
  final Value<String?> tursoDatabaseName;
  const ProjectEnvironmentStatesCompanion({
    this.projectEnvironmentId = const Value.absent(),
    this.flyAppName = const Value.absent(),
    this.flyVolumeName = const Value.absent(),
    this.flyMacaroonToken = const Value.absent(),
    this.domainName = const Value.absent(),
    this.tursoDatabaseName = const Value.absent(),
  });
  ProjectEnvironmentStatesCompanion.insert({
    required String projectEnvironmentId,
    this.flyAppName = const Value.absent(),
    this.flyVolumeName = const Value.absent(),
    this.flyMacaroonToken = const Value.absent(),
    this.domainName = const Value.absent(),
    this.tursoDatabaseName = const Value.absent(),
  }) : projectEnvironmentId = Value(projectEnvironmentId);
  static Insertable<ProjectEnvironmentStatesData> custom({
    Expression<String>? projectEnvironmentId,
    Expression<String>? flyAppName,
    Expression<String>? flyVolumeName,
    Expression<String>? flyMacaroonToken,
    Expression<String>? domainName,
    Expression<String>? tursoDatabaseName,
  }) {
    return RawValuesInsertable({
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (flyAppName != null) 'fly_app_name': flyAppName,
      if (flyVolumeName != null) 'fly_volume_name': flyVolumeName,
      if (flyMacaroonToken != null) 'fly_macaroon_token': flyMacaroonToken,
      if (domainName != null) 'domain_name': domainName,
      if (tursoDatabaseName != null) 'turso_database_name': tursoDatabaseName,
    });
  }

  ProjectEnvironmentStatesCompanion copyWith({
    Value<String>? projectEnvironmentId,
    Value<String?>? flyAppName,
    Value<String?>? flyVolumeName,
    Value<String?>? flyMacaroonToken,
    Value<String?>? domainName,
    Value<String?>? tursoDatabaseName,
  }) {
    return ProjectEnvironmentStatesCompanion(
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      flyAppName: flyAppName ?? this.flyAppName,
      flyVolumeName: flyVolumeName ?? this.flyVolumeName,
      flyMacaroonToken: flyMacaroonToken ?? this.flyMacaroonToken,
      domainName: domainName ?? this.domainName,
      tursoDatabaseName: tursoDatabaseName ?? this.tursoDatabaseName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (flyAppName.present) {
      map['fly_app_name'] = Variable<String>(flyAppName.value);
    }
    if (flyVolumeName.present) {
      map['fly_volume_name'] = Variable<String>(flyVolumeName.value);
    }
    if (flyMacaroonToken.present) {
      map['fly_macaroon_token'] = Variable<String>(flyMacaroonToken.value);
    }
    if (domainName.present) {
      map['domain_name'] = Variable<String>(domainName.value);
    }
    if (tursoDatabaseName.present) {
      map['turso_database_name'] = Variable<String>(tursoDatabaseName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentStatesCompanion(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('flyAppName: $flyAppName, ')
          ..write('flyVolumeName: $flyVolumeName, ')
          ..write('flyMacaroonToken: $flyMacaroonToken, ')
          ..write('domainName: $domainName, ')
          ..write('tursoDatabaseName: $tursoDatabaseName')
          ..write(')'))
        .toString();
  }
}

class Operations extends Table with TableInfo<Operations, OperationsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Operations(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> response = GeneratedColumn<String>(
    'response',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
    'error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
    'done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (response IS NOT NULL OR error IS NOT NULL) VIRTUAL',
  );
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  late final GeneratedColumn<String> fullResourceName = GeneratedColumn<String>(
    'full_resource_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> ownerType = GeneratedColumn<String>(
    'owner_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
    'resource_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
    'resource_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    metadata,
    response,
    error,
    done,
    createTime,
    fullResourceName,
    ownerType,
    ownerId,
    resourceType,
    resourceId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'operations';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperationsData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
      response: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}response'],
      ),
      error: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
      done:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}done'],
          )!,
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      fullResourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_resource_name'],
      ),
      ownerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_type'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      ),
      resourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_type'],
      ),
      resourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_id'],
      ),
    );
  }

  @override
  Operations createAlias(String alias) {
    return Operations(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class OperationsData extends DataClass implements Insertable<OperationsData> {
  final String id;
  final String? metadata;
  final String? response;
  final String? error;
  final bool done;
  final DateTime createTime;
  final String? fullResourceName;
  final String? ownerType;
  final String? ownerId;
  final String? resourceType;
  final String? resourceId;
  const OperationsData({
    required this.id,
    this.metadata,
    this.response,
    this.error,
    required this.done,
    required this.createTime,
    this.fullResourceName,
    this.ownerType,
    this.ownerId,
    this.resourceType,
    this.resourceId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    if (!nullToAbsent || response != null) {
      map['response'] = Variable<String>(response);
    }
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    map['done'] = Variable<bool>(done);
    map['create_time'] = Variable<DateTime>(createTime);
    if (!nullToAbsent || fullResourceName != null) {
      map['full_resource_name'] = Variable<String>(fullResourceName);
    }
    if (!nullToAbsent || ownerType != null) {
      map['owner_type'] = Variable<String>(ownerType);
    }
    if (!nullToAbsent || ownerId != null) {
      map['owner_id'] = Variable<String>(ownerId);
    }
    if (!nullToAbsent || resourceType != null) {
      map['resource_type'] = Variable<String>(resourceType);
    }
    if (!nullToAbsent || resourceId != null) {
      map['resource_id'] = Variable<String>(resourceId);
    }
    return map;
  }

  OperationsCompanion toCompanion(bool nullToAbsent) {
    return OperationsCompanion(
      id: Value(id),
      metadata:
          metadata == null && nullToAbsent
              ? const Value.absent()
              : Value(metadata),
      response:
          response == null && nullToAbsent
              ? const Value.absent()
              : Value(response),
      error:
          error == null && nullToAbsent ? const Value.absent() : Value(error),
      done: Value(done),
      createTime: Value(createTime),
      fullResourceName:
          fullResourceName == null && nullToAbsent
              ? const Value.absent()
              : Value(fullResourceName),
      ownerType:
          ownerType == null && nullToAbsent
              ? const Value.absent()
              : Value(ownerType),
      ownerId:
          ownerId == null && nullToAbsent
              ? const Value.absent()
              : Value(ownerId),
      resourceType:
          resourceType == null && nullToAbsent
              ? const Value.absent()
              : Value(resourceType),
      resourceId:
          resourceId == null && nullToAbsent
              ? const Value.absent()
              : Value(resourceId),
    );
  }

  factory OperationsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperationsData(
      id: serializer.fromJson<String>(json['id']),
      metadata: serializer.fromJson<String?>(json['metadata']),
      response: serializer.fromJson<String?>(json['response']),
      error: serializer.fromJson<String?>(json['error']),
      done: serializer.fromJson<bool>(json['done']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      fullResourceName: serializer.fromJson<String?>(json['fullResourceName']),
      ownerType: serializer.fromJson<String?>(json['ownerType']),
      ownerId: serializer.fromJson<String?>(json['ownerId']),
      resourceType: serializer.fromJson<String?>(json['resourceType']),
      resourceId: serializer.fromJson<String?>(json['resourceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'metadata': serializer.toJson<String?>(metadata),
      'response': serializer.toJson<String?>(response),
      'error': serializer.toJson<String?>(error),
      'done': serializer.toJson<bool>(done),
      'createTime': serializer.toJson<DateTime>(createTime),
      'fullResourceName': serializer.toJson<String?>(fullResourceName),
      'ownerType': serializer.toJson<String?>(ownerType),
      'ownerId': serializer.toJson<String?>(ownerId),
      'resourceType': serializer.toJson<String?>(resourceType),
      'resourceId': serializer.toJson<String?>(resourceId),
    };
  }

  OperationsData copyWith({
    String? id,
    Value<String?> metadata = const Value.absent(),
    Value<String?> response = const Value.absent(),
    Value<String?> error = const Value.absent(),
    bool? done,
    DateTime? createTime,
    Value<String?> fullResourceName = const Value.absent(),
    Value<String?> ownerType = const Value.absent(),
    Value<String?> ownerId = const Value.absent(),
    Value<String?> resourceType = const Value.absent(),
    Value<String?> resourceId = const Value.absent(),
  }) => OperationsData(
    id: id ?? this.id,
    metadata: metadata.present ? metadata.value : this.metadata,
    response: response.present ? response.value : this.response,
    error: error.present ? error.value : this.error,
    done: done ?? this.done,
    createTime: createTime ?? this.createTime,
    fullResourceName:
        fullResourceName.present
            ? fullResourceName.value
            : this.fullResourceName,
    ownerType: ownerType.present ? ownerType.value : this.ownerType,
    ownerId: ownerId.present ? ownerId.value : this.ownerId,
    resourceType: resourceType.present ? resourceType.value : this.resourceType,
    resourceId: resourceId.present ? resourceId.value : this.resourceId,
  );
  OperationsData copyWithCompanion(OperationsCompanion data) {
    return OperationsData(
      id: data.id.present ? data.id.value : this.id,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      response: data.response.present ? data.response.value : this.response,
      error: data.error.present ? data.error.value : this.error,
      done: data.done.present ? data.done.value : this.done,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      fullResourceName:
          data.fullResourceName.present
              ? data.fullResourceName.value
              : this.fullResourceName,
      ownerType: data.ownerType.present ? data.ownerType.value : this.ownerType,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      resourceType:
          data.resourceType.present
              ? data.resourceType.value
              : this.resourceType,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OperationsData(')
          ..write('id: $id, ')
          ..write('metadata: $metadata, ')
          ..write('response: $response, ')
          ..write('error: $error, ')
          ..write('done: $done, ')
          ..write('createTime: $createTime, ')
          ..write('fullResourceName: $fullResourceName, ')
          ..write('ownerType: $ownerType, ')
          ..write('ownerId: $ownerId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    metadata,
    response,
    error,
    done,
    createTime,
    fullResourceName,
    ownerType,
    ownerId,
    resourceType,
    resourceId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationsData &&
          other.id == this.id &&
          other.metadata == this.metadata &&
          other.response == this.response &&
          other.error == this.error &&
          other.done == this.done &&
          other.createTime == this.createTime &&
          other.fullResourceName == this.fullResourceName &&
          other.ownerType == this.ownerType &&
          other.ownerId == this.ownerId &&
          other.resourceType == this.resourceType &&
          other.resourceId == this.resourceId);
}

class OperationsCompanion extends UpdateCompanion<OperationsData> {
  final Value<String> id;
  final Value<String?> metadata;
  final Value<String?> response;
  final Value<String?> error;
  final Value<bool> done;
  final Value<DateTime> createTime;
  final Value<String?> fullResourceName;
  final Value<String?> ownerType;
  final Value<String?> ownerId;
  final Value<String?> resourceType;
  final Value<String?> resourceId;
  final Value<int> rowid;
  const OperationsCompanion({
    this.id = const Value.absent(),
    this.metadata = const Value.absent(),
    this.response = const Value.absent(),
    this.error = const Value.absent(),
    this.done = const Value.absent(),
    this.createTime = const Value.absent(),
    this.fullResourceName = const Value.absent(),
    this.ownerType = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OperationsCompanion.insert({
    required String id,
    this.metadata = const Value.absent(),
    this.response = const Value.absent(),
    this.error = const Value.absent(),
    required bool done,
    this.createTime = const Value.absent(),
    this.fullResourceName = const Value.absent(),
    this.ownerType = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       done = Value(done);
  static Insertable<OperationsData> custom({
    Expression<String>? id,
    Expression<String>? metadata,
    Expression<String>? response,
    Expression<String>? error,
    Expression<bool>? done,
    Expression<DateTime>? createTime,
    Expression<String>? fullResourceName,
    Expression<String>? ownerType,
    Expression<String>? ownerId,
    Expression<String>? resourceType,
    Expression<String>? resourceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (metadata != null) 'metadata': metadata,
      if (response != null) 'response': response,
      if (error != null) 'error': error,
      if (done != null) 'done': done,
      if (createTime != null) 'create_time': createTime,
      if (fullResourceName != null) 'full_resource_name': fullResourceName,
      if (ownerType != null) 'owner_type': ownerType,
      if (ownerId != null) 'owner_id': ownerId,
      if (resourceType != null) 'resource_type': resourceType,
      if (resourceId != null) 'resource_id': resourceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OperationsCompanion copyWith({
    Value<String>? id,
    Value<String?>? metadata,
    Value<String?>? response,
    Value<String?>? error,
    Value<bool>? done,
    Value<DateTime>? createTime,
    Value<String?>? fullResourceName,
    Value<String?>? ownerType,
    Value<String?>? ownerId,
    Value<String?>? resourceType,
    Value<String?>? resourceId,
    Value<int>? rowid,
  }) {
    return OperationsCompanion(
      id: id ?? this.id,
      metadata: metadata ?? this.metadata,
      response: response ?? this.response,
      error: error ?? this.error,
      done: done ?? this.done,
      createTime: createTime ?? this.createTime,
      fullResourceName: fullResourceName ?? this.fullResourceName,
      ownerType: ownerType ?? this.ownerType,
      ownerId: ownerId ?? this.ownerId,
      resourceType: resourceType ?? this.resourceType,
      resourceId: resourceId ?? this.resourceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (response.present) {
      map['response'] = Variable<String>(response.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (fullResourceName.present) {
      map['full_resource_name'] = Variable<String>(fullResourceName.value);
    }
    if (ownerType.present) {
      map['owner_type'] = Variable<String>(ownerType.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(resourceType.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationsCompanion(')
          ..write('id: $id, ')
          ..write('metadata: $metadata, ')
          ..write('response: $response, ')
          ..write('error: $error, ')
          ..write('done: $done, ')
          ..write('createTime: $createTime, ')
          ..write('fullResourceName: $fullResourceName, ')
          ..write('ownerType: $ownerType, ')
          ..write('ownerId: $ownerId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final CloudAuthUsers cloudAuthUsers = CloudAuthUsers(this);
  late final CedarTypes cedarTypes = CedarTypes(this);
  late final CedarEntities cedarEntities = CedarEntities(this);
  late final Trigger cloudAuthUsersCreateTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_users_create_trg BEFORE INSERT ON cloud_auth_users BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::User\', NEW.user_id);END',
    'cloud_auth_users_create_trg',
  );
  late final CedarRelationships cedarRelationships = CedarRelationships(this);
  late final Trigger cloudAuthUsersDeleteTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_users_delete_trg AFTER DELETE ON cloud_auth_users BEGIN DELETE FROM cedar_relationships WHERE(entity_type = \'Celest::User\' AND entity_id = OLD.user_id)OR(parent_type = \'Celest::User\' AND parent_id = OLD.user_id);DELETE FROM cedar_entities WHERE entity_id = OLD.user_id AND entity_type = \'Celest::User\';END',
    'cloud_auth_users_delete_trg',
  );
  late final CloudAuthUserEmails cloudAuthUserEmails = CloudAuthUserEmails(
    this,
  );
  late final CloudAuthUserPhoneNumbers cloudAuthUserPhoneNumbers =
      CloudAuthUserPhoneNumbers(this);
  late final CloudAuthProjects cloudAuthProjects = CloudAuthProjects(this);
  late final CloudAuthApis cloudAuthApis = CloudAuthApis(this);
  late final Index cloudAuthApisProjectIdx = Index(
    'cloud_auth_apis_project_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_apis_project_idx ON cloud_auth_apis (project_id)',
  );
  late final Trigger cloudAuthApisCreateTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_apis_create_trg BEFORE INSERT ON cloud_auth_apis BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Api\', NEW.api_id);END',
    'cloud_auth_apis_create_trg',
  );
  late final Trigger cloudAuthApisDeleteTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_apis_delete_trg AFTER DELETE ON cloud_auth_apis BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Api\' AND entity_id = OLD.api_id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Api\' AND parent_id = OLD.api_id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Api\' AND entity_id = OLD.api_id;END',
    'cloud_auth_apis_delete_trg',
  );
  late final CloudAuthFunctions cloudAuthFunctions = CloudAuthFunctions(this);
  late final Index cloudAuthFunctionsApiIdx = Index(
    'cloud_auth_functions_api_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_functions_api_idx ON cloud_auth_functions (api_id)',
  );
  late final Trigger cloudAuthFunctionsCreateTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_functions_create_trg BEFORE INSERT ON cloud_auth_functions BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Function\', NEW.function_id);INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Function\', NEW.function_id, \'Celest::Api\', NEW.api_id);END',
    'cloud_auth_functions_create_trg',
  );
  late final Trigger cloudAuthFunctionsDeleteTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_functions_delete_trg AFTER DELETE ON cloud_auth_functions BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Function\' AND entity_id = OLD.function_id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Function\' AND parent_id = OLD.function_id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Function\' AND entity_id = OLD.function_id;END',
    'cloud_auth_functions_delete_trg',
  );
  late final CloudAuthMeta cloudAuthMeta = CloudAuthMeta(this);
  late final CloudAuthCryptoKeys cloudAuthCryptoKeys = CloudAuthCryptoKeys(
    this,
  );
  late final Index cloudAuthCryptoKeysExternalCryptoKeyIdIdx = Index(
    'cloud_auth_crypto_keys_external_crypto_key_id_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_crypto_keys_external_crypto_key_id_idx ON cloud_auth_crypto_keys (external_crypto_key_id)',
  );
  late final CloudAuthSessions cloudAuthSessions = CloudAuthSessions(this);
  late final Index cloudAuthSessionsUserIdx = Index(
    'cloud_auth_sessions_user_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_sessions_user_idx ON cloud_auth_sessions (user_id)',
  );
  late final Index cloudAuthSessionsCryptoKeyIdx = Index(
    'cloud_auth_sessions_crypto_key_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_sessions_crypto_key_idx ON cloud_auth_sessions (crypto_key_id)',
  );
  late final Index cloudAuthSessionsExternalSessionIdIdx = Index(
    'cloud_auth_sessions_external_session_id_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_sessions_external_session_id_idx ON cloud_auth_sessions (external_session_id)',
  );
  late final Trigger cloudAuthSessionsUpdateTimeTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_sessions_update_time_trg AFTER UPDATE ON cloud_auth_sessions BEGIN UPDATE cloud_auth_sessions SET update_time = unixepoch(\'now\', \'subsec\') WHERE "rowid" = OLD."rowid";END',
    'cloud_auth_sessions_update_time_trg',
  );
  late final CloudAuthOtpCodes cloudAuthOtpCodes = CloudAuthOtpCodes(this);
  late final Index cloudAuthOtpCodesSessionIdIdx = Index(
    'cloud_auth_otp_codes_session_id_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_otp_codes_session_id_idx ON cloud_auth_otp_codes (session_id)',
  );
  late final CloudAuthCorks cloudAuthCorks = CloudAuthCorks(this);
  late final Index cloudAuthCorksCryptoKeyIdx = Index(
    'cloud_auth_corks_crypto_key_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_corks_crypto_key_idx ON cloud_auth_corks (crypto_key_id)',
  );
  late final Index cloudAuthCorksBearerIdx = Index(
    'cloud_auth_corks_bearer_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_corks_bearer_idx ON cloud_auth_corks (bearer_type, bearer_id)',
  );
  late final Index cloudAuthCorksAudienceIdx = Index(
    'cloud_auth_corks_audience_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_corks_audience_idx ON cloud_auth_corks (audience_type, audience_id)',
  );
  late final Index cloudAuthCorksIssuerIdx = Index(
    'cloud_auth_corks_issuer_idx',
    'CREATE INDEX IF NOT EXISTS cloud_auth_corks_issuer_idx ON cloud_auth_corks (issuer_type, issuer_id)',
  );
  late final Index cedarRelationshipsFkEntityIdx = Index(
    'cedar_relationships_fk_entity_idx',
    'CREATE INDEX IF NOT EXISTS cedar_relationships_fk_entity_idx ON cedar_relationships (entity_type, entity_id)',
  );
  late final Index cedarRelationshipsFkParentIdx = Index(
    'cedar_relationships_fk_parent_idx',
    'CREATE INDEX IF NOT EXISTS cedar_relationships_fk_parent_idx ON cedar_relationships (parent_type, parent_id)',
  );
  late final CedarPolicies cedarPolicies = CedarPolicies(this);
  late final CedarPolicyTemplates cedarPolicyTemplates = CedarPolicyTemplates(
    this,
  );
  late final CedarPolicyTemplateLinks cedarPolicyTemplateLinks =
      CedarPolicyTemplateLinks(this);
  late final Index cedarPolicyTemplateLinksFkTemplateIdIdx = Index(
    'cedar_policy_template_links_fk_template_id_idx',
    'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_template_id_idx ON cedar_policy_template_links (template_id)',
  );
  late final Index cedarPolicyTemplateLinksFkPrincipalIdx = Index(
    'cedar_policy_template_links_fk_principal_idx',
    'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_principal_idx ON cedar_policy_template_links (principal_type, principal_id)',
  );
  late final Index cedarPolicyTemplateLinksFkResourceIdx = Index(
    'cedar_policy_template_links_fk_resource_idx',
    'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_resource_idx ON cedar_policy_template_links (resource_type, resource_id)',
  );
  late final CedarAuthorizationLogs cedarAuthorizationLogs =
      CedarAuthorizationLogs(this);
  late final UserMemberships userMemberships = UserMemberships(this);
  late final Index userMembershipsParentIdx = Index(
    'user_memberships_parent_idx',
    'CREATE INDEX IF NOT EXISTS user_memberships_parent_idx ON user_memberships (parent_type, parent_id)',
  );
  late final Trigger userMembershipsCreateTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS user_memberships_create_trg BEFORE INSERT ON user_memberships BEGIN INSERT INTO cedar_entities (entity_type, entity_id, attribute_json) VALUES (NEW.parent_type || \'::Member\', NEW.membership_id, json_object(\'role\', json_object(\'type\', \'Celest::Role\', \'id\', NEW.role), \'parent\', json_object(\'type\', NEW.parent_type, \'id\', NEW.parent_id)));INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::User\', NEW.user_id, NEW.parent_type || \'::Member\', NEW.membership_id);END',
    'user_memberships_create_trg',
  );
  late final Trigger userMembershipsUpdateTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS user_memberships_update_trg AFTER UPDATE ON user_memberships BEGIN UPDATE cedar_entities SET attribute_json = json_object(\'role\', json_object(\'type\', \'Celest::Role\', \'id\', NEW.role), \'parent\', json_object(\'type\', OLD.parent_type, \'id\', OLD.parent_id)) WHERE entity_id = OLD.membership_id AND entity_type = OLD.parent_type || \'::Member\';UPDATE cedar_relationships SET parent_id = NEW.role WHERE entity_id = OLD.membership_id AND entity_type = OLD.parent_type || \'::Member\' AND parent_type = \'Celest::Role\';END',
    'user_memberships_update_trg',
  );
  late final Trigger userMembershipsDeleteTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS user_memberships_delete_trg AFTER DELETE ON user_memberships BEGIN DELETE FROM cedar_relationships WHERE entity_id = OLD.membership_id AND entity_type = OLD.parent_type || \'::Member\';DELETE FROM cedar_relationships WHERE parent_id = OLD.membership_id AND parent_type = OLD.parent_type || \'::Member\';DELETE FROM cedar_entities WHERE entity_id = OLD.membership_id AND entity_type = OLD.parent_type || \'::Member\';END',
    'user_memberships_delete_trg',
  );
  late final Organizations organizations = Organizations(this);
  late final Trigger organizationsDeleteUserMembershipsTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS organizations_delete_user_memberships_trg AFTER DELETE ON organizations BEGIN DELETE FROM user_memberships WHERE parent_type = \'Celest::Organization\' AND parent_id = OLD.id;END',
    'organizations_delete_user_memberships_trg',
  );
  late final Projects projects = Projects(this);
  late final Trigger projectsDeleteUserMembershipsTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS projects_delete_user_memberships_trg AFTER DELETE ON projects BEGIN DELETE FROM user_memberships WHERE parent_type = \'Celest::Project\' AND parent_id = OLD.id;END',
    'projects_delete_user_memberships_trg',
  );
  late final ProjectEnvironments projectEnvironments = ProjectEnvironments(
    this,
  );
  late final Trigger projectEnvironmentsDeleteUserMembershipsTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS project_environments_delete_user_memberships_trg AFTER DELETE ON project_environments BEGIN DELETE FROM user_memberships WHERE parent_type = \'Celest::Project::Environment\' AND parent_id = OLD.id;END',
    'project_environments_delete_user_memberships_trg',
  );
  late final Index projectEnvironmentsParentIdx = Index(
    'project_environments_parent_idx',
    'CREATE INDEX IF NOT EXISTS project_environments_parent_idx ON project_environments (parent_type, parent_id)',
  );
  late final Trigger projectEnvironmentsUpdateTimeTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS project_environments_update_time_trg AFTER UPDATE ON project_environments BEGIN UPDATE project_environments SET update_time = unixepoch(\'now\', \'subsec\') WHERE id = OLD.id;END',
    'project_environments_update_time_trg',
  );
  late final Trigger projectEnvironmentsCreateTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS project_environments_create_trg BEFORE INSERT ON project_environments BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Project::Environment\', NEW.id);INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Project::Environment\', NEW.id, NEW.parent_type, NEW.parent_id);END',
    'project_environments_create_trg',
  );
  late final Trigger projectEnvironmentsSetParentTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS project_environments_set_parent_trg AFTER UPDATE OF parent_type, parent_id ON project_environments WHEN OLD.parent_type != NEW.parent_type OR OLD.parent_id != NEW.parent_id BEGIN UPDATE cedar_relationships SET parent_type = NEW.parent_type, parent_id = NEW.parent_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Project::Environment\';END',
    'project_environments_set_parent_trg',
  );
  late final Trigger projectEnvironmentsDeleteTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS project_environments_delete_trg AFTER DELETE ON project_environments BEGIN DELETE FROM cedar_relationships WHERE entity_id = OLD.id AND entity_type = \'Celest::Project::Environment\';DELETE FROM cedar_entities WHERE entity_id = OLD.id AND entity_type = \'Celest::Project::Environment\';END',
    'project_environments_delete_trg',
  );
  late final ProjectEnvironmentAsts projectEnvironmentAsts =
      ProjectEnvironmentAsts(this);
  late final ProjectEnvironmentAssets projectEnvironmentAssets =
      ProjectEnvironmentAssets(this);
  late final TursoDatabases tursoDatabases = TursoDatabases(this);
  late final ProjectEnvironmentStates projectEnvironmentStates =
      ProjectEnvironmentStates(this);
  late final Index idxProjectEnvironmentTursoDatabase = Index(
    'idx_project_environment_turso_database',
    'CREATE INDEX IF NOT EXISTS idx_project_environment_turso_database ON project_environment_states (turso_database_name)',
  );
  late final Index projectsFkParentIdx = Index(
    'projects_fk_parent_idx',
    'CREATE INDEX IF NOT EXISTS projects_fk_parent_idx ON projects (parent_type, parent_id)',
  );
  late final Trigger projectsUpdateTimeTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS projects_update_time_trg AFTER UPDATE ON projects BEGIN UPDATE projects SET update_time = unixepoch(\'now\', \'subsec\') WHERE id = OLD.id;END',
    'projects_update_time_trg',
  );
  late final Trigger projectsCreateTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS projects_create_trg BEFORE INSERT ON projects BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Project\', NEW.id);INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Project\', NEW.id, NEW.parent_type, NEW.parent_id);END',
    'projects_create_trg',
  );
  late final Trigger projectsSetParentTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS projects_set_parent_trg AFTER UPDATE OF parent_type, parent_id ON projects WHEN OLD.parent_type != NEW.parent_type OR OLD.parent_id != NEW.parent_id BEGIN UPDATE cedar_relationships SET parent_type = NEW.parent_type, parent_id = NEW.parent_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Project\';END',
    'projects_set_parent_trg',
  );
  late final Trigger projectsDeleteTrg = Trigger(
    'CREATE TRIGGER IF NOT EXISTS projects_delete_trg AFTER DELETE ON projects BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Project\' AND entity_id = OLD.id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Project\' AND parent_id = OLD.id;DELETE FROM cedar_entities WHERE entity_id = OLD.id AND entity_type = \'Celest::Project\';END',
    'projects_delete_trg',
  );
  late final Index organizationsParentIdx = Index(
    'organizations_parent_idx',
    'CREATE INDEX IF NOT EXISTS organizations_parent_idx ON organizations (parent_type, parent_id)',
  );
  late final Trigger organizationsUpdateTime = Trigger(
    'CREATE TRIGGER IF NOT EXISTS organizations_update_time AFTER UPDATE ON organizations BEGIN UPDATE organizations SET update_time = unixepoch(\'now\', \'subsec\') WHERE id = OLD.id;END',
    'organizations_update_time',
  );
  late final Trigger organizationsCreate = Trigger(
    'CREATE TRIGGER IF NOT EXISTS organizations_create BEFORE INSERT ON organizations BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Organization\', NEW.id);END',
    'organizations_create',
  );
  late final Trigger organizationsCreateParent = Trigger(
    'CREATE TRIGGER IF NOT EXISTS organizations_create_parent AFTER INSERT ON organizations WHEN NEW.parent_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Organization\', NEW.id, NEW.parent_type, NEW.parent_id);END',
    'organizations_create_parent',
  );
  late final Trigger organizationsAddParent = Trigger(
    'CREATE TRIGGER IF NOT EXISTS organizations_add_parent AFTER UPDATE OF parent_id ON organizations WHEN OLD.parent_id IS NULL AND NEW.parent_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Organization\', NEW.id, NEW.parent_type, NEW.parent_id);END',
    'organizations_add_parent',
  );
  late final Trigger organizationsSetParent = Trigger(
    'CREATE TRIGGER IF NOT EXISTS organizations_set_parent AFTER UPDATE OF parent_type, parent_id ON organizations WHEN(OLD.parent_type != NEW.parent_type OR OLD.parent_id != NEW.parent_id)AND NEW.parent_id IS NOT NULL BEGIN UPDATE cedar_relationships SET parent_type = NEW.parent_type, parent_id = NEW.parent_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Organization\';END',
    'organizations_set_parent',
  );
  late final Trigger organizationsRemoveParent = Trigger(
    'CREATE TRIGGER IF NOT EXISTS organizations_remove_parent AFTER UPDATE OF parent_id ON organizations WHEN OLD.parent_id IS NOT NULL AND NEW.parent_id IS NULL BEGIN DELETE FROM cedar_relationships WHERE entity_id = OLD.id AND entity_type = \'Celest::Organization\' AND parent_id = OLD.parent_id AND parent_type = OLD.parent_type;END',
    'organizations_remove_parent',
  );
  late final Trigger organizationsDelete = Trigger(
    'CREATE TRIGGER IF NOT EXISTS organizations_delete AFTER DELETE ON organizations BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Organization\' AND entity_id = OLD.id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Organization\' AND parent_id = OLD.id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Organization\' AND entity_id = OLD.id;END',
    'organizations_delete',
  );
  late final Operations operations = Operations(this);
  late final Index operationsFkOwnerIdx = Index(
    'operations_fk_owner_idx',
    'CREATE INDEX IF NOT EXISTS operations_fk_owner_idx ON operations (owner_type, owner_id)',
  );
  late final Index operationsFkResourceIdx = Index(
    'operations_fk_resource_idx',
    'CREATE INDEX IF NOT EXISTS operations_fk_resource_idx ON operations (resource_type, resource_id)',
  );
  late final Trigger operationsTriggerCreate = Trigger(
    'CREATE TRIGGER IF NOT EXISTS operations_trigger_create BEFORE INSERT ON operations BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Operation\', NEW.id);END',
    'operations_trigger_create',
  );
  late final Trigger operationsTriggerCreateOwner = Trigger(
    'CREATE TRIGGER IF NOT EXISTS operations_trigger_create_owner AFTER INSERT ON operations WHEN NEW.owner_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Operation\', NEW.id, NEW.owner_type, NEW.owner_id);END',
    'operations_trigger_create_owner',
  );
  late final Trigger operationsTriggerCreateResource = Trigger(
    'CREATE TRIGGER IF NOT EXISTS operations_trigger_create_resource AFTER INSERT ON operations WHEN NEW.resource_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Operation\', NEW.id, NEW.resource_type, NEW.resource_id);END',
    'operations_trigger_create_resource',
  );
  late final Trigger operationsTriggerAddOwner = Trigger(
    'CREATE TRIGGER IF NOT EXISTS operations_trigger_add_owner AFTER UPDATE OF owner_id ON operations WHEN OLD.owner_id IS NULL AND NEW.owner_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Operation\', NEW.id, NEW.owner_type, NEW.owner_id);END',
    'operations_trigger_add_owner',
  );
  late final Trigger operationsTriggerAddResource = Trigger(
    'CREATE TRIGGER IF NOT EXISTS operations_trigger_add_resource AFTER UPDATE OF resource_id ON operations WHEN OLD.resource_id IS NULL AND NEW.resource_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Operation\', NEW.id, NEW.resource_type, NEW.resource_id);END',
    'operations_trigger_add_resource',
  );
  late final Trigger operationsTriggerSetOwner = Trigger(
    'CREATE TRIGGER IF NOT EXISTS operations_trigger_set_owner AFTER UPDATE OF owner_type, owner_id ON operations WHEN(OLD.owner_type != NEW.owner_type OR OLD.owner_id != NEW.owner_id)AND OLD.owner_id IS NOT NULL AND NEW.owner_id IS NOT NULL BEGIN UPDATE cedar_relationships SET parent_type = NEW.owner_type, parent_id = NEW.owner_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Operation\' AND parent_type = OLD.owner_type AND parent_id = OLD.owner_id;END',
    'operations_trigger_set_owner',
  );
  late final Trigger operationsTriggerSetResource = Trigger(
    'CREATE TRIGGER IF NOT EXISTS operations_trigger_set_resource AFTER UPDATE OF resource_type, resource_id ON operations WHEN(OLD.resource_type != NEW.resource_type OR OLD.resource_id != NEW.resource_id)AND OLD.resource_id IS NOT NULL AND NEW.resource_id IS NOT NULL BEGIN UPDATE cedar_relationships SET parent_type = NEW.resource_type, parent_id = NEW.resource_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Operation\' AND parent_type = OLD.resource_type AND parent_id = OLD.resource_id;END',
    'operations_trigger_set_resource',
  );
  late final Trigger operationsTriggerDelete = Trigger(
    'CREATE TRIGGER IF NOT EXISTS operations_trigger_delete AFTER DELETE ON operations BEGIN DELETE FROM cedar_relationships WHERE entity_id = OLD.id AND entity_type = \'Celest::Operation\';DELETE FROM cedar_entities WHERE entity_id = OLD.id AND entity_type = \'Celest::Operation\';END',
    'operations_trigger_delete',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cloudAuthUsers,
    cedarTypes,
    cedarEntities,
    cloudAuthUsersCreateTrg,
    cedarRelationships,
    cloudAuthUsersDeleteTrg,
    cloudAuthUserEmails,
    cloudAuthUserPhoneNumbers,
    cloudAuthProjects,
    cloudAuthApis,
    cloudAuthApisProjectIdx,
    cloudAuthApisCreateTrg,
    cloudAuthApisDeleteTrg,
    cloudAuthFunctions,
    cloudAuthFunctionsApiIdx,
    cloudAuthFunctionsCreateTrg,
    cloudAuthFunctionsDeleteTrg,
    cloudAuthMeta,
    cloudAuthCryptoKeys,
    cloudAuthCryptoKeysExternalCryptoKeyIdIdx,
    cloudAuthSessions,
    cloudAuthSessionsUserIdx,
    cloudAuthSessionsCryptoKeyIdx,
    cloudAuthSessionsExternalSessionIdIdx,
    cloudAuthSessionsUpdateTimeTrg,
    cloudAuthOtpCodes,
    cloudAuthOtpCodesSessionIdIdx,
    cloudAuthCorks,
    cloudAuthCorksCryptoKeyIdx,
    cloudAuthCorksBearerIdx,
    cloudAuthCorksAudienceIdx,
    cloudAuthCorksIssuerIdx,
    cedarRelationshipsFkEntityIdx,
    cedarRelationshipsFkParentIdx,
    cedarPolicies,
    cedarPolicyTemplates,
    cedarPolicyTemplateLinks,
    cedarPolicyTemplateLinksFkTemplateIdIdx,
    cedarPolicyTemplateLinksFkPrincipalIdx,
    cedarPolicyTemplateLinksFkResourceIdx,
    cedarAuthorizationLogs,
    userMemberships,
    userMembershipsParentIdx,
    userMembershipsCreateTrg,
    userMembershipsUpdateTrg,
    userMembershipsDeleteTrg,
    organizations,
    organizationsDeleteUserMembershipsTrg,
    projects,
    projectsDeleteUserMembershipsTrg,
    projectEnvironments,
    projectEnvironmentsDeleteUserMembershipsTrg,
    projectEnvironmentsParentIdx,
    projectEnvironmentsUpdateTimeTrg,
    projectEnvironmentsCreateTrg,
    projectEnvironmentsSetParentTrg,
    projectEnvironmentsDeleteTrg,
    projectEnvironmentAsts,
    projectEnvironmentAssets,
    tursoDatabases,
    projectEnvironmentStates,
    idxProjectEnvironmentTursoDatabase,
    projectsFkParentIdx,
    projectsUpdateTimeTrg,
    projectsCreateTrg,
    projectsSetParentTrg,
    projectsDeleteTrg,
    organizationsParentIdx,
    organizationsUpdateTime,
    organizationsCreate,
    organizationsCreateParent,
    organizationsAddParent,
    organizationsSetParent,
    organizationsRemoveParent,
    organizationsDelete,
    operations,
    operationsFkOwnerIdx,
    operationsFkResourceIdx,
    operationsTriggerCreate,
    operationsTriggerCreateOwner,
    operationsTriggerCreateResource,
    operationsTriggerAddOwner,
    operationsTriggerAddResource,
    operationsTriggerSetOwner,
    operationsTriggerSetResource,
    operationsTriggerDelete,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cloud_auth_apis',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cloud_auth_apis',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cloud_auth_functions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cloud_auth_functions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cloud_auth_sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_memberships',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_memberships',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_memberships',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [],
    ),
  ]);
  @override
  int get schemaVersion => 2;
}
