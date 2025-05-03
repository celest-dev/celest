import 'dart:convert';

import 'package:graphql/client.dart';
import 'package:grpc/grpc.dart';

/// A wrapper over Fly's GraphQL API.
///
/// https://api.fly.io/graphql
final class FlyGql {
  FlyGql(this.client);

  final GraphQLClient client;

  static final _fetchVolumes = gql(r'''
query FetchVolumes($appName: String!) {
  app(name: $appName) {
    volumes {
      nodes {
        id
        name
      }
    }
  }
}
''');

  /// Retrieves the ID of a volume by its name.
  Future<String> getVolumeId({
    required String appName,
    required String volumeName,
  }) async {
    final result = await client.query(
      QueryOptions(
        document: _fetchVolumes,
        operationName: 'FetchVolumes',
        variables: {'appName': appName},
      ),
    );
    if (result.exception case final exception?) {
      throw GrpcError.internal('Failed to fetch volume id: $exception');
    }
    return switch (result.data) {
      {'app': {'volumes': {'nodes': final List<Object?> nodes}}} =>
        nodes.cast<Map<Object?, Object?>>().firstWhere(
              (node) => node['name'] == volumeName,
            )['id']
            as String,
      _ =>
        throw GrpcError.internal(
          'Failed to fetch volume id: ${jsonEncode(result.data)}',
        ),
    };
  }

  static final _fetchAppInternalNumericId = gql(r'''
query FetchAppInternalNumericId($appName: String!) {
  app(name: $appName) {
    internalNumericId
  }
}
''');

  /// Retrieves the internal numeric ID of an app by its name.
  Future<int> getInternalAppId({required String appName}) async {
    final result = await client.query(
      QueryOptions(
        document: _fetchAppInternalNumericId,
        operationName: 'FetchAppInternalNumericId',
        variables: {'appName': appName},
      ),
    );
    if (result.exception case final exception?) {
      throw GrpcError.internal(
        'Failed to fetch app internal numeric id: $exception',
      );
    }
    return switch (result.data) {
      {'app': {'internalNumericId': final num id}} => id.toInt(),
      _ =>
        throw GrpcError.internal(
          'Failed to fetch app internal numeric id: ${jsonEncode(result.data)}',
        ),
    };
  }

  static final _setSecrets = gql(r'''
mutation SetSecrets($input: SetSecretsInput!) { 
  setSecrets(input: $input) {}
}
''');

  /// Sets secrets for an app.
  Future<void> setSecrets({
    required String appName,
    required Map<String, String> secrets,
  }) async {
    final result = await client.mutate(
      MutationOptions(
        document: _setSecrets,
        operationName: 'SetSecrets',
        variables: {
          'input': {
            'appId': appName,
            'secrets': [
              for (final entry in secrets.entries)
                {'key': entry.key, 'value': entry.value},
            ],
          },
        },
      ),
    );
    if (result.exception case final exception?) {
      throw GrpcError.internal('Failed to set secrets: $exception');
    }
  }

  static final _listSecrets = gql(r'''
query ListSecrets($appName: String!) {
  app(name: $appName) {
    secrets {
      name
    }
  }
}
''');

  /// Lists secrets for an app.
  Future<List<String>> listSecrets({required String appName}) async {
    final result = await client.query(
      QueryOptions(
        document: _listSecrets,
        operationName: 'ListSecrets',
        variables: {'appName': appName},
      ),
    );
    if (result.exception case final exception?) {
      throw GrpcError.internal('Failed to list secrets: $exception');
    }
    return switch (result.data) {
      {'app': {'secrets': final List<Object?> secrets}} =>
        secrets
            .cast<Map<Object?, Object?>>()
            .map((secret) => secret['name'] as String)
            .toList(),
      _ =>
        throw GrpcError.internal(
          'Failed to list secrets: ${jsonEncode(result.data)}',
        ),
    };
  }
}
