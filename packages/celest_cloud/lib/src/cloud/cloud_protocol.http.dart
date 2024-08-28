import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.dart';
import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.http.dart';
import 'package:celest_cloud/src/cloud/cloud_protocol.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.http.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations_protocol.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations_protocol.http.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.http.dart';
import 'package:celest_cloud/src/cloud/users/users_protocol.dart';
import 'package:celest_cloud/src/cloud/users/users_protocol.http.dart';
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final class CloudProtocolHttp implements CloudProtocol {
  CloudProtocolHttp({
    required Uri uri,
    required Authenticator authenticator,
    http.Client? httpClient,
    Logger? logger,
  })  : _client = CelestHttpClient(
          baseClient: httpClient,
          authenticator: authenticator,
          logger: logger,
        ),
        _baseUri = uri;

  final http.Client _client;
  final Uri _baseUri;

  @override
  late final AuthenticationProtocol authentication = AuthenticationProtocolHttp(
    uri: _baseUri,
    httpClient: _client,
  );

  @override
  late final OperationsProtocol operations = OperationsProtocolHttp(
    uri: _baseUri,
    httpClient: _client,
  );

  @override
  late final OrganizationsProtocol organizations = OrganizationsProtocolHttp(
    uri: _baseUri,
    httpClient: _client,
  );

  @override
  late final UsersProtocol users = UsersProtocolHttp(
    uri: _baseUri,
    httpClient: _client,
  );

  @override
  late final ProjectsProtocol projects = ProjectsProtocolHttp(
    uri: _baseUri,
    httpClient: _client,
  );
}
