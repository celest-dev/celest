// ignore_for_file: constant_identifier_names

/// GENERATED CODE - DO NOT MODIFY BY HAND
///
/// Dart client for the Fly.io Machines API generated from spec.json.
/// Visit the complete [Machines API docs](https://fly.io/docs/machines/api/) for more information.
library;

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

final Logger _logger = Logger('FlyApi');

/// Base class for exceptions specific to the Fly Machines API client.
class FlyMachinesApiException implements Exception {
  // Can hold the parsed ErrorResponse or raw body

  const FlyMachinesApiException(
    this.message, [
    this.statusCode,
    this.errorResponse,
  ]);
  final String message;
  final int? statusCode;
  final dynamic errorResponse;

  @override
  String toString() {
    return 'FlyMachinesApiException: $message'
        '${statusCode != null ? ' (Status Code: $statusCode)' : ''}'
        '${errorResponse != null ? '\nResponse: $errorResponse' : ''}';
  }
}

// ------------------------------------------
// API Client Core
// ------------------------------------------

/// Main client class for interacting with the Fly.io Machines API.
///
/// This site hosts documentation generated from the Fly.io Machines API OpenAPI specification.
/// Visit our complete [Machines API docs](https://fly.io/docs/machines/api/) for how to get started,
/// more information about each endpoint, parameter descriptions, and examples.
class FlyMachinesApiClient {
  /// Creates a new API client.
  ///
  /// [baseUrl] defaults to 'https://api.machines.dev/v1'.
  /// [client] allows providing a custom `http.Client`. If null, a default one is created.
  /// [authToken] is the Bearer token used for authentication. Must be provided.
  FlyMachinesApiClient({
    http.Client? client,
    String baseUrl = 'https://api.machines.dev/v1',
    required String authToken,
  }) : _client = client ?? http.Client(),
       _ownsClient = client == null,
       _baseUrl = Uri.parse(baseUrl),
       _authToken = authToken;

  final http.Client _client;
  final bool _ownsClient;
  final Uri _baseUrl;
  final String _authToken;

  /// Closes the underlying HTTP client.
  /// Should be called when the client is no longer needed.
  void close() {
    if (_ownsClient) {
      _client.close();
    }
  }

  // --- Endpoint Groups ---

  late final AppsApi apps = AppsApi._(this);
  late final MachinesApi machines = MachinesApi._(this);
  late final VolumesApi volumes = VolumesApi._(this);
  late final SecretsApi secrets = SecretsApi._(this);
  late final TokensApi tokens = TokensApi._(this);

  // --- Internal Request Helper ---

  Future<T> _sendRequest<T>(
    String method,
    String path, {
    Map<String, String?>? queryParams,
    Object? body,
    T Function(Object?)? parseResponse,
    Map<String, String>? headers,
  }) async {
    final uri = _baseUrl.replace(
      path: '${_baseUrl.path}$path',
      queryParameters: queryParams?..removeWhere((key, value) => value == null),
    );

    final requestHeaders = {
      'Authorization': 'FlyV1 $_authToken',
      'Accept': 'application/json',
      if (body != null) 'Content-Type': 'application/json',
      ...?headers, // Allow overriding default headers or adding new ones
    };

    final request = http.Request(method, uri);
    request.headers.addAll(requestHeaders);
    if (body != null) {
      request.body = jsonEncode(body);
    }

    http.StreamedResponse responseStream;
    try {
      responseStream = await _client.send(request);
    } catch (e) {
      throw FlyMachinesApiException('Network error: ${e.toString()}');
    }

    final responseBodyBytes = await responseStream.stream.toBytes();
    final responseBody = utf8.decode(responseBodyBytes, allowMalformed: true);
    final statusCode = responseStream.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      if (parseResponse == null) {
        // Expecting no content (e.g., 204)
        if (responseBody.isNotEmpty) {
          // Unexpected content
          _logger.finest(
            'Warning: Received unexpected response body for status $statusCode: $responseBody',
          );
        }
        // We need to cast carefully because T could be void
        return null as T;
      }
      // Handle empty body for success codes where content is expected
      if (responseBody.isEmpty) {
        // This might happen for 200 OK with an optional body.
        // The parse function needs to handle null appropriately.
        return parseResponse(const {});
      }
      final jsonResponse = jsonDecode(responseBody);
      return parseResponse(jsonResponse);
    } else {
      // Handle error responses
      ErrorResponse? error;
      dynamic rawError = responseBody;
      try {
        if (responseBody.isNotEmpty &&
            (responseStream.headers['content-type']?.contains(
                  'application/json',
                ) ??
                false)) {
          final jsonError = jsonDecode(responseBody);
          error = ErrorResponse.fromJson(jsonError as Map<String, Object?>);
          rawError = error; // Use the parsed error if available
        }
      } on Object {
        // Ignore parsing errors for the error body, keep the raw string
      }
      throw FlyMachinesApiException(
        error?.error ?? 'API error',
        statusCode,
        rawError,
      );
    }
  }
}

// ------------------------------------------
// API Endpoint Groups
// ------------------------------------------

/// Operations related to Apps.
/// This site hosts documentation generated from the Fly.io Machines API OpenAPI specification.
/// Visit our complete [Machines API docs](https://fly.io/docs/machines/api/apps-resource/) for details about using the Apps resource.
class AppsApi {
  AppsApi._(this._client);
  final FlyMachinesApiClient _client;

  /// List Apps
  ///
  /// List all apps with the ability to filter by organization slug.
  /// [orgSlug]: The org slug, or 'personal', to filter apps
  Future<ListAppsResponse> list({required String orgSlug}) async {
    return _client._sendRequest<ListAppsResponse>(
      'GET',
      '/apps',
      queryParams: {'org_slug': orgSlug},
      parseResponse:
          (json) => ListAppsResponse.fromJson(json as Map<String, Object?>),
    );
  }

  /// Create App
  ///
  /// Create an app with the specified details in the request body.
  /// [request]: App body
  Future<CreateAppResponse> create({required CreateAppRequest request}) async {
    return _client._sendRequest<CreateAppResponse>(
      'POST',
      '/apps',
      body: request.toJson(),
      parseResponse: (resp) => (id: (resp as Map)['id'] as String),
    );
  }

  /// Get App
  ///
  /// Retrieve details about a specific app by its name.
  /// [appName]: Fly App Name
  Future<App> show({required String appName}) async {
    return _client._sendRequest<App>(
      'GET',
      '/apps/$appName',
      parseResponse: (json) => App.fromJson(json as Map<String, Object?>),
    );
  }

  /// Destroy App
  ///
  /// Delete an app by its name.
  /// [appName]: Fly App Name
  Future<void> delete({required String appName}) async {
    await _client._sendRequest<void>(
      'DELETE',
      '/apps/$appName',
      parseResponse: null, // Expecting 202 Accepted with no body
    );
  }
}

/// Operations related to Machines.
/// This site hosts documentation generated from the Fly.io Machines API OpenAPI specification.
/// Visit our complete [Machines API docs](https://fly.io/docs/machines/api/machines-resource/) for details about using the Machines resource.
class MachinesApi {
  MachinesApi._(this._client);
  final FlyMachinesApiClient _client;

  /// List Machines
  ///
  /// List all Machines associated with a specific app, with optional filters for including deleted Machines and filtering by region.
  /// [appName]: Fly App Name
  /// [includeDeleted]: Include deleted machines
  /// [region]: Region filter
  /// [state]: comma separated list of states to filter (created, started, stopped, suspended)
  /// [summary]: Only return summary info about machines (omit config, checks, events, host_status, nonce, etc.)
  Future<List<Machine>> list({
    required String appName,
    bool? includeDeleted,
    String? region,
    String? state,
    bool? summary,
  }) async {
    return _client._sendRequest<List<Machine>>(
      'GET',
      '/apps/$appName/machines',
      queryParams: {
        'include_deleted': includeDeleted?.toString(),
        'region': region,
        'state': state,
        'summary': summary?.toString(),
      },
      parseResponse:
          (json) =>
              (json as List)
                  .map((item) => Machine.fromJson(item as Map<String, Object?>))
                  .toList(),
    );
  }

  /// Create Machine
  ///
  /// Create a Machine within a specific app using the details provided in the request body.
  ///
  /// **Important**: This request can fail, and you’re responsible for handling that failure. If you ask for a large Machine, or a Machine in a region we happen to be at capacity for, you might need to retry the request, or to fall back to another region. If you’re working directly with the Machines API, you’re taking some responsibility for your own orchestration!
  /// [appName]: Fly App Name
  /// [request]: Create machine request
  Future<Machine> create({
    required String appName,
    required CreateMachineRequest request,
  }) async {
    return _client._sendRequest<Machine>(
      'POST',
      '/apps/$appName/machines',
      body: request.toJson(),
      parseResponse: (json) => Machine.fromJson(json as Map<String, Object?>),
    );
  }

  /// Get Machine
  ///
  /// Get details of a specific Machine within an app by the Machine ID.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<Machine> show({
    required String appName,
    required String machineId,
  }) async {
    return _client._sendRequest<Machine>(
      'GET',
      '/apps/$appName/machines/$machineId',
      parseResponse: (json) => Machine.fromJson(json as Map<String, Object?>),
    );
  }

  /// Update Machine
  ///
  /// Update a Machine's configuration using the details provided in the request body.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [request]: Request body
  Future<Machine> update({
    required String appName,
    required String machineId,
    required UpdateMachineRequest request,
  }) async {
    return _client._sendRequest<Machine>(
      'POST', // Note: The spec uses POST for update here
      '/apps/$appName/machines/$machineId',
      body: request.toJson(),
      parseResponse: (json) => Machine.fromJson(json as Map<String, Object?>),
    );
  }

  /// Destroy Machine
  ///
  /// Delete a specific Machine within an app by Machine ID, with an optional force parameter to force kill the Machine if it's running.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [force]: Force kill the machine if it's running
  Future<void> delete({
    required String appName,
    required String machineId,
    bool? force,
  }) async {
    await _client._sendRequest<void>(
      'DELETE',
      '/apps/$appName/machines/$machineId',
      queryParams: {'force': force?.toString()},
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// Cordon Machine
  ///
  /// “Cordoning” a Machine refers to disabling its services, so the Fly Proxy won’t route requests to it. In flyctl this is used by blue/green deployments; one set of Machines is started up with services disabled, and when they are all healthy, the services are enabled on the new Machines and disabled on the old ones.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<void> cordon({
    required String appName,
    required String machineId,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/machines/$machineId/cordon',
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// Uncordon Machine
  ///
  /// “Cordoning” a Machine refers to disabling its services, so the Fly Proxy won’t route requests to it. In flyctl this is used by blue/green deployments; one set of Machines is started up with services disabled, and when they are all healthy, the services are enabled on the new Machines and disabled on the old ones.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<void> uncordon({
    required String appName,
    required String machineId,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/machines/$machineId/uncordon',
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// List Events
  ///
  /// List all events associated with a specific Machine within an app.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<List<MachineEvent>> listEvents({
    required String appName,
    required String machineId,
  }) async {
    return _client._sendRequest<List<MachineEvent>>(
      'GET',
      '/apps/$appName/machines/$machineId/events',
      parseResponse:
          (json) =>
              (json as List)
                  .map(
                    (item) =>
                        MachineEvent.fromJson(item as Map<String, Object?>),
                  )
                  .toList(),
    );
  }

  /// Execute Command
  ///
  /// Execute a command on a specific Machine and return the raw command output bytes.
  /// Note: The API might return JSON or octet-stream, this client requests and expects JSON.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [request]: Request body
  Future<Flydv1ExecResponse> exec({
    required String appName,
    required String machineId,
    required MachineExecRequest request,
  }) async {
    return _client._sendRequest<Flydv1ExecResponse>(
      'POST',
      '/apps/$appName/machines/$machineId/exec',
      body: request.toJson(),
      // Force Accept header to application/json
      headers: {'Accept': 'application/json'},
      parseResponse:
          (json) => Flydv1ExecResponse.fromJson(json as Map<String, Object?>),
    );
  }

  /// Get Lease
  ///
  /// Retrieve the current lease of a specific Machine within an app. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<Lease> showLease({
    required String appName,
    required String machineId,
  }) async {
    return _client._sendRequest<Lease>(
      'GET',
      '/apps/$appName/machines/$machineId/lease',
      parseResponse: (json) => Lease.fromJson(json as Map<String, Object?>),
    );
  }

  /// Create Lease
  ///
  /// Create a lease for a specific Machine within an app using the details provided in the request body. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [request]: Request body
  /// [flyMachineLeaseNonce]: Existing lease nonce to refresh by ttl, empty or non-existent to create a new lease
  Future<Lease> createLease({
    required String appName,
    required String machineId,
    required CreateLeaseRequest request,
    String? flyMachineLeaseNonce,
  }) async {
    return _client._sendRequest<Lease>(
      'POST',
      '/apps/$appName/machines/$machineId/lease',
      body: request.toJson(),
      headers:
          flyMachineLeaseNonce != null
              ? {'fly-machine-lease-nonce': flyMachineLeaseNonce}
              : null,
      parseResponse: (json) => Lease.fromJson(json as Map<String, Object?>),
    );
  }

  /// Release Lease
  ///
  /// Release the lease of a specific Machine within an app. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [flyMachineLeaseNonce]: Existing lease nonce
  Future<void> releaseLease({
    required String appName,
    required String machineId,
    required String flyMachineLeaseNonce,
  }) async {
    await _client._sendRequest<void>(
      'DELETE',
      '/apps/$appName/machines/$machineId/lease',
      headers: {'fly-machine-lease-nonce': flyMachineLeaseNonce},
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// Get Metadata
  ///
  /// Retrieve metadata for a specific Machine within an app.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<Map<String, String>> showMetadata({
    required String appName,
    required String machineId,
  }) async {
    return _client._sendRequest<Map<String, String>>(
      'GET',
      '/apps/$appName/machines/$machineId/metadata',
      parseResponse: (json) => (json as Map<String, Object?>).cast(),
    );
  }

  /// Update Metadata
  ///
  /// Update metadata for a specific machine within an app by providing a metadata key.
  /// Note: The value for the key should be sent in the request body (though the spec doesn't explicitly define the body structure for this POST, typically it would be a simple JSON value like `{"value": "your-metadata-value"}`). This client assumes no body is needed based on the 204 response. If a body *is* required, this method needs adjustment.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [key]: Metadata Key
  Future<void> updateMetadata({
    required String appName,
    required String machineId,
    required String key,
    // Consider adding: Object? valueBody,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/machines/$machineId/metadata/$key',
      // body: valueBody, // If a body is required
      parseResponse: null, // Expecting 204 No Content
    );
  }

  /// Delete Metadata
  ///
  /// Delete metadata for a specific Machine within an app by providing a metadata key.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [key]: Metadata Key
  Future<void> deleteMetadata({
    required String appName,
    required String machineId,
    required String key,
  }) async {
    await _client._sendRequest<void>(
      'DELETE',
      '/apps/$appName/machines/$machineId/metadata/$key',
      parseResponse: null, // Expecting 204 No Content
    );
  }

  /// List Processes
  ///
  /// List all processes running on a specific Machine within an app, with optional sorting parameters.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [sortBy]: Sort by
  /// [order]: Order
  Future<List<ProcessStat>> listProcesses({
    required String appName,
    required String machineId,
    String? sortBy,
    String? order,
  }) async {
    return _client._sendRequest<List<ProcessStat>>(
      'GET',
      '/apps/$appName/machines/$machineId/ps',
      queryParams: {'sort_by': sortBy, 'order': order},
      parseResponse:
          (json) =>
              (json as List)
                  .map(
                    (item) =>
                        ProcessStat.fromJson(item as Map<String, Object?>),
                  )
                  .toList(),
    );
  }

  /// Restart Machine
  ///
  /// Restart a specific Machine within an app, with an optional timeout parameter.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [timeout]: Restart timeout as a Go duration string or number of seconds
  /// [signal]: Unix signal name
  Future<void> restart({
    required String appName,
    required String machineId,
    String? timeout,
    String? signal,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/machines/$machineId/restart',
      queryParams: {'timeout': timeout, 'signal': signal},
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// Signal Machine
  ///
  /// Send a signal to a specific Machine within an app using the details provided in the request body.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [request]: Request body
  Future<void> signal({
    required String appName,
    required String machineId,
    required SignalRequest request,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/machines/$machineId/signal',
      body: request.toJson(),
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// Start Machine
  ///
  /// Start a specific Machine within an app.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<void> start({
    required String appName,
    required String machineId,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/machines/$machineId/start',
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// Stop Machine
  ///
  /// Stop a specific Machine within an app, with an optional request body to specify signal and timeout.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [request]: Optional request body
  Future<void> stop({
    required String appName,
    required String machineId,
    StopRequest? request,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/machines/$machineId/stop',
      body: request?.toJson(), // Body is optional
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// Suspend Machine
  ///
  /// Suspend a specific Machine within an app. The next start operation will attempt (but is not guaranteed) to resume the Machine from a snapshot taken at suspension time, rather than performing a cold boot.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<void> suspend({
    required String appName,
    required String machineId,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/machines/$machineId/suspend',
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// List Versions
  ///
  /// List all versions of the configuration for a specific Machine within an app.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  Future<List<MachineVersion>> listVersions({
    required String appName,
    required String machineId,
  }) async {
    return _client._sendRequest<List<MachineVersion>>(
      'GET',
      '/apps/$appName/machines/$machineId/versions',
      parseResponse:
          (json) =>
              (json as List)
                  .map(
                    (item) =>
                        MachineVersion.fromJson(item as Map<String, Object?>),
                  )
                  .toList(),
    );
  }

  /// Wait for State
  ///
  /// Wait for a Machine to reach a specific state. Specify the desired state with the state parameter. See the [Machine states table](https://fly.io/docs/machines/working-with-machines/#machine-states) for a list of possible states. The default for this parameter is `started`.
  ///
  /// This request will block for up to 60 seconds. Set a shorter timeout with the timeout parameter.
  /// [appName]: Fly App Name
  /// [machineId]: Machine ID
  /// [instanceId]: 26-character Machine version ID
  /// [timeout]: wait timeout. default 60s
  /// [state]: desired state
  Future<void> wait({
    required String appName,
    required String machineId,
    String? instanceId,
    int? timeout,
    MachinesWaitState? state,
  }) async {
    await _client._sendRequest<void>(
      'GET',
      '/apps/$appName/machines/$machineId/wait',
      queryParams: {
        'instance_id': instanceId,
        'timeout': timeout?.toString(),
        'state': state?.toJson(),
      },
      parseResponse: null, // Expecting 200 OK with no body
    );
  }
}

/// Operations related to Volumes.
/// This site hosts documentation generated from the Fly.io Machines API OpenAPI specification.
/// Visit our complete [Machines API docs](https://fly.io/docs/machines/api/volumes-resource/) for details about using the Volumes resource.
class VolumesApi {
  VolumesApi._(this._client);
  final FlyMachinesApiClient _client;

  /// List Volumes
  ///
  /// List all volumes associated with a specific app.
  /// [appName]: Fly App Name
  /// [summary]: Only return summary info about volumes (omit blocks, block size, etc)
  Future<List<Volume>> list({required String appName, bool? summary}) async {
    return _client._sendRequest<List<Volume>>(
      'GET',
      '/apps/$appName/volumes',
      queryParams: {'summary': summary?.toString()},
      parseResponse:
          (json) =>
              (json as List)
                  .map((item) => Volume.fromJson(item as Map<String, Object?>))
                  .toList(),
    );
  }

  /// Create Volume
  ///
  /// Create a volume for a specific app using the details provided in the request body.
  /// [appName]: Fly App Name
  /// [request]: Request body
  Future<Volume> create({
    required String appName,
    required CreateVolumeRequest request,
  }) async {
    return _client._sendRequest<Volume>(
      'POST',
      '/apps/$appName/volumes',
      body: request.toJson(),
      parseResponse: (json) => Volume.fromJson(json as Map<String, Object?>),
    );
  }

  /// Get Volume
  ///
  /// Retrieve details about a specific volume by its ID within an app.
  /// [appName]: Fly App Name
  /// [volumeId]: Volume ID
  Future<Volume> getById({
    required String appName,
    required String volumeId,
  }) async {
    return _client._sendRequest<Volume>(
      'GET',
      '/apps/$appName/volumes/$volumeId',
      parseResponse: (json) => Volume.fromJson(json as Map<String, Object?>),
    );
  }

  /// Update Volume
  ///
  /// Update a volume's configuration using the details provided in the request body.
  /// [appName]: Fly App Name
  /// [volumeId]: Volume ID
  /// [request]: Request body
  Future<Volume> update({
    required String appName,
    required String volumeId,
    required UpdateVolumeRequest request,
  }) async {
    return _client._sendRequest<Volume>(
      'PUT',
      '/apps/$appName/volumes/$volumeId',
      body: request.toJson(),
      parseResponse: (json) => Volume.fromJson(json as Map<String, Object?>),
    );
  }

  /// Destroy Volume
  ///
  /// Delete a specific volume within an app by volume ID.
  /// [appName]: Fly App Name
  /// [volumeId]: Volume ID
  Future<Volume> delete({
    required String appName,
    required String volumeId,
  }) async {
    // Note: Spec says DELETE returns 200 OK with Volume body
    return _client._sendRequest<Volume>(
      'DELETE',
      '/apps/$appName/volumes/$volumeId',
      parseResponse: (json) => Volume.fromJson(json as Map<String, Object?>),
    );
  }

  /// Extend Volume
  ///
  /// Extend a volume's size within an app using the details provided in the request body.
  /// [appName]: Fly App Name
  /// [volumeId]: Volume ID
  /// [request]: Request body
  Future<ExtendVolumeResponse> extend({
    required String appName,
    required String volumeId,
    required ExtendVolumeRequest request,
  }) async {
    return _client._sendRequest<ExtendVolumeResponse>(
      'PUT',
      '/apps/$appName/volumes/$volumeId/extend',
      body: request.toJson(),
      parseResponse:
          (resp) => ExtendVolumeResponse.fromJson(resp as Map<String, Object?>),
    );
  }

  /// List Snapshots
  ///
  /// List all snapshots for a specific volume within an app.
  /// [appName]: Fly App Name
  /// [volumeId]: Volume ID
  Future<List<VolumeSnapshot>> listSnapshots({
    required String appName,
    required String volumeId,
  }) async {
    return _client._sendRequest<List<VolumeSnapshot>>(
      'GET',
      '/apps/$appName/volumes/$volumeId/snapshots',
      parseResponse:
          (json) =>
              (json as List)
                  .map(
                    (item) =>
                        VolumeSnapshot.fromJson(item as Map<String, Object?>),
                  )
                  .toList(),
    );
  }

  /// Create Snapshot
  ///
  /// Create a snapshot for a specific volume within an app.
  /// [appName]: Fly App Name
  /// [volumeId]: Volume ID
  Future<void> createSnapshot({
    required String appName,
    required String volumeId,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/volumes/$volumeId/snapshots',
      parseResponse: null, // Expecting 200 OK with no body
    );
  }
}

/// Operations related to Secrets.
class SecretsApi {
  SecretsApi._(this._client);
  final FlyMachinesApiClient _client;

  /// List App secrets
  /// [appName]: Fly App Name
  Future<List<ListSecret>> list({required String appName}) async {
    return _client._sendRequest<List<ListSecret>>(
      'GET',
      '/apps/$appName/secrets',
      parseResponse:
          (json) =>
              (json as List)
                  .map(
                    (item) => ListSecret.fromJson(item as Map<String, Object?>),
                  )
                  .toList(),
    );
  }

  /// Destroy Secret
  /// [appName]: Fly App Name
  /// [secretLabel]: App Secret Label
  Future<void> delete({
    required String appName,
    required String secretLabel,
  }) async {
    await _client._sendRequest<void>(
      'DELETE',
      '/apps/$appName/secrets/$secretLabel',
      parseResponse: null, // Expecting 200 OK with no body
    );
  }

  /// Create Secret
  /// [appName]: Fly App Name
  /// [secretLabel]: App Secret Label
  /// [secretType]: App Secret Type
  /// [request]: secret body
  Future<void> create({
    required String appName,
    required String secretLabel,
    required String secretType,
    required CreateSecretRequest request,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/secrets/$secretLabel/type/$secretType',
      body: request.toJson(),
      parseResponse: null, // Expecting 201 Created with no body
    );
  }

  /// Generate Secret
  /// [appName]: Fly App Name
  /// [secretLabel]: App Secret Label
  /// [secretType]: App Secret Type
  Future<void> generate({
    required String appName,
    required String secretLabel,
    required String secretType,
  }) async {
    await _client._sendRequest<void>(
      'POST',
      '/apps/$appName/secrets/$secretLabel/type/$secretType/generate',
      parseResponse: null, // Expecting 201 Created with no body
    );
  }
}

/// Operations related to Tokens.
class TokensApi {
  TokensApi._(this._client);
  final FlyMachinesApiClient _client;

  /// Request a Petsem token for accessing KMS
  ///
  /// This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/apps-resource/) for details about using the Apps resource.
  Future<String> requestKms() async {
    return _client._sendRequest<String>(
      'POST',
      '/tokens/kms',
      parseResponse: (json) => json as String,
    );
  }

  /// Request an OIDC token
  ///
  /// Request an Open ID Connect token for your machine. Customize the audience claim with the `aud` parameter. This returns a JWT token. Learn more about [using OpenID Connect](/docs/reference/openid-connect/) on Fly.io.
  /// [request]: Optional request body
  Future<String> requestOIDC({required CreateOIDCTokenRequest request}) async {
    return _client._sendRequest<String>(
      'POST',
      '/tokens/oidc',
      body: request.toJson(),
      parseResponse: (json) => json as String,
    );
  }
}

// ------------------------------------------
// Data Models (Schemas)
// ------------------------------------------

/// Represents an application on Fly.io.
@immutable
class App {
  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      id: json['id'] as String?,
      name: json['name'] as String?,
      organization:
          json['organization'] == null
              ? null
              : Organization.fromJson(
                json['organization'] as Map<String, dynamic>,
              ),
      status: json['status'] as String?,
    );
  }
  const App({this.id, this.name, this.organization, this.status});

  final String? id;
  final String? name;
  final Organization? organization;
  final String? status;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'organization': organization?.toJson(),
      'status': status,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is App &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          organization == other.organization &&
          status == other.status;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ organization.hashCode ^ status.hashCode;

  @override
  String toString() =>
      'App(id: $id, name: $name, organization: $organization, status: $status)';

  App copyWith({
    String? id,
    String? name,
    Organization? organization,
    String? status,
  }) {
    return App(
      id: id ?? this.id,
      name: name ?? this.name,
      organization: organization ?? this.organization,
      status: status ?? this.status,
    );
  }
}

/// Represents the status of a machine check.
@immutable
class CheckStatus {
  factory CheckStatus.fromJson(Map<String, dynamic> json) {
    return CheckStatus(
      name: json['name'] as String?,
      output: json['output'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
  const CheckStatus({this.name, this.output, this.status, this.updatedAt});

  final String? name;
  final String? output;
  final String? status;
  final String? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'output': output,
      'status': status,
      'updated_at': updatedAt,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckStatus &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          output == other.output &&
          status == other.status &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      name.hashCode ^ output.hashCode ^ status.hashCode ^ updatedAt.hashCode;

  @override
  String toString() =>
      'CheckStatus(name: $name, output: $output, status: $status, updatedAt: $updatedAt)';

  CheckStatus copyWith({
    String? name,
    String? output,
    String? status,
    String? updatedAt,
  }) {
    return CheckStatus(
      name: name ?? this.name,
      output: output ?? this.output,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Request body for creating an app.
@immutable
class CreateAppRequest {
  factory CreateAppRequest.fromJson(Map<String, dynamic> json) {
    return CreateAppRequest(
      appName: json['app_name'] as String?,
      enableSubdomains: json['enable_subdomains'] as bool?,
      network: json['network'] as String?,
      orgSlug: json['org_slug'] as String?,
    );
  }
  const CreateAppRequest({
    this.appName,
    this.enableSubdomains,
    this.network,
    this.orgSlug,
  });

  final String? appName;
  final bool? enableSubdomains;
  final String? network;
  final String? orgSlug;

  Map<String, dynamic> toJson() {
    return {
      'app_name': appName,
      'enable_subdomains': enableSubdomains,
      'network': network,
      'org_slug': orgSlug,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateAppRequest &&
          runtimeType == other.runtimeType &&
          appName == other.appName &&
          enableSubdomains == other.enableSubdomains &&
          network == other.network &&
          orgSlug == other.orgSlug;

  @override
  int get hashCode =>
      appName.hashCode ^
      enableSubdomains.hashCode ^
      network.hashCode ^
      orgSlug.hashCode;

  @override
  String toString() =>
      'CreateAppRequest(appName: $appName, enableSubdomains: $enableSubdomains, network: $network, orgSlug: $orgSlug)';

  CreateAppRequest copyWith({
    String? appName,
    bool? enableSubdomains,
    String? network,
    String? orgSlug,
  }) {
    return CreateAppRequest(
      appName: appName ?? this.appName,
      enableSubdomains: enableSubdomains ?? this.enableSubdomains,
      network: network ?? this.network,
      orgSlug: orgSlug ?? this.orgSlug,
    );
  }
}

typedef CreateAppResponse = ({String id});

/// Request body for creating a machine lease.
@immutable
class CreateLeaseRequest {
  factory CreateLeaseRequest.fromJson(Map<String, dynamic> json) {
    return CreateLeaseRequest(
      description: json['description'] as String?,
      ttl: json['ttl'] as int?,
    );
  }
  const CreateLeaseRequest({this.description, this.ttl});

  final String? description;

  /// seconds lease will be valid
  final int? ttl;

  Map<String, dynamic> toJson() {
    return {'description': description, 'ttl': ttl}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateLeaseRequest &&
          runtimeType == other.runtimeType &&
          description == other.description &&
          ttl == other.ttl;

  @override
  int get hashCode => description.hashCode ^ ttl.hashCode;

  @override
  String toString() =>
      'CreateLeaseRequest(description: $description, ttl: $ttl)';

  CreateLeaseRequest copyWith({String? description, int? ttl}) {
    return CreateLeaseRequest(
      description: description ?? this.description,
      ttl: ttl ?? this.ttl,
    );
  }
}

/// Request body for creating a machine.
@immutable
class CreateMachineRequest {
  factory CreateMachineRequest.fromJson(Map<String, dynamic> json) {
    return CreateMachineRequest(
      config:
          json['config'] == null
              ? null
              : FlyMachineConfig.fromJson(
                json['config'] as Map<String, dynamic>,
              ),
      leaseTtl: json['lease_ttl'] as int?,
      lsvd: json['lsvd'] as bool?,
      name: json['name'] as String?,
      region: json['region'] as String?,
      skipLaunch: json['skip_launch'] as bool?,
      skipServiceRegistration: json['skip_service_registration'] as bool?,
    );
  }
  const CreateMachineRequest({
    this.config,
    this.leaseTtl,
    this.lsvd,
    this.name,
    this.region,
    this.skipLaunch,
    this.skipServiceRegistration,
  });

  /// An object defining the Machine configuration
  final FlyMachineConfig? config;
  final int? leaseTtl;
  final bool? lsvd;

  /// Unique name for this Machine. If omitted, one is generated for you
  final String? name;

  /// The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).
  final String? region;
  final bool? skipLaunch;
  final bool? skipServiceRegistration;

  Map<String, dynamic> toJson() {
    return {
      'config': config?.toJson(),
      'lease_ttl': leaseTtl,
      'lsvd': lsvd,
      'name': name,
      'region': region,
      'skip_launch': skipLaunch,
      'skip_service_registration': skipServiceRegistration,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateMachineRequest &&
          runtimeType == other.runtimeType &&
          config == other.config &&
          leaseTtl == other.leaseTtl &&
          lsvd == other.lsvd &&
          name == other.name &&
          region == other.region &&
          skipLaunch == other.skipLaunch &&
          skipServiceRegistration == other.skipServiceRegistration;

  @override
  int get hashCode =>
      config.hashCode ^
      leaseTtl.hashCode ^
      lsvd.hashCode ^
      name.hashCode ^
      region.hashCode ^
      skipLaunch.hashCode ^
      skipServiceRegistration.hashCode;

  @override
  String toString() =>
      'CreateMachineRequest(config: $config, leaseTtl: $leaseTtl, lsvd: $lsvd, name: $name, region: $region, skipLaunch: $skipLaunch, skipServiceRegistration: $skipServiceRegistration)';

  CreateMachineRequest copyWith({
    FlyMachineConfig? config,
    int? leaseTtl,
    bool? lsvd,
    String? name,
    String? region,
    bool? skipLaunch,
    bool? skipServiceRegistration,
  }) {
    return CreateMachineRequest(
      config: config ?? this.config,
      leaseTtl: leaseTtl ?? this.leaseTtl,
      lsvd: lsvd ?? this.lsvd,
      name: name ?? this.name,
      region: region ?? this.region,
      skipLaunch: skipLaunch ?? this.skipLaunch,
      skipServiceRegistration:
          skipServiceRegistration ?? this.skipServiceRegistration,
    );
  }
}

/// Optional parameters for requesting an OIDC token.
@immutable
class CreateOIDCTokenRequest {
  factory CreateOIDCTokenRequest.fromJson(Map<String, dynamic> json) {
    return CreateOIDCTokenRequest(
      aud: json['aud'] as String?,
      awsPrincipalTags: json['aws_principal_tags'] as bool?,
    );
  }
  const CreateOIDCTokenRequest({this.aud, this.awsPrincipalTags});

  /// Example: "https://fly.io/org-slug"
  final String? aud;
  final bool? awsPrincipalTags;

  Map<String, dynamic> toJson() {
    return {'aud': aud, 'aws_principal_tags': awsPrincipalTags}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateOIDCTokenRequest &&
          runtimeType == other.runtimeType &&
          aud == other.aud &&
          awsPrincipalTags == other.awsPrincipalTags;

  @override
  int get hashCode => aud.hashCode ^ awsPrincipalTags.hashCode;

  @override
  String toString() =>
      'CreateOIDCTokenRequest(aud: $aud, awsPrincipalTags: $awsPrincipalTags)';

  CreateOIDCTokenRequest copyWith({String? aud, bool? awsPrincipalTags}) {
    return CreateOIDCTokenRequest(
      aud: aud ?? this.aud,
      awsPrincipalTags: awsPrincipalTags ?? this.awsPrincipalTags,
    );
  }
}

/// Request body for creating a secret.
@immutable
class CreateSecretRequest {
  factory CreateSecretRequest.fromJson(Map<String, dynamic> json) {
    return CreateSecretRequest(
      value: (json['value'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );
  }
  const CreateSecretRequest({this.value});

  final List<int>? value;

  Map<String, dynamic> toJson() {
    return {'value': value}..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateSecretRequest &&
          runtimeType == other.runtimeType &&
          // Use DeepCollectionEquality for list comparison
          const DeepCollectionEquality().equals(value, other.value);

  @override
  int get hashCode => const DeepCollectionEquality().hash(value);

  @override
  String toString() => 'CreateSecretRequest(value: $value)';

  CreateSecretRequest copyWith({List<int>? value}) {
    return CreateSecretRequest(value: value ?? this.value);
  }
}

/// Request body for creating a volume.
@immutable
class CreateVolumeRequest {
  factory CreateVolumeRequest.fromJson(Map<String, dynamic> json) {
    return CreateVolumeRequest(
      compute:
          json['compute'] == null
              ? null
              : FlyMachineGuest.fromJson(
                json['compute'] as Map<String, dynamic>,
              ),
      computeImage: json['compute_image'] as String?,
      encrypted: json['encrypted'] as bool?,
      fstype: json['fstype'] as String?,
      name: json['name'] as String?,
      region: json['region'] as String?,
      requireUniqueZone: json['require_unique_zone'] as bool?,
      sizeGb: json['size_gb'] as int?,
      snapshotId: json['snapshot_id'] as String?,
      snapshotRetention: json['snapshot_retention'] as int?,
      sourceVolumeId: json['source_volume_id'] as String?,
      uniqueZoneAppWide: json['unique_zone_app_wide'] as bool?,
    );
  }
  const CreateVolumeRequest({
    this.compute,
    this.computeImage,
    this.encrypted,
    this.fstype,
    this.name,
    this.region,
    this.requireUniqueZone,
    this.sizeGb,
    this.snapshotId,
    this.snapshotRetention,
    this.sourceVolumeId,
    this.uniqueZoneAppWide,
  });

  final FlyMachineGuest? compute;
  final String? computeImage;
  final bool? encrypted;
  final String? fstype;
  final String? name;
  final String? region;
  final bool? requireUniqueZone;
  final int? sizeGb;

  /// restore from snapshot
  final String? snapshotId;
  final int? snapshotRetention;

  /// fork from remote volume
  final String? sourceVolumeId;
  final bool? uniqueZoneAppWide;

  Map<String, dynamic> toJson() {
    return {
      'compute': compute?.toJson(),
      'compute_image': computeImage,
      'encrypted': encrypted,
      'fstype': fstype,
      'name': name,
      'region': region,
      'require_unique_zone': requireUniqueZone,
      'size_gb': sizeGb,
      'snapshot_id': snapshotId,
      'snapshot_retention': snapshotRetention,
      'source_volume_id': sourceVolumeId,
      'unique_zone_app_wide': uniqueZoneAppWide,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateVolumeRequest &&
          runtimeType == other.runtimeType &&
          compute == other.compute &&
          computeImage == other.computeImage &&
          encrypted == other.encrypted &&
          fstype == other.fstype &&
          name == other.name &&
          region == other.region &&
          requireUniqueZone == other.requireUniqueZone &&
          sizeGb == other.sizeGb &&
          snapshotId == other.snapshotId &&
          snapshotRetention == other.snapshotRetention &&
          sourceVolumeId == other.sourceVolumeId &&
          uniqueZoneAppWide == other.uniqueZoneAppWide;

  @override
  int get hashCode =>
      compute.hashCode ^
      computeImage.hashCode ^
      encrypted.hashCode ^
      fstype.hashCode ^
      name.hashCode ^
      region.hashCode ^
      requireUniqueZone.hashCode ^
      sizeGb.hashCode ^
      snapshotId.hashCode ^
      snapshotRetention.hashCode ^
      sourceVolumeId.hashCode ^
      uniqueZoneAppWide.hashCode;

  @override
  String toString() =>
      'CreateVolumeRequest(compute: $compute, computeImage: $computeImage, encrypted: $encrypted, fstype: $fstype, name: $name, region: $region, requireUniqueZone: $requireUniqueZone, sizeGb: $sizeGb, snapshotId: $snapshotId, snapshotRetention: $snapshotRetention, sourceVolumeId: $sourceVolumeId, uniqueZoneAppWide: $uniqueZoneAppWide)';

  CreateVolumeRequest copyWith({
    FlyMachineGuest? compute,
    String? computeImage,
    bool? encrypted,
    String? fstype,
    String? name,
    String? region,
    bool? requireUniqueZone,
    int? sizeGb,
    String? snapshotId,
    int? snapshotRetention,
    String? sourceVolumeId,
    bool? uniqueZoneAppWide,
  }) {
    return CreateVolumeRequest(
      compute: compute ?? this.compute,
      computeImage: computeImage ?? this.computeImage,
      encrypted: encrypted ?? this.encrypted,
      fstype: fstype ?? this.fstype,
      name: name ?? this.name,
      region: region ?? this.region,
      requireUniqueZone: requireUniqueZone ?? this.requireUniqueZone,
      sizeGb: sizeGb ?? this.sizeGb,
      snapshotId: snapshotId ?? this.snapshotId,
      snapshotRetention: snapshotRetention ?? this.snapshotRetention,
      sourceVolumeId: sourceVolumeId ?? this.sourceVolumeId,
      uniqueZoneAppWide: uniqueZoneAppWide ?? this.uniqueZoneAppWide,
    );
  }
}

/// Represents an error response from the API.
@immutable
class ErrorResponse {
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      details:
          json['details'] == null
              ? null
              : Map<String, dynamic>.from(json['details'] as Map),
      error: json['error'] as String?,
      status:
          json['status'] == null
              ? null
              : MainStatusCode.fromJson(json['status'] as String),
    );
  }
  const ErrorResponse({this.details, this.error, this.status});

  /// Deprecated
  final Map<String, dynamic>? details;
  final String? error;
  final MainStatusCode? status;

  Map<String, dynamic> toJson() {
    return {'details': details, 'error': error, 'status': status?.toJson()}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorResponse &&
          runtimeType == other.runtimeType &&
          // Use DeepCollectionEquality for map comparison
          const DeepCollectionEquality().equals(details, other.details) &&
          error == other.error &&
          status == other.status;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(details) ^
      error.hashCode ^
      status.hashCode;

  @override
  String toString() =>
      'ErrorResponse(details: $details, error: $error, status: $status)';

  ErrorResponse copyWith({
    Map<String, dynamic>? details,
    String? error,
    MainStatusCode? status,
  }) {
    return ErrorResponse(
      details: details ?? this.details,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}

/// Request body for extending a volume.
@immutable
class ExtendVolumeRequest {
  factory ExtendVolumeRequest.fromJson(Map<String, dynamic> json) {
    return ExtendVolumeRequest(sizeGb: json['size_gb'] as int?);
  }
  const ExtendVolumeRequest({this.sizeGb});

  final int? sizeGb;

  Map<String, dynamic> toJson() {
    return {'size_gb': sizeGb}..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendVolumeRequest &&
          runtimeType == other.runtimeType &&
          sizeGb == other.sizeGb;

  @override
  int get hashCode => sizeGb.hashCode;

  @override
  String toString() => 'ExtendVolumeRequest(sizeGb: $sizeGb)';

  ExtendVolumeRequest copyWith({int? sizeGb}) {
    return ExtendVolumeRequest(sizeGb: sizeGb ?? this.sizeGb);
  }
}

/// Response body for extending a volume.
@immutable
class ExtendVolumeResponse {
  factory ExtendVolumeResponse.fromJson(Map<String, dynamic> json) {
    return ExtendVolumeResponse(
      needsRestart: json['needs_restart'] as bool?,
      volume:
          json['volume'] == null
              ? null
              : Volume.fromJson(json['volume'] as Map<String, dynamic>),
    );
  }
  const ExtendVolumeResponse({this.needsRestart, this.volume});

  final bool? needsRestart;
  final Volume? volume;

  Map<String, dynamic> toJson() {
    return {'needs_restart': needsRestart, 'volume': volume?.toJson()}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendVolumeResponse &&
          runtimeType == other.runtimeType &&
          needsRestart == other.needsRestart &&
          volume == other.volume;

  @override
  int get hashCode => needsRestart.hashCode ^ volume.hashCode;

  @override
  String toString() =>
      'ExtendVolumeResponse(needsRestart: $needsRestart, volume: $volume)';

  ExtendVolumeResponse copyWith({bool? needsRestart, Volume? volume}) {
    return ExtendVolumeResponse(
      needsRestart: needsRestart ?? this.needsRestart,
      volume: volume ?? this.volume,
    );
  }
}

/// Represents a reference to a Docker image.
@immutable
class ImageRef {
  factory ImageRef.fromJson(Map<String, dynamic> json) {
    return ImageRef(
      digest: json['digest'] as String?,
      labels:
          json['labels'] == null
              ? null
              : Map<String, String>.from(json['labels'] as Map),
      registry: json['registry'] as String?,
      repository: json['repository'] as String?,
      tag: json['tag'] as String?,
    );
  }
  const ImageRef({
    this.digest,
    this.labels,
    this.registry,
    this.repository,
    this.tag,
  });

  final String? digest;
  final Map<String, String>? labels;
  final String? registry;
  final String? repository;
  final String? tag;

  Map<String, dynamic> toJson() {
    return {
      'digest': digest,
      'labels': labels,
      'registry': registry,
      'repository': repository,
      'tag': tag,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageRef &&
          runtimeType == other.runtimeType &&
          digest == other.digest &&
          // Use DeepCollectionEquality for map comparison
          const DeepCollectionEquality().equals(labels, other.labels) &&
          registry == other.registry &&
          repository == other.repository &&
          tag == other.tag;

  @override
  int get hashCode =>
      digest.hashCode ^
      const DeepCollectionEquality().hash(labels) ^
      registry.hashCode ^
      repository.hashCode ^
      tag.hashCode;

  @override
  String toString() =>
      'ImageRef(digest: $digest, labels: $labels, registry: $registry, repository: $repository, tag: $tag)';

  ImageRef copyWith({
    String? digest,
    Map<String, String>? labels,
    String? registry,
    String? repository,
    String? tag,
  }) {
    return ImageRef(
      digest: digest ?? this.digest,
      labels: labels ?? this.labels,
      registry: registry ?? this.registry,
      repository: repository ?? this.repository,
      tag: tag ?? this.tag,
    );
  }
}

/// Represents a lease on a machine.
@immutable
class Lease {
  factory Lease.fromJson(Map<String, dynamic> json) {
    return Lease(
      description: json['description'] as String?,
      expiresAt: json['expires_at'] as int?,
      nonce: json['nonce'] as String?,
      owner: json['owner'] as String?,
      version: json['version'] as String?,
    );
  }
  const Lease({
    this.description,
    this.expiresAt,
    this.nonce,
    this.owner,
    this.version,
  });

  /// Description or reason for the Lease.
  final String? description;

  /// ExpiresAt is the unix timestamp in UTC to denote when the Lease will no longer be valid.
  final int? expiresAt;

  /// Nonce is the unique ID autogenerated and associated with the Lease.
  final String? nonce;

  /// Owner is the user identifier which acquired the Lease.
  final String? owner;

  /// Machine version
  final String? version;

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'expires_at': expiresAt,
      'nonce': nonce,
      'owner': owner,
      'version': version,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Lease &&
          runtimeType == other.runtimeType &&
          description == other.description &&
          expiresAt == other.expiresAt &&
          nonce == other.nonce &&
          owner == other.owner &&
          version == other.version;

  @override
  int get hashCode =>
      description.hashCode ^
      expiresAt.hashCode ^
      nonce.hashCode ^
      owner.hashCode ^
      version.hashCode;

  @override
  String toString() =>
      'Lease(description: $description, expiresAt: $expiresAt, nonce: $nonce, owner: $owner, version: $version)';

  Lease copyWith({
    String? description,
    int? expiresAt,
    String? nonce,
    String? owner,
    String? version,
  }) {
    return Lease(
      description: description ?? this.description,
      expiresAt: expiresAt ?? this.expiresAt,
      nonce: nonce ?? this.nonce,
      owner: owner ?? this.owner,
      version: version ?? this.version,
    );
  }
}

/// Represents an app in a list response.
@immutable
class ListApp {
  factory ListApp.fromJson(Map<String, dynamic> json) {
    return ListApp(
      id: json['id'] as String?,
      machineCount: json['machine_count'] as int?,
      name: json['name'] as String?,
      network: json['network'] as String?,
    );
  }
  const ListApp({this.id, this.machineCount, this.name, this.network});

  final String? id;
  final int? machineCount;
  final String? name;
  final String? network;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'machine_count': machineCount,
      'name': name,
      'network': network,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListApp &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          machineCount == other.machineCount &&
          name == other.name &&
          // Use DeepCollectionEquality for map comparison
          const DeepCollectionEquality().equals(network, other.network);

  @override
  int get hashCode =>
      id.hashCode ^
      machineCount.hashCode ^
      name.hashCode ^
      const DeepCollectionEquality().hash(network);

  @override
  String toString() =>
      'ListApp(id: $id, machineCount: $machineCount, name: $name, network: $network)';

  ListApp copyWith({
    String? id,
    int? machineCount,
    String? name,
    String? network,
  }) {
    return ListApp(
      id: id ?? this.id,
      machineCount: machineCount ?? this.machineCount,
      name: name ?? this.name,
      network: network ?? this.network,
    );
  }
}

/// Response body for listing apps.
@immutable
class ListAppsResponse {
  factory ListAppsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppsResponse(
      apps:
          (json['apps'] as List<dynamic>?)
              ?.map((e) => ListApp.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalApps: json['total_apps'] as int?,
    );
  }
  const ListAppsResponse({this.apps, this.totalApps});

  final List<ListApp>? apps;
  final int? totalApps;

  Map<String, dynamic> toJson() {
    return {
      'apps': apps?.map((e) => e.toJson()).toList(),
      'total_apps': totalApps,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListAppsResponse &&
          runtimeType == other.runtimeType &&
          // Use DeepCollectionEquality for list comparison
          const DeepCollectionEquality().equals(apps, other.apps) &&
          totalApps == other.totalApps;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(apps) ^ totalApps.hashCode;

  @override
  String toString() => 'ListAppsResponse(apps: $apps, totalApps: $totalApps)';

  ListAppsResponse copyWith({List<ListApp>? apps, int? totalApps}) {
    return ListAppsResponse(
      apps: apps ?? this.apps,
      totalApps: totalApps ?? this.totalApps,
    );
  }
}

/// Represents a secret in a list response.
@immutable
class ListSecret {
  factory ListSecret.fromJson(Map<String, dynamic> json) {
    return ListSecret(
      label: json['label'] as String?,
      publickey:
          (json['publickey'] as List<dynamic>?)?.map((e) => e as int).toList(),
      type: json['type'] as String?,
    );
  }
  const ListSecret({this.label, this.publickey, this.type});

  final String? label;
  final List<int>? publickey;
  final String? type;

  Map<String, dynamic> toJson() {
    return {'label': label, 'publickey': publickey, 'type': type}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListSecret &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          // Use DeepCollectionEquality for list comparison
          const DeepCollectionEquality().equals(publickey, other.publickey) &&
          type == other.type;

  @override
  int get hashCode =>
      label.hashCode ^
      const DeepCollectionEquality().hash(publickey) ^
      type.hashCode;

  @override
  String toString() =>
      'ListSecret(label: $label, publickey: $publickey, type: $type)';

  ListSecret copyWith({String? label, List<int>? publickey, String? type}) {
    return ListSecret(
      label: label ?? this.label,
      publickey: publickey ?? this.publickey,
      type: type ?? this.type,
    );
  }
}

/// Represents a listening socket on a machine process.
@immutable
class ListenSocket {
  factory ListenSocket.fromJson(Map<String, dynamic> json) {
    return ListenSocket(
      address: json['address'] as String?,
      proto: json['proto'] as String?,
    );
  }
  const ListenSocket({this.address, this.proto});

  final String? address;
  final String? proto;

  Map<String, dynamic> toJson() {
    return {'address': address, 'proto': proto}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListenSocket &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          proto == other.proto;

  @override
  int get hashCode => address.hashCode ^ proto.hashCode;

  @override
  String toString() => 'ListenSocket(address: $address, proto: $proto)';

  ListenSocket copyWith({String? address, String? proto}) {
    return ListenSocket(
      address: address ?? this.address,
      proto: proto ?? this.proto,
    );
  }
}

/// Represents a Fly Machine.
@immutable
class Machine {
  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      checks:
          (json['checks'] as List<dynamic>?)
              ?.map((e) => CheckStatus.fromJson(e as Map<String, dynamic>))
              .toList(),
      config:
          json['config'] == null
              ? null
              : FlyMachineConfig.fromJson(
                json['config'] as Map<String, dynamic>,
              ),
      createdAt: json['created_at'] as String?,
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => MachineEvent.fromJson(e as Map<String, dynamic>))
              .toList(),
      hostStatus:
          json['host_status'] == null
              ? null
              : MachineHostStatus.fromJson(json['host_status'] as String),
      id: json['id'] as String,
      imageRef:
          json['image_ref'] == null
              ? null
              : ImageRef.fromJson(json['image_ref'] as Map<String, dynamic>),
      incompleteConfig:
          json['incomplete_config'] == null
              ? null
              : FlyMachineConfig.fromJson(
                json['incomplete_config'] as Map<String, dynamic>,
              ),
      instanceId: json['instance_id'] as String?,
      name: json['name'] as String?,
      nonce: json['nonce'] as String?,
      privateIp: json['private_ip'] as String?,
      region: json['region'] as String?,
      state: json['state'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
  const Machine({
    required this.id,
    this.checks,
    this.config,
    this.createdAt,
    this.events,
    this.hostStatus,
    this.imageRef,
    this.incompleteConfig,
    this.instanceId,
    this.name,
    this.nonce,
    this.privateIp,
    this.region,
    this.state,
    this.updatedAt,
  });

  final List<CheckStatus>? checks;
  final FlyMachineConfig? config;
  final String? createdAt;
  final List<MachineEvent>? events;
  final MachineHostStatus? hostStatus;
  final String id;
  final ImageRef? imageRef;
  final FlyMachineConfig? incompleteConfig;

  /// InstanceID is unique for each version of the machine
  final String? instanceId;
  final String? name;

  /// Nonce is only every returned on machine creation if a lease_duration was provided.
  final String? nonce;

  /// PrivateIP is the internal 6PN address of the machine.
  final String? privateIp;
  final String? region;
  final String? state;
  final String? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'checks': checks?.map((e) => e.toJson()).toList(),
      'config': config?.toJson(),
      'created_at': createdAt,
      'events': events?.map((e) => e.toJson()).toList(),
      'host_status': hostStatus?.toJson(),
      'id': id,
      'image_ref': imageRef?.toJson(),
      'incomplete_config': incompleteConfig?.toJson(),
      'instance_id': instanceId,
      'name': name,
      'nonce': nonce,
      'private_ip': privateIp,
      'region': region,
      'state': state,
      'updated_at': updatedAt,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Machine &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(checks, other.checks) &&
          config == other.config &&
          createdAt == other.createdAt &&
          const DeepCollectionEquality().equals(events, other.events) &&
          hostStatus == other.hostStatus &&
          id == other.id &&
          imageRef == other.imageRef &&
          incompleteConfig == other.incompleteConfig &&
          instanceId == other.instanceId &&
          name == other.name &&
          nonce == other.nonce &&
          privateIp == other.privateIp &&
          region == other.region &&
          state == other.state &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(checks) ^
      config.hashCode ^
      createdAt.hashCode ^
      const DeepCollectionEquality().hash(events) ^
      hostStatus.hashCode ^
      id.hashCode ^
      imageRef.hashCode ^
      incompleteConfig.hashCode ^
      instanceId.hashCode ^
      name.hashCode ^
      nonce.hashCode ^
      privateIp.hashCode ^
      region.hashCode ^
      state.hashCode ^
      updatedAt.hashCode;

  @override
  String toString() =>
      'Machine(checks: $checks, config: $config, createdAt: $createdAt, events: $events, hostStatus: $hostStatus, id: $id, imageRef: $imageRef, incompleteConfig: $incompleteConfig, instanceId: $instanceId, name: $name, nonce: $nonce, privateIp: $privateIp, region: $region, state: $state, updatedAt: $updatedAt)';

  Machine copyWith({
    List<CheckStatus>? checks,
    FlyMachineConfig? config,
    String? createdAt,
    List<MachineEvent>? events,
    MachineHostStatus? hostStatus,
    String? id,
    ImageRef? imageRef,
    FlyMachineConfig? incompleteConfig,
    String? instanceId,
    String? name,
    String? nonce,
    String? privateIp,
    String? region,
    String? state,
    String? updatedAt,
  }) {
    return Machine(
      checks: checks ?? this.checks,
      config: config ?? this.config,
      createdAt: createdAt ?? this.createdAt,
      events: events ?? this.events,
      hostStatus: hostStatus ?? this.hostStatus,
      id: id ?? this.id,
      imageRef: imageRef ?? this.imageRef,
      incompleteConfig: incompleteConfig ?? this.incompleteConfig,
      instanceId: instanceId ?? this.instanceId,
      name: name ?? this.name,
      nonce: nonce ?? this.nonce,
      privateIp: privateIp ?? this.privateIp,
      region: region ?? this.region,
      state: state ?? this.state,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Enum for Machine host status.
enum MachineHostStatus {
  ok('ok'),
  unknown('unknown'),
  unreachable('unreachable');

  const MachineHostStatus(this.value);
  final String value;

  static MachineHostStatus? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Represents an event related to a machine.
@immutable
class MachineEvent {
  factory MachineEvent.fromJson(Map<String, dynamic> json) {
    return MachineEvent(
      id: json['id'] as String?,
      request:
          json['request'] == null
              ? null
              : Map<String, dynamic>.from(json['request'] as Map),
      source: json['source'] as String?,
      status: json['status'] as String?,
      timestamp: json['timestamp'] as int?,
      type: json['type'] as String?,
    );
  }
  const MachineEvent({
    this.id,
    this.request,
    this.source,
    this.status,
    this.timestamp,
    this.type,
  });

  final String? id;
  final Map<String, dynamic>? request;
  final String? source;
  final String? status;
  final int? timestamp;
  final String? type;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'request': request,
      'source': source,
      'status': status,
      'timestamp': timestamp,
      'type': type,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineEvent &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          const DeepCollectionEquality().equals(request, other.request) &&
          source == other.source &&
          status == other.status &&
          timestamp == other.timestamp &&
          type == other.type;

  @override
  int get hashCode =>
      id.hashCode ^
      const DeepCollectionEquality().hash(request) ^
      source.hashCode ^
      status.hashCode ^
      timestamp.hashCode ^
      type.hashCode;

  @override
  String toString() =>
      'MachineEvent(id: $id, request: $request, source: $source, status: $status, timestamp: $timestamp, type: $type)';

  MachineEvent copyWith({
    String? id,
    Map<String, dynamic>? request,
    String? source,
    String? status,
    int? timestamp,
    String? type,
  }) {
    return MachineEvent(
      id: id ?? this.id,
      request: request ?? this.request,
      source: source ?? this.source,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
    );
  }
}

/// Request body for executing a command on a machine.
@immutable
class MachineExecRequest {
  factory MachineExecRequest.fromJson(Map<String, dynamic> json) {
    return MachineExecRequest(
      cmd: json['cmd'] as String?,
      command:
          (json['command'] as List<dynamic>?)?.map((e) => e as String).toList(),
      container: json['container'] as String?,
      stdin: json['stdin'] as String?,
      timeout: json['timeout'] as int?,
    );
  }
  const MachineExecRequest({
    this.cmd,
    this.command,
    this.container,
    this.stdin,
    this.timeout,
  });

  /// Deprecated: use Command instead
  final String? cmd;
  final List<String>? command;
  final String? container;
  final String? stdin;
  final int? timeout;

  Map<String, dynamic> toJson() {
    return {
      'cmd': cmd,
      'command': command,
      'container': container,
      'stdin': stdin,
      'timeout': timeout,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineExecRequest &&
          runtimeType == other.runtimeType &&
          cmd == other.cmd &&
          const DeepCollectionEquality().equals(command, other.command) &&
          container == other.container &&
          stdin == other.stdin &&
          timeout == other.timeout;

  @override
  int get hashCode =>
      cmd.hashCode ^
      const DeepCollectionEquality().hash(command) ^
      container.hashCode ^
      stdin.hashCode ^
      timeout.hashCode;

  @override
  String toString() =>
      'MachineExecRequest(cmd: $cmd, command: $command, container: $container, stdin: $stdin, timeout: $timeout)';

  MachineExecRequest copyWith({
    String? cmd,
    List<String>? command,
    String? container,
    String? stdin,
    int? timeout,
  }) {
    return MachineExecRequest(
      cmd: cmd ?? this.cmd,
      command: command ?? this.command,
      container: container ?? this.container,
      stdin: stdin ?? this.stdin,
      timeout: timeout ?? this.timeout,
    );
  }
}

/// Represents a specific version of a machine's configuration.
@immutable
class MachineVersion {
  factory MachineVersion.fromJson(Map<String, dynamic> json) {
    return MachineVersion(
      userConfig:
          json['user_config'] == null
              ? null
              : FlyMachineConfig.fromJson(
                json['user_config'] as Map<String, dynamic>,
              ),
      version: json['version'] as String?,
    );
  }
  const MachineVersion({this.userConfig, this.version});

  final FlyMachineConfig? userConfig;
  final String? version;

  Map<String, dynamic> toJson() {
    return {'user_config': userConfig?.toJson(), 'version': version}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineVersion &&
          runtimeType == other.runtimeType &&
          userConfig == other.userConfig &&
          version == other.version;

  @override
  int get hashCode => userConfig.hashCode ^ version.hashCode;

  @override
  String toString() =>
      'MachineVersion(userConfig: $userConfig, version: $version)';

  MachineVersion copyWith({FlyMachineConfig? userConfig, String? version}) {
    return MachineVersion(
      userConfig: userConfig ?? this.userConfig,
      version: version ?? this.version,
    );
  }
}

/// Represents a Fly.io organization.
@immutable
class Organization {
  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );
  }
  const Organization({this.name, this.slug});

  final String? name;
  final String? slug;

  Map<String, dynamic> toJson() {
    return {'name': name, 'slug': slug}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Organization &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          slug == other.slug;

  @override
  int get hashCode => name.hashCode ^ slug.hashCode;

  @override
  String toString() => 'Organization(name: $name, slug: $slug)';

  Organization copyWith({String? name, String? slug}) {
    return Organization(name: name ?? this.name, slug: slug ?? this.slug);
  }
}

/// Represents statistics about a process running on a machine.
@immutable
class ProcessStat {
  factory ProcessStat.fromJson(Map<String, dynamic> json) {
    return ProcessStat(
      command: json['command'] as String?,
      cpu: json['cpu'] as int?,
      directory: json['directory'] as String?,
      listenSockets:
          (json['listen_sockets'] as List<dynamic>?)
              ?.map((e) => ListenSocket.fromJson(e as Map<String, dynamic>))
              .toList(),
      pid: json['pid'] as int?,
      rss: json['rss'] as int?,
      rtime: json['rtime'] as int?,
      stime: json['stime'] as int?,
    );
  }
  const ProcessStat({
    this.command,
    this.cpu,
    this.directory,
    this.listenSockets,
    this.pid,
    this.rss,
    this.rtime,
    this.stime,
  });

  final String? command;
  final int? cpu;
  final String? directory;
  final List<ListenSocket>? listenSockets;
  final int? pid;
  final int? rss;
  final int? rtime;
  final int? stime;

  Map<String, dynamic> toJson() {
    return {
      'command': command,
      'cpu': cpu,
      'directory': directory,
      'listen_sockets': listenSockets?.map((e) => e.toJson()).toList(),
      'pid': pid,
      'rss': rss,
      'rtime': rtime,
      'stime': stime,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProcessStat &&
          runtimeType == other.runtimeType &&
          command == other.command &&
          cpu == other.cpu &&
          directory == other.directory &&
          const DeepCollectionEquality().equals(
            listenSockets,
            other.listenSockets,
          ) &&
          pid == other.pid &&
          rss == other.rss &&
          rtime == other.rtime &&
          stime == other.stime;

  @override
  int get hashCode =>
      command.hashCode ^
      cpu.hashCode ^
      directory.hashCode ^
      const DeepCollectionEquality().hash(listenSockets) ^
      pid.hashCode ^
      rss.hashCode ^
      rtime.hashCode ^
      stime.hashCode;

  @override
  String toString() =>
      'ProcessStat(command: $command, cpu: $cpu, directory: $directory, listenSockets: $listenSockets, pid: $pid, rss: $rss, rtime: $rtime, stime: $stime)';

  ProcessStat copyWith({
    String? command,
    int? cpu,
    String? directory,
    List<ListenSocket>? listenSockets,
    int? pid,
    int? rss,
    int? rtime,
    int? stime,
  }) {
    return ProcessStat(
      command: command ?? this.command,
      cpu: cpu ?? this.cpu,
      directory: directory ?? this.directory,
      listenSockets: listenSockets ?? this.listenSockets,
      pid: pid ?? this.pid,
      rss: rss ?? this.rss,
      rtime: rtime ?? this.rtime,
      stime: stime ?? this.stime,
    );
  }
}

/// Request body for sending a signal to a machine.
@immutable
class SignalRequest {
  factory SignalRequest.fromJson(Map<String, dynamic> json) {
    return SignalRequest(
      signal:
          json['signal'] == null
              ? null
              : SignalRequestSignal.fromJson(json['signal'] as String),
    );
  }
  const SignalRequest({this.signal});

  final SignalRequestSignal? signal;

  Map<String, dynamic> toJson() {
    return {'signal': signal?.toJson()}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignalRequest &&
          runtimeType == other.runtimeType &&
          signal == other.signal;

  @override
  int get hashCode => signal.hashCode;

  @override
  String toString() => 'SignalRequest(signal: $signal)';

  SignalRequest copyWith({SignalRequestSignal? signal}) {
    return SignalRequest(signal: signal ?? this.signal);
  }
}

/// Enum for signals that can be sent to a machine.
enum SignalRequestSignal {
  SIGABRT('SIGABRT'),
  SIGALRM('SIGALRM'),
  SIGFPE('SIGFPE'),
  SIGHUP('SIGHUP'),
  SIGILL('SIGILL'),
  SIGINT('SIGINT'),
  SIGKILL('SIGKILL'),
  SIGPIPE('SIGPIPE'),
  SIGQUIT('SIGQUIT'),
  SIGSEGV('SIGSEGV'),
  SIGTERM('SIGTERM'),
  SIGTRAP('SIGTRAP'),
  SIGUSR1('SIGUSR1');

  const SignalRequestSignal(this.value);
  final String value;

  static SignalRequestSignal? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Optional request body for stopping a machine.
@immutable
class StopRequest {
  // Changed FlyDuration to int based on analysis

  factory StopRequest.fromJson(Map<String, dynamic> json) {
    return StopRequest(
      signal: json['signal'] as String?,
      // Assuming 'timeout' in JSON is an integer representing seconds
      timeout: json['timeout'] as int?,
      // Original based on spec (problematic):
      // timeout: json['timeout'] == null ? null : FlyDuration.fromJson(json['timeout'] as Map<String, dynamic>),
    );
  }
  const StopRequest({this.signal, this.timeout});

  final String? signal;

  /// Represents a duration as an integer (likely seconds).
  /// See description for `Machines_restart` `timeout` parameter.
  final int? timeout;

  Map<String, dynamic> toJson() {
    return {
      'signal': signal,
      // Assuming 'timeout' in JSON should be an integer
      'timeout': timeout,
      // Original based on spec (problematic):
      // 'timeout': timeout?.toJson(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StopRequest &&
          runtimeType == other.runtimeType &&
          signal == other.signal &&
          timeout == other.timeout;

  @override
  int get hashCode => signal.hashCode ^ timeout.hashCode;

  @override
  String toString() => 'StopRequest(signal: $signal, timeout: $timeout)';

  StopRequest copyWith({
    String? signal,
    int? timeout, // Changed FlyDuration? to int?
  }) {
    return StopRequest(
      signal: signal ?? this.signal,
      timeout: timeout ?? this.timeout,
    );
  }
}

/// Request body for updating a machine.
@immutable
class UpdateMachineRequest {
  factory UpdateMachineRequest.fromJson(Map<String, dynamic> json) {
    return UpdateMachineRequest(
      config:
          json['config'] == null
              ? null
              : FlyMachineConfig.fromJson(
                json['config'] as Map<String, dynamic>,
              ),
      currentVersion: json['current_version'] as String?,
      leaseTtl: json['lease_ttl'] as int?,
      lsvd: json['lsvd'] as bool?,
      name: json['name'] as String?,
      region: json['region'] as String?,
      skipLaunch: json['skip_launch'] as bool?,
      skipServiceRegistration: json['skip_service_registration'] as bool?,
    );
  }
  const UpdateMachineRequest({
    this.config,
    this.currentVersion,
    this.leaseTtl,
    this.lsvd,
    this.name,
    this.region,
    this.skipLaunch,
    this.skipServiceRegistration,
  });

  /// An object defining the Machine configuration
  final FlyMachineConfig? config;
  final String? currentVersion;
  final int? leaseTtl;
  final bool? lsvd;

  /// Unique name for this Machine. If omitted, one is generated for you
  final String? name;

  /// The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).
  final String? region;
  final bool? skipLaunch;
  final bool? skipServiceRegistration;

  Map<String, dynamic> toJson() {
    return {
      'config': config?.toJson(),
      'current_version': currentVersion,
      'lease_ttl': leaseTtl,
      'lsvd': lsvd,
      'name': name,
      'region': region,
      'skip_launch': skipLaunch,
      'skip_service_registration': skipServiceRegistration,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateMachineRequest &&
          runtimeType == other.runtimeType &&
          config == other.config &&
          currentVersion == other.currentVersion &&
          leaseTtl == other.leaseTtl &&
          lsvd == other.lsvd &&
          name == other.name &&
          region == other.region &&
          skipLaunch == other.skipLaunch &&
          skipServiceRegistration == other.skipServiceRegistration;

  @override
  int get hashCode =>
      config.hashCode ^
      currentVersion.hashCode ^
      leaseTtl.hashCode ^
      lsvd.hashCode ^
      name.hashCode ^
      region.hashCode ^
      skipLaunch.hashCode ^
      skipServiceRegistration.hashCode;

  @override
  String toString() =>
      'UpdateMachineRequest(config: $config, currentVersion: $currentVersion, leaseTtl: $leaseTtl, lsvd: $lsvd, name: $name, region: $region, skipLaunch: $skipLaunch, skipServiceRegistration: $skipServiceRegistration)';

  UpdateMachineRequest copyWith({
    FlyMachineConfig? config,
    String? currentVersion,
    int? leaseTtl,
    bool? lsvd,
    String? name,
    String? region,
    bool? skipLaunch,
    bool? skipServiceRegistration,
  }) {
    return UpdateMachineRequest(
      config: config ?? this.config,
      currentVersion: currentVersion ?? this.currentVersion,
      leaseTtl: leaseTtl ?? this.leaseTtl,
      lsvd: lsvd ?? this.lsvd,
      name: name ?? this.name,
      region: region ?? this.region,
      skipLaunch: skipLaunch ?? this.skipLaunch,
      skipServiceRegistration:
          skipServiceRegistration ?? this.skipServiceRegistration,
    );
  }
}

/// Request body for updating a volume.
@immutable
class UpdateVolumeRequest {
  factory UpdateVolumeRequest.fromJson(Map<String, dynamic> json) {
    return UpdateVolumeRequest(
      autoBackupEnabled: json['auto_backup_enabled'] as bool?,
      snapshotRetention: json['snapshot_retention'] as int?,
    );
  }
  const UpdateVolumeRequest({this.autoBackupEnabled, this.snapshotRetention});

  final bool? autoBackupEnabled;
  final int? snapshotRetention;

  Map<String, dynamic> toJson() {
    return {
      'auto_backup_enabled': autoBackupEnabled,
      'snapshot_retention': snapshotRetention,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateVolumeRequest &&
          runtimeType == other.runtimeType &&
          autoBackupEnabled == other.autoBackupEnabled &&
          snapshotRetention == other.snapshotRetention;

  @override
  int get hashCode => autoBackupEnabled.hashCode ^ snapshotRetention.hashCode;

  @override
  String toString() =>
      'UpdateVolumeRequest(autoBackupEnabled: $autoBackupEnabled, snapshotRetention: $snapshotRetention)';

  UpdateVolumeRequest copyWith({
    bool? autoBackupEnabled,
    int? snapshotRetention,
  }) {
    return UpdateVolumeRequest(
      autoBackupEnabled: autoBackupEnabled ?? this.autoBackupEnabled,
      snapshotRetention: snapshotRetention ?? this.snapshotRetention,
    );
  }
}

/// Represents a Fly Volume.
@immutable
class Volume {
  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      attachedAllocId: json['attached_alloc_id'] as String?,
      attachedMachineId: json['attached_machine_id'] as String?,
      autoBackupEnabled: json['auto_backup_enabled'] as bool?,
      blockSize: json['block_size'] as int?,
      blocks: json['blocks'] as int?,
      blocksAvail: json['blocks_avail'] as int?,
      blocksFree: json['blocks_free'] as int?,
      createdAt: json['created_at'] as String?,
      encrypted: json['encrypted'] as bool?,
      fstype: json['fstype'] as String?,
      hostStatus:
          json['host_status'] == null
              ? null
              : VolumeHostStatus.fromJson(json['host_status'] as String),
      id: json['id'] as String?,
      name: json['name'] as String?,
      region: json['region'] as String?,
      sizeGb: json['size_gb'] as int?,
      snapshotRetention: json['snapshot_retention'] as int?,
      state: json['state'] as String?,
      zone: json['zone'] as String?,
    );
  }
  const Volume({
    this.attachedAllocId,
    this.attachedMachineId,
    this.autoBackupEnabled,
    this.blockSize,
    this.blocks,
    this.blocksAvail,
    this.blocksFree,
    this.createdAt,
    this.encrypted,
    this.fstype,
    this.hostStatus,
    this.id,
    this.name,
    this.region,
    this.sizeGb,
    this.snapshotRetention,
    this.state,
    this.zone,
  });

  final String? attachedAllocId;
  final String? attachedMachineId;
  final bool? autoBackupEnabled;
  final int? blockSize;
  final int? blocks;
  final int? blocksAvail;
  final int? blocksFree;
  final String? createdAt;
  final bool? encrypted;
  final String? fstype;
  final VolumeHostStatus? hostStatus;
  final String? id;
  final String? name;
  final String? region;
  final int? sizeGb;
  final int? snapshotRetention;
  final String? state;
  final String? zone;

  Map<String, dynamic> toJson() {
    return {
      'attached_alloc_id': attachedAllocId,
      'attached_machine_id': attachedMachineId,
      'auto_backup_enabled': autoBackupEnabled,
      'block_size': blockSize,
      'blocks': blocks,
      'blocks_avail': blocksAvail,
      'blocks_free': blocksFree,
      'created_at': createdAt,
      'encrypted': encrypted,
      'fstype': fstype,
      'host_status': hostStatus?.toJson(),
      'id': id,
      'name': name,
      'region': region,
      'size_gb': sizeGb,
      'snapshot_retention': snapshotRetention,
      'state': state,
      'zone': zone,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Volume &&
          runtimeType == other.runtimeType &&
          attachedAllocId == other.attachedAllocId &&
          attachedMachineId == other.attachedMachineId &&
          autoBackupEnabled == other.autoBackupEnabled &&
          blockSize == other.blockSize &&
          blocks == other.blocks &&
          blocksAvail == other.blocksAvail &&
          blocksFree == other.blocksFree &&
          createdAt == other.createdAt &&
          encrypted == other.encrypted &&
          fstype == other.fstype &&
          hostStatus == other.hostStatus &&
          id == other.id &&
          name == other.name &&
          region == other.region &&
          sizeGb == other.sizeGb &&
          snapshotRetention == other.snapshotRetention &&
          state == other.state &&
          zone == other.zone;

  @override
  int get hashCode =>
      attachedAllocId.hashCode ^
      attachedMachineId.hashCode ^
      autoBackupEnabled.hashCode ^
      blockSize.hashCode ^
      blocks.hashCode ^
      blocksAvail.hashCode ^
      blocksFree.hashCode ^
      createdAt.hashCode ^
      encrypted.hashCode ^
      fstype.hashCode ^
      hostStatus.hashCode ^
      id.hashCode ^
      name.hashCode ^
      region.hashCode ^
      sizeGb.hashCode ^
      snapshotRetention.hashCode ^
      state.hashCode ^
      zone.hashCode;

  @override
  String toString() =>
      'Volume(attachedAllocId: $attachedAllocId, attachedMachineId: $attachedMachineId, autoBackupEnabled: $autoBackupEnabled, blockSize: $blockSize, blocks: $blocks, blocksAvail: $blocksAvail, blocksFree: $blocksFree, createdAt: $createdAt, encrypted: $encrypted, fstype: $fstype, hostStatus: $hostStatus, id: $id, name: $name, region: $region, sizeGb: $sizeGb, snapshotRetention: $snapshotRetention, state: $state, zone: $zone)';

  Volume copyWith({
    String? attachedAllocId,
    String? attachedMachineId,
    bool? autoBackupEnabled,
    int? blockSize,
    int? blocks,
    int? blocksAvail,
    int? blocksFree,
    String? createdAt,
    bool? encrypted,
    String? fstype,
    VolumeHostStatus? hostStatus,
    String? id,
    String? name,
    String? region,
    int? sizeGb,
    int? snapshotRetention,
    String? state,
    String? zone,
  }) {
    return Volume(
      attachedAllocId: attachedAllocId ?? this.attachedAllocId,
      attachedMachineId: attachedMachineId ?? this.attachedMachineId,
      autoBackupEnabled: autoBackupEnabled ?? this.autoBackupEnabled,
      blockSize: blockSize ?? this.blockSize,
      blocks: blocks ?? this.blocks,
      blocksAvail: blocksAvail ?? this.blocksAvail,
      blocksFree: blocksFree ?? this.blocksFree,
      createdAt: createdAt ?? this.createdAt,
      encrypted: encrypted ?? this.encrypted,
      fstype: fstype ?? this.fstype,
      hostStatus: hostStatus ?? this.hostStatus,
      id: id ?? this.id,
      name: name ?? this.name,
      region: region ?? this.region,
      sizeGb: sizeGb ?? this.sizeGb,
      snapshotRetention: snapshotRetention ?? this.snapshotRetention,
      state: state ?? this.state,
      zone: zone ?? this.zone,
    );
  }
}

/// Enum for Volume host status.
enum VolumeHostStatus {
  ok('ok'),
  unknown('unknown'),
  unreachable('unreachable');

  const VolumeHostStatus(this.value);
  final String value;

  static VolumeHostStatus? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Represents a snapshot of a Fly Volume.
@immutable
class VolumeSnapshot {
  factory VolumeSnapshot.fromJson(Map<String, dynamic> json) {
    return VolumeSnapshot(
      createdAt: json['created_at'] as String?,
      digest: json['digest'] as String?,
      id: json['id'] as String?,
      retentionDays: json['retention_days'] as int?,
      size: json['size'] as int?,
      status: json['status'] as String?,
    );
  }
  const VolumeSnapshot({
    this.createdAt,
    this.digest,
    this.id,
    this.retentionDays,
    this.size,
    this.status,
  });

  final String? createdAt;
  final String? digest;
  final String? id;
  final int? retentionDays;
  final int? size;
  final String? status;

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'digest': digest,
      'id': id,
      'retention_days': retentionDays,
      'size': size,
      'status': status,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeSnapshot &&
          runtimeType == other.runtimeType &&
          createdAt == other.createdAt &&
          digest == other.digest &&
          id == other.id &&
          retentionDays == other.retentionDays &&
          size == other.size &&
          status == other.status;

  @override
  int get hashCode =>
      createdAt.hashCode ^
      digest.hashCode ^
      id.hashCode ^
      retentionDays.hashCode ^
      size.hashCode ^
      status.hashCode;

  @override
  String toString() =>
      'VolumeSnapshot(createdAt: $createdAt, digest: $digest, id: $id, retentionDays: $retentionDays, size: $size, status: $status)';

  VolumeSnapshot copyWith({
    String? createdAt,
    String? digest,
    String? id,
    int? retentionDays,
    int? size,
    String? status,
  }) {
    return VolumeSnapshot(
      createdAt: createdAt ?? this.createdAt,
      digest: digest ?? this.digest,
      id: id ?? this.id,
      retentionDays: retentionDays ?? this.retentionDays,
      size: size ?? this.size,
      status: status ?? this.status,
    );
  }
}

/// Configuration for a container within a machine.
@immutable
class FlyContainerConfig {
  factory FlyContainerConfig.fromJson(Map<String, dynamic> json) {
    return FlyContainerConfig(
      cmd: (json['cmd'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dependsOn:
          (json['depends_on'] as List<dynamic>?)
              ?.map(
                (e) =>
                    FlyContainerDependency.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      entrypoint:
          (json['entrypoint'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      env:
          json['env'] == null
              ? null
              : Map<String, String>.from(json['env'] as Map),
      envFrom:
          (json['env_from'] as List<dynamic>?)
              ?.map((e) => FlyEnvFrom.fromJson(e as Map<String, dynamic>))
              .toList(),
      exec: (json['exec'] as List<dynamic>?)?.map((e) => e as String).toList(),
      files:
          (json['files'] as List<dynamic>?)
              ?.map((e) => FlyFile.fromJson(e as Map<String, dynamic>))
              .toList(),
      healthchecks:
          (json['healthchecks'] as List<dynamic>?)
              ?.map(
                (e) =>
                    FlyContainerHealthcheck.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      image: json['image'] as String?,
      mounts:
          (json['mounts'] as List<dynamic>?)
              ?.map(
                (e) => FlyContainerMount.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      name: json['name'] as String?,
      restart:
          json['restart'] == null
              ? null
              : FlyMachineRestart.fromJson(
                json['restart'] as Map<String, dynamic>,
              ),
      secrets:
          (json['secrets'] as List<dynamic>?)
              ?.map((e) => FlyMachineSecret.fromJson(e as Map<String, dynamic>))
              .toList(),
      stop:
          json['stop'] == null
              ? null
              : FlyStopConfig.fromJson(json['stop'] as Map<String, dynamic>),
      user: json['user'] as String?,
    );
  }
  const FlyContainerConfig({
    this.cmd,
    this.dependsOn,
    this.entrypoint,
    this.env,
    this.envFrom,
    this.exec,
    this.files,
    this.healthchecks,
    this.image,
    this.mounts,
    this.name,
    this.restart,
    this.secrets,
    this.stop,
    this.user,
  });

  /// CmdOverride is used to override the default command of the image.
  final List<String>? cmd;

  /// DependsOn can be used to define dependencies between containers. The container will only be
  /// started after all of its dependent conditions have been satisfied.
  final List<FlyContainerDependency>? dependsOn;

  /// EntrypointOverride is used to override the default entrypoint of the image.
  final List<String>? entrypoint;

  /// ExtraEnv is used to add additional environment variables to the container.
  final Map<String, String>? env;

  /// EnvFrom can be provided to set environment variables from machine fields.
  final List<FlyEnvFrom>? envFrom;

  /// Image Config overrides - these fields are used to override the image configuration.
  /// If not provided, the image configuration will be used.
  /// ExecOverride is used to override the default command of the image.
  final List<String>? exec;

  /// Files are files that will be written to the container file system.
  final List<FlyFile>? files;

  /// Healthchecks determine the health of your containers. Healthchecks can use HTTP, TCP or an Exec command.
  final List<FlyContainerHealthcheck>? healthchecks;

  /// Image is the docker image to run.
  final String? image;

  /// Set of mounts added to the container. These must reference a volume in the machine config via its name.
  final List<FlyContainerMount>? mounts;

  /// Name is used to identify the container in the machine.
  final String? name;

  /// Restart is used to define the restart policy for the container. NOTE: spot-price is not
  /// supported for containers.
  final FlyMachineRestart? restart;

  /// Secrets can be provided at the process level to explicitly indicate which secrets should be
  /// used for the process. If not provided, the secrets provided at the machine level will be used.
  final List<FlyMachineSecret>? secrets;

  /// Stop is used to define the signal and timeout for stopping the container.
  final FlyStopConfig? stop;

  /// UserOverride is used to override the default user of the image.
  final String? user;

  Map<String, dynamic> toJson() {
    return {
      'cmd': cmd,
      'depends_on': dependsOn?.map((e) => e.toJson()).toList(),
      'entrypoint': entrypoint,
      'env': env,
      'env_from': envFrom?.map((e) => e.toJson()).toList(),
      'exec': exec,
      'files': files?.map((e) => e.toJson()).toList(),
      'healthchecks': healthchecks?.map((e) => e.toJson()).toList(),
      'image': image,
      'mounts': mounts?.map((e) => e.toJson()).toList(),
      'name': name,
      'restart': restart?.toJson(),
      'secrets': secrets?.map((e) => e.toJson()).toList(),
      'stop': stop?.toJson(),
      'user': user,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyContainerConfig &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(cmd, other.cmd) &&
          const DeepCollectionEquality().equals(dependsOn, other.dependsOn) &&
          const DeepCollectionEquality().equals(entrypoint, other.entrypoint) &&
          const DeepCollectionEquality().equals(env, other.env) &&
          const DeepCollectionEquality().equals(envFrom, other.envFrom) &&
          const DeepCollectionEquality().equals(exec, other.exec) &&
          const DeepCollectionEquality().equals(files, other.files) &&
          const DeepCollectionEquality().equals(
            healthchecks,
            other.healthchecks,
          ) &&
          image == other.image &&
          const DeepCollectionEquality().equals(mounts, other.mounts) &&
          name == other.name &&
          restart == other.restart &&
          const DeepCollectionEquality().equals(secrets, other.secrets) &&
          stop == other.stop &&
          user == other.user;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cmd) ^
      const DeepCollectionEquality().hash(dependsOn) ^
      const DeepCollectionEquality().hash(entrypoint) ^
      const DeepCollectionEquality().hash(env) ^
      const DeepCollectionEquality().hash(envFrom) ^
      const DeepCollectionEquality().hash(exec) ^
      const DeepCollectionEquality().hash(files) ^
      const DeepCollectionEquality().hash(healthchecks) ^
      image.hashCode ^
      const DeepCollectionEquality().hash(mounts) ^
      name.hashCode ^
      restart.hashCode ^
      const DeepCollectionEquality().hash(secrets) ^
      stop.hashCode ^
      user.hashCode;

  @override
  String toString() =>
      'FlyContainerConfig(cmd: $cmd, dependsOn: $dependsOn, entrypoint: $entrypoint, env: $env, envFrom: $envFrom, exec: $exec, files: $files, healthchecks: $healthchecks, image: $image, mounts: $mounts, name: $name, restart: $restart, secrets: $secrets, stop: $stop, user: $user)';

  FlyContainerConfig copyWith({
    List<String>? cmd,
    List<FlyContainerDependency>? dependsOn,
    List<String>? entrypoint,
    Map<String, String>? env,
    List<FlyEnvFrom>? envFrom,
    List<String>? exec,
    List<FlyFile>? files,
    List<FlyContainerHealthcheck>? healthchecks,
    String? image,
    List<FlyContainerMount>? mounts,
    String? name,
    FlyMachineRestart? restart,
    List<FlyMachineSecret>? secrets,
    FlyStopConfig? stop,
    String? user,
  }) {
    return FlyContainerConfig(
      cmd: cmd ?? this.cmd,
      dependsOn: dependsOn ?? this.dependsOn,
      entrypoint: entrypoint ?? this.entrypoint,
      env: env ?? this.env,
      envFrom: envFrom ?? this.envFrom,
      exec: exec ?? this.exec,
      files: files ?? this.files,
      healthchecks: healthchecks ?? this.healthchecks,
      image: image ?? this.image,
      mounts: mounts ?? this.mounts,
      name: name ?? this.name,
      restart: restart ?? this.restart,
      secrets: secrets ?? this.secrets,
      stop: stop ?? this.stop,
      user: user ?? this.user,
    );
  }
}

/// Defines a dependency between containers.
@immutable
class FlyContainerDependency {
  factory FlyContainerDependency.fromJson(Map<String, dynamic> json) {
    return FlyContainerDependency(
      condition:
          json['condition'] == null
              ? null
              : FlyContainerDependencyCondition.fromJson(
                json['condition'] as String,
              ),
      name: json['name'] as String?,
    );
  }
  const FlyContainerDependency({this.condition, this.name});

  final FlyContainerDependencyCondition? condition;
  final String? name;

  Map<String, dynamic> toJson() {
    return {'condition': condition?.toJson(), 'name': name}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyContainerDependency &&
          runtimeType == other.runtimeType &&
          condition == other.condition &&
          name == other.name;

  @override
  int get hashCode => condition.hashCode ^ name.hashCode;

  @override
  String toString() =>
      'FlyContainerDependency(condition: $condition, name: $name)';

  FlyContainerDependency copyWith({
    FlyContainerDependencyCondition? condition,
    String? name,
  }) {
    return FlyContainerDependency(
      condition: condition ?? this.condition,
      name: name ?? this.name,
    );
  }
}

/// Condition for a container dependency.
enum FlyContainerDependencyCondition {
  exitedSuccessfully('exited_successfully'),
  healthy('healthy'),
  started('started');

  const FlyContainerDependencyCondition(this.value);
  final String value;

  static FlyContainerDependencyCondition? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Configuration for a container health check.
@immutable
class FlyContainerHealthcheck {
  factory FlyContainerHealthcheck.fromJson(Map<String, dynamic> json) {
    return FlyContainerHealthcheck(
      exec:
          json['exec'] == null
              ? null
              : FlyExecHealthcheck.fromJson(
                json['exec'] as Map<String, dynamic>,
              ),
      failureThreshold: json['failure_threshold'] as int?,
      gracePeriod: json['grace_period'] as int?,
      http:
          json['http'] == null
              ? null
              : FlyHTTPHealthcheck.fromJson(
                json['http'] as Map<String, dynamic>,
              ),
      interval: json['interval'] as int?,
      kind:
          json['kind'] == null
              ? null
              : FlyContainerHealthcheckKind.fromJson(json['kind'] as String),
      name: json['name'] as String?,
      successThreshold: json['success_threshold'] as int?,
      tcp:
          json['tcp'] == null
              ? null
              : FlyTCPHealthcheck.fromJson(json['tcp'] as Map<String, dynamic>),
      timeout: json['timeout'] as int?,
      unhealthy:
          json['unhealthy'] == null
              ? null
              : FlyUnhealthyPolicy.fromJson(json['unhealthy'] as String),
    );
  }
  const FlyContainerHealthcheck({
    this.exec,
    this.failureThreshold,
    this.gracePeriod,
    this.http,
    this.interval,
    this.kind,
    this.name,
    this.successThreshold,
    this.tcp,
    this.timeout,
    this.unhealthy,
  });

  final FlyExecHealthcheck? exec;

  /// The number of times the check must fail before considering the container unhealthy.
  final int? failureThreshold;

  /// The time in seconds to wait after a container starts before checking its health.
  final int? gracePeriod;
  final FlyHTTPHealthcheck? http;

  /// The time in seconds between executing the defined check.
  final int? interval;

  /// Kind of healthcheck (readiness, liveness)
  final FlyContainerHealthcheckKind? kind;

  /// The name of the check. Must be unique within the container.
  final String? name;

  /// The number of times the check must succeeed before considering the container healthy.
  final int? successThreshold;
  final FlyTCPHealthcheck? tcp;

  /// The time in seconds to wait for the check to complete.
  final int? timeout;

  /// Unhealthy policy that determines what action to take if a container is deemed unhealthy
  final FlyUnhealthyPolicy? unhealthy;

  Map<String, dynamic> toJson() {
    return {
      'exec': exec?.toJson(),
      'failure_threshold': failureThreshold,
      'grace_period': gracePeriod,
      'http': http?.toJson(),
      'interval': interval,
      'kind': kind?.toJson(),
      'name': name,
      'success_threshold': successThreshold,
      'tcp': tcp?.toJson(),
      'timeout': timeout,
      'unhealthy': unhealthy?.toJson(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyContainerHealthcheck &&
          runtimeType == other.runtimeType &&
          exec == other.exec &&
          failureThreshold == other.failureThreshold &&
          gracePeriod == other.gracePeriod &&
          http == other.http &&
          interval == other.interval &&
          kind == other.kind &&
          name == other.name &&
          successThreshold == other.successThreshold &&
          tcp == other.tcp &&
          timeout == other.timeout &&
          unhealthy == other.unhealthy;

  @override
  int get hashCode =>
      exec.hashCode ^
      failureThreshold.hashCode ^
      gracePeriod.hashCode ^
      http.hashCode ^
      interval.hashCode ^
      kind.hashCode ^
      name.hashCode ^
      successThreshold.hashCode ^
      tcp.hashCode ^
      timeout.hashCode ^
      unhealthy.hashCode;

  @override
  String toString() =>
      'FlyContainerHealthcheck(exec: $exec, failureThreshold: $failureThreshold, gracePeriod: $gracePeriod, http: $http, interval: $interval, kind: $kind, name: $name, successThreshold: $successThreshold, tcp: $tcp, timeout: $timeout, unhealthy: $unhealthy)';

  FlyContainerHealthcheck copyWith({
    FlyExecHealthcheck? exec,
    int? failureThreshold,
    int? gracePeriod,
    FlyHTTPHealthcheck? http,
    int? interval,
    FlyContainerHealthcheckKind? kind,
    String? name,
    int? successThreshold,
    FlyTCPHealthcheck? tcp,
    int? timeout,
    FlyUnhealthyPolicy? unhealthy,
  }) {
    return FlyContainerHealthcheck(
      exec: exec ?? this.exec,
      failureThreshold: failureThreshold ?? this.failureThreshold,
      gracePeriod: gracePeriod ?? this.gracePeriod,
      http: http ?? this.http,
      interval: interval ?? this.interval,
      kind: kind ?? this.kind,
      name: name ?? this.name,
      successThreshold: successThreshold ?? this.successThreshold,
      tcp: tcp ?? this.tcp,
      timeout: timeout ?? this.timeout,
      unhealthy: unhealthy ?? this.unhealthy,
    );
  }
}

/// Kind of container health check.
enum FlyContainerHealthcheckKind {
  readiness('readiness'),
  liveness('liveness');

  const FlyContainerHealthcheckKind(this.value);
  final String value;

  static FlyContainerHealthcheckKind? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Scheme for HTTP container health check.
enum FlyContainerHealthcheckScheme {
  http('http'),
  https('https');

  const FlyContainerHealthcheckScheme(this.value);
  final String value;

  static FlyContainerHealthcheckScheme? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Configuration for mounting a volume into a container.
@immutable
class FlyContainerMount {
  factory FlyContainerMount.fromJson(Map<String, dynamic> json) {
    return FlyContainerMount(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );
  }
  const FlyContainerMount({this.name, this.path});

  /// The name of the volume. Must exist in the volumes field in the machine configuration
  final String? name;

  /// The path to mount the volume within the container
  final String? path;

  Map<String, dynamic> toJson() {
    return {'name': name, 'path': path}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyContainerMount &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          path == other.path;

  @override
  int get hashCode => name.hashCode ^ path.hashCode;

  @override
  String toString() => 'FlyContainerMount(name: $name, path: $path)';

  FlyContainerMount copyWith({String? name, String? path}) {
    return FlyContainerMount(name: name ?? this.name, path: path ?? this.path);
  }
}

/// DNS configuration for a machine.
@immutable
class FlyDNSConfig {
  factory FlyDNSConfig.fromJson(Map<String, dynamic> json) {
    return FlyDNSConfig(
      dnsForwardRules:
          (json['dns_forward_rules'] as List<dynamic>?)
              ?.map(
                (e) => FlyDnsForwardRule.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      hostname: json['hostname'] as String?,
      hostnameFqdn: json['hostname_fqdn'] as String?,
      nameservers:
          (json['nameservers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => FlyDnsOption.fromJson(e as Map<String, dynamic>))
              .toList(),
      searches:
          (json['searches'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      skipRegistration: json['skip_registration'] as bool?,
    );
  }
  const FlyDNSConfig({
    this.dnsForwardRules,
    this.hostname,
    this.hostnameFqdn,
    this.nameservers,
    this.options,
    this.searches,
    this.skipRegistration,
  });

  final List<FlyDnsForwardRule>? dnsForwardRules;
  final String? hostname;
  final String? hostnameFqdn;
  final List<String>? nameservers;
  final List<FlyDnsOption>? options;
  final List<String>? searches;
  final bool? skipRegistration;

  Map<String, dynamic> toJson() {
    return {
      'dns_forward_rules': dnsForwardRules?.map((e) => e.toJson()).toList(),
      'hostname': hostname,
      'hostname_fqdn': hostnameFqdn,
      'nameservers': nameservers,
      'options': options?.map((e) => e.toJson()).toList(),
      'searches': searches,
      'skip_registration': skipRegistration,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyDNSConfig &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(
            dnsForwardRules,
            other.dnsForwardRules,
          ) &&
          hostname == other.hostname &&
          hostnameFqdn == other.hostnameFqdn &&
          const DeepCollectionEquality().equals(
            nameservers,
            other.nameservers,
          ) &&
          const DeepCollectionEquality().equals(options, other.options) &&
          const DeepCollectionEquality().equals(searches, other.searches) &&
          skipRegistration == other.skipRegistration;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(dnsForwardRules) ^
      hostname.hashCode ^
      hostnameFqdn.hashCode ^
      const DeepCollectionEquality().hash(nameservers) ^
      const DeepCollectionEquality().hash(options) ^
      const DeepCollectionEquality().hash(searches) ^
      skipRegistration.hashCode;

  @override
  String toString() =>
      'FlyDNSConfig(dnsForwardRules: $dnsForwardRules, hostname: $hostname, hostnameFqdn: $hostnameFqdn, nameservers: $nameservers, options: $options, searches: $searches, skipRegistration: $skipRegistration)';

  FlyDNSConfig copyWith({
    List<FlyDnsForwardRule>? dnsForwardRules,
    String? hostname,
    String? hostnameFqdn,
    List<String>? nameservers,
    List<FlyDnsOption>? options,
    List<String>? searches,
    bool? skipRegistration,
  }) {
    return FlyDNSConfig(
      dnsForwardRules: dnsForwardRules ?? this.dnsForwardRules,
      hostname: hostname ?? this.hostname,
      hostnameFqdn: hostnameFqdn ?? this.hostnameFqdn,
      nameservers: nameservers ?? this.nameservers,
      options: options ?? this.options,
      searches: searches ?? this.searches,
      skipRegistration: skipRegistration ?? this.skipRegistration,
    );
  }
}

/// Represents a duration, likely in seconds based on context.
/// The OpenAPI schema `fly.Duration` is ambiguous/potentially incorrect.
/// We represent it as an integer (seconds) for JSON serialization,
/// matching parameter descriptions like "Go duration string or number of seconds".
@immutable
class FlyDuration {
  /// Creates a FlyDuration from a Dart Duration.
  factory FlyDuration.fromDuration(Duration duration) {
    return FlyDuration(seconds: duration.inSeconds);
  }

  factory FlyDuration.fromJson(Map<String, dynamic> json) {
    // The schema has a strange "time.Duration" key. We'll assume
    // the actual JSON payload uses a simpler structure or just an integer.
    // Prioritize parsing a direct integer value if present.
    if (json.keys.length == 1 && json.values.first is int) {
      return FlyDuration(seconds: json.values.first as int);
    }
    // Fallback for the potentially incorrect spec structure
    final durationValue = json['time.Duration'];
    if (durationValue is int) {
      return FlyDuration(seconds: durationValue);
    }
    // If neither matches, return with null. Consider logging a warning.
    _logger.severe('Warning: Could not parse FlyDuration from JSON: $json');
    return const FlyDuration();
  }
  const FlyDuration({this.seconds});

  /// Duration in seconds.
  final int? seconds;

  /// Converts this FlyDuration to a Dart Duration.
  Duration? toDuration() {
    return seconds == null ? null : Duration(seconds: seconds!);
  }

  Map<String, dynamic> toJson() {
    // Serialize as a simple integer (seconds)
    return {
      // This key is likely NOT what the API expects, but follows the problematic spec
      // A simple integer might be correct, but requires API confirmation.
      // For safety, we match the spec's odd key, assuming it might be needed.
      // If API calls fail, try sending just the integer value directly: `return seconds;`
      'time.Duration': seconds,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyDuration &&
          runtimeType == other.runtimeType &&
          seconds == other.seconds;

  @override
  int get hashCode => seconds.hashCode;

  @override
  String toString() => 'FlyDuration(seconds: $seconds)';

  FlyDuration copyWith({int? seconds}) {
    return FlyDuration(seconds: seconds ?? this.seconds);
  }
}

/// EnvVar defines an environment variable to be populated from a machine field, env_var
@immutable
class FlyEnvFrom {
  factory FlyEnvFrom.fromJson(Map<String, dynamic> json) {
    return FlyEnvFrom(
      envVar: json['env_var'] as String?,
      fieldRef:
          json['field_ref'] == null
              ? null
              : FlyEnvFromFieldRef.fromJson(json['field_ref'] as String),
    );
  }
  const FlyEnvFrom({this.envVar, this.fieldRef});

  /// EnvVar is required and is the name of the environment variable that will be set from the
  /// secret. It must be a valid environment variable name.
  final String? envVar;

  /// FieldRef selects a field of the Machine: supports id, version, app_name, private_ip, region, image.
  final FlyEnvFromFieldRef? fieldRef;

  Map<String, dynamic> toJson() {
    return {'env_var': envVar, 'field_ref': fieldRef?.toJson()}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyEnvFrom &&
          runtimeType == other.runtimeType &&
          envVar == other.envVar &&
          fieldRef == other.fieldRef;

  @override
  int get hashCode => envVar.hashCode ^ fieldRef.hashCode;

  @override
  String toString() => 'FlyEnvFrom(envVar: $envVar, fieldRef: $fieldRef)';

  FlyEnvFrom copyWith({String? envVar, FlyEnvFromFieldRef? fieldRef}) {
    return FlyEnvFrom(
      envVar: envVar ?? this.envVar,
      fieldRef: fieldRef ?? this.fieldRef,
    );
  }
}

/// Field reference for environment variable source.
enum FlyEnvFromFieldRef {
  id('id'),
  version('version'),
  appName('app_name'),
  privateIp('private_ip'),
  region('region'),
  image('image');

  const FlyEnvFromFieldRef(this.value);
  final String value;

  static FlyEnvFromFieldRef? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Configuration for an exec-based container health check.
@immutable
class FlyExecHealthcheck {
  factory FlyExecHealthcheck.fromJson(Map<String, dynamic> json) {
    return FlyExecHealthcheck(
      command:
          (json['command'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
  const FlyExecHealthcheck({this.command});

  /// The command to run to check the health of the container (e.g. ["cat", "/tmp/healthy"])
  final List<String>? command;

  Map<String, dynamic> toJson() {
    return {'command': command}..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyExecHealthcheck &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(command, other.command);

  @override
  int get hashCode => const DeepCollectionEquality().hash(command);

  @override
  String toString() => 'FlyExecHealthcheck(command: $command)';

  FlyExecHealthcheck copyWith({List<String>? command}) {
    return FlyExecHealthcheck(command: command ?? this.command);
  }
}

/// A file that will be written to the Machine. One of RawValue or SecretName must be set.
@immutable
class FlyFile {
  factory FlyFile.fromJson(Map<String, dynamic> json) {
    return FlyFile(
      guestPath: json['guest_path'] as String?,
      mode: json['mode'] as int?,
      rawValue: json['raw_value'] as String?,
      secretName: json['secret_name'] as String?,
    );
  }
  const FlyFile({this.guestPath, this.mode, this.rawValue, this.secretName});

  /// GuestPath is the path on the machine where the file will be written and must be an absolute path.
  /// For example: /full/path/to/file.json
  final String? guestPath;

  /// Mode bits used to set permissions on this file as accepted by chmod(2).
  final int? mode;

  /// The base64 encoded string of the file contents.
  final String? rawValue;

  /// The name of the secret that contains the base64 encoded file contents.
  final String? secretName;

  Map<String, dynamic> toJson() {
    return {
      'guest_path': guestPath,
      'mode': mode,
      'raw_value': rawValue,
      'secret_name': secretName,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyFile &&
          runtimeType == other.runtimeType &&
          guestPath == other.guestPath &&
          mode == other.mode &&
          rawValue == other.rawValue &&
          secretName == other.secretName;

  @override
  int get hashCode =>
      guestPath.hashCode ^
      mode.hashCode ^
      rawValue.hashCode ^
      secretName.hashCode;

  @override
  String toString() =>
      'FlyFile(guestPath: $guestPath, mode: $mode, rawValue: $rawValue, secretName: $secretName)';

  FlyFile copyWith({
    String? guestPath,
    int? mode,
    String? rawValue,
    String? secretName,
  }) {
    return FlyFile(
      guestPath: guestPath ?? this.guestPath,
      mode: mode ?? this.mode,
      rawValue: rawValue ?? this.rawValue,
      secretName: secretName ?? this.secretName,
    );
  }
}

/// Configuration for an HTTP-based container health check.
@immutable
class FlyHTTPHealthcheck {
  factory FlyHTTPHealthcheck.fromJson(Map<String, dynamic> json) {
    return FlyHTTPHealthcheck(
      headers:
          (json['headers'] as List<dynamic>?)
              ?.map(
                (e) => FlyMachineHTTPHeader.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      method: json['method'] as String?,
      path: json['path'] as String?,
      port: json['port'] as int?,
      scheme:
          json['scheme'] == null
              ? null
              : FlyContainerHealthcheckScheme.fromJson(
                json['scheme'] as String,
              ),
      tlsServerName: json['tls_server_name'] as String?,
      tlsSkipVerify: json['tls_skip_verify'] as bool?,
    );
  }
  const FlyHTTPHealthcheck({
    this.headers,
    this.method,
    this.path,
    this.port,
    this.scheme,
    this.tlsServerName,
    this.tlsSkipVerify,
  });

  /// Additional headers to send with the request
  final List<FlyMachineHTTPHeader>? headers;

  /// The HTTP method to use to when making the request
  final String? method;

  /// The path to send the request to
  final String? path;

  /// The port to connect to, often the same as internal_port
  final int? port;

  /// Whether to use http or https
  final FlyContainerHealthcheckScheme? scheme;

  /// If the protocol is https, the hostname to use for TLS certificate validation
  final String? tlsServerName;

  /// If the protocol is https, whether or not to verify the TLS certificate
  final bool? tlsSkipVerify;

  Map<String, dynamic> toJson() {
    return {
      'headers': headers?.map((e) => e.toJson()).toList(),
      'method': method,
      'path': path,
      'port': port,
      'scheme': scheme?.toJson(),
      'tls_server_name': tlsServerName,
      'tls_skip_verify': tlsSkipVerify,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyHTTPHealthcheck &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(headers, other.headers) &&
          method == other.method &&
          path == other.path &&
          port == other.port &&
          scheme == other.scheme &&
          tlsServerName == other.tlsServerName &&
          tlsSkipVerify == other.tlsSkipVerify;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(headers) ^
      method.hashCode ^
      path.hashCode ^
      port.hashCode ^
      scheme.hashCode ^
      tlsServerName.hashCode ^
      tlsSkipVerify.hashCode;

  @override
  String toString() =>
      'FlyHTTPHealthcheck(headers: $headers, method: $method, path: $path, port: $port, scheme: $scheme, tlsServerName: $tlsServerName, tlsSkipVerify: $tlsSkipVerify)';

  FlyHTTPHealthcheck copyWith({
    List<FlyMachineHTTPHeader>? headers,
    String? method,
    String? path,
    int? port,
    FlyContainerHealthcheckScheme? scheme,
    String? tlsServerName,
    bool? tlsSkipVerify,
  }) {
    return FlyHTTPHealthcheck(
      headers: headers ?? this.headers,
      method: method ?? this.method,
      path: path ?? this.path,
      port: port ?? this.port,
      scheme: scheme ?? this.scheme,
      tlsServerName: tlsServerName ?? this.tlsServerName,
      tlsSkipVerify: tlsSkipVerify ?? this.tlsSkipVerify,
    );
  }
}

/// HTTP options for a machine service port.
@immutable
class FlyHTTPOptions {
  factory FlyHTTPOptions.fromJson(Map<String, dynamic> json) {
    return FlyHTTPOptions(
      compress: json['compress'] as bool?,
      h2Backend: json['h2_backend'] as bool?,
      headersReadTimeout: json['headers_read_timeout'] as int?,
      idleTimeout: json['idle_timeout'] as int?,
      response:
          json['response'] == null
              ? null
              : FlyHTTPResponseOptions.fromJson(
                json['response'] as Map<String, dynamic>,
              ),
    );
  }
  const FlyHTTPOptions({
    this.compress,
    this.h2Backend,
    this.headersReadTimeout,
    this.idleTimeout,
    this.response,
  });

  final bool? compress;
  final bool? h2Backend;
  final int? headersReadTimeout;
  final int? idleTimeout;
  final FlyHTTPResponseOptions? response;

  Map<String, dynamic> toJson() {
    return {
      'compress': compress,
      'h2_backend': h2Backend,
      'headers_read_timeout': headersReadTimeout,
      'idle_timeout': idleTimeout,
      'response': response?.toJson(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyHTTPOptions &&
          runtimeType == other.runtimeType &&
          compress == other.compress &&
          h2Backend == other.h2Backend &&
          headersReadTimeout == other.headersReadTimeout &&
          idleTimeout == other.idleTimeout &&
          response == other.response;

  @override
  int get hashCode =>
      compress.hashCode ^
      h2Backend.hashCode ^
      headersReadTimeout.hashCode ^
      idleTimeout.hashCode ^
      response.hashCode;

  @override
  String toString() =>
      'FlyHTTPOptions(compress: $compress, h2Backend: $h2Backend, headersReadTimeout: $headersReadTimeout, idleTimeout: $idleTimeout, response: $response)';

  FlyHTTPOptions copyWith({
    bool? compress,
    bool? h2Backend,
    int? headersReadTimeout,
    int? idleTimeout,
    FlyHTTPResponseOptions? response,
  }) {
    return FlyHTTPOptions(
      compress: compress ?? this.compress,
      h2Backend: h2Backend ?? this.h2Backend,
      headersReadTimeout: headersReadTimeout ?? this.headersReadTimeout,
      idleTimeout: idleTimeout ?? this.idleTimeout,
      response: response ?? this.response,
    );
  }
}

/// HTTP response options.
@immutable
class FlyHTTPResponseOptions {
  factory FlyHTTPResponseOptions.fromJson(Map<String, dynamic> json) {
    return FlyHTTPResponseOptions(
      headers:
          json['headers'] == null
              ? null
              : Map<String, dynamic>.from(json['headers'] as Map),
      pristine: json['pristine'] as bool?,
    );
  }
  const FlyHTTPResponseOptions({this.headers, this.pristine});

  final Map<String, dynamic>? headers;
  final bool? pristine;

  Map<String, dynamic> toJson() {
    return {'headers': headers, 'pristine': pristine}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyHTTPResponseOptions &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(headers, other.headers) &&
          pristine == other.pristine;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(headers) ^ pristine.hashCode;

  @override
  String toString() =>
      'FlyHTTPResponseOptions(headers: $headers, pristine: $pristine)';

  FlyHTTPResponseOptions copyWith({
    Map<String, dynamic>? headers,
    bool? pristine,
  }) {
    return FlyHTTPResponseOptions(
      headers: headers ?? this.headers,
      pristine: pristine ?? this.pristine,
    );
  }
}

/// An optional object that defines one or more named checks. The key for each check is the check name.
@immutable
class FlyMachineCheck {
  factory FlyMachineCheck.fromJson(Map<String, dynamic> json) {
    return FlyMachineCheck(
      gracePeriod: json['grace_period'] as String?,
      interval: json['interval'] as String?,
      method: json['method'] as String?,
      path: json['path'] as String?,
      port: json['port'] as int?,
      protocol: json['protocol'] as String?,
      timeout: json['timeout'] as String?,
      tlsServerName: json['tls_server_name'] as String?,
      tlsSkipVerify: json['tls_skip_verify'] as bool?,
      type: json['type'] as String?,
    );
  }
  const FlyMachineCheck({
    this.gracePeriod,
    this.interval,
    this.method,
    this.path,
    this.port,
    this.protocol,
    this.timeout,
    this.tlsServerName,
    this.tlsSkipVerify,
    this.type,
  });

  /// The time to wait after a VM starts before checking its health
  final String? gracePeriod;

  /// The time between connectivity checks
  final String? interval;

  /// For http checks, the HTTP method to use to when making the request
  final String? method;

  /// For http checks, the path to send the request to
  final String? path;

  /// The port to connect to, often the same as internal_port
  final int? port;

  /// For http checks, whether to use http or https
  final String? protocol;

  /// The maximum time a connection can take before being reported as failing its health check
  final String? timeout;

  /// If the protocol is https, the hostname to use for TLS certificate validation
  final String? tlsServerName;

  /// For http checks with https protocol, whether or not to verify the TLS certificate
  final bool? tlsSkipVerify;

  /// tcp or http
  final String? type;

  Map<String, dynamic> toJson() {
    return {
      'grace_period': gracePeriod,
      'interval': interval,
      'method': method,
      'path': path,
      'port': port,
      'protocol': protocol,
      'timeout': timeout,
      'tls_server_name': tlsServerName,
      'tls_skip_verify': tlsSkipVerify,
      'type': type,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineCheck &&
          runtimeType == other.runtimeType &&
          gracePeriod == other.gracePeriod &&
          interval == other.interval &&
          method == other.method &&
          path == other.path &&
          port == other.port &&
          protocol == other.protocol &&
          timeout == other.timeout &&
          tlsServerName == other.tlsServerName &&
          tlsSkipVerify == other.tlsSkipVerify &&
          type == other.type;

  @override
  int get hashCode =>
      gracePeriod.hashCode ^
      interval.hashCode ^
      method.hashCode ^
      path.hashCode ^
      port.hashCode ^
      protocol.hashCode ^
      timeout.hashCode ^
      tlsServerName.hashCode ^
      tlsSkipVerify.hashCode ^
      type.hashCode;

  @override
  String toString() =>
      'FlyMachineCheck(gracePeriod: $gracePeriod, interval: $interval, method: $method, path: $path, port: $port, protocol: $protocol, timeout: $timeout, tlsServerName: $tlsServerName, tlsSkipVerify: $tlsSkipVerify, type: $type)';

  FlyMachineCheck copyWith({
    String? gracePeriod,
    String? interval,
    String? method,
    String? path,
    int? port,
    String? protocol,
    String? timeout,
    String? tlsServerName,
    bool? tlsSkipVerify,
    String? type,
  }) {
    return FlyMachineCheck(
      gracePeriod: gracePeriod ?? this.gracePeriod,
      interval: interval ?? this.interval,
      method: method ?? this.method,
      path: path ?? this.path,
      port: port ?? this.port,
      protocol: protocol ?? this.protocol,
      timeout: timeout ?? this.timeout,
      tlsServerName: tlsServerName ?? this.tlsServerName,
      tlsSkipVerify: tlsSkipVerify ?? this.tlsSkipVerify,
      type: type ?? this.type,
    );
  }
}

/// Kind of machine check.
enum FlyMachineCheckKind {
  informational('informational'),
  readiness('readiness');

  const FlyMachineCheckKind(this.value);
  final String value;

  static FlyMachineCheckKind? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Represents the configuration of a Fly Machine.
@immutable
class FlyMachineConfig {
  factory FlyMachineConfig.fromJson(Map<String, dynamic> json) {
    return FlyMachineConfig(
      autoDestroy: json['auto_destroy'] as bool?,
      checks: (json['checks'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, FlyMachineCheck.fromJson(e as Map<String, dynamic>)),
      ),
      containers:
          (json['containers'] as List<dynamic>?)
              ?.map(
                (e) => FlyContainerConfig.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      disableMachineAutostart: json['disable_machine_autostart'] as bool?,
      dns:
          json['dns'] == null
              ? null
              : FlyDNSConfig.fromJson(json['dns'] as Map<String, dynamic>),
      env:
          json['env'] == null
              ? null
              : Map<String, String>.from(json['env'] as Map),
      files:
          (json['files'] as List<dynamic>?)
              ?.map((e) => FlyFile.fromJson(e as Map<String, dynamic>))
              .toList(),
      guest:
          json['guest'] == null
              ? null
              : FlyMachineGuest.fromJson(json['guest'] as Map<String, dynamic>),
      image: json['image'] as String?,
      init:
          json['init'] == null
              ? null
              : FlyMachineInit.fromJson(json['init'] as Map<String, dynamic>),
      metadata:
          json['metadata'] == null
              ? null
              : Map<String, String>.from(json['metadata'] as Map),
      metrics:
          json['metrics'] == null
              ? null
              : FlyMachineMetrics.fromJson(
                json['metrics'] as Map<String, dynamic>,
              ),
      mounts:
          (json['mounts'] as List<dynamic>?)
              ?.map((e) => FlyMachineMount.fromJson(e as Map<String, dynamic>))
              .toList(),
      processes:
          (json['processes'] as List<dynamic>?)
              ?.map(
                (e) => FlyMachineProcess.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      restart:
          json['restart'] == null
              ? null
              : FlyMachineRestart.fromJson(
                json['restart'] as Map<String, dynamic>,
              ),
      schedule: json['schedule'] as String?,
      services:
          (json['services'] as List<dynamic>?)
              ?.map(
                (e) => FlyMachineService.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      size: json['size'] as String?,
      standbys:
          (json['standbys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      statics:
          (json['statics'] as List<dynamic>?)
              ?.map((e) => FlyStatic.fromJson(e as Map<String, dynamic>))
              .toList(),
      stopConfig:
          json['stop_config'] == null
              ? null
              : FlyStopConfig.fromJson(
                json['stop_config'] as Map<String, dynamic>,
              ),
      volumes:
          (json['volumes'] as List<dynamic>?)
              ?.map((e) => FlyVolumeConfig.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
  const FlyMachineConfig({
    this.autoDestroy,
    this.checks,
    this.containers,
    this.disableMachineAutostart,
    this.dns,
    this.env,
    this.files,
    this.guest,
    this.image,
    this.init,
    this.metadata,
    this.metrics,
    this.mounts,
    this.processes,
    this.restart,
    this.schedule,
    this.services,
    this.size,
    this.standbys,
    this.statics,
    this.stopConfig,
    this.volumes,
  });

  /// Optional boolean telling the Machine to destroy itself once it’s complete (default false)
  final bool? autoDestroy;
  final Map<String, FlyMachineCheck>? checks;

  /// Containers are a list of containers that will run in the machine. Currently restricted to
  /// only specific organizations.
  final List<FlyContainerConfig>? containers;

  /// Deprecated: use Service.Autostart instead
  final bool? disableMachineAutostart;
  final FlyDNSConfig? dns;

  /// An object filled with key/value pairs to be set as environment variables
  final Map<String, String>? env;
  final List<FlyFile>? files;
  final FlyMachineGuest? guest;

  /// The docker image to run
  final String? image;
  final FlyMachineInit? init;
  final Map<String, String>? metadata;
  final FlyMachineMetrics? metrics;
  final List<FlyMachineMount>? mounts;
  final List<FlyMachineProcess>? processes;
  final FlyMachineRestart? restart;
  final String? schedule;
  final List<FlyMachineService>? services;

  /// Deprecated: use Guest instead
  final String? size;

  /// Standbys enable a machine to be a standby for another. In the event of a hardware failure,
  /// the standby machine will be started.
  final List<String>? standbys;
  final List<FlyStatic>? statics;
  final FlyStopConfig? stopConfig;

  /// Volumes describe the set of volumes that can be attached to the machine. Used in conjuction
  /// with containers
  final List<FlyVolumeConfig>? volumes;

  Map<String, dynamic> toJson() {
    return {
      'auto_destroy': autoDestroy,
      'checks': checks?.map((k, e) => MapEntry(k, e.toJson())),
      'containers': containers?.map((e) => e.toJson()).toList(),
      'disable_machine_autostart': disableMachineAutostart,
      'dns': dns?.toJson(),
      'env': env,
      'files': files?.map((e) => e.toJson()).toList(),
      'guest': guest?.toJson(),
      'image': image,
      'init': init?.toJson(),
      'metadata': metadata,
      'metrics': metrics?.toJson(),
      'mounts': mounts?.map((e) => e.toJson()).toList(),
      'processes': processes?.map((e) => e.toJson()).toList(),
      'restart': restart?.toJson(),
      'schedule': schedule,
      'services': services?.map((e) => e.toJson()).toList(),
      'size': size,
      'standbys': standbys,
      'statics': statics?.map((e) => e.toJson()).toList(),
      'stop_config': stopConfig?.toJson(),
      'volumes': volumes?.map((e) => e.toJson()).toList(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineConfig &&
          runtimeType == other.runtimeType &&
          autoDestroy == other.autoDestroy &&
          const DeepCollectionEquality().equals(checks, other.checks) &&
          const DeepCollectionEquality().equals(containers, other.containers) &&
          disableMachineAutostart == other.disableMachineAutostart &&
          dns == other.dns &&
          const DeepCollectionEquality().equals(env, other.env) &&
          const DeepCollectionEquality().equals(files, other.files) &&
          guest == other.guest &&
          image == other.image &&
          init == other.init &&
          const DeepCollectionEquality().equals(metadata, other.metadata) &&
          metrics == other.metrics &&
          const DeepCollectionEquality().equals(mounts, other.mounts) &&
          const DeepCollectionEquality().equals(processes, other.processes) &&
          restart == other.restart &&
          schedule == other.schedule &&
          const DeepCollectionEquality().equals(services, other.services) &&
          size == other.size &&
          const DeepCollectionEquality().equals(standbys, other.standbys) &&
          const DeepCollectionEquality().equals(statics, other.statics) &&
          stopConfig == other.stopConfig &&
          const DeepCollectionEquality().equals(volumes, other.volumes);

  @override
  int get hashCode =>
      autoDestroy.hashCode ^
      const DeepCollectionEquality().hash(checks) ^
      const DeepCollectionEquality().hash(containers) ^
      disableMachineAutostart.hashCode ^
      dns.hashCode ^
      const DeepCollectionEquality().hash(env) ^
      const DeepCollectionEquality().hash(files) ^
      guest.hashCode ^
      image.hashCode ^
      init.hashCode ^
      const DeepCollectionEquality().hash(metadata) ^
      metrics.hashCode ^
      const DeepCollectionEquality().hash(mounts) ^
      const DeepCollectionEquality().hash(processes) ^
      restart.hashCode ^
      schedule.hashCode ^
      const DeepCollectionEquality().hash(services) ^
      size.hashCode ^
      const DeepCollectionEquality().hash(standbys) ^
      const DeepCollectionEquality().hash(statics) ^
      stopConfig.hashCode ^
      const DeepCollectionEquality().hash(volumes);

  @override
  String toString() =>
      'FlyMachineConfig(autoDestroy: $autoDestroy, checks: $checks, containers: $containers, disableMachineAutostart: $disableMachineAutostart, dns: $dns, env: $env, files: $files, guest: $guest, image: $image, init: $init, metadata: $metadata, metrics: $metrics, mounts: $mounts, processes: $processes, restart: $restart, schedule: $schedule, services: $services, size: $size, standbys: $standbys, statics: $statics, stopConfig: $stopConfig, volumes: $volumes)';

  FlyMachineConfig copyWith({
    bool? autoDestroy,
    Map<String, FlyMachineCheck>? checks,
    List<FlyContainerConfig>? containers,
    bool? disableMachineAutostart,
    FlyDNSConfig? dns,
    Map<String, String>? env,
    List<FlyFile>? files,
    FlyMachineGuest? guest,
    String? image,
    FlyMachineInit? init,
    Map<String, String>? metadata,
    FlyMachineMetrics? metrics,
    List<FlyMachineMount>? mounts,
    List<FlyMachineProcess>? processes,
    FlyMachineRestart? restart,
    String? schedule,
    List<FlyMachineService>? services,
    String? size,
    List<String>? standbys,
    List<FlyStatic>? statics,
    FlyStopConfig? stopConfig,
    List<FlyVolumeConfig>? volumes,
  }) {
    return FlyMachineConfig(
      autoDestroy: autoDestroy ?? this.autoDestroy,
      checks: checks ?? this.checks,
      containers: containers ?? this.containers,
      disableMachineAutostart:
          disableMachineAutostart ?? this.disableMachineAutostart,
      dns: dns ?? this.dns,
      env: env ?? this.env,
      files: files ?? this.files,
      guest: guest ?? this.guest,
      image: image ?? this.image,
      init: init ?? this.init,
      metadata: metadata ?? this.metadata,
      metrics: metrics ?? this.metrics,
      mounts: mounts ?? this.mounts,
      processes: processes ?? this.processes,
      restart: restart ?? this.restart,
      schedule: schedule ?? this.schedule,
      services: services ?? this.services,
      size: size ?? this.size,
      standbys: standbys ?? this.standbys,
      statics: statics ?? this.statics,
      stopConfig: stopConfig ?? this.stopConfig,
      volumes: volumes ?? this.volumes,
    );
  }
}

/// Guest settings for a machine (CPU, memory, GPU).
@immutable
class FlyMachineGuest {
  factory FlyMachineGuest.fromJson(Map<String, dynamic> json) {
    return FlyMachineGuest(
      cpuKind: json['cpu_kind'] as String?,
      cpus: json['cpus'] as int?,
      gpuKind: json['gpu_kind'] as String?,
      gpus: json['gpus'] as int?,
      hostDedicationId: json['host_dedication_id'] as String?,
      kernelArgs:
          (json['kernel_args'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      memoryMb: json['memory_mb'] as int?,
    );
  }
  const FlyMachineGuest({
    this.cpuKind,
    this.cpus,
    this.gpuKind,
    this.gpus,
    this.hostDedicationId,
    this.kernelArgs,
    this.memoryMb,
  });

  final String? cpuKind;
  final int? cpus;
  final String? gpuKind;
  final int? gpus;
  final String? hostDedicationId;
  final List<String>? kernelArgs;
  final int? memoryMb;

  Map<String, dynamic> toJson() {
    return {
      'cpu_kind': cpuKind,
      'cpus': cpus,
      'gpu_kind': gpuKind,
      'gpus': gpus,
      'host_dedication_id': hostDedicationId,
      'kernel_args': kernelArgs,
      'memory_mb': memoryMb,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineGuest &&
          runtimeType == other.runtimeType &&
          cpuKind == other.cpuKind &&
          cpus == other.cpus &&
          gpuKind == other.gpuKind &&
          gpus == other.gpus &&
          hostDedicationId == other.hostDedicationId &&
          const DeepCollectionEquality().equals(kernelArgs, other.kernelArgs) &&
          memoryMb == other.memoryMb;

  @override
  int get hashCode =>
      cpuKind.hashCode ^
      cpus.hashCode ^
      gpuKind.hashCode ^
      gpus.hashCode ^
      hostDedicationId.hashCode ^
      const DeepCollectionEquality().hash(kernelArgs) ^
      memoryMb.hashCode;

  @override
  String toString() =>
      'FlyMachineGuest(cpuKind: $cpuKind, cpus: $cpus, gpuKind: $gpuKind, gpus: $gpus, hostDedicationId: $hostDedicationId, kernelArgs: $kernelArgs, memoryMb: $memoryMb)';

  FlyMachineGuest copyWith({
    String? cpuKind,
    int? cpus,
    String? gpuKind,
    int? gpus,
    String? hostDedicationId,
    List<String>? kernelArgs,
    int? memoryMb,
  }) {
    return FlyMachineGuest(
      cpuKind: cpuKind ?? this.cpuKind,
      cpus: cpus ?? this.cpus,
      gpuKind: gpuKind ?? this.gpuKind,
      gpus: gpus ?? this.gpus,
      hostDedicationId: hostDedicationId ?? this.hostDedicationId,
      kernelArgs: kernelArgs ?? this.kernelArgs,
      memoryMb: memoryMb ?? this.memoryMb,
    );
  }
}

/// For http checks, an array of objects with string field Name and array of strings field Values. The key/value pairs specify header and header values that will get passed with the check call.
@immutable
class FlyMachineHTTPHeader {
  factory FlyMachineHTTPHeader.fromJson(Map<String, dynamic> json) {
    return FlyMachineHTTPHeader(
      name: json['name'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
  const FlyMachineHTTPHeader({this.name, this.values});

  /// The header name
  final String? name;

  /// The header value
  final List<String>? values;

  Map<String, dynamic> toJson() {
    return {'name': name, 'values': values}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineHTTPHeader &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          const DeepCollectionEquality().equals(values, other.values);

  @override
  int get hashCode =>
      name.hashCode ^ const DeepCollectionEquality().hash(values);

  @override
  String toString() => 'FlyMachineHTTPHeader(name: $name, values: $values)';

  FlyMachineHTTPHeader copyWith({String? name, List<String>? values}) {
    return FlyMachineHTTPHeader(
      name: name ?? this.name,
      values: values ?? this.values,
    );
  }
}

/// Machine initialization configuration.
@immutable
class FlyMachineInit {
  factory FlyMachineInit.fromJson(Map<String, dynamic> json) {
    return FlyMachineInit(
      cmd: (json['cmd'] as List<dynamic>?)?.map((e) => e as String).toList(),
      entrypoint:
          (json['entrypoint'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      exec: (json['exec'] as List<dynamic>?)?.map((e) => e as String).toList(),
      kernelArgs:
          (json['kernel_args'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      swapSizeMb: json['swap_size_mb'] as int?,
      tty: json['tty'] as bool?,
    );
  }
  const FlyMachineInit({
    this.cmd,
    this.entrypoint,
    this.exec,
    this.kernelArgs,
    this.swapSizeMb,
    this.tty,
  });

  final List<String>? cmd;
  final List<String>? entrypoint;
  final List<String>? exec;
  final List<String>? kernelArgs;
  final int? swapSizeMb;
  final bool? tty;

  Map<String, dynamic> toJson() {
    return {
      'cmd': cmd,
      'entrypoint': entrypoint,
      'exec': exec,
      'kernel_args': kernelArgs,
      'swap_size_mb': swapSizeMb,
      'tty': tty,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineInit &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(cmd, other.cmd) &&
          const DeepCollectionEquality().equals(entrypoint, other.entrypoint) &&
          const DeepCollectionEquality().equals(exec, other.exec) &&
          const DeepCollectionEquality().equals(kernelArgs, other.kernelArgs) &&
          swapSizeMb == other.swapSizeMb &&
          tty == other.tty;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cmd) ^
      const DeepCollectionEquality().hash(entrypoint) ^
      const DeepCollectionEquality().hash(exec) ^
      const DeepCollectionEquality().hash(kernelArgs) ^
      swapSizeMb.hashCode ^
      tty.hashCode;

  @override
  String toString() =>
      'FlyMachineInit(cmd: $cmd, entrypoint: $entrypoint, exec: $exec, kernelArgs: $kernelArgs, swapSizeMb: $swapSizeMb, tty: $tty)';

  FlyMachineInit copyWith({
    List<String>? cmd,
    List<String>? entrypoint,
    List<String>? exec,
    List<String>? kernelArgs,
    int? swapSizeMb,
    bool? tty,
  }) {
    return FlyMachineInit(
      cmd: cmd ?? this.cmd,
      entrypoint: entrypoint ?? this.entrypoint,
      exec: exec ?? this.exec,
      kernelArgs: kernelArgs ?? this.kernelArgs,
      swapSizeMb: swapSizeMb ?? this.swapSizeMb,
      tty: tty ?? this.tty,
    );
  }
}

/// Machine metrics configuration.
@immutable
class FlyMachineMetrics {
  factory FlyMachineMetrics.fromJson(Map<String, dynamic> json) {
    return FlyMachineMetrics(
      https: json['https'] as bool?,
      path: json['path'] as String?,
      port: json['port'] as int?,
    );
  }
  const FlyMachineMetrics({this.https, this.path, this.port});

  final bool? https;
  final String? path;
  final int? port;

  Map<String, dynamic> toJson() {
    return {'https': https, 'path': path, 'port': port}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineMetrics &&
          runtimeType == other.runtimeType &&
          https == other.https &&
          path == other.path &&
          port == other.port;

  @override
  int get hashCode => https.hashCode ^ path.hashCode ^ port.hashCode;

  @override
  String toString() =>
      'FlyMachineMetrics(https: $https, path: $path, port: $port)';

  FlyMachineMetrics copyWith({bool? https, String? path, int? port}) {
    return FlyMachineMetrics(
      https: https ?? this.https,
      path: path ?? this.path,
      port: port ?? this.port,
    );
  }
}

/// Machine volume mount configuration.
@immutable
class FlyMachineMount {
  factory FlyMachineMount.fromJson(Map<String, dynamic> json) {
    return FlyMachineMount(
      addSizeGb: json['add_size_gb'] as int?,
      encrypted: json['encrypted'] as bool?,
      extendThresholdPercent: json['extend_threshold_percent'] as int?,
      name: json['name'] as String?,
      path: json['path'] as String?,
      sizeGb: json['size_gb'] as int?,
      sizeGbLimit: json['size_gb_limit'] as int?,
      volume: json['volume'] as String?,
    );
  }
  const FlyMachineMount({
    this.addSizeGb,
    this.encrypted,
    this.extendThresholdPercent,
    this.name,
    this.path,
    this.sizeGb,
    this.sizeGbLimit,
    this.volume,
  });

  final int? addSizeGb;
  final bool? encrypted;
  final int? extendThresholdPercent;
  final String? name;
  final String? path;
  final int? sizeGb;
  final int? sizeGbLimit;
  final String? volume;

  Map<String, dynamic> toJson() {
    return {
      'add_size_gb': addSizeGb,
      'encrypted': encrypted,
      'extend_threshold_percent': extendThresholdPercent,
      'name': name,
      'path': path,
      'size_gb': sizeGb,
      'size_gb_limit': sizeGbLimit,
      'volume': volume,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineMount &&
          runtimeType == other.runtimeType &&
          addSizeGb == other.addSizeGb &&
          encrypted == other.encrypted &&
          extendThresholdPercent == other.extendThresholdPercent &&
          name == other.name &&
          path == other.path &&
          sizeGb == other.sizeGb &&
          sizeGbLimit == other.sizeGbLimit &&
          volume == other.volume;

  @override
  int get hashCode =>
      addSizeGb.hashCode ^
      encrypted.hashCode ^
      extendThresholdPercent.hashCode ^
      name.hashCode ^
      path.hashCode ^
      sizeGb.hashCode ^
      sizeGbLimit.hashCode ^
      volume.hashCode;

  @override
  String toString() =>
      'FlyMachineMount(addSizeGb: $addSizeGb, encrypted: $encrypted, extendThresholdPercent: $extendThresholdPercent, name: $name, path: $path, sizeGb: $sizeGb, sizeGbLimit: $sizeGbLimit, volume: $volume)';

  FlyMachineMount copyWith({
    int? addSizeGb,
    bool? encrypted,
    int? extendThresholdPercent,
    String? name,
    String? path,
    int? sizeGb,
    int? sizeGbLimit,
    String? volume,
  }) {
    return FlyMachineMount(
      addSizeGb: addSizeGb ?? this.addSizeGb,
      encrypted: encrypted ?? this.encrypted,
      extendThresholdPercent:
          extendThresholdPercent ?? this.extendThresholdPercent,
      name: name ?? this.name,
      path: path ?? this.path,
      sizeGb: sizeGb ?? this.sizeGb,
      sizeGbLimit: sizeGbLimit ?? this.sizeGbLimit,
      volume: volume ?? this.volume,
    );
  }
}

/// Machine service port configuration.
@immutable
class FlyMachinePort {
  factory FlyMachinePort.fromJson(Map<String, dynamic> json) {
    return FlyMachinePort(
      endPort: json['end_port'] as int?,
      forceHttps: json['force_https'] as bool?,
      handlers:
          (json['handlers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      httpOptions:
          json['http_options'] == null
              ? null
              : FlyHTTPOptions.fromJson(
                json['http_options'] as Map<String, dynamic>,
              ),
      port: json['port'] as int?,
      proxyProtoOptions:
          json['proxy_proto_options'] == null
              ? null
              : FlyProxyProtoOptions.fromJson(
                json['proxy_proto_options'] as Map<String, dynamic>,
              ),
      startPort: json['start_port'] as int?,
      tlsOptions:
          json['tls_options'] == null
              ? null
              : FlyTLSOptions.fromJson(
                json['tls_options'] as Map<String, dynamic>,
              ),
    );
  }
  const FlyMachinePort({
    this.endPort,
    this.forceHttps,
    this.handlers,
    this.httpOptions,
    this.port,
    this.proxyProtoOptions,
    this.startPort,
    this.tlsOptions,
  });

  final int? endPort;
  final bool? forceHttps;
  final List<String>? handlers;
  final FlyHTTPOptions? httpOptions;
  final int? port;
  final FlyProxyProtoOptions? proxyProtoOptions;
  final int? startPort;
  final FlyTLSOptions? tlsOptions;

  Map<String, dynamic> toJson() {
    return {
      'end_port': endPort,
      'force_https': forceHttps,
      'handlers': handlers,
      'http_options': httpOptions?.toJson(),
      'port': port,
      'proxy_proto_options': proxyProtoOptions?.toJson(),
      'start_port': startPort,
      'tls_options': tlsOptions?.toJson(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachinePort &&
          runtimeType == other.runtimeType &&
          endPort == other.endPort &&
          forceHttps == other.forceHttps &&
          const DeepCollectionEquality().equals(handlers, other.handlers) &&
          httpOptions == other.httpOptions &&
          port == other.port &&
          proxyProtoOptions == other.proxyProtoOptions &&
          startPort == other.startPort &&
          tlsOptions == other.tlsOptions;

  @override
  int get hashCode =>
      endPort.hashCode ^
      forceHttps.hashCode ^
      const DeepCollectionEquality().hash(handlers) ^
      httpOptions.hashCode ^
      port.hashCode ^
      proxyProtoOptions.hashCode ^
      startPort.hashCode ^
      tlsOptions.hashCode;

  @override
  String toString() =>
      'FlyMachinePort(endPort: $endPort, forceHttps: $forceHttps, handlers: $handlers, httpOptions: $httpOptions, port: $port, proxyProtoOptions: $proxyProtoOptions, startPort: $startPort, tlsOptions: $tlsOptions)';

  FlyMachinePort copyWith({
    int? endPort,
    bool? forceHttps,
    List<String>? handlers,
    FlyHTTPOptions? httpOptions,
    int? port,
    FlyProxyProtoOptions? proxyProtoOptions,
    int? startPort,
    FlyTLSOptions? tlsOptions,
  }) {
    return FlyMachinePort(
      endPort: endPort ?? this.endPort,
      forceHttps: forceHttps ?? this.forceHttps,
      handlers: handlers ?? this.handlers,
      httpOptions: httpOptions ?? this.httpOptions,
      port: port ?? this.port,
      proxyProtoOptions: proxyProtoOptions ?? this.proxyProtoOptions,
      startPort: startPort ?? this.startPort,
      tlsOptions: tlsOptions ?? this.tlsOptions,
    );
  }
}

/// Machine process configuration.
@immutable
class FlyMachineProcess {
  factory FlyMachineProcess.fromJson(Map<String, dynamic> json) {
    return FlyMachineProcess(
      cmd: (json['cmd'] as List<dynamic>?)?.map((e) => e as String).toList(),
      entrypoint:
          (json['entrypoint'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      env:
          json['env'] == null
              ? null
              : Map<String, String>.from(json['env'] as Map),
      envFrom:
          (json['env_from'] as List<dynamic>?)
              ?.map((e) => FlyEnvFrom.fromJson(e as Map<String, dynamic>))
              .toList(),
      exec: (json['exec'] as List<dynamic>?)?.map((e) => e as String).toList(),
      ignoreAppSecrets: json['ignore_app_secrets'] as bool?,
      secrets:
          (json['secrets'] as List<dynamic>?)
              ?.map((e) => FlyMachineSecret.fromJson(e as Map<String, dynamic>))
              .toList(),
      user: json['user'] as String?,
    );
  }
  const FlyMachineProcess({
    this.cmd,
    this.entrypoint,
    this.env,
    this.envFrom,
    this.exec,
    this.ignoreAppSecrets,
    this.secrets,
    this.user,
  });

  final List<String>? cmd;
  final List<String>? entrypoint;
  final Map<String, String>? env;

  /// EnvFrom can be provided to set environment variables from machine fields.
  final List<FlyEnvFrom>? envFrom;
  final List<String>? exec;

  /// IgnoreAppSecrets can be set to true to ignore the secrets for the App the Machine belongs to
  /// and only use the secrets provided at the process level. The default/legacy behavior is to use
  /// the secrets provided at the App level.
  final bool? ignoreAppSecrets;

  /// Secrets can be provided at the process level to explicitly indicate which secrets should be
  /// used for the process. If not provided, the secrets provided at the machine level will be used.
  final List<FlyMachineSecret>? secrets;
  final String? user;

  Map<String, dynamic> toJson() {
    return {
      'cmd': cmd,
      'entrypoint': entrypoint,
      'env': env,
      'env_from': envFrom?.map((e) => e.toJson()).toList(),
      'exec': exec,
      'ignore_app_secrets': ignoreAppSecrets,
      'secrets': secrets?.map((e) => e.toJson()).toList(),
      'user': user,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineProcess &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(cmd, other.cmd) &&
          const DeepCollectionEquality().equals(entrypoint, other.entrypoint) &&
          const DeepCollectionEquality().equals(env, other.env) &&
          const DeepCollectionEquality().equals(envFrom, other.envFrom) &&
          const DeepCollectionEquality().equals(exec, other.exec) &&
          ignoreAppSecrets == other.ignoreAppSecrets &&
          const DeepCollectionEquality().equals(secrets, other.secrets) &&
          user == other.user;

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cmd) ^
      const DeepCollectionEquality().hash(entrypoint) ^
      const DeepCollectionEquality().hash(env) ^
      const DeepCollectionEquality().hash(envFrom) ^
      const DeepCollectionEquality().hash(exec) ^
      ignoreAppSecrets.hashCode ^
      const DeepCollectionEquality().hash(secrets) ^
      user.hashCode;

  @override
  String toString() =>
      'FlyMachineProcess(cmd: $cmd, entrypoint: $entrypoint, env: $env, envFrom: $envFrom, exec: $exec, ignoreAppSecrets: $ignoreAppSecrets, secrets: $secrets, user: $user)';

  FlyMachineProcess copyWith({
    List<String>? cmd,
    List<String>? entrypoint,
    Map<String, String>? env,
    List<FlyEnvFrom>? envFrom,
    List<String>? exec,
    bool? ignoreAppSecrets,
    List<FlyMachineSecret>? secrets,
    String? user,
  }) {
    return FlyMachineProcess(
      cmd: cmd ?? this.cmd,
      entrypoint: entrypoint ?? this.entrypoint,
      env: env ?? this.env,
      envFrom: envFrom ?? this.envFrom,
      exec: exec ?? this.exec,
      ignoreAppSecrets: ignoreAppSecrets ?? this.ignoreAppSecrets,
      secrets: secrets ?? this.secrets,
      user: user ?? this.user,
    );
  }
}

/// The Machine restart policy defines whether and how flyd restarts a Machine after its main process exits. See https://fly.io/docs/machines/guides-examples/machine-restart-policy/.
@immutable
class FlyMachineRestart {
  factory FlyMachineRestart.fromJson(Map<String, dynamic> json) {
    return FlyMachineRestart(
      gpuBidPrice: (json['gpu_bid_price'] as num?)?.toDouble(),
      maxRetries: json['max_retries'] as int?,
      policy:
          json['policy'] == null
              ? null
              : FlyMachineRestartPolicy.fromJson(json['policy'] as String),
    );
  }
  const FlyMachineRestart({this.gpuBidPrice, this.maxRetries, this.policy});

  /// GPU bid price for spot Machines.
  final double? gpuBidPrice;

  /// When policy is on-failure, the maximum number of times to attempt to restart the Machine before letting it stop.
  final int? maxRetries;

  /// * no - Never try to restart a Machine automatically when its main process exits, whether that’s on purpose or on a crash.
  /// * always - Always restart a Machine automatically and never let it enter a stopped state, even when the main process exits cleanly.
  /// * on-failure - Try up to MaxRetries times to automatically restart the Machine if it exits with a non-zero exit code. Default when no explicit policy is set, and for Machines with schedules.
  /// * spot-price - Starts the Machine only when there is capacity and the spot price is less than or equal to the bid price.
  final FlyMachineRestartPolicy? policy;

  Map<String, dynamic> toJson() {
    return {
      'gpu_bid_price': gpuBidPrice,
      'max_retries': maxRetries,
      'policy': policy?.toJson(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineRestart &&
          runtimeType == other.runtimeType &&
          gpuBidPrice == other.gpuBidPrice &&
          maxRetries == other.maxRetries &&
          policy == other.policy;

  @override
  int get hashCode =>
      gpuBidPrice.hashCode ^ maxRetries.hashCode ^ policy.hashCode;

  @override
  String toString() =>
      'FlyMachineRestart(gpuBidPrice: $gpuBidPrice, maxRetries: $maxRetries, policy: $policy)';

  FlyMachineRestart copyWith({
    double? gpuBidPrice,
    int? maxRetries,
    FlyMachineRestartPolicy? policy,
  }) {
    return FlyMachineRestart(
      gpuBidPrice: gpuBidPrice ?? this.gpuBidPrice,
      maxRetries: maxRetries ?? this.maxRetries,
      policy: policy ?? this.policy,
    );
  }
}

/// Restart policy for a machine.
enum FlyMachineRestartPolicy {
  no('no'),
  always('always'),
  onFailure('on-failure'),
  spotPrice('spot-price');

  const FlyMachineRestartPolicy(this.value);
  final String value;

  static FlyMachineRestartPolicy? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// A Secret needing to be set in the environment of the Machine. env_var is required
@immutable
class FlyMachineSecret {
  factory FlyMachineSecret.fromJson(Map<String, dynamic> json) {
    return FlyMachineSecret(
      envVar: json['env_var'] as String?,
      name: json['name'] as String?,
    );
  }
  const FlyMachineSecret({this.envVar, this.name});

  /// EnvVar is required and is the name of the environment variable that will be set from the
  /// secret. It must be a valid environment variable name.
  final String? envVar;

  /// Name is optional and when provided is used to reference a secret name where the EnvVar is
  /// different from what was set as the secret name.
  final String? name;

  Map<String, dynamic> toJson() {
    return {'env_var': envVar, 'name': name}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineSecret &&
          runtimeType == other.runtimeType &&
          envVar == other.envVar &&
          name == other.name;

  @override
  int get hashCode => envVar.hashCode ^ name.hashCode;

  @override
  String toString() => 'FlyMachineSecret(envVar: $envVar, name: $name)';

  FlyMachineSecret copyWith({String? envVar, String? name}) {
    return FlyMachineSecret(
      envVar: envVar ?? this.envVar,
      name: name ?? this.name,
    );
  }
}

/// Machine service configuration.
@immutable
class FlyMachineService {
  factory FlyMachineService.fromJson(Map<String, dynamic> json) {
    // Handle boolean backward compatibility for autostop
    FlyMachineServiceAutostop? parsedAutostop;
    final autostopValue = json['autostop'];
    if (autostopValue is String) {
      parsedAutostop = FlyMachineServiceAutostop.fromJson(autostopValue);
    } else if (autostopValue is bool) {
      parsedAutostop =
          autostopValue
              ? FlyMachineServiceAutostop.stop
              : FlyMachineServiceAutostop.off;
    }

    return FlyMachineService(
      autostart: json['autostart'] as bool?,
      autostop: parsedAutostop,
      checks:
          (json['checks'] as List<dynamic>?)
              ?.map((e) => FlyMachineCheck.fromJson(e as Map<String, dynamic>))
              .toList(),
      concurrency:
          json['concurrency'] == null
              ? null
              : FlyMachineServiceConcurrency.fromJson(
                json['concurrency'] as Map<String, dynamic>,
              ),
      forceInstanceDescription: json['force_instance_description'] as String?,
      forceInstanceKey: json['force_instance_key'] as String?,
      internalPort: json['internal_port'] as int?,
      minMachinesRunning: json['min_machines_running'] as int?,
      ports:
          (json['ports'] as List<dynamic>?)
              ?.map((e) => FlyMachinePort.fromJson(e as Map<String, dynamic>))
              .toList(),
      protocol: json['protocol'] as String?,
    );
  }
  const FlyMachineService({
    this.autostart,
    this.autostop,
    this.checks,
    this.concurrency,
    this.forceInstanceDescription,
    this.forceInstanceKey,
    this.internalPort,
    this.minMachinesRunning,
    this.ports,
    this.protocol,
  });

  final bool? autostart;

  /// Accepts a string (new format) or a boolean (old format). For backward compatibility with older clients, the API continues to use booleans for "off" and "stop" in responses.
  /// * "off" or false - Do not autostop the Machine.
  /// * "stop" or true - Automatically stop the Machine.
  /// * "suspend" - Automatically suspend the Machine, falling back to a full stop if this is not possible.
  final FlyMachineServiceAutostop? autostop;
  final List<FlyMachineCheck>? checks;
  final FlyMachineServiceConcurrency? concurrency;
  final String? forceInstanceDescription;
  final String? forceInstanceKey;
  final int? internalPort;
  final int? minMachinesRunning;
  final List<FlyMachinePort>? ports;
  final String? protocol;

  Map<String, dynamic> toJson() {
    // Always serialize autostop as string based on enum
    return {
      'autostart': autostart,
      'autostop': autostop?.toJson(),
      'checks': checks?.map((e) => e.toJson()).toList(),
      'concurrency': concurrency?.toJson(),
      'force_instance_description': forceInstanceDescription,
      'force_instance_key': forceInstanceKey,
      'internal_port': internalPort,
      'min_machines_running': minMachinesRunning,
      'ports': ports?.map((e) => e.toJson()).toList(),
      'protocol': protocol,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineService &&
          runtimeType == other.runtimeType &&
          autostart == other.autostart &&
          autostop == other.autostop &&
          const DeepCollectionEquality().equals(checks, other.checks) &&
          concurrency == other.concurrency &&
          forceInstanceDescription == other.forceInstanceDescription &&
          forceInstanceKey == other.forceInstanceKey &&
          internalPort == other.internalPort &&
          minMachinesRunning == other.minMachinesRunning &&
          const DeepCollectionEquality().equals(ports, other.ports) &&
          protocol == other.protocol;

  @override
  int get hashCode =>
      autostart.hashCode ^
      autostop.hashCode ^
      const DeepCollectionEquality().hash(checks) ^
      concurrency.hashCode ^
      forceInstanceDescription.hashCode ^
      forceInstanceKey.hashCode ^
      internalPort.hashCode ^
      minMachinesRunning.hashCode ^
      const DeepCollectionEquality().hash(ports) ^
      protocol.hashCode;

  @override
  String toString() =>
      'FlyMachineService(autostart: $autostart, autostop: $autostop, checks: $checks, concurrency: $concurrency, forceInstanceDescription: $forceInstanceDescription, forceInstanceKey: $forceInstanceKey, internalPort: $internalPort, minMachinesRunning: $minMachinesRunning, ports: $ports, protocol: $protocol)';

  FlyMachineService copyWith({
    bool? autostart,
    FlyMachineServiceAutostop? autostop,
    List<FlyMachineCheck>? checks,
    FlyMachineServiceConcurrency? concurrency,
    String? forceInstanceDescription,
    String? forceInstanceKey,
    int? internalPort,
    int? minMachinesRunning,
    List<FlyMachinePort>? ports,
    String? protocol,
  }) {
    return FlyMachineService(
      autostart: autostart ?? this.autostart,
      autostop: autostop ?? this.autostop,
      checks: checks ?? this.checks,
      concurrency: concurrency ?? this.concurrency,
      forceInstanceDescription:
          forceInstanceDescription ?? this.forceInstanceDescription,
      forceInstanceKey: forceInstanceKey ?? this.forceInstanceKey,
      internalPort: internalPort ?? this.internalPort,
      minMachinesRunning: minMachinesRunning ?? this.minMachinesRunning,
      ports: ports ?? this.ports,
      protocol: protocol ?? this.protocol,
    );
  }
}

/// Autostop policy for a machine service.
enum FlyMachineServiceAutostop {
  off('off'),
  stop('stop'),
  suspend('suspend');

  const FlyMachineServiceAutostop(this.value);
  final String value;

  static FlyMachineServiceAutostop? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    // Handle boolean backward compatibility (should be done in parent fromJson)
    if (jsonValue == 'true') return stop;
    if (jsonValue == 'false') return off;
    return null;
  }

  String toJson() => value;
}

/// Concurrency settings for a machine service.
@immutable
class FlyMachineServiceConcurrency {
  factory FlyMachineServiceConcurrency.fromJson(Map<String, dynamic> json) {
    return FlyMachineServiceConcurrency(
      hardLimit: json['hard_limit'] as int?,
      softLimit: json['soft_limit'] as int?,
      type: json['type'] as String?,
    );
  }
  const FlyMachineServiceConcurrency({
    this.hardLimit,
    this.softLimit,
    this.type,
  });

  final int? hardLimit;
  final int? softLimit;
  final String? type;

  Map<String, dynamic> toJson() {
    return {'hard_limit': hardLimit, 'soft_limit': softLimit, 'type': type}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyMachineServiceConcurrency &&
          runtimeType == other.runtimeType &&
          hardLimit == other.hardLimit &&
          softLimit == other.softLimit &&
          type == other.type;

  @override
  int get hashCode => hardLimit.hashCode ^ softLimit.hashCode ^ type.hashCode;

  @override
  String toString() =>
      'FlyMachineServiceConcurrency(hardLimit: $hardLimit, softLimit: $softLimit, type: $type)';

  FlyMachineServiceConcurrency copyWith({
    int? hardLimit,
    int? softLimit,
    String? type,
  }) {
    return FlyMachineServiceConcurrency(
      hardLimit: hardLimit ?? this.hardLimit,
      softLimit: softLimit ?? this.softLimit,
      type: type ?? this.type,
    );
  }
}

/// Proxy Protocol options.
@immutable
class FlyProxyProtoOptions {
  factory FlyProxyProtoOptions.fromJson(Map<String, dynamic> json) {
    return FlyProxyProtoOptions(version: json['version'] as String?);
  }
  const FlyProxyProtoOptions({this.version});

  final String? version;

  Map<String, dynamic> toJson() {
    return {'version': version}..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyProxyProtoOptions &&
          runtimeType == other.runtimeType &&
          version == other.version;

  @override
  int get hashCode => version.hashCode;

  @override
  String toString() => 'FlyProxyProtoOptions(version: $version)';

  FlyProxyProtoOptions copyWith({String? version}) {
    return FlyProxyProtoOptions(version: version ?? this.version);
  }
}

/// Static file serving configuration.
@immutable
class FlyStatic {
  factory FlyStatic.fromJson(Map<String, dynamic> json) {
    return FlyStatic(
      guestPath: json['guest_path'] as String,
      indexDocument: json['index_document'] as String?,
      tigrisBucket: json['tigris_bucket'] as String?,
      urlPrefix: json['url_prefix'] as String,
    );
  }
  const FlyStatic({
    required this.guestPath,
    this.indexDocument,
    this.tigrisBucket,
    required this.urlPrefix,
  });

  final String guestPath;
  final String? indexDocument;
  final String? tigrisBucket;
  final String urlPrefix;

  Map<String, dynamic> toJson() {
    return {
      'guest_path': guestPath,
      'index_document': indexDocument,
      'tigris_bucket': tigrisBucket,
      'url_prefix': urlPrefix,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyStatic &&
          runtimeType == other.runtimeType &&
          guestPath == other.guestPath &&
          indexDocument == other.indexDocument &&
          tigrisBucket == other.tigrisBucket &&
          urlPrefix == other.urlPrefix;

  @override
  int get hashCode =>
      guestPath.hashCode ^
      indexDocument.hashCode ^
      tigrisBucket.hashCode ^
      urlPrefix.hashCode;

  @override
  String toString() =>
      'FlyStatic(guestPath: $guestPath, indexDocument: $indexDocument, tigrisBucket: $tigrisBucket, urlPrefix: $urlPrefix)';

  FlyStatic copyWith({
    String? guestPath,
    String? indexDocument,
    String? tigrisBucket,
    String? urlPrefix,
  }) {
    return FlyStatic(
      guestPath: guestPath ?? this.guestPath,
      indexDocument: indexDocument ?? this.indexDocument,
      tigrisBucket: tigrisBucket ?? this.tigrisBucket,
      urlPrefix: urlPrefix ?? this.urlPrefix,
    );
  }
}

/// Configuration for stopping a machine or container.
@immutable
class FlyStopConfig {
  factory FlyStopConfig.fromJson(Map<String, dynamic> json) {
    return FlyStopConfig(
      signal: json['signal'] as String?,
      timeout:
          json['timeout'] == null
              ? null
              : FlyDuration.fromJson(
                Map<String, dynamic>.from(json['timeout'] as Map),
              ),
    );
  }
  const FlyStopConfig({this.signal, this.timeout});

  final String? signal;
  final FlyDuration? timeout;

  Map<String, dynamic> toJson() {
    return {'signal': signal, 'timeout': timeout?.toJson()}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyStopConfig &&
          runtimeType == other.runtimeType &&
          signal == other.signal &&
          timeout == other.timeout;

  @override
  int get hashCode => signal.hashCode ^ timeout.hashCode;

  @override
  String toString() => 'FlyStopConfig(signal: $signal, timeout: $timeout)';

  FlyStopConfig copyWith({String? signal, FlyDuration? timeout}) {
    return FlyStopConfig(
      signal: signal ?? this.signal,
      timeout: timeout ?? this.timeout,
    );
  }
}

/// Configuration for a TCP-based container health check.
@immutable
class FlyTCPHealthcheck {
  factory FlyTCPHealthcheck.fromJson(Map<String, dynamic> json) {
    return FlyTCPHealthcheck(port: json['port'] as int?);
  }
  const FlyTCPHealthcheck({this.port});

  /// The port to connect to, often the same as internal_port
  final int? port;

  Map<String, dynamic> toJson() {
    return {'port': port}..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyTCPHealthcheck &&
          runtimeType == other.runtimeType &&
          port == other.port;

  @override
  int get hashCode => port.hashCode;

  @override
  String toString() => 'FlyTCPHealthcheck(port: $port)';

  FlyTCPHealthcheck copyWith({int? port}) {
    return FlyTCPHealthcheck(port: port ?? this.port);
  }
}

/// TLS options for a machine service port.
@immutable
class FlyTLSOptions {
  factory FlyTLSOptions.fromJson(Map<String, dynamic> json) {
    return FlyTLSOptions(
      alpn: (json['alpn'] as List<dynamic>?)?.map((e) => e as String).toList(),
      defaultSelfSigned: json['default_self_signed'] as bool?,
      versions:
          (json['versions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );
  }
  const FlyTLSOptions({this.alpn, this.defaultSelfSigned, this.versions});

  final List<String>? alpn;
  final bool? defaultSelfSigned;
  final List<String>? versions;

  Map<String, dynamic> toJson() {
    return {
      'alpn': alpn,
      'default_self_signed': defaultSelfSigned,
      'versions': versions,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyTLSOptions &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(alpn, other.alpn) &&
          defaultSelfSigned == other.defaultSelfSigned &&
          const DeepCollectionEquality().equals(versions, other.versions);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(alpn) ^
      defaultSelfSigned.hashCode ^
      const DeepCollectionEquality().hash(versions);

  @override
  String toString() =>
      'FlyTLSOptions(alpn: $alpn, defaultSelfSigned: $defaultSelfSigned, versions: $versions)';

  FlyTLSOptions copyWith({
    List<String>? alpn,
    bool? defaultSelfSigned,
    List<String>? versions,
  }) {
    return FlyTLSOptions(
      alpn: alpn ?? this.alpn,
      defaultSelfSigned: defaultSelfSigned ?? this.defaultSelfSigned,
      versions: versions ?? this.versions,
    );
  }
}

/// Configuration for a temporary directory volume.
@immutable
class FlyTempDirVolume {
  factory FlyTempDirVolume.fromJson(Map<String, dynamic> json) {
    return FlyTempDirVolume(
      sizeMb: json['size_mb'] as int?,
      storageType: json['storage_type'] as String?,
    );
  }
  const FlyTempDirVolume({this.sizeMb, this.storageType});

  /// The size limit of the temp dir, only applicable when using disk backed storage.
  final int? sizeMb;

  /// The type of storage used to back the temp dir. Either disk or memory.
  final String? storageType;

  Map<String, dynamic> toJson() {
    return {'size_mb': sizeMb, 'storage_type': storageType}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyTempDirVolume &&
          runtimeType == other.runtimeType &&
          sizeMb == other.sizeMb &&
          storageType == other.storageType;

  @override
  int get hashCode => sizeMb.hashCode ^ storageType.hashCode;

  @override
  String toString() =>
      'FlyTempDirVolume(sizeMb: $sizeMb, storageType: $storageType)';

  FlyTempDirVolume copyWith({int? sizeMb, String? storageType}) {
    return FlyTempDirVolume(
      sizeMb: sizeMb ?? this.sizeMb,
      storageType: storageType ?? this.storageType,
    );
  }
}

/// Policy for handling unhealthy containers.
enum FlyUnhealthyPolicy {
  stop('stop');

  const FlyUnhealthyPolicy(this.value);
  final String value;

  static FlyUnhealthyPolicy? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Configuration for a volume within a machine config (used with containers).
@immutable
class FlyVolumeConfig {
  factory FlyVolumeConfig.fromJson(Map<String, dynamic> json) {
    return FlyVolumeConfig(
      name: json['name'] as String?,
      tempDir:
          json['temp_dir'] == null
              ? null
              : FlyTempDirVolume.fromJson(
                json['temp_dir'] as Map<String, dynamic>,
              ),
    );
  }
  const FlyVolumeConfig({this.name, this.tempDir});

  /// The name of the volume. A volume must have a unique name within an app
  final String? name;
  final FlyTempDirVolume? tempDir;

  Map<String, dynamic> toJson() {
    return {'name': name, 'temp_dir': tempDir?.toJson()}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyVolumeConfig &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          tempDir == other.tempDir;

  @override
  int get hashCode => name.hashCode ^ tempDir.hashCode;

  @override
  String toString() => 'FlyVolumeConfig(name: $name, tempDir: $tempDir)';

  FlyVolumeConfig copyWith({String? name, FlyTempDirVolume? tempDir}) {
    return FlyVolumeConfig(
      name: name ?? this.name,
      tempDir: tempDir ?? this.tempDir,
    );
  }
}

/// DNS forward rule configuration.
@immutable
class FlyDnsForwardRule {
  factory FlyDnsForwardRule.fromJson(Map<String, dynamic> json) {
    return FlyDnsForwardRule(
      addr: json['addr'] as String?,
      basename: json['basename'] as String?,
    );
  }
  const FlyDnsForwardRule({this.addr, this.basename});

  final String? addr;
  final String? basename;

  Map<String, dynamic> toJson() {
    return {'addr': addr, 'basename': basename}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyDnsForwardRule &&
          runtimeType == other.runtimeType &&
          addr == other.addr &&
          basename == other.basename;

  @override
  int get hashCode => addr.hashCode ^ basename.hashCode;

  @override
  String toString() => 'FlyDnsForwardRule(addr: $addr, basename: $basename)';

  FlyDnsForwardRule copyWith({String? addr, String? basename}) {
    return FlyDnsForwardRule(
      addr: addr ?? this.addr,
      basename: basename ?? this.basename,
    );
  }
}

/// DNS option configuration.
@immutable
class FlyDnsOption {
  factory FlyDnsOption.fromJson(Map<String, dynamic> json) {
    return FlyDnsOption(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }
  const FlyDnsOption({this.name, this.value});

  final String? name;
  final String? value;

  Map<String, dynamic> toJson() {
    return {'name': name, 'value': value}
      ..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlyDnsOption &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          value == other.value;

  @override
  int get hashCode => name.hashCode ^ value.hashCode;

  @override
  String toString() => 'FlyDnsOption(name: $name, value: $value)';

  FlyDnsOption copyWith({String? name, String? value}) {
    return FlyDnsOption(name: name ?? this.name, value: value ?? this.value);
  }
}

/// Response body for the machine exec command.
@immutable
class Flydv1ExecResponse {
  factory Flydv1ExecResponse.fromJson(Map<String, dynamic> json) {
    return Flydv1ExecResponse(
      exitCode: json['exit_code'] as int?,
      exitSignal: json['exit_signal'] as int?,
      stderr: json['stderr'] as String?,
      stdout: json['stdout'] as String?,
    );
  }
  const Flydv1ExecResponse({
    this.exitCode,
    this.exitSignal,
    this.stderr,
    this.stdout,
  });

  final int? exitCode;
  final int? exitSignal;
  final String? stderr;
  final String? stdout;

  Map<String, dynamic> toJson() {
    return {
      'exit_code': exitCode,
      'exit_signal': exitSignal,
      'stderr': stderr,
      'stdout': stdout,
    }..removeWhere((key, value) => value == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Flydv1ExecResponse &&
          runtimeType == other.runtimeType &&
          exitCode == other.exitCode &&
          exitSignal == other.exitSignal &&
          stderr == other.stderr &&
          stdout == other.stdout;

  @override
  int get hashCode =>
      exitCode.hashCode ^
      exitSignal.hashCode ^
      stderr.hashCode ^
      stdout.hashCode;

  @override
  String toString() =>
      'Flydv1ExecResponse(exitCode: $exitCode, exitSignal: $exitSignal, stderr: $stderr, stdout: $stdout)';

  Flydv1ExecResponse copyWith({
    int? exitCode,
    int? exitSignal,
    String? stderr,
    String? stdout,
  }) {
    return Flydv1ExecResponse(
      exitCode: exitCode ?? this.exitCode,
      exitSignal: exitSignal ?? this.exitSignal,
      stderr: stderr ?? this.stderr,
      stdout: stdout ?? this.stdout,
    );
  }
}

/// Status code enum used in ErrorResponse.
enum MainStatusCode {
  unknown('unknown'),
  insufficientCapacity('insufficient_capacity');

  const MainStatusCode(this.value);
  final String value;

  static MainStatusCode? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}

/// Enum for desired machine state in the wait operation.
enum MachinesWaitState {
  started('started'),
  stopped('stopped'),
  suspended('suspended'),
  destroyed('destroyed');

  const MachinesWaitState(this.value);
  final String value;

  static MachinesWaitState? fromJson(String? jsonValue) {
    if (jsonValue == null) return null;
    for (final e in values) {
      if (e.value == jsonValue) return e;
    }
    return null;
  }

  String toJson() => value;
}
