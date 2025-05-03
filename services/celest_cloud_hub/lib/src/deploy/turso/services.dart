import 'models.dart';
import 'turso_client.dart';

class OrganizationService {
  OrganizationService(this._client);

  final TursoClient _client;

  Future<List<Organization>> listOrganizations() async {
    final response = await _client.get('/v1/organizations');
    final organizations =
        (response['organizations'] as List)
            .map((org) => Organization.fromJson(org as Map<String, dynamic>))
            .toList();
    return organizations;
  }

  Future<Organization> getOrganization(String organizationSlug) async {
    final response = await _client.get('/v1/organizations/$organizationSlug');
    return Organization.fromJson(
      response['organization'] as Map<String, dynamic>,
    );
  }

  Future<Organization> updateOrganization(
    String organizationSlug, {
    required bool overages,
  }) async {
    final response = await _client.patch(
      '/v1/organizations/$organizationSlug',
      body: {'overages': overages},
    );
    return Organization.fromJson(
      response['organization'] as Map<String, dynamic>,
    );
  }
}

class DatabaseService {
  DatabaseService(this._client);
  final TursoClient _client;

  Future<List<Database>> listDatabases(
    String organizationSlug, {
    String? group,
    String? schema,
    String? parent,
  }) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/databases',
      queryParams: {
        if (group != null) 'group': group,
        if (schema != null) 'schema': schema,
        if (parent != null) 'parent': parent,
      },
    );
    final databases =
        (response['databases'] as List)
            .map((db) => Database.fromJson(db as Map<String, dynamic>))
            .toList();
    return databases;
  }

  Future<Database> createDatabase(
    String organizationSlug, {
    required String name,
    required String group,
    String? sizeLimit,
  }) async {
    final response = await _client.post(
      '/v1/organizations/$organizationSlug/databases',
      body: {
        'name': name,
        'group': group,
        if (sizeLimit != null) 'size_limit': sizeLimit,
      },
    );
    return Database.fromJson(response['database'] as Map<String, dynamic>);
  }

  Future<Database> getDatabase(
    String organizationSlug,
    String databaseName,
  ) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/databases/$databaseName',
    );
    return Database.fromJson(response['database'] as Map<String, dynamic>);
  }

  Future<void> deleteDatabase(
    String organizationSlug,
    String databaseName,
  ) async {
    await _client.delete(
      '/v1/organizations/$organizationSlug/databases/$databaseName',
    );
  }

  Future<List<Instance>> listDatabaseInstances(
    String organizationSlug,
    String databaseName,
  ) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/databases/$databaseName/instances',
    );
    final instances =
        (response['instances'] as List)
            .map(
              (instance) => Instance.fromJson(instance as Map<String, dynamic>),
            )
            .toList();
    return instances;
  }

  Future<Instance> getDatabaseInstance(
    String organizationSlug,
    String databaseName,
    String instanceName,
  ) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/databases/$databaseName/instances/$instanceName',
    );
    return Instance.fromJson(response['instance'] as Map<String, dynamic>);
  }

  Future<String> createDatabaseToken(
    String organizationSlug,
    String databaseName, {
    String expiration = 'never',
    String authorization = 'full-access',
  }) async {
    final response = await _client.post(
      '/v1/organizations/$organizationSlug/databases/$databaseName/auth/tokens',
      queryParams: {'expiration': expiration, 'authorization': authorization},
    );
    return response['jwt'] as String;
  }

  Future<void> invalidateDatabaseTokens(
    String organizationSlug,
    String databaseName,
  ) async {
    await _client.post(
      '/v1/organizations/$organizationSlug/databases/$databaseName/auth/rotate',
    );
  }

  Future<DatabaseUsage> getDatabaseUsage(
    String organizationSlug,
    String databaseName, {
    DateTime? from,
    DateTime? to,
  }) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/databases/$databaseName/usage',
      queryParams: {
        if (from != null) 'from': from.toIso8601String(),
        if (to != null) 'to': to.toIso8601String(),
      },
    );
    return DatabaseUsage.fromJson(response['database'] as Map<String, dynamic>);
  }

  Future<List<DatabaseStats>> getDatabaseStats(
    String organizationSlug,
    String databaseName,
  ) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/databases/$databaseName/stats',
    );
    final stats =
        (response['top_queries'] as List)
            .map((stat) => DatabaseStats.fromJson(stat as Map<String, dynamic>))
            .toList();
    return stats;
  }
}

class GroupService {
  GroupService(this._client);
  final TursoClient _client;

  Future<List<Group>> listGroups(String organizationSlug) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/groups',
    );
    final groups =
        (response['groups'] as List)
            .map((group) => Group.fromJson(group as Map<String, dynamic>))
            .toList();
    return groups;
  }

  Future<Group> createGroup(
    String organizationSlug, {
    required String name,
    required String location,
    List<String>? extensions,
  }) async {
    final response = await _client.post(
      '/v1/organizations/$organizationSlug/groups',
      body: {
        'name': name,
        'location': location,
        if (extensions != null) 'extensions': extensions,
      },
    );
    return Group.fromJson(response['group'] as Map<String, dynamic>);
  }

  Future<Group> getGroup(String organizationSlug, String groupName) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/groups/$groupName',
    );
    return Group.fromJson(response['group'] as Map<String, dynamic>);
  }

  Future<void> deleteGroup(String organizationSlug, String groupName) async {
    await _client.delete(
      '/v1/organizations/$organizationSlug/groups/$groupName',
    );
  }

  Future<String> createGroupToken(
    String organizationSlug,
    String groupName, {
    String expiration = 'never',
    String authorization = 'full-access',
  }) async {
    final response = await _client.post(
      '/v1/organizations/$organizationSlug/groups/$groupName/auth/tokens',
      queryParams: {'expiration': expiration, 'authorization': authorization},
    );
    return response['jwt'] as String;
  }

  Future<void> invalidateGroupTokens(
    String organizationSlug,
    String groupName,
  ) async {
    await _client.post(
      '/v1/organizations/$organizationSlug/groups/$groupName/auth/rotate',
    );
  }
}

class MemberService {
  MemberService(this._client);
  final TursoClient _client;

  Future<List<Member>> listMembers(String organizationSlug) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/members',
    );
    final members =
        (response['members'] as List)
            .map((member) => Member.fromJson(member as Map<String, dynamic>))
            .toList();
    return members;
  }

  Future<Member> addMember(
    String organizationSlug, {
    required String username,
    String role = 'member',
  }) async {
    final response = await _client.post(
      '/v1/organizations/$organizationSlug/members',
      body: {'username': username, 'role': role},
    );
    return Member.fromJson(response['member'] as Map<String, dynamic>);
  }

  Future<Member> getMember(String organizationSlug, String username) async {
    final response = await _client.get(
      '/v1/organizations/$organizationSlug/members/$username',
    );
    return Member.fromJson(response['member'] as Map<String, dynamic>);
  }

  Future<void> removeMember(String organizationSlug, String username) async {
    await _client.delete(
      '/v1/organizations/$organizationSlug/members/$username',
    );
  }

  Future<Member> updateMemberRole(
    String organizationSlug,
    String username, {
    required String role,
  }) async {
    final response = await _client.patch(
      '/v1/organizations/$organizationSlug/members/$username',
      body: {'role': role},
    );
    return Member.fromJson(response['member'] as Map<String, dynamic>);
  }
}
