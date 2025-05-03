class Organization {
  Organization({
    required this.name,
    required this.slug,
    required this.type,
    required this.overages,
    required this.blockedReads,
    required this.blockedWrites,
    this.planId,
    this.planTimeline,
    this.platform,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      name: json['name'] as String,
      slug: json['slug'] as String,
      type: json['type'] as String,
      overages: json['overages'] as bool,
      blockedReads: json['blocked_reads'] as bool,
      blockedWrites: json['blocked_writes'] as bool,
      planId: json['plan_id'] as String?,
      planTimeline: json['plan_timeline'] as String?,
      platform: json['platform'] as String?,
    );
  }
  final String name;
  final String slug;
  final String type;
  final bool overages;
  final bool blockedReads;
  final bool blockedWrites;
  final String? planId;
  final String? planTimeline;
  final String? platform;
}

class Database {
  Database({
    required this.name,
    required this.dbId,
    required this.hostname,
    this.blockReads,
    this.blockWrites,
    this.regions,
    this.primaryRegion,
    this.group,
    this.deleteProtection,
    this.parent,
  });

  factory Database.fromJson(Map<String, dynamic> json) {
    return Database(
      name: json['Name'] as String,
      dbId: json['DbId'] as String,
      hostname: json['Hostname'] as String,
      blockReads: json['block_reads'] as bool?,
      blockWrites: json['block_writes'] as bool?,
      regions:
          json['regions'] == null
              ? null
              : List<String>.from(json['regions'] as List),
      primaryRegion: json['primaryRegion'] as String?,
      group: json['group'] as String?,
      deleteProtection: json['delete_protection'] as bool?,
      parent:
          json['parent'] != null
              ? DatabaseParent.fromJson(json['parent'] as Map<String, dynamic>)
              : null,
    );
  }
  final String name;
  final String dbId;
  final String hostname;
  final bool? blockReads;
  final bool? blockWrites;
  final List<String>? regions;
  final String? primaryRegion;
  final String? group;
  final bool? deleteProtection;
  final DatabaseParent? parent;
}

class DatabaseParent {
  DatabaseParent({
    required this.id,
    required this.name,
    required this.branchedAt,
  });

  factory DatabaseParent.fromJson(Map<String, dynamic> json) {
    return DatabaseParent(
      id: json['id'] as String,
      name: json['name'] as String,
      branchedAt: DateTime.parse(json['branched_at'] as String),
    );
  }
  final String id;
  final String name;
  final DateTime branchedAt;
}

class Instance {
  Instance({
    required this.uuid,
    required this.name,
    required this.type,
    required this.region,
    required this.hostname,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      region: json['region'] as String,
      hostname: json['hostname'] as String,
    );
  }
  final String uuid;
  final String name;
  final String type;
  final String region;
  final String hostname;
}

class Group {
  Group({
    required this.name,
    required this.version,
    required this.uuid,
    required this.locations,
    required this.primary,
    required this.deleteProtection,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['name'] as String,
      version: json['version'] as String,
      uuid: json['uuid'] as String,
      locations: List<String>.from(json['locations'] as List),
      primary: json['primary'] as String,
      deleteProtection: json['delete_protection'] as bool,
    );
  }
  final String name;
  final String version;
  final String uuid;
  final List<String> locations;
  final String primary;
  final bool deleteProtection;
}

class Member {
  Member({required this.username, required this.role, required this.email});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      username: json['username'] as String,
      role: json['role'] as String,
      email: json['email'] as String,
    );
  }
  final String username;
  final String role;
  final String email;
}

class DatabaseUsage {
  DatabaseUsage({
    required this.rowsRead,
    required this.rowsWritten,
    required this.storageBytes,
    required this.bytesSynced,
  });

  factory DatabaseUsage.fromJson(Map<String, dynamic> json) {
    return DatabaseUsage(
      rowsRead: json['rows_read'] as int,
      rowsWritten: json['rows_written'] as int,
      storageBytes: json['storage_bytes'] as int,
      bytesSynced: json['bytes_synced'] as int,
    );
  }
  final int rowsRead;
  final int rowsWritten;
  final int storageBytes;
  final int bytesSynced;
}

class DatabaseStats {
  DatabaseStats({
    required this.query,
    required this.rowsRead,
    required this.rowsWritten,
  });

  factory DatabaseStats.fromJson(Map<String, dynamic> json) {
    return DatabaseStats(
      query: json['query'] as String,
      rowsRead: json['rows_read'] as int,
      rowsWritten: json['rows_written'] as int,
    );
  }
  final String query;
  final int rowsRead;
  final int rowsWritten;
}
